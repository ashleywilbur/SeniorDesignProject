

MakeTable();

function MakeTable(){
	var allPackages = new Array();
	for(var i =1; i <7; i++){
	GetInfo(i);
	}
	console.log(window.location.href );
}

function GetInfo(pNum){

	//Name
	//emassid
	//customer
	//package lead
	//package validator
	//current step
	//accredicdation type
	//Certification Acquired Date
	
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
    response =this.responseText;
	//console.log(this);
	console.log(this);
	console.log(response);
	//if statement makes sure the right data only comes in once
	if(this.readyState == 3){
	Information = response;
	//the parse makes the data usuable
	Information =JSON.parse(Information);
				
	//makes the table by grabbing the previous HTML and adding more info to it
	//The structure is very sensitive, editing has to be done carefully because of the quotes
	var tableStart = document.getElementById('allP').innerHTML;
	var tableD = "<tr>\
	<td><a href=\"http://localhost/MyPackages.html#"+Information.PID+"\">"+Information.Name+"</a></td>\
	<td>"+Information.eMassID+"</td>\
	<td>"+Information.Customer+"</td>\
	<td>"+Information.PackageLead+"</td>\
	<td>"+Information.PackageValidator+"</td>\
	<td>"+Information.TrackerStep+"</td>\
	<td>"+Information.AccredType+"</td>\
	<td>"+Information.CertificationAcquiredDate+"</td></tr>"

	document.getElementById('allP').innerHTML = tableStart + tableD;
	}
	};
	
	//function for search bar
	jQuery(function ($) {
    
    	var filter;
    	
    	$("#active").click(function () {
        	if (filter == 'active') {
            	$('tr').show();
            	filter = undefined;
        	} else {
            	$('tr:not(.success)').hide();
            	$('tr.success').show();
        	filter = 'active';
        	}
    	});
    	$("#archived").click(function () {
        	if (filter == 'archived') {
            	$('tr').show();
            filter = undefined;
        	} else {
            	$('tr:not(.danger)').hide();
            	$('tr.danger').show();
            filter = 'archived';
        	}
    	});
        $("#both").click(function () {
        	if (filter == 'both') {
            	$('tr').show();
            filter = undefined;
        	} else {
            	$('tr:not(.danger)').hide();
            	$('tr.danger').show();
            filter = 'both';
        	}
    	});
});
	
  xhttp.open("POST", "http://localhost/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package=" + pNum);
	
}


