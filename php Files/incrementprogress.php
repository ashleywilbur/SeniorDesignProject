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

	//paid, sid, reasons
	if(isset($_POST['pid'])){
		$pid = $_POST['pid'];
	}
	
	$sql = "SELECT TrackerStep FROM package WHERE package.PID LIKE '%" . $pid . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	$progress = $row['TrackerStep'];
	$progress++;
	
	$date = date ("Y-m-d");
	
	$sql = "UPDATE package SET (TrackerStep = '%" . $progress . "%') WHERE package.uid LIKE '%" . $pid . "%'";

	if ($conn->query($sql) === TRUE) {
		echo "Record updated successfully";
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