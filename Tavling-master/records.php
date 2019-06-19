<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
	<title>Records</title>
	<link rel="stylesheet" type="text/css" href="recordsstyle.css?<?php echo time(); ?>" />
</head>

<div class="topnav">
 <a href="login.php">Login</a>
 <a href="home.php">Personal Page</a>
 <a class="active" href="records.php">Records</a>
 <a href="competitions.php">Competitions</a>
 <a href="ranks.php">Rankings</a>
</div>

<body style="background: LIGHTSALMON">

<center><h1><center>  Records  </center></h1></center>

<div class="sidenav">
	<form method="POST" action="records.php">
		 <h3> Choose Sport </h3>
		<select name="sport">
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

			$sports = mysqli_query($conn,"select name,sportid from sport");

			while ($row = mysqli_fetch_array($sports)) {
					unset($sportid, $name);
					$sportid = $row['sportid'];
					$name = $row['name'];
					echo '<option value="'.$sportid.'" name="'.$sportid.'">'.$name.'</option>';
			}
			?>
		</select><br><br>
		<h3> Choose Country </h3>
		<input type="text" name="country" placeholder="Country"><br><br>
		<h3> Choose Season </h3>
		<input type="text" name="season" placeholder="Season"><br><br>
		<input type="submit" name="formsubmit" value="Filter"><br><br>
	</form>
</div>

</body></html>

<?php
if($conn) {
	if (isset($_POST['formsubmit'])) {
		$sport = $_POST['sport'];

		if (isset($_POST['country'])) {
			$country = $_POST['country'];
		} else {
			$country = "%";
		}

		if (isset($_POST['season'])) {
			$season = $_POST['season'];
		} else {
			$season = "%";
		}

		if (strlen($country) == 0) {
			$country = "%";
		}

		if (strlen($season) == 0) {
			$season = "%";
		}

		$sportType = "";
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

		$sql = "SELECT CONCAT(d.gender, ' ', CONVERT(d.minAge, CHARACTER), '-', CONVERT(d.maxAge, CHARACTER)) AS 'Division',
			p.name AS 'Name', a.country AS 'Country', divRecord.record AS 'Record'
			FROM Participates:sportType parti
			JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.endDate) LIKE ':season' AND parti.sportID = :sportID
			JOIN Athlete a
			ON parti.athleteID = a.athleteID AND a.country LIKE ':country'
			JOIN (SELECT divisionID, IF(:sportID IN (SELECT sportID FROM TBSport), MIN(result), MAX(result)) AS record
			FROM Participates:sportType parti
			JOIN Competition c
			ON parti.competitionID = c.competitionID AND YEAR(c.endDate) LIKE ':season' AND parti.sportID = :sportID
			JOIN Athlete a
			ON parti.athleteID = a.athleteID AND a.country LIKE ':country'
			GROUP BY divisionID) AS divRecord
			ON divRecord.divisionID = parti.divisionID
			JOIN Division d
			ON parti.divisionID = d.divisionID
			JOIN Person p
			ON parti.athleteID = p.personID
			WHERE parti.result = divRecord.record
			ORDER BY  divRecord.record :sort";

			$sql = str_replace(":sportID",strval($sport),$sql);
			$sql = str_replace(":sportType",$sportType,$sql);
			$sql = str_replace(":season",$season,$sql);
			$sql = str_replace(":country",$country,$sql);
			$sql = str_replace(":sort",$sort,$sql);

			$result = mysqli_query($conn,$sql);

			printResult($result);


	}
}

function printResult($result) {
		if(!$result || mysqli_num_rows($result) == 0){
			echo "No Results";
		} else {
		echo "<table>";
  	echo "<tr><th>Division</th><th>Name</th><th>Country</th><th>Record</th></tr>";
			while($row = mysqli_fetch_array($result)) {
	  		echo "<tr><td>" . $row["Division"] . "</td><td>" . $row["Name"] . "</td><td>" . $row["Country"] . "</td><td>" . $row["Record"] . "</td></tr>"; //or just use "echo $row[0]"
			}
			echo "</table>";

  }
}
$conn->close();
?>
