 <!DOCTYPE html>
<html>
<head>
	<title>Ranking
	</title>
</head>
<body style="background: LIGHTSALMON">


<div class="topnav">
 <a href="login.php">Login</a>
 <a href="home.php">Personal Page</a>
 <a href="records.php">Records</a>
 <a href="competitions.php">Competitions</a>
 <a class="active" href="ranks.php">Rankings</a>
</div>
<br>
<center><h1><center>  Ranking  </center></h1></center>

<div class="sidenav">
    <form method="POST" action="ranks.php">
   <h3> Choose Sport </h3>
    <select name="sportid">

<?php
		$servername = "localhost";
		$username = "naman";
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
</select>




 <h3> Choose Division </h3>
    <select name="divID">
 <?php

  $divsionname= mysqli_query($conn,"select DISTINCT divName,divisionID from AthleteRank");
    echo '<option value="'.$divID.'" divName="%" > None </option>';
     while ($row = mysqli_fetch_array($divsionname)) {
        unset($divID, $divName);
        $divID = $row['divisionID'];
        $divName = $row['divName'];
        echo '<option value="'.$divID.'" name="'.$divID.'">'.$divName.'</option>';
    }
 ?>
</select>

 <h3> Choose Country </h3>
	<input type="text" name="country" placeholder="country"><br>
	<br>
	<input type="submit" name="formsubmit" value="Find Rank"><br>
   </form>
</div>

   <style>
   table {
   	vertical-align: top;
    border-collapse: collapse;
    margin-bottom: : 1000px;
    margin-left: 550px;
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

 .sidenav {
     width: 150px;
     position: fixed;
     z-index: 1;
     top: 200px;
     left: 20px;
     background:#ffa07a;
     overflow-x: hidden;
     padding: 8px 0;
 }

 .sidenav a {
     padding: 6px 8px 6px 16px;
     text-decoration: none;
     font-size: 25px;
     color:#ffa07a;
     display: block;
 }

 .sidenav a:hover {
     color:#ffa07a;
 }

</style>


<?php
if($conn) {
	if (isset($_POST['formsubmit'])) {
		$sportid = $_POST['sportid'];

         if (isset($_POST['divID'])) {
			$divID = $_POST['divID'];
			if (strlen($divID) == 0) {
				$divID = "'%'";
			}

		} else {
			$divID = "'%'";
		}

		if (isset($_POST['country'])) {
			$country = $_POST['country'];
		} else {
			$country = "%";
		}

		if (strlen($divID) == 0) {
			$divID = "'%'";
		}

		if (strlen($country) == 0) {
			$country = "%";

		}

		$sql = "SELECT aName AS 'Athlete', country, divName AS 'Division', points
                   FROM AthleteRank
					WHERE sportID = :sportID AND
					divisionID LIKE :divID AND
					country LIKE ':country'
					ORDER BY points DESC";

					$sql = str_replace(":sportID",strval($sportid),$sql);
			        $sql = str_replace(":divID",$divID,$sql);
					$sql = str_replace(":country",$country,$sql);

					$result = mysqli_query($conn,$sql);

					printResult($result);
	}
}



function printResult($result) {
		if(!$result || mysqli_num_rows($result) == 0){
			echo "No Results";
		} else {
		echo "<table>";
  	echo "<tr><th>Athlete</th><th>Country</th><th>Division</th><th>Points</th></tr>";
			while($row = mysqli_fetch_array($result)) {
	  		echo "<tr><td>" . $row["Athlete"] . "</td><td>" . $row["country"] . "</td><td>" . $row["Division"] .
	  		"</td><td>" . $row["points"]. "</td></tr>";  //or just use "echo $row[0]"
			}
			echo "</table>";

  }
}
$conn->close();
?>
