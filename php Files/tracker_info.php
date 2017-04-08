<?php
	// Create connection for secured servers
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "rmf_test_devyn";
	
	$conn = new mysqli($servername, $username, $password, $dbname);
	
	// Create Connection for unsecured users
	//$conn = new mysqli();
	//mysql_select_db('movies');

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	//echo "Connected successfully";
	
	if(isset($_POST['package'])){
		$package = $_POST['package'];
	}
	
	
	//$package = $_POST["package"];
	
	
	//Checks Package ID and returns the current step
	
	$sql = "SELECT * FROM package WHERE package.PID LIKE '%" . $package . "%'";
	$result = $conn->query($sql);
	
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	
	
	//output of package info
	echo $row["Name"];
	echo $row["Acronym"];
	echo $row["Description"];
	echo $row["eMassID"];
	echo $row["Classification"];
	echo $row["CIA"];
	echo $row["Archive"];
	echo $row["ArchiveDate"];
	
	// output of current step & info
	$step = $row["TrackerStep"];
	
	echo $step;
	
	
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