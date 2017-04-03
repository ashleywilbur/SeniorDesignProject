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
	
	
	//display package count
	$sql = "SELECT COUNT(PID) as total FROM package";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["total"];
	
	
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
	
	$row = mysql_fetch_row($result);
	
	
	//output of package info
	echo $row["Name"];
	echo $row["Acronym"];
	echo $row["Description"];
	echo $row["eMassID"];
	echo $row["Classification"];
	echo $row["CIA"];
	echo $row["Archive"];
	echo $row["ArchiveDate"];
	
	//output of current step
	$step = $row["TrackerStep"];
	
	echo $step;
	
	
	//Searches for all packagestandardtimeline/standardtimeline values
	
	$sql = "SELECT * FROM packagestandardtimeline pst, standardtimeline st WHERE pst.PID LIKE '%" . $package . "%' AND pst.STID LIKE st.STID";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	
	//outputs packagestandardtimeline/standardtimeline values
	
	echo $row["PkgCreationDate"];
	echo $row["Step1Delay"]; //how many days Step1Date has been delayed
	echo $row["Step2Delay"]; //how many days Step2Date has been delayed
	echo $row["Step3Delay"]; //how many days Step3Date has been delayed
	echo $row["Step4Delay"]; //how many days Step4Date has been delayed
	echo $row["Step5Delay"]; //how many days Step5Date has been delayed
	echo $row["CertAcquiredDelay"]; //how many days CertAcquiredDate has been delayed
	echo $row["ExpirationDelay"]; //how many months ExpirationDateMonth has been delayed
	echo $row["Zone"];
	echo $row["AccredType"];
	echo $row["CreationDate"]; //not important for package data
	echo $row["Step1Date"]; //how many days after PkgCreationDate Step 1 is due
	echo $row["Step2Date"]; //how many days after Step1Date Step 2 is due
	echo $row["Step3Date"]; //how many days after Step2Date Step 3 is due
	echo $row["Step4Date"]; //how many days after Step3Date Step 4 is due
	echo $row["Step5Date"]; //how many days after Step4Date Step 5 is due
	echo $row["CertAcquiredDate"]; //how many days after Step5Date the Cert is expected to be  finalized
	echo $row["ExpirationDateMonth"]; //how long the cert lasts (months)
	echo $row["OverallProcessMonths"]; //how long the process should take as a wile (months)
	
	//set search value for artifact info based off packagestandardtimeline
	
	$aid1 = $row["Step1Artifact"];
	$aid2 = $row["Step2Artifact"];
	$aid3 = $row["Step3Artifact"];
	$aid4 = $row["Step4Artifact"];
	$aid5 = $row["Step5Artifact"];
	
	//search & output using set value
	
	//aid1
	$sql = "SELECT * FROM artifacts WHERE artifacts.AID LIKE '%" . $aid1 . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["Name"];
	echo $row["Date"];
	
	//aid2
	$sql = "SELECT * FROM artifacts WHERE artifacts.AID LIKE '%" . $aid2 . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["Name"];
	echo $row["Date"];
	
	//aid3
	$sql = "SELECT * FROM artifacts WHERE artifacts.AID LIKE '%" . $aid3 . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["Name"];
	echo $row["Date"];
	
	//aid4
	$sql = "SELECT * FROM artifacts WHERE artifacts.AID LIKE '%" . $aid4 . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["Name"];
	echo $row["Date"];
	
	//aid5
	$sql = "SELECT * FROM artifacts WHERE artifacts.AID LIKE '%" . $aid5 . "%'";
	$result = $conn->query($sql);
	
	if (!$result) {
		trigger_error('Invalid query: ' . $conn->error);
	}
	
	$row = mysql_fetch_row($result);
	echo $row["Name"];
	echo $row["Date"];
	
	
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