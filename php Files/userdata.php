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
	
	
	//display user count
	
	if(isset($_POST['uid'])){
		$uid = $_POST['uid'];
	}
	
	
	//$package = $_POST["package"];
	
	
	//Checks Package ID and returns the user data 
	
	$sql = "SELECT * FROM users WHERE users.UID LIKE '%" . $uid . "%'";
	$result = $conn->query($sql);
	
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	//$row = mysql_fetch_row($result);
	$row = $result->fetch_assoc();
	
	
	//output of Usr Data
	/*echo $row["FirstName"]." ";
	echo $row["LastName"];
	echo "+";
	echo $row["Code"];*/
	
	echo "{";	
	echo "\"First\":\"";
	echo $row["FirstName"] . "\"";
	echo ",";
	echo "\"Last\":\"";
	echo $row["LastName"] . "\"";
	echo ",";
	echo "\"Email\":\"";
	echo $row["Email"] . "\"";
	echo ",";
	echo "\"Phone\":\"";
	echo $row["Phone"] . "\"";
	echo ",";
	echo "\"Location\":\"";
	echo $row["Location"] . "\"";
	echo ",";
	echo "\"Org\":\"";
	echo $row["Org"] . "\"";
	echo ",";
	echo "\"Code\":\"";
	echo $row["Code"] . "\"";
	echo ",";
	echo "\"ArchiveDate\":\"";
	echo $row["ArchiveDate"] . "\"";
	echo ",";
	echo "\"Archive\":\"";
	echo $row["Archive"] . "\"";
	
	echo "}";
	
	
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