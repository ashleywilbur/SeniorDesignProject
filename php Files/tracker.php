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
	
	$row = $result->fetch_assoc();
	
	
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
	echo "\"ArchiveDate\":";
	echo $row["ArchiveDate"];
	echo ",";
	echo "\"TrackerStep\":";
	
	//output of current step
	$step = $row["TrackerStep"];
	
	echo $step;
	echo ",";
	
	echo "\"PID\":";
	//output of current step
	$step = $row["PID"];
	
	echo $step;
	echo ",";
	
	//Searches for all packagestandardtimeline/standardtimeline values
	
	$sql = "SELECT * FROM packagestandardtimeline pst, standardtimeline st WHERE pst.PID LIKE '%" . $package . "%' AND pst.STID LIKE st.STID";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = $result->fetch_assoc();
	
	//outputs packagestandardtimeline/standardtimeline values
	echo "\"PkgCreationDate\":";
	echo $row["PkgCreationDate"];
	echo ",";
	echo "\"Step1Delay\":";
	echo $row["Step1Delay"]; //how many days Step1Date has been 
	echo ",";
	echo "\"Step2Delay\":";
	echo $row["Step2Delay"]; //how many days Step2Date has been delayed
	echo ",";
	echo "\"Step3Delay\":";
	echo $row["Step3Delay"]; //how many days Step3Date has been delayed
	echo ",";
	echo "\"Step4Delay\":";
	echo $row["Step4Delay"]; //how many days Step4Date has been delayed
	echo ",";
	echo "\"Step5Delay\":";
	echo $row["Step5Delay"]; //how many days Step5Date has been delayed
	echo ",";
	echo "\"CertAcquiredDelay\":";
	echo $row["CertAcquiredDelay"]; //how many days CertAcquiredDate has been delayed
	echo ",";
	echo "\"ExpirationDelay\":";
	echo $row["ExpirationDelay"]; //how many months ExpirationDateMonth has been delayed
	echo ",";
	echo "\"Zone\":\"";
	echo $row["Zone"] . "\"";
	echo ",";
	echo "\"AccredType\":\"";
	echo $row["AccredType"] . "\"";
	echo ",";
	echo "\"CreationDate\":";
	echo $row["CreationDate"]; //not important for package data
	echo ",";
	echo "\"Step1Date\":";
	echo $row["Step1Date"]; //how many days after PkgCreationDate Step 1 is due
	echo ",";
	echo "\"Step2Date\":";
	echo $row["Step2Date"]; //how many days after Step1Date Step 2 is due
	echo ",";
	echo "\"Step3Date\":";
	echo $row["Step3Date"]; //how many days after Step2Date Step 3 is due
	echo ",";
	echo "\"Step4Date\":";
	echo $row["Step4Date"]; //how many days after Step3Date Step 4 is due
	echo ",";
	echo "\"Step5Date\":";
	echo $row["Step5Date"]; //how many days after Step4Date Step 5 is due
	echo ",";
	echo "\"CertAcquiredDate\":";
	echo $row["CertAcquiredDate"]; //how many days after Step5Date the Cert is expected to be  finalized
	echo ",";
	echo "\"ExpirationDateMonth\":";
	echo $row["ExpirationDateMonth"]; //how long the cert lasts (months)
	echo ",";
	echo "\"OverallProcessMonths\":";
	echo $row["OverallProcessMonths"]; //how long the process should take as a wile (months)
	echo ",";
	
	//search artifacts using PUID and associated tables
	
	$sql = "SELECT PUID FROM packageusers WHERE packageusers.PID LIKE '%" . $package . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = $result->fetch_assoc();
	$puid = $row["PUID"];
	
	
	$sql = "SELECT * FROM artifacts a, packageartifacts pa WHERE a.AID LIKE pa.AID AND pa.PUID LIKE '%" . $puid . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo $row["Name"] . "\"";
			echo $row["SID"] . "\"";
			echo $row["SubmitDate"] . "\"";
			echo $row["Progress"];
		}
	} else {
		echo "0 results";
	}
	
	
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