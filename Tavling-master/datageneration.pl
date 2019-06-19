#!/usr/bin/perl

@maleNames = (
'Siffre Levine',
'Cass Pledger',
'Casper Mandalia',
'Ronnie Abarca',
'Olly Zegans',
'Cornall Colangelo',
'Ad Lieber',
'Marc Green',
'Rod Robbat',
'Redford Weighart',
'Broderic Bonadeo',
'Lionel Krieger',
'Adrian Eden',
'Cob Chinipardaz',
'Wain Gagliardi',
'William Copas',
'Staffard Irwin',
'Marty Uehling',
'Vin Panepinto',
'Roger Quinlan'
);

@femaleNames = ( 
'Kristen Luongo',
'Cherye Martenis',
'Daniel Dinning',
'Dredi Chiarotti',
'Drucill Favazza',
'Zorina Neary',
'Dasie Looney',
'Carry Monque',
'Adela Cleroux',
'Gwenny Cassidy',
'Sammy Bellacicco',
'Brear Anselin',
'Philippa Maguire',
'Charmane Pontes',
'Jeanna Fornasari',
'Perrine Sayied',
'Linda Verde',
'Roslyn Delafaille',
'Fifine Harris',
'Maura Oberfield'
);

@DOBs = ( 
'1980:09:29',
'1980:08:09',
'1980:03:25',
'1980:07:09',
'1980:10:16',
'1980:11:23',
'1981:05:16',
'1983:10:21',
'1984:07:26',
'1984:10:21',
'1985:01:10',
'1985:11:06',
'1986:02:09',
'1986:12:05',
'1987:10:22',
'1989:06:18',
'1989:12:20',
'1990:10:20',
'1992:06:10',
'1995:10:23',
'1998:01:03',
'1998:01:09',
'1998:12:26',
'1999:10:05',
'1999:11:01',
'1976:06:08',
'1976:08:19',
'1976:12:10',
'1978:12:28',
'1979:08:09',
'1980:04:23',
'1981:09:02',
'1982:02:13',
'1982:08:24',
'1982:11:27',
'1982:12:03',
'1983:03:04',
'1985:09:03',
'1987:05:11',
'1987:08:07',
'1988:08:31',
'1990:06:20',
'1990:11:11',
'1991:06:30',
'1993:03:19',
'1993:11:03',
'1995:12:25',
'1996:06:27',
'1997:08:30',
'1999:09:26',
'1956:02:16',
'1956:04:19',
'1957:08:17',
'1958:01:18',
'1958:11:08',
'1959:11:14',
'1961:12:20',
'1963:07:28',
'1965:02:24',
'1965:11:10',
'1966:08:07',
'1966:10:12',
'1967:12:23',
'1968:08:26',
'1969:06:16',
'1969:10:14',
'1972:04:01',
'1972:12:16',
'1974:01:28',
'1981:02:17',
'1981:11:10',
'1982:09:29',
'1983:02:25',
'1983:06:30',
'1983:09:10'
);

@heights = (
187,
178,
158,
154,
160,
183,
176,
155,
150,
178,
178,
169,
174,
153,
177,
184,
190,
191,
154,
192,
181,
202,
182,
162,
187,
202,
152,
179,
181,
195,
154,
199,
173,
151,
167,
196,
163,
197,
176,
152,
166,
197,
169,
160,
176,
201,
183,
175,
174,
193,
155,
199,
183,
168,
177,
192,
158,
163,
151,
177,
168,
190,
160,
173,
180,
202,
199,
202,
172,
197,
170,
187,
203,
176,
192,
162,
150,
195,
171,
150,
156,
162,
200,
195,
155,
168,
183,
151,
173,
156,
203,
164,
151,
170,
191,
180,
156,
186,
158,
199,
);

@weights = (
97,
64,
82,
103,
91,
63,
99,
82,
103,
109,
93,
56,
98,
103,
65,
60,
97,
70,
83,
81,
93,
85,
107,
90,
90,
62,
57,
99,
55,
62,
91,
62,
87,
64,
61,
95,
66,
60,
55,
93,
101,
64,
77,
70,
78,
87,
105,
62,
70,
87,
109,
83,
66,
59,
94,
93,
89,
70,
69,
62,
55,
77,
99,
57,
84,
101,
65,
85,
73,
58,
66,
63,
70,
86,
59,
60,
83,
109,
81,
105,
92,
90,
63,
99,
82,
89,
110,
80,
80,
66,
71,
74,
98,
71,
80,
74,
88,
92,
64,
91,
111,
92,
116,
97,
120,
90,
109,
102,
115,
126,
116,
129,
126,
127,
118,
115,
109,
115,
124,
97,
104,
92,
117,
94,
95,
125,
106,
124,
92,
98,
);

@coachExpLevel = (
13,
24,
24,
1,
9,
10,
19,
23,
22,
13,
21,
22,
3,
9,
5,
9,
2,
22,
5,
6,
13,
25,
2,
15,
10,
20,
16,
11,
5,
17,
3,
15,
2,
14,
2,
22,
1,
8,
14,
9
);

@coachNames = (
'Hort Ruda',
'Frank Wolfe',
'Karoly Esser',
'Abbot Houng',
'Forbes Joseph',
'Gaelan Endler',
'Khalil Breiman',
'Ruddie Rachev',
'Trumann Shefftz',
'Warner Berstler',
);

@Cities_province_country = (
    '"Australia", "NSW", "Sydney"',
    '"Australia", "NSW", "Newcastle"',
    '"Australia", "QLD", "Brisbane"', 
    '"Australia", "QLD", "Townsville"', 
    '"Australia", "VIC", "Melbourne"', 
    '"Australia", "ACT", "Canberra"',
    '"Canada", "BC", "Vancouver"',
    '"Canada", "BC", "Burnaby"', 
    '"Canada", "BC", "Whistler"', 
    '"Canada", "BC", "Kelowna"',
    '"Canada", "AB", "Calgary"',
    '"Canada", "AB", "Edmonton"',
    '"Canada", "AB", "Banff"',
    '"Canada", "SK", "Saskatoon"',
    '"Canada", "SK", "Regina"',
    '"Canada", "ON", "Toronto"',
    '"Canada", "QC", "Montreal"',
    '"USA", "NY", "New York"',
    '"USA", "CA", "Los Angeles"',
    '"Sweden", "VL", "Gothenburg"',
    '"Sweden", "UP", "Uppsala"',
    '"Sweden", "SL", "Stockholm"'
);


@country = ('Canada', 'Australia', 'Sweden', 'USA'
    );


@sportsSB = (
    "Javelin",
    "Shot Put",
    "Discus",
    "Hammer Throw",
    "Long Jump",
    "High Jump",
    "Triple Jump",
    "Pole Vault"
);

@sportsTB = (
"100m",
"200m",
"400m",
"800m",
"1500m",
"3000m",
"5000m",
"10000m",
"110m Hurdle",
"400m Hurdle",
"20km Walk",
"50km Walk",
"Marathon"    
);

@drugTests = (
'"Amphetamine"',
'"Heroin"',
'"Anabolic Steroids"',
'"Trenbolone"',
'"Testosterone"',
'"Human Growth Hormone"',
'"Cocaine"',
'"Barbiturates"',
'"MDMA"',
'"Propoxyphene"'
);

@team_Names = (
'Bye Week', 
'Raspberry Berets', 
'The Flaming Flamingos', 
'Battling Mongooses', 
'The Best Team', 
'Columbian Boot Weasels', 
'Real Honey Badgers', 
'Tumbling Tumbleweeds', 
'Mad Cows', 
'Great Balls of Fire', 
'Awkward Turtles', 
'Amazing Armadillos', 
'Silly Squids', 
'Chuck Norris Offspring', 
'Pokemon Rescue Squad', 
'Donkey Kong Killers', 
'The Splendid Pineapples', 
);

@divisions = (
    '"17","15"',
    '"22","18"',
    '"29","22"',
    '"39","30"',
    '"65","40"'
);


@CompetitionManagerNames = (
'Sumner Daumer',
'Mattie Hoe',
'Jonathan Paula',
'Lockwood Eskin',
'Keary Zinnes',
'Shellysheldon Perella',
'Court Bruice',
'Rolfe Sandblom',
'Codi Oleski',
'Erich Corrado' 
);


my $filename = 'insertStatements.sql';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

print $fh "DROP DATABASE IF EXISTS tavlingDB;\n";

foreach $i (0..($#maleNames+$#femaleNames+$#coachNames+$#CompetitionManagerNames)){
    print $fh "DROP USER IF EXISTS\'$i\'@\'localhost\';\n\n";
}

print $fh "CREATE DATABASE tavlingDB; USE tavlingDB; FLUSH PRIVILEGES;\n";

print $fh '
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
trainingID INTEGER AUTO_INCREMENT,
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
  ON SCHEDULE EVERY 1 MINUTE 
    STARTS \'2018-11-17 00:00:00.000000\' ENDS \'2020-03-31 00:00:00.000000\'  
      ON COMPLETION PRESERVE  
      ENABLE 
      DO DELETE FROM athletetakestest  
        WHERE CURRENT_DATE > expDate;

CREATE EVENT `NewSeason` 
  ON SCHEDULE EVERY 1 YEAR 
    STARTS \'2018-12-31 23:59:59\' ENDS \'2037-12-31 23:59:59\' 
      ON COMPLETION PRESERVE 
        ENABLE COMMENT \'Reset points of every athlete after season finishes\' 
          DO UPDATE rank SET points = 0 
            WHERE 1=1;';

print $fh "\n";

print $fh "/* Division Declarations */\n";
foreach $j (0...$#divisions){
    $fdiv = $j + $#divisions + 1;
    print $fh "INSERT INTO Division
    VALUES (\"$j\", $divisions[$j], \"M\");\n\n";
    print $fh "INSERT INTO Division
    VALUES (\"$fdiv\", $divisions[$j], \"F\");\n\n";

}

#sport declaration generation. This includes both TB and SB sports
print $fh "/* Sport Declarations */\n";
foreach $i (0...$#sportsSB){
    print $fh "INSERT INTO Sport
    VALUES (\"$i\", \"$sportsSB[$i]\");\n\n";
    
    print $fh "INSERT INTO SBSport
    VALUES (\"$i\", \"metres\");\n\n";
    #foreach $j (0..(2*$#divisions)){
    #    $worldrecS = int(rand(105));
    #    print $fh "INSERT INTO WRSB
    #    VALUES (\"$i\", \"$j\", \"$worldrecS\");\n\n";        
    #}
}

foreach $i (0...$#sportsTB){
    $scaleSports = $#sportsSB + 1 + $i;
    print $fh "INSERT INTO Sport
    VALUES (\"$scaleSports\", \"$sportsTB[$i]\");\n\n";
    
    print $fh "INSERT INTO TBSport
    VALUES (\"$scaleSports\");\n\n";
    #foreach $j (0..(2*$#divisions)){
    #    $worldrec1 = int(rand(2));
    #    $worldrec2 = int(rand(60));
    #    $worldrec3 = int(rand(60));
    #    print $fh "INSERT INTO WRTB
    #    VALUES (\"$scaleSports\", \"$j\", \"$worldrec1:$worldrec2:$worldrec3\");\n\n";        
    #}
}

foreach $i (0..$#drugTests){
    print $fh "INSERT INTO DrugTest
    VALUES (\"$i\", $drugTests[$i]);\n\n";            
}


print $fh "/* Location Declarations */\n";
foreach $j (0...$#Cities_province_country){
    print $fh "INSERT INTO Location
    VALUES ($Cities_province_country[$j]);\n\n";
}

print $fh "/* Team Declarations */\n";
foreach $j (0...$#team_Names){
    print $fh "INSERT INTO Team
    VALUES (\"$j\", \"$team_Names[$j]\", $Cities_province_country[$j%($#Cities_province_country)]);\n\n";
}

print $fh "/* Male Persons Declarations */\n";
foreach $j (0...$#maleNames){
    $dobstore[$j] = $DOBs[$j%($#DOBs)];
    #print "j = $j, $dobstore[$j]\n";
    print $fh "INSERT INTO Person
    VALUES (\"$j\", \"$maleNames[$j]\", \"M\", \"$dobstore[$j]\", \"0\");\n\n";
}

print $fh "/* Female Persons Declarations */\n";
foreach $j (0...$#femaleNames){
    $scale = $j + $#maleNames + 1;
    $dobstore[$scale] = $DOBs[$j%($#DOBs)];
    print $fh "INSERT INTO Person
    VALUES (\"$scale\", \"$femaleNames[$j]\", \"F\", \"$dobstore[$scale]\", \"0\");\n\n";
}

print $fh "/* Coach Persons Declarations */\n";
foreach $j (0...$#coachNames){
    $scale = $j + $#maleNames + $#femaleNames + 2;
    print $fh "INSERT INTO Person
    VALUES (\"$scale\", \"$coachNames[$j]\", \"M\", \"$DOBs[$j%($#DOBs)]\", \"0\");\n\n";
}

print $fh "/* CompetitionManager Persons Declarations */\n";
foreach $j (0...$#coachNames){
    $scale = $j + $#maleNames + $#femaleNames + $#coachNames + 3;
    print $fh "INSERT INTO Person
    VALUES (\"$scale\", \"$CompetitionManagerNames[$j]\", \"M\", \"$DOBs[$j%($#DOBs)]\", \"1\");\n\n";
}

print $fh "/* Male Athlete Declarations */\n";
foreach $j (0...$#maleNames){
    $tempTeam = int(rand($#team_Names +1));
    $tempCountry = $country[int(rand($#country+1))];
    print $fh "INSERT INTO Athlete
    VALUES (\"$weights[$j%($#weights)]\", \"$heights[$j%($#heights)]\", \"$j\", \"$tempTeam\", \"$tempCountry\" );\n\n";

}

print $fh "/* female Athlete Declarations */\n";
foreach $j (0...$#femaleNames){
    $tempTeam = int(rand($#team_Names +1));
    $tempCountry = $country[int(rand($#country+1))];
    $scale = $j + $#maleNames + 1;
    print $fh "INSERT INTO Athlete
    VALUES (\"$weights[$j%($#weights)]\", \"$heights[$j%($#heights)]\", \"$scale\", \"$tempTeam\", \"$tempCountry\");\n\n";
}



#first 9 male names are coaches as well as athletes
#print $fh "/* Coach Declarations */\n";
#foreach $j (0...8){
#    $expLevel = int(rand(10));
#    $Loc = $Cities_province_country[(int(rand($#Cities_province_country)))];
#    print $fh "INSERT INTO Coach
#    VALUES (\"$j\", \"$expLevel\", $Loc);\n\n";
#}

#same for female
#print $fh "/* Coach Declarations */\n";
#foreach $j (0...8){
#   $scale = $j + $#maleNames + 1;
#    $expLevel = int(rand(10));
#    $Loc = $Cities_province_country[(int(rand($#Cities_province_country)))];
#    print $fh "INSERT INTO Coach
#    VALUES (\"$scale\", \"$expLevel\", $Loc);\n\n";

#}

print $fh "/* Coach Declarations */\n";
foreach $j (0...$#coachNames){
    $scale = $j + $#maleNames + $#femaleNames + 2;
    $expLevel = int(rand(10));
    $Loc = $Cities_province_country[(int(rand($#Cities_province_country)))];
    print $fh "INSERT INTO Coach
    VALUES (\"$scale\", \"$expLevel\", $Loc);\n\n";

}
 @coachTeaches = (());
print $fh "/* Coach teaching Declarations */\n";
foreach $i (0...$#coachNames){
    $randSport = int(rand($#sportsSB));
    $randSport2 = int(rand($#sportsTB))+$#sportsSB+1;
    $scale = $i + $#maleNames + $#femaleNames + 2;
    $coachTeaches[$scale][0] = $randSport;
    $coachTeaches[$scale][1] = $randSport2;
    print "$scale $randSport blah $randSport2 \n";
    print $fh "INSERT INTO teaches
    VALUES ($scale, $randSport);\n\n";
    print $fh "INSERT INTO teaches
    VALUES ($scale, $randSport2);\n\n";
}

#print $fh "/* Coach teaching Declarations */\n";
#foreach $i (0...8){
#    $randSport = int(rand($#sportsSB));
#    $randSport2 = int(rand($#sportsTB))+$#sportsSB+1;
#    $scale = $i;
#    $coachTeaches[$scale][0] = $randSport;
#    $coachTeaches[$scale][1] = $randSport2;
#    print $fh "INSERT INTO teaches
#    VALUES (\"$scale\", \"$randSport\");\n\n";
#    print $fh "INSERT INTO teaches
#    VALUES (\"$scale\", \"$randSport2\");\n\n";
#
#}

#foreach $i (0...8){
#    $randSport = int(rand($#sportsSB));
#    $randSport2 = int(rand($#sportsTB))+$#sportsSB+1;
#    $scale = $i + $#maleNames +1;
#    $coachTeaches[$scale][0] = $randSport;
#    $coachTeaches[$scale][1] = $randSport2;
#    print $fh "INSERT INTO teaches
##    VALUES (\"$scale\", \"$randSport\");\n\n";
#    print $fh "INSERT INTO teaches
#    VALUES (\"$scale\", \"$randSport2\");\n\n";

#}

@athleteTestResults = (());
foreach $i (0..$#maleNames+$#femaleNames){
    foreach $j (0..$#drugTests){
        $date = int(rand(6))+6;
        $passFail = int(rand(4000));
        #print "$passFail\n";
        $result = ($passFail%8 != 0) ? '1' : '0';
        $athleteTestResults[$i][$j] = $result;
        #//print "$result\n";
        print $fh "INSERT INTO AthleteTakesTest
        VALUES (\"2018:$date:30\", \"$result\", \"$i\", \"$j\");\n\n";
        undef $passFail;
        undef $result;
    }
}

@CompetitionNames = (
'"January 2018 Meet"',
'"February 2018 Meet"',
'"March 2018 Meet"',
'"May 2018 Meet"',
'"April 2018 Meet"',
'"June 2018 Meet"',
'"July 2018 Meet"',
'"August 2018 Meet"',
'"September 2018 Meet"',
'"October 2018 Meet"',
'"November 2018 Meet"',
'"December 2018 Meet"',
'"Winter Finals 2018"',
'"Summer Finals 2018"',
'"Spring Finals 2018"',
'"Fall Finals 2018"',
);

@CompetitionNames2017 = (
'"January 2017 Meet"',
'"February 2017 Meet"',
'"March 2017 Meet"',
'"May 2017 Meet"',
'"April 2017 Meet"',
'"June 2017 Meet"',
'"July 2017 Meet"',
'"August 2017 Meet"',
'"September 2017 Meet"',
'"October 2017 Meet"',
'"November 2017 Meet"',
'"December 2017 Meet"',
'"Winter Finals 2017"',
'"Summer Finals 2017"',
'"Spring Finals 2017"',
'"Fall Finals 2017"',
);

@CompetitionNames2016 = (
#'"January 2016 Meet"',
#'"February 2016 Meet"',
#'"March 2016 Meet"',
#'"May 2016 Meet"',
#'"April 2016 Meet"',
#'"June 2016 Meet"',
#'"July 2016 Meet"',
'"August 2016 Meet"',
'"September 2016 Meet"',
'"October 2016 Meet"',
'"November 2016 Meet"',
'"December 2016 Meet"',
#'"Winter Finals 2016"',
#'"Summer Finals 2016"',
#'"Spring Finals 2016"',
#'"Fall Finals 2016"',
);

$q = 3;
foreach $i (0...$#CompetitionNames) {
    $locat = int(rand($#Cities_province_country));
    $compManager = int(rand($#CompetitionManagerNames)) + $#coachNames + $#maleNames +$#femaleNames + 3;     
    if ($i < 12){
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $i + 1;
        print $fh "INSERT INTO Competition
        VALUES (\"$i\", $CompetitionNames[$i], \"2018:$month:$startDateNum\", \"2018:$month:$endDateNum\", \"0\", $Cities_province_country[$locat], \"$compManager\");\n\n";
    } else {
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $q;
        print $fh "INSERT INTO Competition
        VALUES (\"$i\", $CompetitionNames[$i], \"2018:$month:$startDateNum\", \"2018:$month:$endDateNum\", \"1\", $Cities_province_country[$locat], \"$compManager\");\n\n";
        $q = $q + 3;
    }
    
}

$q = 3;
foreach $i (0...$#CompetitionNames2017) {
    $scale = $i +1 + $#CompetitionNames;
    $locat = int(rand($#Cities_province_country));
    $compManager = int(rand($#CompetitionManagerNames+1)) + $#coachNames + $#maleNames +$#femaleNames + 3;     
    if ($i < 12){
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $i + 1;
        
        print $fh "INSERT INTO Competition
        VALUES (\"$scale\", $CompetitionNames2017[$i], \"2017:$month:$startDateNum\", \"2017:$month:$endDateNum\", \"0\", $Cities_province_country[$locat], \"$compManager\");\n\n";
    } else {
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $q;
        print $fh "INSERT INTO Competition
        VALUES (\"$scale\", $CompetitionNames2017[$i], \"2017:$month:$startDateNum\", \"2017:$month:$endDateNum\", \"1\", $Cities_province_country[$locat], \"$compManager\");\n\n";
        $q = $q + 3;
    }
    
}

$q = 3;
foreach $i (0...$#CompetitionNames2016) {
    $scale = $i +1 + $#CompetitionNames +1+ $#CompetitionNames2017;
    $locat = int(rand($#Cities_province_country));
    $compManager = int(rand($#CompetitionManagerNames+1)) + $#coachNames + $#maleNames +$#femaleNames + 3;     
    if ($i < 12){
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $i + 1;
        
        print $fh "INSERT INTO Competition
        VALUES (\"$scale\", $CompetitionNames2016[$i], \"2016:$month:$startDateNum\", \"2017:$month:$endDateNum\", \"0\", $Cities_province_country[$locat], \"$compManager\");\n\n";
    } else {
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = $q;
        print $fh "INSERT INTO Competition
        VALUES (\"$scale\", $CompetitionNames2016[$i], \"2016:$month:$startDateNum\", \"2017:$month:$endDateNum\", \"1\", $Cities_province_country[$locat], \"$compManager\");\n\n";
        $q = $q + 3;
    }
    
}

print $fh "/* Private Team Competition Declarations */\n";
foreach $i (0...$#team_Names) {
    $locat = int(rand($#Cities_province_country));
    $compManager = int(rand($#CompetitionManagerNames)) + $#coachNames + $#maleNames +$#femaleNames + 3;
        $startDateNum = int(rand(20)+1);
        $endDateNum = $startDateNum + 2;
        $month = int(rand(12))+1;
        $CompID = $#CompetitionNames + 1 +$i+$#CompetitionNames2017+1+$#CompetitionNames2016+1;
        print $fh "INSERT INTO Competition
        VALUES (\"$CompID\", \"$team_Names[$i] Private Meet\", \"2018:$month:$startDateNum\", \"2018:$month:$endDateNum\", \"0\", $Cities_province_country[$locat], \"$compManager\");\n\n";
        print $fh "INSERT INTO CompForTeam
        VALUES (\"$CompID\", \"$i\");\n\n";
}

@randSport100 = ();
@randSport400 = ();

foreach $i (0...($#maleNames+$#femaleNames)){
    push @randSport100, int(rand($i%($#sportsSB)));
    #print "$i random SB = $randSport100[$i]\n";
    push @randSport400, int(rand($i%($#sportsTB+1)))+$#sportsSB+1;
    #print "random TB = $randSport400[$i]\n";
    #print "athlete $i has randSport1 $randSport100[$i] and rnadSport2 $randSport400[$i]\n";
    #$points = int(rand(100));
    foreach $j (0..$#sportsSB+$#sportsTB){
    print $fh "INSERT INTO Rank
            VALUES (\"$i\", \"$j\", \"0\");\n\n";
    }
    #$points = int(rand(98));
    #print $fh "INSERT INTO Rank
    #        VALUES (\"$i\", \"$randSport400[$i]\", \"$points\");\n\n";
}

@statuses = (
'DQD',
'DNF',
'FND',
'NAN',
'INV'
);

#might have to sort this there are way too many
@DrugTestReqs = (((())));
foreach $i (0...$#CompetitionNames) {
    foreach $j (0..$#sportsSB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            #print "$minAge $maxAge\n";

            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$j][$k][0] = $test1;
            $DrugTestReqs[$i][$j][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}

            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$k\", \"$i\");\n\n";
            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$femaleDivScale\", \"$i\");\n\n";

            #give each division/sport 2 arbitrary tests
            
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$k\", \"$i\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$k\", \"$i\");\n\n";

            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$femaleDivScale\", \"$i\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$femaleDivScale\", \"$i\");\n\n";

            #repeat for females

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$z])){
                    print "you're in - Male SB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "ye\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$z\", \"$j\", \"$k\", \"$i\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$j\", \"$k\", \"$i\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 +$#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$scalefemaleInnerSB])){
                    print "you're in - Female SB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "yeet\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$i\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$i\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

        }
    }

    foreach $j (0..$#sportsTB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            $scaleTB =  $j+$#sportsSB+1;
            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$scale][$k][0] = $test1;
            $DrugTestReqs[$i][$scale][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$k\", \"$i\");\n\n";
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$femaleDivScale\", \"$i\");\n\n";

            #give each division/sport 2 arbitrary tests
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$k\", \"$i\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$k\", \"$i\");\n\n";

            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$femaleDivScale\", \"$i\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$femaleDivScale\", \"$i\");\n\n";

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "$minAge, $age, $maxAge "; 
                #print "$randSport400[$z] $scaleTB || $minAge $age $maxAge\n";

                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$z])){
                    print "you're in - Male TB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        #$resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$z\", \"$scaleTB\", \"$k\", \"$i\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$scaleTB\", \"$k\", \"$i\");\n\n"
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 + $#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$scalefemaleInnerSB])){
                    print "you're in - femaleTB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        #print "femaleTB\n";
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        $resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$i\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$i\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }
        }
    }
}


########################################################
# 2017

foreach $i (0...$#CompetitionNames2017) {
    $scaleComp = $i + 1 + $#CompetitionNames;
    foreach $j (0..$#sportsSB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            #print "$minAge $maxAge\n";

            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$j][$k][0] = $test1;
            $DrugTestReqs[$i][$j][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}

            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #give each division/sport 2 arbitrary tests
            
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$k\", \"$scaleComp\");\n\n";

            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #repeat for females

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$z])){
                    print "you're in - Male SB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "ye\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$z\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 +$#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$scalefemaleInnerSB])){
                    print "you're in - Female SB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "yeet\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

        }
    }

    foreach $j (0..$#sportsTB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            $scaleTB =  $j+$#sportsSB+1;
            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$scale][$k][0] = $test1;
            $DrugTestReqs[$i][$scale][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #give each division/sport 2 arbitrary tests
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";

            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "$minAge, $age, $maxAge "; 
                #print "$randSport400[$z] $scaleTB || $minAge $age $maxAge\n";

                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$z])){
                    print "you're in - Male TB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        #$resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$z\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n"
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 + $#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$scalefemaleInnerSB])){
                    print "you're in - femaleTB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        #print "femaleTB\n";
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        $resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }
        }
    }
}

#########################################################


########################################################
# 2016

foreach $i (0...$#CompetitionNames2016) {
    $scaleComp = $i + 1 + $#CompetitionNames + $#CompetitionNames2017 + 1;
    foreach $j (0..$#sportsSB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            #print "$minAge $maxAge\n";

            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$j][$k][0] = $test1;
            $DrugTestReqs[$i][$j][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}

            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO HasSB
            VALUES (\"50\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #give each division/sport 2 arbitrary tests
            
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$k\", \"$scaleComp\");\n\n";

            print $fh "INSERT INTO requiresSB
            VALUES (\"$test1\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresSB
            VALUES (\"$test2\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #repeat for females

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$z])){
                    print "you're in - Male SB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "ye\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$z\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$j\", \"$k\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 +$#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($j == $randSport100[$scalefemaleInnerSB])){
                    print "you're in - Female SB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        $resultSB = int(rand(200));
                        #print "yeet\n";
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[2]\", \"$resultSB\", \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesSB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$j\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }

        }
    }

    foreach $j (0..$#sportsTB) {
        foreach $k (0...$#divisions){
            @Ages = split('","', $divisions[$k]);
            $Ages[0] =~ s/"//g;
            $Ages[1] =~ s/"//g;
            $minAge = int($Ages[1]);
            $maxAge = int($Ages[0]);
            $scaleTB =  $j+$#sportsSB+1;
            $femaleDivScale = $k+$#divisions+1;
            #$randomSkip = int(rand($#divisions));
            $test1 = ($i%$#drugTests);
            $test2 = ($i+1)%$#drugTests;
            $DrugTestReqs[$i][$scale][$k][0] = $test1;
            $DrugTestReqs[$i][$scale][$k][1] = $test2;
            #if ($randomSkip == $k) {
            #    next;
            #}
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO HasTB
            VALUES (\"50\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            #give each division/sport 2 arbitrary tests
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";

            print $fh "INSERT INTO requiresTB
            VALUES (\"$test1\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
            print $fh "INSERT INTO requiresTB
            VALUES (\"$test2\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";

            foreach $z (0..$#maleNames){
                @year = split(':', $dobstore[$z]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#maleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "$minAge, $age, $maxAge "; 
                #print "$randSport400[$z] $scaleTB || $minAge $age $maxAge\n";

                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$z])){
                    print "you're in - Male TB\n";
                    if(($athleteTestResults[$z][$test1] eq '1') && ($athleteTestResults[$z][$test2] eq '1') ){
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        #$resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$z\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$z\", \"$scaleTB\", \"$k\", \"$scaleComp\");\n\n"
                    }
                }
                # need to factor in DOB of each athlete
            }

            foreach $z (0..$#femaleNames){
                $scalefemaleInnerSB = $z + 1 + $#maleNames;
                @year = split(':', $dobstore[$scalefemaleInnerSB]);
                #print "$dobstore[$z], $year[0]\n";
                $age = 2018 - int($year[0]);
                if(int($year[1]) > 11){
                    $age = $age - 1;
                }
                $randomSkip2 = int(rand($#femaleNames));
                if($randomSkip2 == $z){
                    next;
                }
                #print "year = $year[0]\n";
                if(($minAge <= $age) && ($age <= $maxAge) && ($scaleTB == $randSport400[$scalefemaleInnerSB])){
                    print "you're in - femaleTB\n";
                    if(($athleteTestResults[$scalefemaleInnerSB][$test1] eq '1') && ($athleteTestResults[$scalefemaleInnerSB][$test2] eq '1') ){
                        #print "femaleTB\n";
                        $resultTB1 = int(rand(2));
                        $resultTB2 = int(rand(59));
                        $resultTB3 = int(rand(58));
                        $resultSB = int(rand(200));
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[2]\", \"$resultTB1:$resultTB2:$resultTB3\", \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    } else {
                        print $fh "INSERT INTO participatesTB
                        VALUES (\"$statuses[0]\", NULL, \"$scalefemaleInnerSB\", \"$scaleTB\", \"$femaleDivScale\", \"$scaleComp\");\n\n";
                    }
                }
                # need to factor in DOB of each athlete
            }
        }
    }
}

#########################################################


foreach $i (12..15) {
        foreach $j (0..10){
            $compManager = int(rand($#CompetitionManagerNames)) + $#coachNames + $#maleNames +$#femaleNames + 3;    
            print $fh "INSERT INTO InvitesSB
                VALUES (\"$compManager\", \"$j\", \"$randSport100[$j]\", \"3\", \"$i\");\n\n";
            $scale = $j +$#maleNames + 1;
            #print "  male $compManager $j, $randSport100[$j], 4, $i\n";
            #print "female: $compManager $scale $randSport100[$scale], 12, $i\n\n";
            print $fh "INSERT INTO InvitesSB
                VALUES (\"$compManager\", \"$scale\", \"$randSport100[$scale]\", \"8\", \"$i\");\n\n";
        }
}

foreach $i (12..15) {
        foreach $j (0..10){
            $compManager = int(rand($#CompetitionManagerNames)) + $#coachNames + $#maleNames +$#femaleNames + 3;    
            print $fh "INSERT INTO InvitesTB
                VALUES (\"$compManager\", \"$j\", \"$randSport400[$j]\", \"3\", \"$i\");\n\n";
            $scale = $j +$#maleNames + 1;
            print $fh "INSERT INTO InvitesTB
                VALUES (\"$compManager\", \"$scale\", \"$randSport400[$scale]\", \"8\", \"$i\");\n\n";
    }
}

$count = 0;
foreach $i (0..$#coachNames){
    $scale = $i + $#maleNames + $#femaleNames +2;

    foreach $j (0..($#maleNames+$#femaleNames)){
        if(($coachTeaches[$scale][0] == $randSport100[$j]) || ($coachTeaches[$scale][1] == $randSport400[$j])){
            if(int(rand(12)) < 5){
                #print "TrainingPlan \n";
                print $fh "INSERT INTO TrainingPlan
                    VALUES (\"$count\", \"2018:01:01\", \"2018:12:31\", \"Do Lost of Exercise and Stuff!\", \"$scale\", \"$j\");\n\n";
                $count = $count +1;    
            }
        }
    }
}

foreach $i (0..($#maleNames+$#femaleNames+$#coachNames+$#CompetitionManagerNames)){
   print $fh "CREATE USER \'$i\'\@\'localhost\'; GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO \'$i\'\@\'localhost\' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT SELECT, INSERT, UPDATE, DELETE ON \`tavlingDB\`\.\* TO \'$i\'\@\'localhost\';\n\n";
}

print $fh "CREATE USER IF NOT EXISTS \'admin\'\@\'localhost\'; GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO \'$i\'\@\'localhost\' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;GRANT SELECT, INSERT, UPDATE, DELETE ON \`tavlingDB\`\.\* TO \'$i\'\@\'localhost\';\n\n";


close $fh;
print "done\n";
