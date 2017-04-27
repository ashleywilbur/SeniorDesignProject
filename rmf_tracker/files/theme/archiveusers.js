window.onLoad = allUsers();



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
	<td><a><input \"type = 'checkbox' name = 'archiveUser' value = 'archived'\"> Archive User</a></td>\
	<td>"+info.First+"</a></td>\
	<td>"+info.Last+"</td>\
	<td>"+info.Email+"</td>\
	<td>"+info.ArchiveDate+"</td>\
	</tr>"
		console.log(info);
		if(info.Archive == 0)
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
