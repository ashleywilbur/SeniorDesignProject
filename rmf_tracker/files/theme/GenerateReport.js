
var action = 1;
var action2 = 1;
var action3 = 1;
//function gets called as soon as the page loads
window.onload = loadDoc;
//divides URL into an array to extract the package ID from the previous link
packNum = window.location.href.split("#") 

console.log(packNum);

	
	

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
	document.getElementById('Sdesc').innerHTML = Information.Description;
	document.getElementById('Zone').innerHTML = "Zone: "+Information.Zone;	
	
	document.getElementById('dDate1').innerHTML ="Deliver Date:"+ Information.Step1Date;
	document.getElementById('dDate2').innerHTML ="Deliver Date:"+ Information.Step2Date;	
	document.getElementById('dDate3').innerHTML ="Deliver Date:"+ Information.Step3Date;	
	document.getElementById('dDate4').innerHTML ="Deliver Date:"+ Information.Step4Date;
	document.getElementById('dDate5').innerHTML ="Deliver Date:"+ Information.Step5Date;	

		genArtLoad();
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

function genArtLoad(){
	  var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
      response =this.responseText;  console.log("genart");
	 // Information = response.split(","); Can be used to take in info as array instead of object
	if(this.readyState == 3){ console.log("readyState");
		Information = response; console.log(Information);
		Information =JSON.parse(Information);
	for(var step = 1; step < 6; step++){
		for(var i = 1; i <= Information.i; i++){
			var sid = i.toString();
			sid = "SID"+sid;
			if(step == Information[sid]){
			var aName = i.toString();
			aName = "ArtifactName"+aName;
			genArtifacts(Information[aName], Information[sid], i);
			console.log(Information[aName]);}
			
	}}
	
	}
  };
  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package="+packNum[1]);
  
}

function genArtifacts(aName, stepID,i){ console.log(stepID);
	var T1 = document.getElementById("genS"+stepID).innerHTML;
	document.getElementById("genS"+stepID).innerHTML= T1 +
	'<label> Artifact:'+ aName +'</label>';

	
}
