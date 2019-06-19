<!DOCTYPE html>
<html>
<head>
	<title>CPSC-304</title>
</head>
<div class="topnav">
 <a class="active" href="login.php">Login</a>
 <a href="home.php">Personal Page</a>
 <a href="records.php">Records</a>
 <a href="competitions.php">Competitions</a>
 <a href="ranks.php">Rankings</a>
</div>
<body style="background: #f2f2f2">

	<center><h1>Welcome to Tavling</h1></center>
	<hr>
	<center> <img src="welcome.jpg" width="30%"/></center></body>

	<div class="boxed">
		<center><p>Please enter your ID below to log in</p></center>
		<form method="POST" action="login.php">
			<center>User ID:<br></center>
			<center><input type="text" name="userid"></center>
			<center><input type="submit" name="idsubmit" value="Login"></button></center>
		</form>
	</div>
</body>

<style>
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

</html>

<?php
if (isset($_POST['idsubmit'])) {
	// $userid = $_POST['userid'];
	// $GLOBALS['userid'] = $userid;
	session_start();
	$_SESSION['username'] = $_POST['userid'];
	$username = $_SESSION['username'];
	// print_r($GLOBALS['userid']);
	$servername = "localhost";
	// $username = $GLOBALS['userid'];
	$password = "";
	$dbname = "TavlingDB";

	$conn = new mysqli($servername, $username, $password, $dbname);
	if ($conn->connect_error) {
	    die("Connection Error: " . $conn->connect_error);
	}
	$success = True;
}


?>
