<?php

$sql01 = "SELECT IF(:sportID IN (SELECT sportID FROM TBSport), 'TB', 'SB') AS sportType";
$sql01 = str_replace(":sportID", INSERT, $sql01);

$sql02 = "SELECT IF(:personID IN (SELECT athleteID FROM Athlete), 1, 0) AS isAthlete";
$sql02 = str_replace(":personID", INSERT, $sql02);

$sql03 = "SELECT IF(:personID IN (SELECT athleteID FROM Coach), 1, 0) AS isCoach";
$sql03 = str_replace(":personID", INSERT, $sql03);

$sql04 = "SELECT isCompetitionManager FROM Person WHERE personID = :personID";
$sql04 = str_replace(":personID", INSERT, $sql04);

$sql05 = 
"SELECT CONCAT(d.gender, ' ', CONVERT(d.minAge, CHARACTER), '-', CONVERT(d.maxAge, CHARACTER)) AS 'Division',
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
WHERE parti.result = divRecord.record";
$sql05 = str_replace(":sportType", INSERT, $sql05);
$sql05 = str_replace(":sportID", INSERT, $sql05);
$sql05 = str_replace(":country", INSERT, $sql05);
$sql05 = str_replace(":season", INSERT, $sql05);

$sql06 = 
"SELECT s.name AS 'Sport', athRecord.record AS 'Record'
FROM Sport s
JOIN (SELECT sportID, IF(':sportType' LIKE 'TB', MIN(result), MAX(result)) AS record
	FROM Participates:sportType parti
	WHERE athleteID = :athleteID
	GROUP BY sportID) as athRecord
	ON s.sportID = athRecord.sportID"
$sql06 = str_replace(":sportType", INSERT, $sql06);
$sql06 = str_replace(":athleteID", INSERT, $sql06);

$sql07 = 
"SELECT p.name AS 'Athlete', result AS 'Result'
FROM Participates:sportType parti 
JOIN Person p 
	ON parti.athleteID = p.personID
WHERE parti.divisionID = :divID AND parti.competitionID = :compID AND parti.sportID = :sportID
ORDER BY parti.result :sort"
$sql07 = str_replace(":sportType", INSERT, $sql07);
$sql07 = str_replace(":sportID", INSERT, $sql07);
$sql07 = str_replace(":compID", INSERT, $sql07);
$sql07 = str_replace(":divID", INSERT, $sql07);
$sql07 = str_replace(":sort", INSERT, $sql07);

$sql08 = 
"SELECT aName AS 'Athlete', country, divName AS 'Division', points
FROM AthleteRank
WHERE sportID = :sportID AND 
	divisionID LIKE :divID AND
	country LIKE ':country'
ORDER BY points DESC"
$sql08 = str_replace(":sportID", INSERT, $sql08);
$sql08 = str_replace(":divID", INSERT, $sql08);
$sql08 = str_replace(":country", INSERT, $sql08);

$sql09 = 
"SELECT name, startDate, endDate, country, province_state, city
FROM Competition
WHERE city LIKE ':city' AND province_state LIKE ':prov' AND country LIKE ':country' AND NOT
	((startDate < :startDate AND endDate < :startDate) OR (startDate > :endDate AND endDate > :endDate))"
$sql09 = str_replace(":startDate", INSERT, $sql09);
$sql09 = str_replace(":endDate", INSERT, $sql09);
$sql09 = str_replace(":country", INSERT, $sql09);
$sql09 = str_replace(":prov", INSERT, $sql09);
$sql09 = str_replace(":city", INSERT, $sql09);

$sql10 = 
"INSERT INTO participates:sportType(status, athleteID, sportID, competitionID, divisionID)
	VALUES (:status, :athleteID, :sportID, :compID, 
	(SELECT d.divisionID
	FROM Division d 
	JOIN Person p
		ON p.personID = :athleteID
	JOIN Competition c
		ON c.competitionID = :compID
	WHERE YEAR(c.startDate) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge AND 
	p.gender = d.gender)
	)"
$sql10 = str_replace(":sportType", INSERT, $sql10);
$sql10 = str_replace(":sportID", INSERT, $sql10);
$sql10 = str_replace(":compID", INSERT, $sql10);
$sql10 = str_replace(":athleteID", INSERT, $sql10);
$sql10 = str_replace(":status", INSERT, $sql10);

$sql11 = 
"UPDATE participates:sportType
SET status = :status, result = :result
WHERE athleteID = :athleteID AND competitionID = :compID AND sportID = :sportID"
$sql11 = str_replace(":sportType", INSERT, $sql11);
$sql11 = str_replace(":sportID", INSERT, $sql11);
$sql11 = str_replace(":compID", INSERT, $sql11);
$sql11 = str_replace(":athleteID", INSERT, $sql11);
$sql11 = str_replace(":status", INSERT, $sql11);
$sql11 = str_replace(":result", INSERT, $sql11);

$sql12 = 
"UPDATE participates:sportType parti
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
	)"
$sql12 = str_replace(":compID", INSERT, $sql12);
$sql12 = str_replace(":sportType", INSERT, $sql12);

$sql13weight = 
"UPDATE Athlete
SET weight = :weight
WHERE athleteID = :athleteID"
$sql13weight = str_replace(":athleteID", INSERT, $sql13weight);
$sql13weight = str_replace(":weight", INSERT, $sql13weight);

$sql13height = 
"UPDATE Athlete
SET height = :height
WHERE athleteID = :athleteID"
$sql13height = str_replace(":athleteID", INSERT, $sql13height);
$sql13height = str_replace(":height", INSERT, $sql13height);

$sql13country = 
"UPDATE Athlete
SET country = ':country'
WHERE athleteID = :athleteID"
$sql13country = str_replace(":athleteID", INSERT, $sql13country);
$sql13country = str_replace(":country", INSERT, $sql13country);

$sql14create = 
"INSERT INTO Competition(competitionID, name, startDate, endDate, inviteOnly, 
	country, province_state, city, competitionOrganizerID)
VALUES (:compID, :name, :startDate, :endDate, :invOnly, ':country', ':prov', ':city', :managerID)"
$sql14create = str_replace(":compID", INSERT, $sql14create);
$sql14create = str_replace(":name", INSERT, $sql14create);
$sql14create = str_replace(":startDate", INSERT, $sql14create);
$sql14create = str_replace(":endDate", INSERT, $sql14create);
$sql14create = str_replace(":invOnly", INSERT, $sql14create);
$sql14create = str_replace(":country", INSERT, $sql14create);
$sql14create = str_replace(":prov", INSERT, $sql14create);
$sql14create = str_replace(":city", INSERT, $sql14create);
$sql14create = str_replace(":managerID", INSERT, $sql14create);











?>


