<!DOCTYPE html>
<html>
<head>
	<title>User</title>
	<link rel="stylesheet" type="text/css" href="athletestyle.css?<?php echo time(); ?>" />
</head>

<div class="topnav">
 <a href="login.php">Login</a>
 <a class="active" href="home.php">Personal Page</a>
 <a href="records.php">Records</a>
 <a href="competitions.php">Competitions</a>
 <a href="ranks.php">Rankings</a>
</div>

<body>
	<body style="background: LIGHTBLUE">

	<div class="sidenav">
		<p align="center"> <img src="profile.jpg" width="100" height="80" /></p>
	<?php
		session_start();
		$servername = "localhost";
		$username = $_SESSION['username'];
		$password = "";
		$dbname = "TavlingDB";

		$conn = new mysqli($servername, $username, $password, $dbname);
		if ($conn->connect_error) {
				die("Connection Error: " . $conn->connect_error);
		}
		$success = True;
		$actualName = mysqli_query($conn, "select name from person where personID = ".$_SESSION['username'].";");
		$row = mysqli_fetch_array($actualName);
		echo "<center>";
		echo "<h2>".$row['name']." | Athlete</h2>";
		echo "</center>";
	?>
  <hr>
<?php
	$athleteInfo = mysqli_query($conn, "SELECT p.name AS 'Name', p.birthDate AS 'Birth Date', t.name AS 'Team', a.country AS 'Country',
		a.weight AS 'Weight', a.height AS 'Height'
		FROM athlete a, team t, person p WHERE personID = ".$_SESSION['username']." AND a.athleteID = p.personID AND a.teamID = t.teamID");
	printAthleteInfo($athleteInfo);

	function printAthleteInfo($info) {
		if(!$info || mysqli_num_rows($info) == 0){
			echo "No Results";
		} else {
			$row = mysqli_fetch_array($info);
			echo "<center>";
			echo "<th>Name</th><br>";
			echo "<td>" . $row["Name"] . "</td><br><br>";
			echo "<th>Birth Date</th><br>";
			echo "<td>" . $row["Birth Date"] . "</td><br><br>";
			echo "<th>Team</th><br>";
			echo "<td>" . $row["Team"] . "</td><br><br>";
			echo "<th>Country</th><br>";
			echo "<td>" . $row["Country"] . "</td><br><br>";
			echo "<th>Height</th><br>";
			echo "<td>" . $row["Height"] . "</td><br><br>";
			echo "<th>Weight</th><br>";
			echo "<td>" . $row["Weight"] . "</td><br><br>";
			echo "</center>";
  	}
	}
?>

 <form method="POST" action="athlete.php">
	 <center>
	 <input type="submit" name="personalrecords" value="Personal Records"><br><br>
	 <input type="submit" name="testresults" value="Drug Test Results"><br><br>
	 <input type="submit" name="trainingplan" value="View Training Plan(s)"><br><br>
 </center>

</div>
<div class="rsidenav">
	<center>
	Update Your Information:
	<input type="text" name="weighttoupdate" placeholder="Weight"><br>
	<input type="submit" onclick='location.reload(true)' name="updateweight" value="Update Weight"><br><br>
	<input type="text" name="heighttoupdate" placeholder="Height"><br>
	<input type="submit" onclick='location.reload(true)' name="updateheight" value="Update Height"><br><br>
	<input type="text" name="countrytoupdate" placeholder="Country"><br>
	<input type="submit" onclick='location.reload(true)' name="updatecountry" value="Update Country"><br><br>
Sign Up for a Competition:
<select name="competitions">
<?php
		$availComps = mysqli_query($conn, "select c.competitionID as compID, c.name as compName from competition c where inviteOnly=0 AND c.competitionID NOT IN (SELECT team.competitionID from compforteam team);");
		while ($row = mysqli_fetch_array($availComps)) {
			unset($compID, $compName);
			$compID = $row['compID'];
			$compName = $row['compName'];
			echo '<option value="'.$compID.'" name="'.$compID.'">'.$compName.'</option>';
	}
?>
</select><br>

<select name="sport">
		<?php
		$sports = mysqli_query($conn,"select name,sportid from sport");
		while ($row = mysqli_fetch_array($sports)) {
				unset($sportid, $name);
				$sportid = $row['sportid'];
				$name = $row['name'];
				echo '<option value="'.$sportid.'" name="'.$sportid.'">'.$name.'</option>';
		}
		?>
</select><br>
<input type="submit" name="signupsubmit" value="Sign Up"><br><br>
Join a Team:
<select name="teamid">
	<?php
		$teams = mysqli_query($conn,"select name,teamid from team");
		while ($row = mysqli_fetch_array($teams)) {
				unset($teamid, $name);
				$teamid = $row['teamid'];
				$name = $row['name'];
				echo '<option value="'.$teamid.'" name="'.$teamid.'">'.$name.'</option>';
		}
	?>
</select><br>
<input type="submit" name="jointeamsubmit" value="Join Team"><br><br>

Find a Coach:
<select name="coachlocation">
	<?php
	$sqlLocations = mysqli_query($conn,"SELECT * FROM location");

	while ($row = mysqli_fetch_array($sqlLocations)) {
		unset($country, $province_state, $city);
		$country = $row['country'];
		$province_state = $row['province_state'];
		$city = $row['city'];
		echo '<option value="'.$country.'#'.$province_state.'#'.$city.'">'.$country.', '.$province_state.', '.$city.'</option>';
	}
	?>
</select><br>
<input type="submit" name="findcoachsubmit" value="Find Coach">


<center>
</div>

 </form>

<div style="margin-left:250px;">
	<?php
	if ($conn) {
		if (isset($_POST['personalrecords'])) {
			$sqlTB = "SELECT s.name AS 'Sport', athRecord.record AS 'Record'
				FROM Sport s
				JOIN (SELECT sportID, IF(':sportType' LIKE 'SB', MIN(result), MAX(result)) AS record
				FROM Participates:sportType parti
				WHERE athleteID = :athleteID
				GROUP BY sportID) as athRecord
				ON s.sportID = athRecord.sportID";
			$sqlTB = str_replace(":sportType",'TB',$sqlTB);
			$sqlTB = str_replace(":athleteID",$_SESSION['username'],$sqlTB);

			$sqlSB = "SELECT s.name AS 'Sport', athRecord.record AS 'Record'
				FROM Sport s
				JOIN (SELECT sportID, IF(':sportType' LIKE 'SB', MIN(result), MAX(result)) AS record
				FROM Participates:sportType parti
				WHERE athleteID = :athleteID
				GROUP BY sportID) as athRecord
				ON s.sportID = athRecord.sportID";
			$sqlSB = str_replace(":sportType",'SB',$sqlSB);
			$sqlSB = str_replace(":athleteID",$_SESSION['username'],$sqlSB);
			$resultTB = mysqli_query($conn,$sqlTB);
			$resultSB = mysqli_query($conn,$sqlSB);
			printRecordResult($resultTB,$resultSB);
		} else if (isset($_POST['testresults'])) {
			$sql = "SELECT dt.testName AS 'Drug test', testTaken.res AS 'Result', testTaken.date AS 'Expiry date'
							FROM DrugTest dt
							JOIN (SELECT testID, MAX(result) AS res, MAX(expDate) AS date
							FROM AthleteTakesTest
							WHERE athleteID = :athleteID
							GROUP BY testID) as testTaken
							ON dt.testID = testTaken.testID";
			$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
			$result = mysqli_query($conn,$sql);
			printTestResult($result);
		} else if (isset($_POST['trainingplan'])) {
				$sql = "SELECT t.startDate AS 'Start date', t.endDate AS 'End date', t.instructions AS 'Instructions'
					FROM TrainingPlan t
					WHERE t.athleteID = :athleteID
					ORDER BY t.endDate ASC";
				$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
				$result = mysqli_query($conn,$sql);
				printPlanResult($result);
		} else if (isset($_POST['updateweight'])) {
			if (!strlen($_POST['weighttoupdate']) == 0) {
				$sql = "UPDATE Athlete
					SET weight = :weight
					WHERE athleteID = :athleteID";
				$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
				$sql = str_replace(":weight",$_POST['weighttoupdate'],$sql);
				if (!mysqli_query($conn,$sql)) {
					print_r("Error Updating Weight");
				} else {
					print_r("Successfully updated weight");
				}
			} else {
				print_r("Missing field weight");
			}
		} else if (isset($_POST['updateheight'])) {
			if (!strlen($_POST['heighttoupdate']) == 0) {
				$sql = "UPDATE Athlete
					SET height = :height
					WHERE athleteID = :athleteID";
				$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
				$sql = str_replace(":height",$_POST['heighttoupdate'],$sql);
				if (!mysqli_query($conn,$sql)) {
					print_r("Error Updating Height");
				} else {
					print_r("Successfully updated height");
				}
			} else {
				print_r("Missing field height");
			}
		} else if (isset($_POST['updatecountry'])) {
			if (!strlen($_POST['countrytoupdate']) == 0) {
				$sql = "UPDATE Athlete
					SET country = ':country'
					WHERE athleteID = :athleteID";
				$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
				$sql = str_replace(":country",$_POST['countrytoupdate'],$sql);
				if (!mysqli_query($conn,$sql)) {
					print_r("Error Updating Country");
				} else {
					print_r("Successfully updated country");
				}
			} else {
				print_r("Missing field country");
			}
		} else if (isset($_POST['signupsubmit'])) {
			$comp = $_POST['competitions'];
			$compsport = $_POST['sport'];

			$sportType = "";
			if ($compsport <= 7) {
				$sportType = "SB";
			} else {
				$sportType = "TB";
			}

			$sql = "INSERT INTO participates:sportType(status, athleteID, sportID, competitionID, divisionID)
				VALUES ('NAN', :athleteID, :sportID, :compID,
				(SELECT d.divisionID
				FROM Division d
				JOIN Person p
				ON p.personID = :athleteID
				JOIN Competition c
				ON c.competitionID = :compID
				WHERE YEAR(c.startDate) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge AND
				p.gender = d.gender))";
			$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
			$sql = str_replace(":sportID",$compsport,$sql);
			$sql = str_replace(":compID",$comp,$sql);
			$sql = str_replace(":sportType",$sportType,$sql);

			if (!mysqli_query($conn,$sql)) {
				print_r("Error Signing Up For Competition. Are you already participating this this competition?");
			} else {
				print_r("Successfully signed up for Competition");
			}
		} else if (isset($_POST['jointeamsubmit'])) {
				$sql = "UPDATE Athlete
					SET teamID = :tid
					WHERE athleteID = :athleteID";
				$sql = str_replace(":tid",$_POST['teamid'],$sql);
				$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
				if (!mysqli_query($conn,$sql)) {
					print_r("Error joining team. Are you already a part of this team?");
				} else {
					print_r("Successfully joined team");
				}
		} else if (isset($_POST['findcoachsubmit'])) {

			$coachLocationString = $_POST['coachlocation'];
			$coachLocation = explode("#", $coachLocationString);
			$coachLocationCountry = $coachLocation[0];
			$coachLocationProvince_State = $coachLocation[1];
			$coachLocationCity = $coachLocation[2];

			$sql = "SELECT name, country, province_state, city, coachID
				FROM Coach c
				JOIN Person p
				ON p.personID = c.coachID
				WHERE country LIKE ':country' AND
				province_state LIKE ':prov' AND
				city LIKE ':city'";
			$sql = str_replace(":country",$coachLocationCountry,$sql);
			$sql = str_replace(":prov",$coachLocationProvince_State,$sql);
			$sql = str_replace(":city",$coachLocationCity,$sql);
			$result = mysqli_query($conn, $sql);
			printCoachResults($result);
		} else if (isset($_GET['getcoach'])) {
			$coachid = $_GET['getcoach'];
			$sql = "INSERT INTO TrainingPlan(trainingID, startDate, endDate, instructions, coachID, athleteID)
    		VALUES (:trainingID, NULL, NULL, '', :coachID, :athleteID)";
			$tpid = mysqli_fetch_array(mysqli_query($conn, "SELECT MAX(trainingID) + 1 FROM TrainingPlan"))[0];
			$sql = str_replace(":athleteID",$_SESSION['username'],$sql);
			$sql = str_replace(":coachID",$coachid,$sql);
			$sql = str_replace(":trainingID",$tpid,$sql);
			if (!mysqli_query($conn,$sql)) {
				print_r("Error. Are you already signed up with this coach?");
			} else {
				print_r("Successfully signed up for coaching.");
			}
		}
	}

	function printRecordResult($resultTB,$resultSB) {
			if(!$resultSB && !$resultTB || (mysqli_num_rows($resultSB) == 0 && mysqli_num_rows($resultTB) == 0)) {
				echo "No Results";
			} else {
			echo "<table>";
	  	echo "<tr><th>Sport</th><th>Record</th></tr>";
				while($row = mysqli_fetch_array($resultTB)) {
		  		echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>";
				}
				while($row = mysqli_fetch_array($resultSB)) {
					echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td></tr>";
				}
				echo "</table>";
	  }
	}

	function printTestResult($result) {
			if(!$result || mysqli_num_rows($result) == 0){
				echo "No Results";
			} else {
			echo "<table>";
			echo "<tr><th>Drug test</th><th>Result</th><th>Expiry Date</th></tr>";
				while($row = mysqli_fetch_array($result)) {
					echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>";
				}
				echo "</table>";
		}
	}

	function printPlanResult($result) {
			if(!$result || mysqli_num_rows($result) == 0){
				echo "No Results";
			} else {
			echo "<table>";
	  	echo "<tr><th>Start Date</th><th>End Date</th><th>Instructions</th></tr>";
				while($row = mysqli_fetch_array($result)) {
		  		echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>";
				}
				echo "</table>";

	  }
	}

	function printCoachResults($result) {
		if(!$result || mysqli_num_rows($result) == 0){
			echo "No Results";
		} else {
		echo "<table>";
		echo "<tr><th>Name</th><th>Country</th><th>Province/State</th><th>City</th></tr>";
			while($row = mysqli_fetch_array($result)) {
				echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td><a href='?getcoach=" . $row[4] . "'>Sign Up</a></td></tr>";
			}
			echo "</table>";
		}
	}


	$conn->close();
	?>
</div>
</html>
