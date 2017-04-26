
function checkCreds(){
	console.log("hello");
	console.log(document.getElementById("email").value);
	var email = document.getElementById("email").value;
		var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	//console.log(this);
	//console.log();
	//if statement makes sure the right data only comes in once
		if(this.readyState == 3){
		console.log("ready");
		console.log(response);
		
			if(response ==1 ){
				window.location.replace("A&A-lead-dash.html");
				localStorage.setItem("dash", "A&A-lead-dash.html");
				//localStorage.getItem("lastname")
				localStorage.setItem("UID", response);
			}
			if(response ==2 ){
				window.location.replace("A&A-lead-dash.html");
				localStorage.setItem("dash", "A&A-lead-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response ==3 ){
				window.location.replace("ElevatedUser-dash.html");
				localStorage.setItem("dash", "ElevatedUser-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response ==4 ){
				window.location.replace("package-validator-lead-dash.html");
				localStorage.setItem("dash", "package-validator-lead-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response ==5 ){
				window.location.replace("package-validator-lead-dash.html");
				localStorage.setItem("dash", "package-validator-lead-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response == 6){
				window.location.replace("package-team-member-dash.html");
				localStorage.setItem("dash", "package-team-member-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response == 7){
				window.location.replace("customer-dash.html");
				localStorage.setItem("dash", "customer-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			if(response == 8){
				window.location.replace("NewUser-dash.html");
				localStorage.setItem("dash", "NewUser-dash.html");
				localStorage.setItem("UID", response);
				//localStorage.getItem("lastname")
			}
			
			if(this.readyState == 4 && response ==""){
				document.getElementById("errorM").innerHTML="Invalid E-mail";
			}

		}
	}	
  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/user.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("email="+email);
	
	

	
}