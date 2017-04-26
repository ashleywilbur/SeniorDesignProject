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

  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/userdata.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));
	
	
}

function makeUserTable(){
	console.log(userAmount);
	for(var i =1; i <userAmount.length; i++){
	userTable(parseInt(userAmount[i]));
	}
	console.log(window.location.href );
}

function userTable(uNum){
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
	console.log(response);
	if(this.readyState == 3){
		info = JSON.parse(response);
		console.log(uNum);
	var tableStart = document.getElementById('allU').innerHTML;
	var tableD = "<tr>\
	<td>"+info.First+"</a></td>\
	<td>"+info.Last+"</td>\
	<td>"+info.Email+"</td>\
	<td>"+info.Phone+"</td>\
	<td>"+info.Location+"</td>\
	<td>"+info.Org+"</td>\
	</tr>"
		console.log(info);
		document.getElementById('allU').innerHTML = tableStart + tableD;	
	}

  };

  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/userdata.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+uNum);
	
}
function allUsers(){
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
	console.log(response);
	if(this.readyState == 3){
		userAmount = response.split("+");
		console.log(userAmount);
		makeUserTable(userAmount);
	}

  };

  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/allusers.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));	
	
}
