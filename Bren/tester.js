


function tst(){


	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	document.getElementById('testpage').innerHTML=response;;
	};
	//Put the url for the php file here
  xhttp.open("POST", "http://localhost/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  //put whatever needs to be posted here
  xhttp.send("package=2");

	
	
}


