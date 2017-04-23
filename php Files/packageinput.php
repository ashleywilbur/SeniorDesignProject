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
	
	if(isset($_POST['acronym'])){
		$acronym = $_POST['acronym'];
	}
	
	if(isset($_POST['desription'])){
		$description = $_POST['description'];
	}
	
	if(isset($_POST['eMassID'])){
		$eMassID = $_POST['eMassID'];
	}
	
	if(isset($_POST['classification'])){
		$classification = $_POST['cassification'];
	}
	
	if(isset($_POST['CIA'])){
		$CIA = $_POST['CIA'];
	}
	
	$sql = "SELECT MAX(PID) FROM package";
	$result = $conn->query($sql);
	$pid = $result->fetch_assoc();
	$pid++;
	
	$sql = "INSERT INTO package (PID, Name, Acronym, Description, eMassID, Classification, CIA) 
			VALUES ('%" . $pid . "%','%" . $name . "%','%" . $acronym . "%','%" . $description . "%','%" . $eMassID . "%','%" . $classification . "%','%" . $CIA . "%')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully";
	} 
	else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
	
	$i=0;
	
	while(isset($_POST['artifact['.$i.']'])) {
		$artifact = $_POST['artifact['.$i.']'];
		$artifactStep = $_POST['artifactStep['.$i.']'];
		
		$sql = "SELECT MAX(AID) FROM artifacts";
		$result = $conn->query($sql);
		$aid = $result->fetch_assoc();
		$aid++;
		$date = date ("Y-m-d");
		
		$sql = "INSERT INTO artifacts (AID, SID, Name, SubmitDate) 
			VALUES ('%" . $aid . "%','%" . $artifactStep . "%','%" . $artifact . "%','%" . $date . "%'";

		if ($conn->query($sql) === TRUE) {
			echo "New record created successfully";
		} 
		else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		
		$sql = "SELECT MAX(AID) FROM packageartifacts";
		$result = $conn->query($sql);
		$paid = $result->fetch_assoc();
		$paid++;
		
		$sql = "INSERT INTO artifacts (PAID, PID, AID, StartDate, Progress) 
			VALUES ('%" . $paid . "%','%" . $pid . "%','%" . $aid . "%','%" . $date . "%', 0";

		if ($conn->query($sql) === TRUE) {
			echo "New record created successfully";
		} 
		else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
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