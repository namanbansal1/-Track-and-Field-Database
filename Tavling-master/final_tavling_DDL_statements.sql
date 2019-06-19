
CREATE TABLE Sport(
sportID INTEGER,
name CHAR(20),
PRIMARY KEY (sportID));


CREATE TABLE location(
country CHAR(40),
province_state CHAR(40),
city CHAR(40),
PRIMARY KEY (country, province_state, city)
);


CREATE TABLE Team(
teamID INTEGER,
name CHAR(20),
country CHAR(40) NOT NULL,
province_state CHAR(40) NOT NULL,
city CHAR(40) NOT NULL,
PRIMARY KEY (teamID),
FOREIGN KEY (country, province_state, city) REFERENCES Location(country, province_state, city)
ON DELETE NO ACTION
ON UPDATE CASCADE
);


CREATE TABLE Person(
personID INTEGER,
name CHAR(40),
gender CHAR(1),
birthDate DATE,
isCompetitionManager BOOLEAN,
PRIMARY KEY (personID)
);


CREATE TABLE Athlete(
weight INTEGER,
height INTEGER,
athleteID INTEGER,
teamID INTEGER,
country CHAR(20),
PRIMARY KEY (athleteID),
FOREIGN KEY (athleteID) REFERENCES Person(personID)
ON DELETE CASCADE,
FOREIGN KEY (teamID) REFERENCES Team(teamID)
ON DELETE SET NULL
);



CREATE TABLE Coach(
coachID INTEGER,
experienceLevel CHAR(40),
country CHAR(40) NOT NULL,
province_state CHAR(40) NOT NULL,
city CHAR(40) NOT NULL,
PRIMARY KEY (coachID),
FOREIGN KEY (coachID) references person(personID)
ON DELETE CASCADE,
FOREIGN KEY (country, province_state, city) REFERENCES Location(country, province_state, city)
ON DELETE NO ACTION
ON UPDATE CASCADE
);


CREATE TABLE SBSport(
sportID INTEGER,
/*WR FLOAT,*/
unit CHAR(6),
PRIMARY KEY (sportID),
FOREIGN KEY (sportID) REFERENCES Sport(sportID));

CREATE TABLE TBSport(
sportID INTEGER,
/*WR TIME,*/
PRIMARY KEY (sportID),
FOREIGN KEY (sportID) REFERENCES Sport(sportID));

CREATE TABLE Division(
divisionID INTEGER,
maxAge INTEGER,
minAge INTEGER,
gender CHAR(1),
PRIMARY KEY (divisionID));

/*
CREATE TABLE WRTB(
sportID INTEGER,
divisionID INTEGER,
record TIME,
PRIMARY KEY (sportID, divisionID),
FOREIGN KEY (sportID) REFERENCES TBSport(sportID),
FOREIGN KEY (divisionID) REFERENCES Division(divisionID));

CREATE TABLE WRSB(
sportID INTEGER,
divisionID INTEGER,
score FLOAT,
PRIMARY KEY (sportID, divisionID),
FOREIGN KEY (sportID) REFERENCES SBSport(sportID),
FOREIGN KEY (divisionID) REFERENCES Division(divisionID));
*/

CREATE TABLE Competition(
competitionID INTEGER,
name CHAR(40),
startDate DATE,
endDate DATE,
inviteOnly BOOLEAN,
country CHAR(20) NOT NULL,
province_state CHAR(20) NOT NULL,
city CHAR(20) NOT NULL,
competitionOrganizerID INTEGER NOT NULL,
PRIMARY KEY (competitionID),
FOREIGN KEY (country, province_state, city) REFERENCES Location(country, province_state, city)
ON DELETE NO ACTION
ON UPDATE CASCADE,
FOREIGN KEY (competitionOrganizerID) REFERENCES Person(personID)
ON DELETE NO ACTION
ON UPDATE CASCADE);

/*CREATE TABLE Organizes(
competitionOrganizerID INTEGER,
competitionID INTEGER,
PRIMARY KEY (competitionOrganizerID, competitionID),
FOREIGN KEY (competitionOrganizerID) REFERENCES Person(personID)
ON DELETE SET NULL,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE NO ACTION
);*/

CREATE TABLE HasTB(
spots INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (sportID, divisionID, competitionID),
FOREIGN KEY (sportID) references TBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) references Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) references Competition(competitionID)
ON DELETE CASCADE);

CREATE TABLE HasSB(
spots INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (sportID, divisionID, competitionID),
FOREIGN KEY (sportID) REFERENCES SBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) REFERENCES Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE);

CREATE TABLE ParticipatesTB(
status CHAR(20),
result TIME,
athleteID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (athleteID, sportID, divisionID, competitionID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES TBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) REFERENCES Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE);

CREATE TABLE ParticipatesSB(
status CHAR(20),
result float,
athleteID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (athleteID, sportID, divisionID, competitionID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES SBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) REFERENCES Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE);

CREATE TABLE Rank(
athleteID INTEGER,
sportID INTEGER,
points INTEGER,
PRIMARY KEY (athleteID, sportID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES Sport(sportID)
);

CREATE TABLE teaches(
coachID INTEGER,
sportID INTEGER,
PRIMARY KEY (coachID, sportID),
FOREIGN KEY (coachID) REFERENCES Coach(coachID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES Sport(sportID)
);


CREATE TABLE CompForTeam(
competitionID INTEGER,
teamID INTEGER,
PRIMARY KEY (competitionID, teamID),
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE,
FOREIGN KEY (teamID) REFERENCES Team(teamID)
ON DELETE CASCADE);


CREATE TABLE TrainingPlan(
trainingID INTEGER,
startDate DATE,
endDate DATE,
instructions TEXT,
coachID INTEGER,
athleteID INTEGER,
PRIMARY KEY (trainingID),
FOREIGN KEY (coachID) REFERENCES Coach(coachID)
ON DELETE CASCADE,
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID)
ON DELETE CASCADE
);

CREATE TABLE DrugTest(
testID INTEGER,
testName CHAR(20),
PRIMARY KEY (testID)
);

CREATE TABLE AthleteTakesTest(
expDate DATE,
result BOOLEAN,
athleteID INTEGER,
testID INTEGER,
PRIMARY KEY (athleteID,testID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID)
ON DELETE CASCADE,
FOREIGN KEY (testID) REFERENCES DrugTest(testID)
ON DELETE CASCADE
);

CREATE TABLE invitesTB(
competitionManagerID INTEGER,
athleteID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (competitionManagerID, athleteID, sportID, divisionID, competitionID),
FOREIGN KEY (competitionManagerID) REFERENCES Person(personID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID),
FOREIGN KEY (sportID) REFERENCES TBSport(sportID),
FOREIGN KEY (divisionID) REFERENCES Division(divisionID),
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID));

CREATE TABLE invitesSB(
competitionManagerID INTEGER,
athleteID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (competitionManagerID, athleteID, sportID, divisionID, competitionID),
FOREIGN KEY (competitionManagerID) REFERENCES Person(personID),
FOREIGN KEY (athleteID) REFERENCES Athlete(athleteID),
FOREIGN KEY (sportID) REFERENCES SBSport(sportID),
FOREIGN KEY (divisionID) REFERENCES Division(divisionID),
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID));

CREATE TABLE requiresTB(
testID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (testID, sportID, divisionID, competitionID),
FOREIGN KEY (testID) REFERENCES DrugTest(testID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES TBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) REFERENCES Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE);

CREATE TABLE requiresSB(
testID INTEGER,
sportID INTEGER,
divisionID INTEGER,
competitionID INTEGER,
PRIMARY KEY (testID, sportID, divisionID, competitionID),
FOREIGN KEY (testID) REFERENCES DrugTest(testID)
ON DELETE CASCADE,
FOREIGN KEY (sportID) REFERENCES SBSport(sportID)
ON DELETE CASCADE,
FOREIGN KEY (divisionID) REFERENCES Division(divisionID)
ON DELETE CASCADE,
FOREIGN KEY (competitionID) REFERENCES Competition(competitionID)
ON DELETE CASCADE);


CREATE VIEW AthleteRank AS
SELECT p.name AS aName, a.country AS country, r.points AS points, s.name AS sName, s.sportID AS sportID, 
	CONCAT(d.gender, " ", CONVERT(d.minAge, CHARACTER), "-", CONVERT(d.maxAge, CHARACTER)) AS divName, d.divisionID AS divisionID
FROM Rank r
JOIN Person p 
	ON p.personID = r.athleteID
JOIN Athlete a
	ON a.athleteID = p.personID
JOIN Sport s
	ON s.sportID = r.sportID
JOIN Division d
	ON d.gender = p.gender AND	
		YEAR(CURRENT_DATE) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge;

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
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID;

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
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID;
						      
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
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID;

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
	WHERE r.athleteID = NEW.athleteID AND r.sportID = NEW.sportID;


CREATE EVENT `DrugTestExpiry`   
  ON SCHEDULE EVERY 1 DAY  
    STARTS '2018-11-14 00:00:00.000000' ENDS '2020-03-31 00:00:00.000000'  
      ON COMPLETION PRESERVE  
      ENABLE 
      DO DELETE FROM athletetakestest  
        WHERE CURRENT_DATE > expDate;

CREATE EVENT `NewSeason` 
  ON SCHEDULE EVERY 1 YEAR 
    STARTS '2018-12-31 23:59:59' ENDS '2037-12-31 23:59:59' 
      ON COMPLETION PRESERVE 
        ENABLE COMMENT 'Reset points of every athlete after season finishes' 
          DO UPDATE rank SET points = 0 
            WHERE 1=1;