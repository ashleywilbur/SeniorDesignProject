var packNum = window.location.href.split("#") 
var action = 1;
var action2 = 1;
var action3 = 1;
//function gets called as soon as the page loads
window.onload = TrackerColor("track1");
//divides URL into an array to extract the package ID from the previous link


console.log(packNum);
function TrackerColor(id) {
		

		
if(id == "track1"){artLoad(1);
			document.getElementById('T1').innerHTML = 

'<br><br><h1 id = "Snum" >Step #1</h1>'+
'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+

'</form>';


}

		if(id == "track2"){artLoad(2);
			document.getElementById('T1').innerHTML = 
'<br><br><h1 id = "Snum" >Step #2</h1>'+

'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+


'</form>'+
'<div class="kickBack" id="kickBack2">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
	'<button id="saveKickback2">Save </button><br>'+
'</form>'+

		'</div>';}
		if(id == "track3"){artLoad(3);
			document.getElementById('T1').innerHTML = 
'<br><br><h1 id = "Snum" >Step #3</h1>'+

'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+

'</form>'+
'<div class="kickBack" id="kickBack3">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
	'<button id="saveKickback3">Save </button><br>'+
'</form>'+

		'</div>';}
		if(id == "track4"){artLoad(4);
			document.getElementById('T1').innerHTML = 
'<br><br><h1 id = "Snum" >Step #4</h1>'+

'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+

'</form>'+
'<div class="kickBack" id="kickBack4">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
	'<button id="saveKickback4">Save </button><br>'+
'</form>'+

		'</div>';}
		if(id == "track5"){artLoad(5);
			document.getElementById('T1').innerHTML = 
'<br><br><h1 id = "Snum" >Step #5</h1>'+

'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+


'</form>'+
'<div class="kickBack" id="kickBack5">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
	'<button id="saveKickback5">Save </button><br>'+
'</form>'+

		'</div>';}
		if(id == "track6"){artLoad(6);
			document.getElementById('T1').innerHTML = 
'<br><br><h1 id = "Snum" >Step #6</h1>'+

'<h3>Artifact Progress</h3> <br>'+
'<form action="artifactsubmit.php" method="POST">'+

'</form>'+
'<div class="kickBack" id="kickBack6">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
	'<button id="saveKickback6">Save </button><br>'+
'</form>'+

		'</div>';}
	document.getElementById('T1').style.visibility = 'visible';
}
function AA(i){
 var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      response =this.responseText;  

	if(this.readyState == 3){console.log(this);
		response = response.split("+");
	if(response[0] == 1 || response[0] == 2){
	var T1 = document.getElementById("T1").innerHTML;
	document.getElementById("T1").innerHTML= T1 + '<div class="kickBack" id="kickBack">'+
'<label> Delivered </label>'+
'<button id="del4" class = "artButton"></button><br>'+
'<form action = "" method = "POST">'+
	'Step approved? <br>'+
	'<input type="radio" name="approved" value="yes"> Yes<br>'+
	'<input type="radio" name="approved" value="no"> No<br>'+
	'Kickback Reason: <br>'+
	'<input type="text" name="kickback"> <br>'+
'	<button id="saveKickback">Save </button><br>'+
'</form>';
	document.getElementById("T1").innerHTML= T1 +
	'<span><input class="artApp"type="checkbox" name="artapp'+i+'" value="artifactapproved"> Approve &nbsp </span><br>';
	}
	if(response[0] == 4){
	var T1 = document.getElementById("T1").innerHTML;
	document.getElementById("T1").innerHTML= T1 +
	'<span><input class="artSub" type="checkbox" name="artsub'+i+'" value="artifactsubmit"> Submit &nbsp</span>';
	}
	
	}
  };
  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/userroles.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));

}

function artLoad(step){
	  var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
      response =this.responseText;  
	 // Information = response.split(","); Can be used to take in info as array instead of object
	if(this.readyState == 3){
		Information = response;
		Information =JSON.parse(Information);
		for(var i=1; i <= Information.i;i++){
			var sid = i.toString();
			sid = "SID"+sid;
			if(step == Information[sid]){
		var aName = i.toString();
		aName = "ArtifactName"+aName;
			artifacts(Information[aName], Information.SID, i);
			console.log(Information[aName]);}
		}
	
	}
  };
  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package="+packNum[1]);
  
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

function artifacts(aName, stepID,i){ console.log(aName);
	var T1 = document.getElementById("T1").innerHTML;
	document.getElementById("T1").innerHTML= T1 +
	'<label>'+ aName +'</label> '+
	'<button id="art'+i+'" class = "artButton"></button>';
	//'<span id="subs"></span>'+
	//'<span id></span><br>';
	AA(i);
	
}
