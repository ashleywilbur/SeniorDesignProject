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

	//name, acronym, description, eMassID, classification, CIA, artifact
	if(isset($_POST['name'])){
		$name = $_POST['name'];
	}
	else {
		$name = "Unnamed";
	}
	
	if(isset($_POST['acronym'])){
		$acronym = $_POST['acronym'];
	}
	else {
		$acronym = "N/A";
	}
	
	if(isset($_POST['description'])){
		$description = $_POST['description'];
	}
	else {
		$description = "No Description";
	}
	
	if(isset($_POST['eMassID'])){
		$eMassID = $_POST['eMassID'];
	}
	else {
		$eMassID = "N/A";
	}
	
	if(isset($_POST['classification'])){
		$classification = $_POST['classification'];
	}
	else {
		$classification = "N/A";
	}
	
	if(isset($_POST['cia'])){
		$CIA = $_POST['cia'];
	}
	else {
		$CIA = "N/A";
	}
	
	$sql = "SELECT MAX(PID) as max FROM package";
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	$pid = $row['max'];
	$pid++;
	
	$sql = "INSERT INTO package (PID, Name, Acronym, Description, eMassID, Classification, CIA) 
			VALUES (" . $pid . ",'" . $name . "','" . $acronym . "','" . $description . "','" . $eMassID . "','" . $classification . "','" . $CIA . "')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully ";
	} 
	else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
	
	$i=0;
	
	if(isset($_POST['artifact0'])){
		echo $_POST['artifact0'];
	}
	else{
		echo "It is not posting to the name artifact0";
	}
	
	while(isset($_POST['artifact'.$i])) {
		$artifact = $_POST['artifact'.$i];
		if(isset($_POST['artifactStep'.$i])) {
			$artifactStep = $_POST['artifactStep'.$i];
		}
		else {
			$artifactStep = '0';
		}
		if(isset($_POST['artifactReview'.$i])) {
			$rwid = $_POST['artifactReview'.$i];
		}
		else {
			$rwid = '0';
		}
		
		$sql = "SELECT MAX(AID) as max FROM artifacts";
		$result = $conn->query($sql);
		$row = $result->fetch_assoc();
		$aid = $row['max'];
		$aid++;
		$date = date ("Y-m-d");
		
		$sql = "INSERT INTO artifacts (AID, SID, Name, SubmitDate) 
			VALUES (" . $aid . "," . $artifactStep . ",'" . $artifact . "'," . $date . ")";

		if ($conn->query($sql) === TRUE) {
			echo "New artifact record created successfully ";
		} 
		else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		
		$sql = "SELECT MAX(AID) as max FROM packageartifacts";
		$result = $conn->query($sql);
		$row = $result->fetch_assoc();
		$paid = $row['max'];
		$paid++;
		
		$sql = "INSERT INTO packageartifacts (PAID, PID, RWID, AID, StartDate, Progress) 
			VALUES (" . $paid . "," . $pid . "," . $rwid . "," . $aid . "," . $date . ", 0)";

		if ($conn->query($sql) === TRUE) {
			echo "New packageartifact record created successfully ";
		} 
		else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		
		$i++;
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