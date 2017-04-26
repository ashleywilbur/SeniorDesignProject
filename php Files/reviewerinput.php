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

	//FirstName, LastName, email
	if(isset($_POST['firstName'])){
		$firstName = $_POST['firstName'];
	}
	else {
		$firstName = "Not Provided";
	}
	
	if(isset($_POST['lastName'])){
		$lastName = $_POST['lastName'];
	}
	else {
		$lastName = "Not Provided";
	}
	
	if(isset($_POST['email'])){
		$email = $_POST['email'];
	}
	else {
		$email = "No email Provided";
	}
	
	if(isset($_POST['phoneNumber'])){
		$phoneNumber = $_POST['phoneNumber'];
	}
	else {
		$phoneNumber = "0000000000";
	}
	
	
	$sql = "SELECT MAX(RWID) as max FROM reviewer";
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	$rwid = $row['max'];
	$rwid++;
	
	$sql = "INSERT INTO kickbackemail (RWID, FirstName, LastName, Email, PhoneNumber) 
			VALUES (" . $rwid . ",'" . $firstName . "','" . $lastName . "','" . $email . "','" . $phoneNumber . "')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully";
	} 
	else {
		echo "Error: " . $sql . "<br>" . $conn->error;
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
	}
	
	
	$sql = "UPDATE MyGuests SET lastname='Doe' WHERE id=2";

	if ($conn->query($sql) === TRUE) {
		echo "Record updated successfully";
	} else {
		echo "Error updating record: " . $conn->error;
	}
	
	
	$sql = "INSERT INTO MyGuests (firstname, lastname, email) VALUES ('John', 'Doe', 'john@example.com')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}*/
	$conn->close();
?>