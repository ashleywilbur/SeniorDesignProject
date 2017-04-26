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

	//STID Zone AccredType CreationDate Step1Complete Step2Complete Step3Complete Step4Complete Step5Complete CertAcquiredDate ExpirationDateMonth OverallProcessMonths
	if(isset($_POST['zone'])){
		$zone = $_POST['zone'];
	}
	else {
		$zone = "";
	}
	
	if(isset($_POST['accredType'])){
		$accredType = $_POST['accredType'];
	}
	else {
		$accredType = "";
	}
	
	if(isset($_POST['step1complete'])){
		$step1 = $_POST['step1complete'];
	}
	else {
		$step1 = "0";
	}
	
	if(isset($_POST['step2complete'])){
		$step2 = $_POST['step2complete'];
	}
	else {
		$step2 = "0";
	}
	
	if(isset($_POST['step3complete'])){
		$step3 = $_POST['step3complete'];
	}
	else {
		$step3 = "0";
	}
	
	if(isset($_POST['step4complete'])){
		$step4 = $_POST['step4complete'];
	}
	else {
		$step4 = "0";
	}
	
	if(isset($_POST['step5complete'])){
		$step5 = $_POST['step5complete'];
	}
	else {
		$step5 = "0";
	}
	
	if(isset($_POST['certAcquired'])){
		$certAcquired = $_POST['certAcquired'];
	}
	else {
		$certAcquired = "0";
	}
	
	if(isset($_POST['expirationMonths'])){
		$expiraton = $_POST['expirationMonths'];
	}
	else {
		$expiration = "0";
	}
	
	if(isset($_POST['overallMonths'])){
		$overall = $_POST['overallMonths'];
	}
	else {
		$overall = "0";
	}
	
	
	$sql = "SELECT MAX(STID) as max FROM standardtimeline";
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	$stid = $row['max'];
	$stid++;
	$date = date ("Y-m-d");
	
	$sql = "INSERT INTO standardtimeline (STID, Zone, AccredType, CreationDate, Step1Complete, Step2Complete, Step3Complete, Step4Complete, Step5Complete, CertAcquiredDate, ExpirationDateMonth, OverallProcessMonths) 
			VALUES (" . $stid . ",'" . $zone . "','" . $accredType . "','" . $date . "','" . $step1 . "','" . $step2 . "','" . $step3 . "','" . $step4 . "','" . $step5 . "','" . $certAcquired . "','" . $expiration . "','" . $overall . "')";

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