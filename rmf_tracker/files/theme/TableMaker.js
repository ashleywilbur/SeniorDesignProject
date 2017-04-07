
MakeTable();

function MakeTable(){
	var allPackages = new Array();
	for(var i =1; i <7; i++){
	GetInfo(i);
	}

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
	console.log(this);

	
	Information = response;
	Information =JSON.parse(Information);
				

	var tableStart = document.getElementById('allP').innerHTML;
	var tableD = "<tr>\
	<td>"+Information.Name+"</td>\
	<td>"+Information.eMassID+"</td>\
	<td>"+Information.Customer+"</td>\
	<td>"+Information.PackageLead+"</td>\
	<td>"+Information.PackageValidator+"</td>\
	<td>"+Information.TrackerStep+"</td>\
	<td>"+Information.AccredType+"</td>\
	<td>"+Information.CertificationAcquiredDate+"</td></tr>"

	document.getElementById('allP').innerHTML = tableStart + tableD;
	};
	
  xhttp.open("POST", "http://localhost/Pro/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package=" + pNum);

	
	
}

function getTotal(){
	var total = 0;
	var xhttp = new XMLHttpRequest();	
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	console.log(response);

	Information = response;
	Information =JSON.parse(Information);

  };
  xhttp.open("POST", "http://localhost/Pro/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package=0");
	console.log(pTotal);
	
}