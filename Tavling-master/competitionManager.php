<!DOCTYPE html>
<html>
<head>
	<title>Competition Manager</title>
</head>
<div class="topnav">
 <a href="login.php">Login</a>
 <a class="active" href="home.php">Personal Page</a>
 <a href="records.php">Record</a>
 <a href="competitions.php">Competitions</a>
 <a href="ranks.php">Rank</a>
</div>
 <img src="comp.png" />
<body>
	<body style="background: #f2f2f2">

		<?php
		session_start();
		$username = $_SESSION['username'];
		$servername = "localhost";
		$password = "";
		$dbname = "TavlingDB";

		$conn = new mysqli($servername, $username, $password, $dbname);
		if ($conn->connect_error) {
			die("Connection Error: " . $conn->connect_error);
		}
		$success = True;
		$actualName = mysqli_query($conn, "select name from person where personID = ".$username.";");
		$row = mysqli_fetch_array($actualName);


		echo "<h1>".$row['name'] ." | Competition Manager</h1>
		<hr>";
		?>

		<form method="POST" action="competitionManager.php">

			<!-- *********************  Create new competition HTML ********************* -->

			<h1>Create new competition</h1>
			Competition name: <input type="text" name="newCompName" placeholder="Competition name"><br><br>
			Start date: <input type="date" name="newCompStartDate" placeholder="Competition start date"><br><br>
			End date: <input type="date" name="newCompEndDate" placeholder="Competition end date"><br><br>
			Only invitation? <input type="checkbox" name="newCompInvOnly" value="invOnly"><br><br>
			Location: <select name="newCompLocation">
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
			</select><br><br>
			<input type="submit" name="newCompetition" value="Create competition">

			<!-- *********************  Create new competition php ********************* -->

			<?php
			if($conn) {
				if (isset($_POST['newCompetition'])) {
					$newCompID = mysqli_fetch_array(mysqli_query($conn, "SELECT MAX(competitionID) + 1 FROM competition"))[0];
					$newCompName = $_POST['newCompName'];
					$newCompStartDate = $_POST['newCompStartDate'];
					$newCompEndDate = $_POST['newCompEndDate'];
					if(isset($_POST['newCompInvOnly'])) {
						$newCompInvOnly = 1;
					} else {
						$newCompInvOnly = 0;
					}
					$newCompLocationString = $_POST['newCompLocation'];
					$newCompLocation = explode("#", $newCompLocationString);
					$newCompCountry = $newCompLocation[0];
					$newCompProvince_state = $newCompLocation[1];
					$newCompCity = $newCompLocation[2];

					if(strlen($newCompID) == 0) {
						echo 'Missing competitionID!';
					} else if(strlen($newCompName) == 0){
						echo 'Missing competition name!';
					} else if(strlen($newCompStartDate) == 0){
						echo 'Missing start date!';
					} else if(strlen($newCompEndDate) == 0){
						echo 'Missing end date!';
					} else {

						$sql14create =
						"INSERT INTO Competition(competitionID, name, startDate, endDate, inviteOnly,
							country, province_state, city, competitionOrganizerID)
							VALUES (:compID, ':name', ':startDate', ':endDate', :invOnly, ':country', ':prov', ':city', :managerID)";
							$sql14create = str_replace(":compID", $newCompID, $sql14create);
							$sql14create = str_replace(":name", $newCompName, $sql14create);
							$sql14create = str_replace(":startDate", $newCompStartDate, $sql14create);
							$sql14create = str_replace(":endDate", $newCompEndDate, $sql14create);
							$sql14create = str_replace(":invOnly", $newCompInvOnly, $sql14create);
							$sql14create = str_replace(":country", $newCompCountry, $sql14create);
							$sql14create = str_replace(":prov", $newCompProvince_state, $sql14create);
							$sql14create = str_replace(":city", $newCompCity, $sql14create);
							$sql14create = str_replace(":managerID", $username, $sql14create);

							if(!mysqli_query($conn,$sql14create)){ // Create the competition
								echo 'Error creating competition!';
							} else {
								echo 'Competition successfully created!';
								//	Creates HasTB and HasSB relationships (all sports and divisions)
								$sqlSports = mysqli_query($conn, "SELECT sportID FROM sport");
								while ($sportRow = mysqli_fetch_array($sqlSports)) {
									$newHasSportID = $sportRow[0];
									$sqlDivisions = mysqli_query($conn, "SELECT divisionID FROM division");
									while ($divRow = mysqli_fetch_array($sqlDivisions)) {
										$newHasDivID = $divRow[0];

										$sql14insertHas =
										'INSERT INTO Has:sportType(spots, sportID, divisionID, competitionID)
										VALUES (50, '.$newHasSportID.', '.$newHasDivID.', '.$newCompID.')';
										if ($newHasSportID > 7) {
											$sql14insertHas = str_replace(":sportType", "TB", $sql14insertHas);
										} else {
											$sql14insertHas = str_replace(":sportType", "SB", $sql14insertHas);
										}
										if(!mysqli_query($conn,$sql14insertHas)) {
											echo 'Error creating has relationship with division/sport!';
										}
									}
								}
							}
						}
					}
				}
				?>

				<!-- *********************  Update competition HTML ********************* -->

				<h1>Update competition</h1>
				Competition: <select name="updateCompID">
					<?php
					$competitions = mysqli_query($conn,"SELECT competitionID, name FROM competition WHERE competitionOrganizerID
						= ".$username);
						while ($row = mysqli_fetch_array($competitions)) {
							unset($competitionID, $name);
							$competitionID = $row['competitionID'];
							$name = $row['name'];
							echo '<option value="'.$competitionID.'" name="'.$competitionID.'">'.$name.'</option>';
						}
						?>
					</select><br><br>
					Start date: <input type="date" name="updateCompStartDate" placeholder="Competition start date"><br><br>
					End date: <input type="date" name="updateCompEndDate" placeholder="Competition end date"><br><br>
					Location: <select name="updateCompLocation">
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
					</select><br><br>
					<input type="submit" name="updateCompetition" value="Update competition">

					<!-- *********************  Update competition php ********************* -->

					<?php
					if($conn) {
						if (isset($_POST['updateCompetition'])) {
							$updateCompID = $_POST['updateCompID'];
							$updateCompStartDate = $_POST['updateCompStartDate'];
							$updateCompEndDate = $_POST['updateCompEndDate'];
							$updateCompLocationString = $_POST['updateCompLocation'];
							$updateCompLocation = explode("#", $updateCompLocationString);
							$updateCompCountry = $updateCompLocation[0];
							$updateCompProvince_state = $updateCompLocation[1];
							$updateCompCity = $updateCompLocation[2];

							if (strlen($updateCompStartDate) == 0) {
								$updateCompStartDate = mysqli_fetch_array(mysqli_query($conn,
								"SELECT startDate FROM competition WHERE competitionID = ".$updateCompID))[0];
							}
							if (strlen($updateCompEndDate) == 0) {
								$updateCompEndDate = mysqli_fetch_array(mysqli_query($conn,
								"SELECT endDate FROM competition WHERE competitionID = ".$updateCompID))[0];
							}

							$sql14update = "UPDATE Competition
							SET startDate=':startDate', endDate=':endDate',
							country=':country', province_state=':prov', city=':city'
							WHERE competitionID = :compID";
							$sql14update = str_replace(":compID", $updateCompID, $sql14update);
							$sql14update = str_replace(":startDate", $updateCompStartDate, $sql14update);
							$sql14update = str_replace(":endDate", $updateCompEndDate, $sql14update);
							$sql14update = str_replace(":country", $updateCompCountry, $sql14update);
							$sql14update = str_replace(":prov", $updateCompProvince_state, $sql14update);
							$sql14update = str_replace(":city", $updateCompCity, $sql14update);

							if(!mysqli_query($conn,$sql14update)){ // Update the competition
								echo 'Error updating competition!';
							} else {
								echo 'Competition successfully updated!';
							}
						}
					}
					?>

					<!-- *****************  Insert drug test result HTML ********************* -->

					<h1>Insert/Update drug test result</h1>
					Drug test: <select name="newTestTestID">
						<?php
						$drugtests = mysqli_query($conn,"SELECT testID, testName FROM drugtest");
						while ($row = mysqli_fetch_array($drugtests)) {
							unset($testID, $testName);
							$testID = $row['testID'];
							$testName = $row['testName'];
							echo '<option value="'.$testID.'" name="'.$testID.'">'.$testName.'</option>';
						}
						?>
					</select><br><br>
					Athlete: <select name="newTestAthleteID">
						<?php
						$athletes = mysqli_query($conn,"SELECT personID, name FROM person
							WHERE personID IN (SELECT athleteID FROM athlete)");
							while ($row = mysqli_fetch_array($athletes)) {
								unset($personID, $name);
								$personID = $row['personID'];
								$name = $row['name'];
								echo '<option value="'.$personID.'" name="'.$personID.'">'.$name.'</option>';
							}
							?>
						</select><br><br>
						Passed? <input type="checkbox" name="newTestResult"><br><br>
						Expire date: <input type="date" name="newTestExpDate" placeholder="Expire date"><br><br>
						<input type="submit" name="newTestTaken" value="Upload test results">

						<!-- *****************  Insert drug test result php ********************* -->

						<?php
						if($conn) {
							if (isset($_POST['newTestTaken'])) {
								$newTestTestID = $_POST['newTestTestID'];
								$newTestAthleteID = $_POST['newTestAthleteID'];
								$newTestExpDate = $_POST['newTestExpDate'];
								if(isset($_POST['newTestResult'])) {
									$newTestResult = 1;
								} else {
									$newTestResult = 0;
								}

								if(strlen($newTestExpDate) == 0){
									echo 'Missing expire date!';
								} else {
									$sql18insert = "INSERT INTO AthleteTakesTest(expDate,result,athleteID,testID)
									VALUES (':expDate', :result, :athleteID, :did)";
									$sql18insert = str_replace(":expDate", $newTestExpDate, $sql18insert);
									$sql18insert = str_replace(":result", $newTestResult, $sql18insert);
									$sql18insert = str_replace(":athleteID", $newTestAthleteID, $sql18insert);
									$sql18insert = str_replace(":did", $newTestTestID, $sql18insert);

									if(mysqli_query($conn,$sql18insert)){ // Insert drug test result
										echo 'Result successfully inserted!';
									} else {
										$sql18update = "UPDATE AthleteTakesTest
										SET expDate = ':expDate', result = :result
										WHERE athleteID = :athleteID AND testID = :did";
										$sql18update = str_replace(":expDate", $newTestExpDate, $sql18update);
										$sql18update = str_replace(":result", $newTestResult, $sql18update);
										$sql18update = str_replace(":athleteID", $newTestAthleteID, $sql18update);
										$sql18update = str_replace(":did", $newTestTestID, $sql18update);
										if(mysqli_query($conn,$sql18update)){ // Update drug test result
											echo 'Result successfully updated!';
										} else {
											echo 'Error!';
										}
									}
								}
							}
						}

						?>

						<h1>Who has done every drug test?</h1>
						<?php
							$drugTestQuery = "SELECT s.Name as name ,s.personID from person s WHERE NOT EXISTS (SELECT t.testID from drugtest t WHERE t.testid NOT IN (select a.testID from athletetakestest a where a.athleteID = s.personID)) ORDER BY s.personID ASC";
							$athletesDoneDrugTest = mysqli_query($conn, $drugTestQuery);
							echo "<details>";
  							echo "<summary>Name</summary>";
							while($row = mysqli_fetch_array($athletesDoneDrugTest)) {
	  						echo $row["name"] . "<br>"; //or just use "echo $row[0]"
							}
						echo "</details>";
						?>




						<!-- *****************  Disqualify athletes HTML ********************* -->

						<h1>Disqualify athletes that don't meet needed drug tests</h1>
						Competition: <select name="disqAthletesCompID">
							<?php
							$competitions = mysqli_query($conn,"SELECT competitionID, name FROM competition WHERE competitionOrganizerID
								= ".$username);
								while ($row = mysqli_fetch_array($competitions)) {
									unset($competitionID, $name);
									$competitionID = $row['competitionID'];
									$name = $row['name'];
									echo '<option value="'.$competitionID.'" name="'.$competitionID.'">'.$name.'</option>';
								}
								?>
							</select><br><br>
							<input type="submit" name="disqAthletes" value="Disqualify athletes from this competition">

							<!-- *****************  Disqualify athletes php ********************* -->

							<?php
							if($conn) {
								if (isset($_POST['disqAthletes'])) {
									$disqAthletesCompID = $_POST['disqAthletesCompID'];

									$sql12 = "UPDATE participates:sportType parti
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
									)";
									$sql12 = str_replace(":compID", $disqAthletesCompID, $sql12);
									$sql12TB = str_replace(":sportType", "TB", $sql12);
									$sql12SB = str_replace(":sportType", "SB", $sql12);

									if (mysqli_query($conn,$sql12TB) and mysqli_query($conn,$sql12SB)){
										echo "Athletes successfully disqualified!";
									} else {
										echo "Error disqualifying athletes!";
									}
								}
							}
							?>

							<!-- *****************  Upload competition result HTML ********************* -->

							<h1>Insert/Update competition result</h1>
							Competition: <select name="newCompResultCompID">
								<?php
								$competitions = mysqli_query($conn,"SELECT competitionID, name FROM competition WHERE competitionOrganizerID
									= ".$username);
									while ($row = mysqli_fetch_array($competitions)) {
										unset($competitionID, $name);
										$competitionID = $row['competitionID'];
										$name = $row['name'];
										echo '<option value="'.$competitionID.'" name="'.$competitionID.'">'.$name.'</option>';
									}
									?>
								</select><br><br>
								Athlete: <select name="newCompResultAthleteID">
									<?php
									$athletes = mysqli_query($conn,"SELECT personID, name FROM person
										WHERE personID IN (SELECT athleteID FROM athlete)");
										while ($row = mysqli_fetch_array($athletes)) {
											unset($personID, $name);
											$personID = $row['personID'];
											$name = $row['name'];
											echo '<option value="'.$personID.'" name="'.$personID.'">'.$name.'</option>';
										}
										?>
									</select><br><br>
									Sport: <select name="newCompResultSportID">
										<?php
										$sports = mysqli_query($conn,"SELECT sportID, name FROM sport");
										while ($row = mysqli_fetch_array($sports)) {
											unset($sportID, $name);
											$sportID = $row['sportID'];
											$name = $row['name'];
											echo '<option value="'.$sportID.'" name="'.$sportID.'">'.$name.'</option>';
										}
										?>
									</select><br><br>
									Status: <input type="text" name="newCompResultStatus" placeholder="Status"><br>
									NAN<br> DNF-did not finish <br>DQD-disqualified due to drug test <br>
									FND-finished <br>INV-invited<br><br>
									Results: <input type="text" name="newCompResultResult" placeholder="Results">
									(HH:MM:SS for results as time)<br><br>
									<input type="submit" name="newCompResult" value="Upload competition result">

									<!-- *****************  Upload competition result php ********************* -->

									<?php
									if($conn) {
										if (isset($_POST['newCompResult'])) {
											$newCompResultCompID = $_POST['newCompResultCompID'];
											$newCompResultAthleteID = $_POST['newCompResultAthleteID'];
											$newCompResultSportID = $_POST['newCompResultSportID'];
											$newCompResultStatus = $_POST['newCompResultStatus'];
											$newCompResultResult = $_POST['newCompResultResult'];

											if ($newCompResultSportID > 7) {
												$newCompResultSportType = "TB";
												if (strlen($newCompResultResult) != 0) {
													$newCompResultResult = "'".$newCompResultResult."'";
												}
											} else {
												$newCompResultSportType = "SB";
											}
											if (strlen($newCompResultStatus) == 0) {
												$newCompResultStatus = "NAN";
											}
											if (strlen($newCompResultResult) == 0) {
												$newCompResultResult = "NULL";
											}

											$sql10insert = "INSERT INTO participates:sportType(status, result, athleteID, sportID, competitionID, divisionID)
											VALUES (':status', :result, :athleteID, :sportID, :compID,
												(SELECT d.divisionID
													FROM Division d
													JOIN Person p
													ON p.personID = :athleteID
													JOIN Competition c
													ON c.competitionID = :compID
													WHERE YEAR(c.startDate) - YEAR(p.birthDate) BETWEEN d.minAge AND d.maxAge AND
													p.gender = d.gender)
												)";
												$sql10insert = str_replace(":compID", $newCompResultCompID, $sql10insert);
												$sql10insert = str_replace(":athleteID", $newCompResultAthleteID, $sql10insert);
												$sql10insert = str_replace(":sportID", $newCompResultSportID, $sql10insert);
												$sql10insert = str_replace(":status", $newCompResultStatus, $sql10insert);
												$sql10insert = str_replace(":result", $newCompResultResult, $sql10insert);
												$sql10insert = str_replace(":sportType", $newCompResultSportType, $sql10insert);

												$sql10update = "UPDATE participates:sportType
												SET status = ':status', result = :result
												WHERE athleteID = :athleteID AND competitionID = :compID AND sportID = :sportID";
												$sql10update = str_replace(":compID", $newCompResultCompID, $sql10update);
												$sql10update = str_replace(":athleteID", $newCompResultAthleteID, $sql10update);
												$sql10update = str_replace(":sportID", $newCompResultSportID, $sql10update);
												$sql10update = str_replace(":status", $newCompResultStatus, $sql10update);
												$sql10update = str_replace(":result", $newCompResultResult, $sql10update);
												$sql10update = str_replace(":sportType", $newCompResultSportType, $sql10update);

												if (!mysqli_query($conn,$sql10insert)){
													if (!mysqli_query($conn,$sql10update)){
														echo "Error uploading result!";
													} else {
														echo "Result updated successfully!";
													}
												} else {
													echo "Result inserted successfully!";
												}
											}
										}
										?>

									</form>



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

								</style>
								</body>
								</html>


								<?php
								$conn->close();
								?>
