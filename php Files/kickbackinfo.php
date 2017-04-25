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
	
	
	if(isset($_POST['paid'])){
		$paid = $_POST['paid'];
	}
	
	
	//$package = $_POST["package"];
	
	
	//Checks PackageArtifact ID and returns the kickback data 
	
	$sql = "SELECT * FROM kickbackreasons WHERE kickbackreasons.PAID LIKE '%" . $paid . "%'";
	$result = $conn->query($sql);
	
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	//$row = mysql_fetch_row($result);
	$row = $result->fetch_assoc();
	
	
	//output of kickback Data
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo $row["KRID"];
			echo $row["SID"];
			echo $row["Reasons"];
			echo $row["Date"];
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