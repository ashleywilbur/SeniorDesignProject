

MakeTable();

function MakeTable(){
	var allPackages = new Array();
	for(var i =1; i <7; i++){
		GetInfo(i);
	}
	console.log(window.location.href );
}

function GetInfo(pNum){

	//Name
	//emassid
	//customer
	//package lead
	//package validator
	//current step
	//accredicdation type
	//Certification Acquired Date
	
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	//console.log(this);
	//console.log(this);
	//console.log(response);
	//if statement makes sure the right data only comes in once
	if(this.readyState == 3){
		Information = response;
		//the parse makes the data usuable
		Information =JSON.parse(Information);
					
		//makes the table by grabbing the previous HTML and adding more info to it
		//The structure is very sensitive, editing has to be done carefully because of the quotes
		var tableStart = document.getElementById('allP').innerHTML;
		var tableD = "<tr>\
		<td><a href=\"http://localhost/MyPackages.html#"+Information.PID+"\">"+Information.Name+"</a></td>\
		<td>"+Information.eMassID+"</td>\
		<td>"+Information.Customer+"</td>\
		<td>"+Information.PackageLead+"</td>\
		<td>"+Information.PackageValidator+"</td>\
		<td>"+Information.TrackerStep+"</td>\
		<td>"+Information.AccredType+"</td>\
		<td>"+Information.CertificationAcquiredDate+"</td>\
		<td><a href=\"http://localhost/rmf_tracker/generate-report.html#"+Information.PID+"\">"+Information.CertificationAcquiredDate+"</a></td></tr>"

		document.getElementById('allP').innerHTML = tableStart + tableD;
		}
	};
		
  xhttp.open("POST", "http://localhost/rmf_tracker/phpFiles/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package=" + pNum);
	
}


//Function to filter the table to active or archived values
function sortActive(active) { 
	//sortBy determines whether or not we're looking for active or archived packages
	var sortBy;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	//if statement makes sure the right data only comes in once
	if(this.readyState == 3){
	Information = response;
	
	//Determine what to sort by
	if(active==0) { sortBy = 0; }
	else {sortBy = 1; }
	
	Information =JSON.parse(Information);
	if (Information.Archived == sortBy) {
				
	//makes the table by grabbing the previous HTML and adding more info to it
	//The structure is very sensitive, editing has to be done carefully because of the quotes
	var tableStart = document.getElementById('allP').innerHTML;
	var tableD = "<tr>\
	<td><a href=\"http://localhost/MyPackages.html#"+Information.PID+"\">"+Information.Name+"</a></td>\
	<td>"+Information.eMassID+"</td>\
	<td>"+Information.Customer+"</td>\
	<td>"+Information.PackageLead+"</td>\
	<td>"+Information.PackageValidator+"</td>\
	<td>"+Information.TrackerStep+"</td>\
	<td>"+Information.AccredType+"</td>\
	<td>"+Information.CertificationAcquiredDate+"</td>\
	<td><a href=\"http://localhost/rmf_tracker/generate-report.html#"+Information.PID+"\">"+Information.CertificationAcquiredDate+"</a></td></tr>"

	document.getElementById('allP').innerHTML = tableStart + tableD;
	}
	
	//Clark's attempt, old version
/*
  // Declare variables
  var table, tr, sortBy, i;
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  for (var i = 1; i < tr.length; i++) {
	  //PHP pingin' stuff
	  var httpc = new XMLHttpRequest(); 
	  var url = "archive.php";
	  httpc.open("POST", url, true); // sending as POST
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  httpc.onreadystatechange = function() { //Call a function when the state changes.
		if(httpc.readyState == 4 && httpc.status == 200) { // complete and no errors
			alert(httpc.responseText); // some processing here, or whatever you want to do with the response
			}
		}
		httpc.send(tr[i]);
  }

  //sortby pings the php with what it's equal to. If the php tells it "that's a match" it keeps it. If it doesn't match, it filters it out. 
  if(active==0) { sortBy = 0; }
  else {sortBy = 1; }
  
  // Loop through all table rows
  for (i = 0; i < tr.length; i++) {
	//Variable that checks the php for whether or not the current element is archived or not
	var opts = { option_one = <?php echo "'{$archived}'"; ?>;};
  }
	//If there's a match, it keeps that package in the table. If not, it filters it out.  
	  if (sortBy == currentVal) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
    } */
 } 
 
 
 
