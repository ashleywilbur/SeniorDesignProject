window.onLoad = linked();

function logout(){
	localStorage.clear();
}
function linked(){
	
	document.getElementById("dash").setAttribute('href', localStorage.getItem("dash"));
	
	
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
	
	if(this.readyState == 3){
		info = JSON.parse(response);
		document.getElementById("wsite-title").innerHTML= info.First +" " + info.Last;
		document.getElementById("code").innerHTML= "code: "+info.Code;
		console.log(info.First);
	}

  };

  xhttp.open("POST", "http://localhost/userdata.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));
	
	
}

function userTable(){
	console.log("fdsfsdfdf")
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
	
	if(this.readyState == 3){
		info = JSON.parse(response);
		
	var tableStart = document.getElementById('allU').innerHTML;
	var tableD = "<tr>\
	<td>"+info.First+"</a></td>\
	<td>"+info.Last+"</td>\
	<td>"+info.Email+"</td>\
	<td>"+info.Phone+"</td>\
	<td>"+info.Location+"</td>\
	<td>"+info.Org+"</td>\
	</tr>"
		
		document.getElementById('allU').innerHTML = tableStart + tableD;	
	}

  };

  xhttp.open("POST", "http://localhost/userdata.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));
	
}