
var action = 1;
var action2 = 1;

function TrackerColor(id, color) {
	
	//What shows up on first click
	if(action == 1){
			document.getElementById(id).style.backgroundColor = color;
			document.getElementById('T1').style.visibility = 'visible';
			document.getElementById('T1').style.height = '200px';
			//document.getElementById('T1').innerHTML = '<marquee><h1> Hello!!! </h1></marquee>';
			
			action = 2;
	}
	//everything gets hidden on the second click
	else{			
			document.getElementById(id).style.backgroundColor =  '#C0504B';
			document.getElementById('T1').style.visibility = 'hidden';
			document.getElementById('T1').style.height = '10px';
			
			action= 1;

	}
}

function PackageDrop(){
	
		//What shows up on first click
	if(action == 1){
			document.getElementById('dropdown1').style.visibility = 'visible';

			action2 = 2;
	}
	//everything gets hidden on the second click
	else{			
			document.getElementById('dropdown1').style.visibility = 'hidden';

			
			action2= 1;

	}
	
}

 /*var values = $(this).serialize();

 $.ajax({
        url: "tracker.php",
        type: "post",
        data: values ,
        success: function (response) {
           // you will get response from your php page (what you echo or print)                 

        },
        error: function(jqXHR, textStatus, errorThrown) {
           console.log(textStatus, errorThrown);
        }


    });*/
	
	function tracks(stage){
		
		
	}
	
	function submitform()
{
    document.forms["myform"].submit();
}

function loadDoc(ins) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      document.getElementById("demo").innerHTML =
      this.responseText;
  };
  xhttp.open("POST", "http://localhost/tracker.php", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.send("package=" + 1);
}/*
var one = 1;
    $('clicker').on('click',function(){
        $.ajax({
            type:"POST",
            url: "tracker.php",
            data: one,
            success: function(result){
              //  $("#demo").html(result);
			  document.getElementById("demo").innerHTML = "help";
            },
			error: function(){document.getElementById("demo").innerHTML = "nope";}
        });
    });*/