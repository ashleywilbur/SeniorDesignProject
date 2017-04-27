allUsers();



function makeUserTable(){
console.log("makeusertable");
	for(var i =1; i <userAmount.length; i++){
	userTable(parseInt(userAmount[i]));
	}

}

function userTable(uNum){
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;

	if(this.readyState == 3){
		info = JSON.parse(response);


	var tableStart = document.getElementById('allU').innerHTML;
	var tableD = "<tr>\
	<td><input type='checkbox' id='chk_' \"/></td>\
	<td>"+info.First+"</a></td>\
	<td>"+info.Last+"</td>\
	<td>"+info.Email+"</td>\
	<td>"+info.ArchiveDate+"</td>\
	</tr>"

		if(info.Archive == 0){
		document.getElementById('allU').innerHTML = tableStart + tableD;
		console.log("hit");
		}	
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
	console.log("response");
	if(this.readyState == 3){
		userAmount = response.split("+");
console.log("allusers");
		makeUserTable(userAmount);
	}

  };

  xhttp.open("POST", "http://localhost/rmf_tracker/php Files/allusers.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("uid="+localStorage.getItem("UID"));	
	
}
