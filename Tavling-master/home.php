<?php
session_start();
if($_SESSION['username'] < 40){
	header('Location: athlete.php');
} elseif ($_SESSION['username'] < 50){
	header('Location: coach.php');
} else if ($_SESSION['username'] < 60){
	header('Location: competitionManager.php');
} else {
	header('Location: login.php');
}

exit();
?>
