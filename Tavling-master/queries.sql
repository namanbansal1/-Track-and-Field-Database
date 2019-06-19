
/* ******************************************************************************************
Number 1
Find sport type (TB/SB) from sportID (:sportID).
****************************************************************************************** */
SELECT IF(:sportID IN (SELECT sportID FROM TBSport), 'TB', 'SB') AS sportType

/* ******************************************************************************************
Number 2
Find whether a personID (:personID) corresponds to an athlete?
****************************************************************************************** */
SELECT IF(:personID IN (SELECT athleteID FROM Athlete), 1, 0) AS isAthlete

/* ******************************************************************************************
Number 3
Find whether a personID (:personID) corresponds to a coach?
****************************************************************************************** */
SELECT IF(:personID IN (SELECT athleteID FROM Coach), 1, 0) AS isCoach

/* ******************************************************************************************
Number 4
Find whether a personID (:personID) corresponds to a manager?
****************************************************************************************** */
SELECT isCompetitionManager FROM Person WHERE personID = :personID

/* ******************************************************************************************
Number 5
Find records for given sport grouped by division, filtered by country/season.
:sportType	(TB/SB)
:sportID 	(sportID)
:country 	(country name)
:season		(year)
****************************************************************************************** */
SELECT CONCAT(d.gender, ' ', CONVERT(d.minAge, CHARACTER), '-', CONVERT(d.maxAge, CHARACTER)) AS 'Division',
	p.name AS 'Name', a.country AS 'Country', divRecord.record AS 'Record'
FROM Participates:sportType parti
JOIN Competition c
	ON parti.competitionID = c.competitionID AND YEAR(c.endDate) LIKE :season AND parti.sportID = :sportID
JOIN Athlete a
	ON parti.athleteID = a.athleteID AND a.country LIKE ':country'
JOIN (SELECT divisionID, IF(:sportID IN (SELECT sportID FROM TBSport), MIN(result), MAX(result)) AS record
	FROM Participates:sportType parti
	JOIN Competition c
		ON parti.competitionID = c.competitionID AND YEAR(c.endDate) LIKE :season AND parti.sportID = :sportID
	JOIN Athlete a
		ON parti.athleteID = a.athleteID AND a.country LIKE ':country'
	GROUP BY divisionID) AS divRecord
	ON divRecord.divisionID = parti.divisionID
JOIN Division d
	ON parti.divisionID = d.divisionID
JOIN Person p
	ON parti.athleteID = p.personID
WHERE parti.result = divRecord.record

/* ******************************************************************************************
Number 6
Find records in all sports for an athlete (given sport type)
:sportType	(TB/SB)
:athleteID 		(athleteID)
****************************************************************************************** */
SELECT s.name AS 'Sport', athRecord.record AS 'Record'
FROM Sport s
JOIN (SELECT sportID, IF(':sportType' LIKE 'TB', MIN(result), MAX(result)) AS record
	FROM Participates:sportType parti
	WHERE athleteID = :athleteID
	GROUP BY sportID) as athRecord
	ON s.sportID = athRecord.sportID

/* ******************************************************************************************
Number 7
Find result for a given competition, sport and division
:sportType	(TB/SB)
:sportID 	(sportID)
:compID 		(competitionID)
:divID 		(divisionID)
:sort		(ASC for TB / DESC for SB)
****************************************************************************************** */
SELECT p.name AS 'Athlete', result AS 'Result'
FROM Participates:sportType parti 
JOIN Person p 
	ON parti.athleteID = p.personID
WHERE parti.divisionID = :divID AND parti.competitionID = :compID AND parti.sportID = :sportID
ORDER BY parti.result :sort

/* ******************************************************************************************
Number 8
Find ranks for given sport filtered by division/country
:sportID 	(sportID)
:divID 		(divisionID)
:country 	(country name)
****************************************************************************************** */
SELECT aName AS 'Athlete', country, divName AS 'Division', points
FROM AthleteRank
WHERE sportID = :sportID AND 
	divisionID LIKE :divID AND
	country LIKE ':country'
ORDER BY points DESC

/* ******************************************************************************************
Number 9
Find competitions filtered by location and time interval
:startDate		(start date of filter)
:endDate		(end date of filter)
:country 	(country name)
:prov		(state/province name)
:city		(city name)
****************************************************************************************** */
SELECT name, startDate, endDate, country, province_state, city
FROM Competition
WHERE city LIKE ':city' AND province_state LIKE ':prov' AND country LIKE ':country' AND NOT
	((startDate < ':startDate' AND endDate < ':startDate') OR (startDate > ':endDate' AND endDate > ':endDate'))

/* ******************************************************************************************
Number 10
Sign up athlete for competition
:sportType	(TB/SB)
:sportID 		(sportID)
:compID 		(competitionID)
:athleteID 		(athleteID)
:status
:result 		(result)
****************************************************************************************** */
INSERT INTO participates:sportType(status, result, athleteID, sportID, competitionID, divisionID)
	VALUES (':status', :result, :athleteID, :sportID, :compID, 
	(SELECT d.divisionID
	FROM Division d 
	JOIN Person p
		ON p.personID = :athleteID
	JOIN Competition c
		ON c.competitionID = :compID
	WHERE YEAR(c.startDate) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge AND 
	p.gender = d.gender)
	)

/* ******************************************************************************************
Number 11
Update result/status in participation
:sportType	(TB/SB)
:sportID 		(sportID)
:compID 		(competitionID)
:athleteID 		(athleteID)
:status
:result 		(result)
****************************************************************************************** */
UPDATE participates:sportType
SET status = ':status', result = :result
WHERE athleteID = :athleteID AND competitionID = :compID AND sportID = :sportID

/* ******************************************************************************************
Number 12
Set status 'DQD' of athletes not fulfilling needed drug tests. (almost division)
:compID 		(competitionID)
:sportType	(TB/SB)
****************************************************************************************** */
UPDATE participates:sportType parti
SET status = 'DQD', result = NULL
WHERE competitionID = :compID AND EXISTS 
	(
	SELECT testID -- All testID:s required
	FROM requires:sportType req
	WHERE req.divisionID = parti.divisionID AND 
		req.sportID = parti.sportID AND 
		req.competitionID = :compID AND
		testID NOT IN 
		(
		SELECT att.testID -- Except passed testID:s taken by athlete
		FROM AthleteTakesTest att
		JOIN Competition c
			ON c.competitionID = :compID
		WHERE att.athleteID = parti.athleteID AND att.result = 1 AND
			att.expDate >= c.endDate
		)
	)
	
/* ******************************************************************************************
Number 13
Update your own information
:athleteID 	(athleteID)
:weight
:height
:country
****************************************************************************************** */
UPDATE Athlete
SET weight = :weight
WHERE athleteID = :athleteID

UPDATE Athlete
SET height = :height
WHERE athleteID = :athleteID

UPDATE Athlete
SET country = ':country'
WHERE athleteID = :athleteID

/* ******************************************************************************************
Number 14
Create and update competitions
:compID 		(competitionID)
:name
:startDate
:endDate
:invOnly	(only invite?)
:country
:prov		(state/province name)
:city
:managerID 	(competitionOrganizerID)
****************************************************************************************** */
INSERT INTO Competition(competitionID, name, startDate, endDate, inviteOnly, 
	country, province_state, city, competitionOrganizerID)
VALUES (:compID, ':name', ':startDate', ':endDate', :invOnly, ':country', ':prov', ':city', :managerID)

UPDATE Competition
SET startDate=':startDate', endDate=':endDate',
	country=':country', province_state=':prov', city=':city'
WHERE competitionID = :compID

/* ******************************************************************************************
Number 15
Create and update training plan between coach and athlete
:trainingID
:startDate
:endDate
:instru 	(instructions)
:cid 		(coachID)
:athleteID 		(athleteID)
****************************************************************************************** */
INSERT INTO TrainingPlan(trainingID, startDate, endDate, instructions, coachID, athleteID)
	VALUES (:trainingID, ':startDate', ':endDate', ':instru', :cid, :athleteID)

UPDATE TrainingPlan
SET startDate = ':startDate', endDate = ':endDate', instructions = ':instru'
WHERE trainingID = :trainingID

/* ******************************************************************************************
Number 16
Change experience level and location of coach
:country
:prov		(state/province name)
:city
:cid 		(coachID)
:expLevel	(experienceLevel)
****************************************************************************************** */
UPDATE Coach
SET experienceLevel = :expLevel, country = ':country', province_state = ':prov', city = ':city'
WHERE coachID = :cid

/* ******************************************************************************************
Number 17
Athlete signs up for a team
:athleteID 		(athleteID)
:tid		(teamID)
****************************************************************************************** */
UPDATE Athlete
SET teamID = :tid
WHERE athleteID = :athleteID

/* ******************************************************************************************
Number 18
Create drug test results of an athlete
:expDate	(expire date)
:result		(result)
:athleteID 		(athleteID)
:did		(testID)
****************************************************************************************** */
INSERT INTO AthleteTakesTest(expDate,result,athleteID,testID)
	VALUES (':expDate', :result, :athleteID, :did)
	
UPDATE AthleteTakesTest
SET expDate = ':expDate', result = :result
WHERE athleteID = :athleteID AND testID = :did

DELETE FROM AthleteTakesTest
WHERE athleteID = 0 AND testID = 0
/* ******************************************************************************************
Number 20
Find drug test taken (athlete)
:athleteID 		(athleteID)
****************************************************************************************** */
SELECT dt.testName AS 'Drug test', testTaken.res AS 'Result', testTaken.date AS 'Expire date'
FROM DrugTest dt
JOIN (SELECT testID, MAX(result) AS res, MAX(expDate) AS date
	FROM AthleteTakesTest
	WHERE athleteID = :athleteID
	GROUP BY testID) as testTaken
	ON dt.testID = testTaken.testID

/* ******************************************************************************************
Number 21
Find coaches filtered by location, experience level (athlete)
:country
:prov		(state/province name)
:city
:expLevel	(experienceLevel)
****************************************************************************************** */
SELECT name, country, province_state, city, experienceLevel
FROM Coach c
JOIN Person p 
	ON p.personID = c.coachID
WHERE country LIKE ':country' AND 
	province_state LIKE ':prov' AND 
	city LIKE ':city' AND 
	experienceLevel LIKE :expLevel

/* ******************************************************************************************
Number 22
Athlete can view training plans created for them
:athleteID		(athleteID)
****************************************************************************************** */
SELECT t.startDate AS 'Start date', t.endDate AS 'End date', t.instructions AS 'Insructions'
FROM TrainingPlan t
WHERE t.athleteID = :athleteID
ORDER BY t.endDate ASC

/* ******************************************************************************************
Number 23
View information about their athletes (coaches)
:cid		(coachID)
****************************************************************************************** */
SELECT p.name AS 'Athlete', p.gender AS 'Gender', a.height AS 'Height', a.weight AS 'Weight'
FROM Coach c
JOIN TrainingPlan tp
	ON c.coachID = tp.coachID AND c.coachID = :cid
JOIN Athlete a
	ON a.athleteID = tp.athleteID
JOIN Person p
	ON p.personID = a.athleteID
ORDER BY p.name

/* ******************************************************************************************
Number 24
Trigger query for calculating new rank
****************************************************************************************** */
CREATE TRIGGER UpdateRankSB
AFTER UPDATE ON ParticipatesSB
FOR EACH ROW 
	UPDATE Rank r
	SET r.points = 
		(
		SELECT ROUND((MAX(result)+AVG(result))/2) AS Points
		FROM participatesSB parti
		JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.startDate) = YEAR(CURRENT_DATE)
		WHERE parti.athleteID = NEW.athleteID AND parti.sportID = NEW.sportID
		)
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID

CREATE TRIGGER UpdateRankTB
AFTER UPDATE ON ParticipatesTB
FOR EACH ROW 
	UPDATE Rank r
	SET r.points = 
		(
		SELECT 18000 - ROUND((MIN(time_to_sec(result))+AVG(time_to_sec(result)))/2) AS Points
		FROM participatesTB parti
		JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.startDate) = YEAR(CURRENT_DATE)
		WHERE parti.athleteID = NEW.athleteID AND parti.sportID = NEW.sportID
		)
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID
						      
CREATE TRIGGER UpdateInsertRankSB
AFTER INSERT ON ParticipatesSB
FOR EACH ROW 
	UPDATE Rank r
	SET r.points = 
		(
		SELECT ROUND((MAX(result)+AVG(result))/2) AS Points
		FROM participatesSB parti
		JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.startDate) = YEAR(CURRENT_DATE)
		WHERE parti.athleteID = NEW.athleteID AND parti.sportID = NEW.sportID
		)
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID

CREATE TRIGGER UpdateInsertRankTB
AFTER INSERT ON ParticipatesTB
FOR EACH ROW 
	UPDATE Rank r
	SET r.points = 
		(
		SELECT 18000 - ROUND((MIN(time_to_sec(result))+AVG(time_to_sec(result)))/2) AS Points
		FROM participatesTB parti
		JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.startDate) = YEAR(CURRENT_DATE)
		WHERE parti.athleteID = NEW.athleteID AND parti.sportID = NEW.sportID
		)
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID

/* ******************************************************************************************
Number 25
Trigger query for calculating new rank
****************************************************************************************** */
CREATE ASSERTION AllowedParticipationTB
CHECK
(
NOT EXISTS (
SELECT parti.sportID, parti.divisionID, parti.competitionID
FROM ParticipatesTB parti
WHERE NOT EXISTS
	(
	SELECT h.sportID
	FROM HasTB h
	WHERE h.sportID = parti.sportID AND 
		h.divisionID = parti.divisionID AND 
		h.competitionID = parti.competitionID
	)
))

CREATE ASSERTION AllowedParticipationSB
CHECK
(
SELECT parti.sportID, parti.divisionID, parti.competitionID
FROM ParticipatesSB parti
WHERE NOT EXISTS
	(
	SELECT h.sportID
	FROM HasSB h
	WHERE h.sportID = parti.sportID AND 
		h.divisionID = parti.divisionID AND 
		h.competitionID = parti.competitionID
	)
))

/* ******************************************************************************************
Number 26
View over ranks
****************************************************************************************** */
CREATE VIEW AthleteRank AS
SELECT p.name AS aName, a.country AS country, r.points AS points, s.name AS sName, s.sportID AS sportID, 
	CONCAT(d.gender, ' ', CONVERT(d.minAge, CHARACTER), '-', CONVERT(d.maxAge, CHARACTER)) AS divName, d.divisionID AS divisionID
FROM Rank r
JOIN Person p 
	ON p.personID = r.athleteID
JOIN Athlete a
	ON a.athleteID = p.personID
JOIN Sport s
	ON s.sportID = r.sportID
JOIN Division d
	ON d.gender = p.gender AND	
		YEAR(CURRENT_DATE) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge
		

