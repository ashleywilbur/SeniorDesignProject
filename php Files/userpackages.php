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
	
	//display user packages
	
	if(isset($_POST['uid'])){
		$uid = $_POST['uid'];
	}
	
	
	$sql = "SELECT PID FROM packageusers WHERE user.UID LIKE '%" . $uid . "%'";
	$result = $conn->query($sql);
	
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo $row["PID"];
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