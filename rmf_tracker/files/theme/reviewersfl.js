allReviewer();
//userTable();

function makeReviewerTable(){
	console.log(reviewerAmount);
	for(var i =1; i <reviewerAmount.length; i++){
	userTable(parseInt(reviewerAmount[i]));
	}
	console.log(window.location.href);
}

function userTable(rNum){
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
    console.log(this);
	console.log(response);
	if(this.readyState == 3){
		info = JSON.parse(response);
		console.log("hit");
	var tableStart = document.getElementById('allR').innerHTML;
	var tableD = "<tr>\
	<td><input type='checkbox' id='chk_' \"/></td>\
	<td>"+info.FirstName+"</a></td>\
	<td>"+info.LastName+"</td>\
	</tr>"
		console.log(info);
		document.getElementById('allR').innerHTML = tableStart + tableD;	
	}

  };

  xhttp.open("POST", "http://localhost/rmf_tracker/reviewers.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("rwid");
	
}
function allReviewer(){
	var xhttp = new XMLHttpRequest();	
	var uid = xhttp.onreadystatechange = function() {
    response =this.responseText;
	console.log(response);
	if(this.readyState == 3){
		reviewerAmount = response.split("+");
		console.log(reviewerAmount);
		reviewerAmount.shift();
		
		//dropD = " <option>+reviewerAmount[i]+</option>"
		for(var i = 1; i<=reviewerAmount.length; i++){
			if(i%2 == 1){console.log("loop"); console.log(reviewerAmount[i]);
			dropStart = document.getElementById('archivereviewer').innerHTML;
			dropD = " <option value="+reviewerAmount[i-1]+"\">"+reviewerAmount[i]+"</option>"
			document.getElementById('archivereviewer').innerHTML = dropStart + dropD;
			}
			
	//	makeReviewerTable(reviewerAmount);
	}

}

  };

  xhttp.open("POST", "http://localhost/rmf_tracker/reviewers.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("rwid="+localStorage.getItem("RWID"));	
	
}
