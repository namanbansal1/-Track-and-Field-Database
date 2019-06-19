<!DOCTYPE html>
<html>
<head>
	<title>Competitions</title>


	<link rel="stylesheet" type="text/css" href="competitionsstyle.css?<?php echo time(); ?>" />

</head>
<body style="background: LIGHTSALMON">
<div class="topnav">
 <a href="login.php">Login</a>
 <a href="home.php">Personal Page</a>
 <a href="records.php">Records</a>
 <a class="active" href="competitions.php">Competitions</a>
 <a href="ranks.php">Rankings</a>
</div> <br>
	<center><h1><center>  Competitions </center></h1></center>
 <h3>  Choose Competition </h3>
 <div class="sidenav">
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

echo "<form method='POST' action='competitions.php'>";
echo "<select name='competition'>";
		$availComps = mysqli_query($conn, "select c.competitionID as compID, c.name as compName from competition c where c.competitionID NOT IN (SELECT team.competitionID from compforteam team);");
		while ($row = mysqli_fetch_array($availComps)) {
			unset($compID, $compName);
			$compID = $row['compID'];
			$compName = $row['compName'];
			echo '<option value="'.$compID.'" name="'.$compID.'">'.$compName.'</option>';
	}
?>
</select>

 <h3> Choose Division </h3>
<select name="divID">
<?php

$divsionname= mysqli_query($conn,"select DISTINCT divName,divisionID from AthleteRank");
 while ($row = mysqli_fetch_array($divsionname)) {
		unset($divID, $divName);
		$divID = $row['divisionID'];
		$divName = $row['divName'];
		echo '<option value="'.$divID.'" name="'.$divID.'">'.$divName.'</option>';
}
?>
</select><br>
 <h3> Choose Sport </h3>
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
</select><br><br><br>
<input type="submit" name="resultsubmit" value="View Results"><br><br>
</form>
</div>

</html>


<?php
	if ($conn) {
		if (isset($_POST['resultsubmit'])) {
			$comp = $_POST['competition'];
			$sport = $_POST['sport'];
			$sportType = "";
			$div = $_POST['divID'];
			if ($sport <= 7) {
				$sportType = "SB";
			} else {
				$sportType = "TB";
			}
			$sort = "";
			if ($sportType == "TB") {
				$sort = "ASC";
			} else {
				$sort = "DESC";
			}
			$sql = "SELECT p.name AS 'Athlete', result AS 'Result'
				FROM Participates:sportType parti
				JOIN Person p
				ON parti.athleteID = p.personID
				WHERE parti.divisionID = :divID AND parti.competitionID = :compID AND parti.sportID = :sportID
				ORDER BY parti.result :sort";
			$sql = str_replace(":sportType",$sportType,$sql);
			$sql = str_replace(":compID",$comp,$sql);
			$sql = str_replace(":sportID",$sport,$sql);
			$sql = str_replace(":sort",$sort,$sql);
			$sql = str_replace(":divID",$div,$sql);
			$result = mysqli_query($conn,$sql);
			printResult($result);
		}
	}

	function printResult($result) {
			if(!$result || mysqli_num_rows($result) == 0){
				echo "No Results";
			} else {
			echo "<table>";
	  	echo "<tr><th>Athlete</th><th>Result</th></tr>";
				while($row = mysqli_fetch_array($result)) {
		  		echo "<tr><td>" . $row["Athlete"] . "</td><td>" . $row["Result"] . "</td></tr>"; //or just use "echo $row[0]"
				}
				echo "</table>";
	  }
	}
?>
