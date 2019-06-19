<!DOCTYPE html>
<html>
<head>
	<title>Coach Page</title>
</head>
<body>
	<body style="background: #f2f2f2">

<div class="topnav">
	 <a href="login.php">Login</a>
	 <a class="active" href="home.php">Personal Page</a>
	 <a href="records.php">Records</a>
	 <a href="competitions.php">Competitions</a>
	 <a href="ranks.php">Rankings</a>
	</div>


	<p align="left"> <img src="coach.png" width="100" height="80" /></p>
	<?php
	$servername = "localhost";
	session_start();
	$username = $_SESSION['username'];
	$password = "";
	$dbname = "TavlingDB";

	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
    	die("Connection Error: " . $conn->connect_error);
	}
	$success = True;

	$actualName = mysqli_query($conn, "select name from person where personID = ".$username.";");
	$row = mysqli_fetch_array($actualName);
	echo "<h1>".$row['name']." - Coach</h1>";

	$coachInfo = mysqli_query($conn, "select birthDate, experienceLevel, country, province_state, city from coach inner join person on coachID = personID where coachID =".$username.";");
	printCoachInfo($coachInfo);
	?>
  <hr>
  <hr>


<style>

table {
	vertical-align: top;
 border-collapse: collapse;
 margin-left: 0px;
 margin-top: 0px;
}

table th{

  text-align: left;
  background-color: #3a6070;
  color: #FFF;
  padding: 4px 30px 4px 8px;
}

table td{
border: 3px solid black;
padding: 4px 8px;
}
.boxed {
	margin: auto;
	width: 50%;
	background-color: #f2f2f2;
	border: 10px #39ac39;
	padding: 25px;
}

.topnav {
   background-color: #333;
   overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
   float: left;
   color: white;
   text-align: center;
   padding: 14px 20px;
   text-decoration: none;
   font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
   background-color: #ddd;
   color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
   background-color: #4CAF50;
   color: white;
}




</style>

<h4>Sports You Teach</h4>
	<?php

	$sqlTeaches = mysqli_query($conn, "select s.name as name from teaches t inner join sport s on s.sportID = t.sportID where t.coachID = ".$username.";");
	while ($row = mysqli_fetch_array($sqlTeaches)) {
				unset($sportName);
				$sportName = $row['name'];
				echo $sportName. "<br><br>";
	}
	?>



 <form method="POST" action="coach.php">
 	<h2>Athletes You Coach</h2>
 	<select name="athletes2">
	<?php
	$athCoached = mysqli_query($conn, "select DISTINCT p.name as name, t.athleteID as athleteID from trainingplan t " . " inner join person p on p.personID = t.athleteID" . " where coachID =" .$username);
	while ($row = mysqli_fetch_array($athCoached)) {
		unset($athleteID, $athName);
		$athleteID = $row['athleteID'];
		$athName = $row['name'];
		echo '<option value="'.$athleteID.'" name="'.$athleteID.'">'.$athName.'</option>';
	}
	?>
	</select>
		<br><br>
	 <input type="submit" name="viewtrain" value="View Athlete Info and Training Plans"><br>
	<?php
	if($conn) {
	if (isset($_POST['viewtrain'])){
		if (isset($_POST['athletes2'])){

			$athleteID = $_POST['athletes2'];
			$sql = "SELECT p.name as name, instructions, startDate as startD, endDate as endD from trainingplan inner join person p on athleteID = p.personID where coachID=" . $username. " AND athleteID = ".$athleteID .";";
			$result = mysqli_query($conn,$sql);
			$result2 = mysqli_query($conn,$sql);
			$sql2 = "SELECT p.name as name, p.gender as gender, (EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM p.birthDate)) as age, a.weight as weight, a.height as height from person p inner join athlete a on athleteID = personID where athleteID =".$athleteID.";";
			$result3 = mysqli_query($conn, $sql2);
			$row3 = mysqli_fetch_array($result3);
			$row2 = mysqli_fetch_array($result2);
			echo "<h3>Athlete Info and Training Plans - ".$row2['name']." </h3>";
			echo "<table>";
			echo "<tr><th>name</th><th>age</th><th>gender</th><th>weight</th><th>height</th></tr>";
			echo "<tr><td>".$row3['name']."</td><td> ".$row3['age']."</td><td> ".$row3['gender']."</td><td> ".$row3['weight']."</td><td> ".$row3['height']."</td></tr><br>";
			echo "</table";
			echo "<table>";
			echo "<tr><th>From</th><th>To</th><th>Instructions</th></tr>";
			while($row = mysqli_fetch_array($result)){

				echo "<tr><td>".$row['startD'] ."</td><td> ".$row['endD']. "</td><td> " .$row["instructions"] . "</td></tr><br>";


			}
			echo "</table>";

		}
	}

	elseif (isset($_POST['formsubmit'])) {
		if (isset($_POST['location'])) {
				$location = $_POST['location'];
				#echo $location;
				$locSplit = explode(", ", $location);
				#echo $locSplit;
				$sql = "UPDATE coach SET country =\"".$locSplit[0]. "\", province_state =\"".$locSplit[1]. "\", city =\"". $locSplit[2] . "\" WHERE coachID =" . $username . ";";
				#print $sql;
			}

			$result = mysqli_query($conn,$sql);

			#printResult($result);
	}
}
?>
<h2>New Training Plan for Athlete</h2>
Athlete:
<form method="POST" action="coach.php">
	<select name="athletes">

			<?php
			$athCoached = mysqli_query($conn, "select DISTINCT p.name as name, t.athleteID as athleteID from trainingplan t " . " inner join person p on p.personID = t.athleteID" . " where coachID =" .$username);

			while ($row = mysqli_fetch_array($athCoached)) {
				unset($athleteID, $athName);
				$athleteID = $row['athleteID'];
				$athName = $row['name'];


				#$name = $row['name'];
				echo '<option value="'.$athleteID.'" name="'.$athleteID.'">'.$athName.'</option>';
				}


			?>
		</select>

<br><br>Start date: <input type="date" name="newTrainStartDate" placeholder="Start Date"><br><br>
End date: <input type="date" name="newTrainEndDate" placeholder="End Date"><br><br>
<textarea name=trainingText style = "width:350px;height:150px;" ></textarea><br>
<input type="submit" name="newTrainPlan" value="submit"><br>

<?php
	if($conn) {
		if (isset($_POST['newTrainPlan'])){
			$maxTrainingPlanIDsql = mysqli_query($conn, "SELECT MAX(trainingID) as tID from trainingplan");
			$row = mysqli_fetch_array($maxTrainingPlanIDsql);
			$trainingID = $row['tID'] + 1;

			$athleteID = $_POST['athletes'];
			$startDate = $_POST['newTrainStartDate'];
			$endDate = $_POST['newTrainEndDate'];
			$trainText = $_POST['trainingText'];
			$train = mysqli_query($conn, "INSERT INTO trainingplan VALUES (".$trainingID.", '".$startDate."', '".$endDate."',\"". $trainText."\", ".$username.", ".$athleteID."); ");
			if($train == TRUE){
				echo "Success!";
			} else {
				echo "Failure";
			}
		}
	}

?>
</form>


<h2>Sign Athletes Up for Competitions</h2>
Athlete:
<form method="POST" action="coach.php">


 	 <select name="athletes">

			<?php
			$athCoached = mysqli_query($conn, "select DISTINCT p.name as name, t.athleteID as athleteID from trainingplan t " . " inner join person p on p.personID = t.athleteID" . " where coachID =" .$username);

			while ($row = mysqli_fetch_array($athCoached)) {
				unset($athleteID, $athName);
				$athleteID = $row['athleteID'];
				$athName = $row['name'];


				#$name = $row['name'];
				echo '<option value="'.$athleteID.'" name="'.$athleteID.'">'.$athName.'</option>';
		}


			?>
	</select>
	<br><br>
	Competition:
	<select name="competitions">

			<?php
			$availComps = mysqli_query($conn, "select c.competitionID as compID, c.name as compName from competition c where inviteOnly=0 AND c.competitionID NOT IN (SELECT team.competitionID from compforteam team);");

			while ($row = mysqli_fetch_array($availComps)) {
				unset($compID, $compName);
				$compID = $row['compID'];
				$compName = $row['compName'];

				#$name = $row['name'];
				echo '<option value="'.$compID.'" name="'.$compID.'">'.$compName.'</option>';
		}


			?>
	</select>
		<br><br>

	Sport:
	<select name="sport">

			<?php
			$availSports = mysqli_query($conn, "select sportID, name as sportName from sport where sportID in (select sportID from teaches where coachID =".$username.");");

			while ($row = mysqli_fetch_array($availSports)) {
				unset($sportID, $sportName);
				$sportID = $row['sportID'];
				$sportName = $row['sportName'];

				#$name = $row['name'];
				echo '<option value="'.$sportID.'" name="'.$sportID.'">'.$sportName.'</option>';
		}


			?>
	</select>
		<br><br>

	<input type="submit" name="signUp" value="Sign Athlete Up"><br>
	</form>
<?php
	if($conn) {
		if (isset($_POST['formsubmit'])) {
			if (isset($_POST['location'])) {
				$location = $_POST['location'];
				$locSplit = explode(", ", $location);
				#echo $locSplit;
				$sql = "UPDATE coach SET country =\"".$locSplit[0]. "\", province_state =\"".$locSplit[1]. "\", city =\"". $locSplit[2] . "\" WHERE coachID =" . $username . ";";
				#print $sql;
			}

			$result = mysqli_query($conn,$sql);

		}	#printResult($result);
		elseif(isset($_POST['signUp'])){
			if(!isset($_POST['athletes'])){
				echo "Missing Athlete!";
			} elseif (!isset($_POST['competitions'])){
				echo "Missing Competitions!";
			} elseif (!isset($_POST['sport'])){
				echo "Missing Sport!";
			} else {

				if($_POST['sport'] <= 7){
					$sportType = "SB";
				} else {
					$sportType = "TB";
				}
				$sqlGetAge = mysqli_query($conn, "select (EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM birthDate)) as age, gender from person where personID =".$_POST['athletes'].";");
				$row = mysqli_fetch_array($sqlGetAge);
				$athleteAge = $row['age'];
				$gender = $row['gender'];

				$sqlGetDiv = mysqli_query($conn, "select divisionID from division where minAge <= ".$athleteAge." AND ".$athleteAge. " <= maxAge AND gender = '".$gender."';");
				$row = mysqli_fetch_array($sqlGetDiv);
				$divisionID = $row["divisionID"];

				$sqlSignUp = mysqli_query($conn, "INSERT IGNORE INTO participates".$sportType."   VALUES( 'NAN', NULL, ".$_POST['athletes'].", ".$_POST['sport']. ", ".$divisionID.", ".$_POST['competitions'].") ;");
				if($sqlSignUp == TRUE){
					echo "Sucess!";
				}
			}

		} elseif(isset($_POST['addSport'])){

			$sqlAddSport = mysqli_query($conn, "INSERT INTO teaches values (".$username.", ".$_POST['addSportID'].");");
			if($sqlAddSport == TRUE){
				echo "success";
			}
		} elseif(isset($_POST['delSport'])){
			$sqlDelSport = mysqli_query($conn, "DELETE FROM teaches WHERE coachID = ".$username." AND sportID = ".$_POST['delSportID']).";";
			if($sqlDelSport == TRUE){
				echo "success";
			}
		}
}
?>

<?php

?>
	 <h2>Update Coach Info information</h2>
	 Add Sport to Teach
	 <form method="POST" action="coach.php">
	 <select name='addSportID'>

			<?php
			$sportsTeaching = mysqli_query($conn,"select s.name as name, s.sportID as sportID from sport s where sportID not in (select sportID from teaches where coachID = ".$username.");");

			while ($row = mysqli_fetch_array($sportsTeaching)) {
				unset($sportID, $sportName);
				$sportID = $row['sportID'];
				$sportName = $row['name'];

				#$name = $row['name'];
				echo '<option value="'.$sportID.'" name="'.$sportID.'">'.$sportName.'</option>';
			}

			?>

		</select><br><br>
			<input type="submit" name="addSport" value="Add Sport"><br><br>
 		</form>



 	Select Sport to Delete
	 <form method="POST" action="coach.php">
	 <select name='delSportID'>

			<?php
			$sportsTeaching = mysqli_query($conn,"select s.name as name, s.sportID as sportID from sport s where sportID in (select sportID from teaches where coachID = ".$username.");");

			while ($row = mysqli_fetch_array($sportsTeaching)) {
				unset($sportID, $sportName);
				$sportID = $row['sportID'];
				$sportName = $row['name'];

				#$name = $row['name'];
				echo '<option value="'.$sportID.'" name="'.$sportID.'">'.$sportName.'</option>';
			}

			?>

		</select><br><br>
			<input type="submit" name="delSport" value="Delete Sport"><br><br>
 		</form>

	 <form method="POST" action="coach.php">
	 <select name='location'>

			<?php
			$locs = mysqli_query($conn,"select * from location");
			while ($row = mysqli_fetch_array($locs)) {
				unset($country,$state, $city);
				$country = $row['country'];
				$state = $row['province_state'];
				$city = $row['city'];
				echo '<option value="'.$country . ", ".$state . ", ".$city .'" name="'.$city.'">'.$city . ", ".$state . ", ".$country .'</option>';
			}
			?>

		</select><br><br>
			<input type="submit" name="formsubmit" value="Change Your Location"><br><br>
</form>
 </form>





</body>
</html>


<?php

$conn->close();
exit();




function printCoachInfo($info) {
		if(!$info || mysqli_num_rows($info) == 0){
			echo "No Results";
		} else {
		echo "<table>";
  	echo "<tr><th>DOB</th><th>Experience Level</th><th>Location</th></tr>";
			while($row = mysqli_fetch_array($info)) {
	  		echo "<tr><td>" . $row["birthDate"] . "</td><td>" . $row["experienceLevel"] ." years". "</td><td>" . $row["city"] .", ".$row["province_state"] .", ".$row["country"] . "</td></tr>"; //or just use "echo $row[0]"
			}
			echo "</table>";

  }
}

?>
