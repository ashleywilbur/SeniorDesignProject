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
	
	
	//display package count
	$sql = "SELECT COUNT(PID) as total FROM package";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	//Bring back for total packages
	$row = $result->fetch_assoc();
	echo "{";
	echo "\"Total\":";
	echo $row["total"];
	echo ",";
	
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
	
	if($row = $result->fetch_assoc()) {
		
		
		//output of package info
		//echo "\"";
		
		echo "\"Name\":\"";
		echo $row["Name"] . "\"";
		echo ",";
		echo "\"Acronym\":\"";
		echo $row["Acronym"] . "\"";
		echo ",";
		echo "\"Description\":\"";
		echo $row["Description"] . "\"";
		echo ",";
		echo "\"eMassID\":";
		echo $row["eMassID"];	
		echo ",";
		echo "\"Classification\":\"";
		echo $row["Classification"] . "\"";
		echo ",";
		echo "\"CIA\":\"";
		echo $row["CIA"] . "\"";
		echo ",";
		echo "\"Archive\":";
		echo $row["Archive"];
		echo ",";
		echo "\"ArchiveDate\":\"";
		echo $row["ArchiveDate"] . "\"";
		echo ",";
		echo "\"TrackerStep\":";
		
		
		//output of current step
		$step = $row["TrackerStep"];
		//everything under this is commented out for now. Until there is data in the database it will only bring errors
		echo $step;
		echo ",";
		
		echo "\"PID\":";
		//output of PID
		echo $row["PID"];
		echo ",";
	}
	
	//Searches for all packagestandardtimeline/standardtimeline values
	
	$sql = "SELECT * FROM packagestandardtimeline pst, standardtimeline st WHERE pst.PID LIKE '%" . $package . "%' AND pst.STID LIKE st.STID";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	if($row = $result->fetch_assoc()) {
	
		//outputs packagestandardtimeline/standardtimeline values
		/*echo "\"PkgCreationDate\":";
		echo $row["PkgCreationDate"];
		echo ",";
		echo "\"Step1Days\":";
		echo $row["Step1Days"]; //how many days Step1Date has been Delayed
		echo ",";
		echo "\"Step2Days\":";
		echo $row["Step2Days"]; //how many days Step2Date has been Delayed
		echo ",";
		echo "\"Step3Days\":";
		echo $row["Step3Days"]; //how many days Step3Date has been Delayed
		echo ",";
		echo "\"Step4Days\":";
		echo $row["Step4Days"]; //how many days Step4Date has been Delayed
		echo ",";
		echo "\"Step5Days\":";
		echo $row["Step5Days"]; //how many days Step5Date has been Delayed
		echo ",";
		echo "\"CertAcquiredDays\":";
		echo $row["CertAcquiredDays"]; //how many days CertAcquiredDate has been Delayed
		echo ",";
		echo "\"ExpirationMonths\":";
		echo $row["ExpirationMonths"]; //how many months ExpirationDateMonth has been Delayed
		echo ",";*/
		echo "\"Zone\":\"";
		echo $row["Zone"] . "\"";
		echo ",";
		echo "\"AccredType\":\"";
		echo $row["AccredType"] . "\"";}/*
		echo ",";
		echo "\"CreationDate\":";
		echo $row["CreationDate"]; //not important for package data
		echo ",";
		echo "\"Step1Date\":";
		echo $row["Step1Date"]; //when  Step 1 is due
		echo ",";
		echo "\"Step2Date\":";
		echo $row["Step2Date"]; //when Step1Date Step 2 is due
		echo ",";
		echo "\"Step3Date\":";
		echo $row["Step3Date"]; //when Step2Date Step 3 is due
		echo ",";
		echo "\"Step4Date\":";
		echo $row["Step4Date"]; //when Step3Date Step 4 is due
		echo ",";
		echo "\"Step5Date\":";
		echo $row["Step5Date"]; //when Step4Date Step 5 is due
		echo ",";
		echo "\"CertAcquiredDate\":";
		echo $row["CertAcquiredDate"]; //how many days after Step5Date the Cert is expected to be  finalized
		echo ",";
		echo "\"ExpirationDate\":";
		echo $row["ExpirationDate"]; //how long the cert lasts (months)
		echo ",";
		echo "\"OverallProcessMonths\":";
		echo $row["OverallProcessMonths"]; //how long the process should take as a wile (months)
	}
	*/
	//search artifacts using PUID and associated tables
	
	$sql = "SELECT PUID FROM packageusers WHERE packageusers.PID LIKE '%" . $package . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	if($row = $result->fetch_assoc()){
		$puid = $row["PUID"];
	}
	
	
	$sql = "SELECT * FROM artifacts a, packageartifacts pa WHERE a.AID LIKE pa.AID AND pa.PAID LIKE '%" . $puid . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$i=1;
	
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo ",";
			echo "\"ArtifactName".$i."\":\"";
			echo $row["Name"] . "\"";
			echo ",";
			echo "\"SID".$i."\":\"";
			echo $row["SID"]. "\"";
			echo ",";
			echo "\"SubmitDate".$i."\":\"";
			echo $row["SubmitDate"]. "\"";
			echo ",";
			echo "\"Progress".$i."\":\"";
			echo $row["Progress"]. "\"";
			echo ",";
			echo "\"i\":";
			echo $i;
			
			$i++;
		}
	} 
	echo "}";
	
	
	//echo "\"";
	
	
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