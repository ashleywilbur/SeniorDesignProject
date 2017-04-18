
var action = 1;
var action2 = 1;
var action3 = 1;
//function gets called as soon as the page loads
window.onload = loadDoc;
//divides URL into an array to extract the package ID from the previous link
packNum = window.location.href.split("#") 

console.log(packNum);
function TrackerColor(id) {

		if(id == "track1")
			document.getElementById('Snum').innerHTML = "Step #1";
		if(id == "track2")
			document.getElementById('Snum').innerHTML = "Step #2";
		if(id == "track3")
			document.getElementById('Snum').innerHTML = "Step #3";
		if(id == "track4")
			document.getElementById('Snum').innerHTML = "Step #4";
		if(id == "track5")
			document.getElementById('Snum').innerHTML = "Step #5";
		if(id == "track6")
			document.getElementById('Snum').innerHTML = "Step #6";
	document.getElementById('T1').style.visibility = 'visible';
}
function TrackClick(){
		//What shows up on first click
	if(action == 1){
			document.getElementById('T1').style.visibility = 'visible';
			document.getElementById('T1').innerHTML = "<h1>Step #2</h1>Step Description: <br>Deliver Date: <h3>Artifacts: </h3> <h3>Progress: </h3>";;
			
			
			action = 2;
	}
	//everything gets hidden on the second click
	else{			
			document.getElementById('T1').style.visibility = 'hidden';

			
			action= 1;

	}
}

function TrackClick3(){
		//What shows up on first click
	if(action == 1){
			document.getElementById('T1').style.visibility = 'visible';
			document.getElementById('T1').innerHTML = "<h1>Step #3</h1>Step Description: <br>Deliver Date: <h3>Artifacts: </h3> <h3>Progress: </h3>";;

			
			
			action = 2;
	}
	//everything gets hidden on the second click
	else{			
			document.getElementById('T1').style.visibility = 'hidden';

			
			action= 1;

	}
}

function PackageDrop(){
	
		//What shows up on first click
	if(action == 1){
			document.getElementById('dropdown1').style.visibility = 'visible';

			action = 2;
	}
	//everything gets hidden on the second click
	else{			
			document.getElementById('dropdown1').style.visibility = 'hidden';

			
			action= 1;

	}
	
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
	 
	 //Parse brings errors but if it is not there it does not work
	Information =JSON.parse(Information);
	
	//Brings everything to the webpage
   	document.getElementById('Pname').innerHTML = Information.Name;
	document.getElementById('infoTest').innerHTML = Information;
	document.getElementById('Pacronym').innerHTML = "Package Acronym: "+Information.Acronym;
	document.getElementById('Atype').innerHTML = "Accredidation Type: "+Information.AccredType;
	document.getElementById('CATdate').innerHTML = "Certification Acquired Target Date: "+Information.CIA;
	document.getElementById('Sdesc').innerHTML = Information.Description;
	
	//loop for tracker color
	  for(i =1; i < Information.TrackerStep; i++){
		  document.getElementById("Track"+i).style.backgroundColor = '#63AC50';
		  document.getElementById("Track"+(i+1)).style.backgroundColor = '#FFFF69';
	  }
	}
  };
  xhttp.open("POST", "http://localhost/php Files/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package="+packNum[1]);

 
   
}
