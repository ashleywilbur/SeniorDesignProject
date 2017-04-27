
var action = 1;
var action2 = 1;
var action3 = 1;
//function gets called as soon as the page loads
window.onload = loadDoc;
//divides URL into an array to extract the package ID from the previous link
packNum = window.location.href.split("#") 

console.log(packNum);
function TrackerColor(id) {
		
		AA();
		
if(id == "track1"){
			document.getElementById('T1').innerHTML = 

'<br><br><h1 id = "Snum" >Step #1</h1>'+
'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+
'<!--name is paid-->'+
'<label> Artifact 1 </label>'+
'<button id="art1" class = "artButton"></button>'+
'<input class="artSub" type="checkbox" name="art1sub" value="artifactsubmit"> Submit &nbsp'+
'<input class="artApp"type="checkbox" name="art1app" value="artifactapproved"> Approve &nbsp <br>'+
'<label> Artifact 2 </label>'+
'<button id="art2" class = "artButton"></button>'+
'<span class="artSub"> <input type="checkbox" name="art2sub" value="artifactsubmit"> Submit &nbsp </span>'+
' <input class="artApp" type="checkbox" name="art2app" value="artifactapproved"> Approve &nbsp <br>'+
'<label> Artifact 3 </label>'+
'<button id="art3" class = "artButton"></button>'+
'<span class="artSub"><input class="artSub" type="checkbox" name="art3sub" value="artifactsubmit"> Submit &nbsp </span>'+
' <input class="artApp" type="checkbox" name="art3app" value="artifactapproved"> Approve &nbsp <br><br> <br>'+
'<label> Delivered </label>'+
'<button id="del" class = "artButton"></button><br>'+
'<div class="kickBack" id="kickBack">'+
'</div>'+
'</form>'+

'<div class="kickBack" id="kickBack">'+

'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
'	<button id="saveKickback">Save </button><br>'+
'</form>';
}/*

		if(id == "track2"){
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T2').style.visibility = 'visible';
			document.getElementById('T3').style.visibility = 'hidden';
			document.getElementById('T4').style.visibility = 'hidden';
			document.getElementById('T5').style.visibility = 'hidden';
		document.getElementById('T6').style.visibility = 'hidden';}
		if(id == "track3"){
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T2').style.visibility = 'hidden';
			document.getElementById('T3').style.visibility = 'visible';
			document.getElementById('T4').style.visibility = 'hidden';
			document.getElementById('T5').style.visibility = 'hidden';
		document.getElementById('T6').style.visibility = 'hidden';}
		if(id == "track4"){
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T2').style.visibility = 'hidden';
			document.getElementById('T3').style.visibility = 'hidden';
			document.getElementById('T4').style.visibility = 'visible';
			document.getElementById('T5').style.visibility = 'hidden';
		document.getElementById('T6').style.visibility = 'hidden';}
		if(id == "track5"){
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T2').style.visibility = 'hidden';
			document.getElementById('T3').style.visibility = 'hidden';
			document.getElementById('T4').style.visibility = 'hidden';
			document.getElementById('T5').style.visibility = 'visible';
		document.getElementById('T6').style.visibility = 'hidden';}
		if(id == "track6"){
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T2').style.visibility = 'hidden';
			document.getElementById('T3').style.visibility = 'hidden';
			document.getElementById('T4').style.visibility = 'hidden';
			document.getElementById('T5').style.visibility = 'hidden';
		document.getElementById('T6').style.visibility = 'visible';}*/
	document.getElementById('T1').style.visibility = 'visible';
}
function AA(){
 var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      response =this.responseText;  

	if(this.readyState == 3){
		
	  if(response == 1){

	}
	}
  };
  xhttp.open("POST", "http://localhost/rmf_tracker/php_Files/userroles.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));

}
	
	

//Function brings the tracker up to date
//The loop goes through each step and gives it a green color
//Information is an object of data from the database
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      response =this.responseText;  
	 // Information = response.split(","); Can be used to take in info as array instead of object
	if(this.readyState == 3){
	  
	 Information = response;
	 console.log(Information);
	 //Parse brings errors but if it is not there it does not work
	Information =JSON.parse(Information);
	
	//Brings everything to the webpage
   	document.getElementById('Pname').innerHTML = Information.Name;
	//document.getElementById('infoTest').innerHTML = Information;
	document.getElementById('Pacronym').innerHTML = "Package Acronym: "+Information.Acronym;
	document.getElementById('Atype').innerHTML = "Accredidation Type: "+Information.AccredType;
	document.getElementById('CATdate').innerHTML = "Certification Acquired Target Date: "+Information.CIA;
	//document.getElementById('Sdesc').innerHTML = Information.Description;
	
	for(var i=1; i <= Information.i;i++){
	var aName = i.toString();
	aName = "ArtifactName"+aName;
	//	artifacts(Information.ArtifactName+i);
	console.log(Information[aName]);
	}
	
	//loop for tracker color
	  for(i =1; i < Information.TrackerStep; i++){
		  document.getElementById("Track"+i).style.backgroundColor = '#63AC50';
		  document.getElementById("Track"+(i+1)).style.backgroundColor = '#FFFF69';
	  }
	}
  };
  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package="+packNum[1]);

 
   
}

function artifacts(aName, stepID){
	
	
	
}
