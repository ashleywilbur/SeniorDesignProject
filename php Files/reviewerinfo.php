<?php
	// Create connection for secured servers
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "rmf_tracker";
	
	$conn = new mysqli($servername, $username, $password, $dbname);
	
	// Create Connection for unsecured users
	//$conn = new mysqli();
	//mysql_select_db('movies');

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	//echo "Connected successfully";
	
	
	if(isset($_POST['rwid'])){
		$rwid = $_POST['rwid'];
	}
	
	
	//$package = $_POST["package"];
	
	
	//Checks reviewer ID and returns the reviewer data 
	
	$sql = "SELECT * FROM reviewer WHERE reviewer.rwid LIKE '%" . $rwid . "%'";
	$result = $conn->query($sql);
	
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	//$row = mysql_fetch_row($result);
	$row = $result->fetch_assoc();
	
	
	//output of reviewer Data
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo $row["FirstName"];
			echo $row["LastName"];
			echo $row["Email"];
			echo $row["PhoneNumber"];
			echo $row["Archive"];
			echo $row["ArchiveDate"];
		}
	} else {
		echo "0 results";
	}
	
	
	//reference code - not used
	
	/*$sql = "SELECT id, firstname, lastname FROM MyGuests";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
		}
	} else {
		echo "0 results";
	}*/
	$conn->close();
?>