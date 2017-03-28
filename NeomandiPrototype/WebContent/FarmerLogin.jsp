<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.farmlogcls {
    border: 0px;
    border-left: 30px solid #b6e41f;
    border-right: 30px solid #b6e41f;
    background: #1D73BE;
     margin-top: 11%; 
    position: relative;
}
</style>
</head>

<body class="" onkeypress="myFunction(event)">
 <%
if(request.getAttribute("errmsg")!=null && (((String)request.getAttribute("errmsg")).contains("Register first ")))
{    
	 out.println("<script type=\"text/javascript\">");
	 out.println("swal('YOUR HAVE NOT REGISTERED PLEASE REGISTER BEFORE LOGGING IN');");
	 out.println("location='FarmerRegister.jsp';");
     out.println("</script>");
}
else{
if(request.getAttribute("errmsg")!=null && (((String)request.getAttribute("errmsg")).contains("Your password does not match")))
{    
	 out.println("<script type=\"text/javascript\">");
	 out.println("confirm('YOUR PASSWORD IS WRONG!! PLEASE ENTER CORRECT PASSWORD');");
     out.println("</script>");
}%>
<!---menu bar------>

 <nav class="navbar navbar-inverse menu">
  <div class="container-fluid">
    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img src="images/trad_logo.png" class="img-responsive"></a>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.html">About Us</a></li>
                        <li><a href="Vission.html">Vision</a></li>
                        <li><a href="Mission.html">Mission</a></li>
                        <li><a href="Howitworks.html">How it works</a></li>
                        <li><a href="News.html">News</a></li>
                        <li><a href="ContactUs.html">Contact Us</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="Register.html">Register</a>
                        </li>
                        <li class="active"><a href="Login.html">Login</a></li>
      </ul>
      
    </div>
  </div>
</nav> 
<!-----menu bar end------>
<div class="container-fluid farmlogcls pad">
<div class="row">
<div class="col-lg-2 col-md-3 hidden-sm hidden-xs pad loginlogo"><img src="images/trad_logo.png" class="img-responsive" alt="Cinque Terre" style="height:100%"></div>
<div class="col-lg-offset-8 col-lg-2 col-md-offset-5 col-md-3 col-sm-offset-4 col-sm-4 col-xs-offset-1 col-xs-6">
<table class="table login">
<tbody>
<tr><td><h2 style="color:white;">Farmer Login</h2></td></tr>
<tr><td><input type="text" class="form-control" id="name" name="name" placeholder="User name"></td></td></tr>
<tr><td><input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password"></td></td></tr>
<!-- <tr align="center"><td><a href="javascript: submitform()" class="log">Login</a></td></tr><br> -->
<tr align="center"><td><button class="btn btn-primary" onclick="submitform()" style="width: 244px; border-radius:0px; background-color:#B6E41F" id="login">Login</button></td></tr><br>
<tr align="center"><td><a href="" onclick="fp()" class"frgt">Forgot password?</a></td></tr>
</tbody></table>
<script>
document.getElementById("pwd").addEventListener("keyup", function(event) {
	event.preventDefault();
	console.log("inside func");
	if (event.keyCode == 13) {
	    document.getElementById("login").click();
	}
	});
	document.getElementById("name").addEventListener("keyup", function(event) {
		event.preventDefault();
		console.log("inside func");
		if (event.keyCode == 13) {
		    document.getElementById("login").click();
		}
		});
	function fp()
	{
		swal("Please contact Admin for password regenaration");
	}

					function submitform() {
                            var msg = "";
                            if (document.getElementById("name").value == null || document.getElementById("name").value === undefined || document.getElementById("name").value === "") {
                                console.log(document.getElementById("name").value);
                                msg = "USER NAME ";
                            }
                            if (document.getElementById("pwd").value == null || document.getElementById("pwd").value === undefined || document.getElementById("pwd").value === "") {
                                console.log(document.getElementById("name").value);
                                msg = msg + "PASSWORD";
                            }
                            console.log(msg.length);
                            console.log(msg.length);
                        	if(msg.length!=0)
                        		window.swal("PLEASE ENTER "+msg);
                        	
                        	else{
                        	xmlhttp=new XMLHttpRequest();
                        	xmlhttp.onreadystatechange=function()
                        	{
                        		if(this.readyState==4 && this.status==200)
                        		{
                        			 var string=xmlhttp.responseText;
                        			 console.log("string is "+string);
                        		    	if(string.includes("SUCCESS"))
                        		    	{
                        		    		window.location="FarmerMaster.jsp";
                        		    	}
                        		    	else 
                        		    	{
                        		    		if(string != null && string.length!=0)
                        		    			swal(string);		
                        		    	}
                        		}		
                        	};
                        	xmlhttp.open("POST", "FarmerLogin.do", true);
                        	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        	xmlhttp.send("name="+document.getElementById("name").value+"&pwd="+document.getElementById("pwd").value);
                          }
                        }
					function myFunction(event) {
					    var x = event.which || event.keyCode;
					    if(x == 13){
					    	submitform();
					    }
					}
                    </script>
</div>
</div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<%}%>

	<!--  <div class="carousel slide" id="mycarousel" data-ride="carousel" >
	<!--dot notation -->
	<ol class="carousel-indicators" >
			<li data-target="#mycarousel" data-list-to="0"></li>
			<li data-target="#mycarousel" data-list-to="1"></li>
			<li data-target="#mycarousel" data-list-to="2" class="active"></li>

	</ol>
	<!--wrapper image -->
		<div class="carousel-inner" data-target="#mycarousel" width="1300px" >
			
			<div class="item" >
				<img src="images1/cauliflower.jpg" alt="image not found" width="1300px" >
				<div class="carousel-caption">
					
					<button type="button" class="btn btn-primary">know more</button>
				</div>
			</div>
			

			<div class="item">
				<img src="images1/beans.jpg" alt="image not found" width="1300px">
				<div class="carousel-caption">
					
					<button type="button" class="btn btn-primary">know more</button>
				</div>
			</div>
			<div class="item active">
				<img src="images1/carrots.jpg" alt="image not found" width="1300px"  >
				<div class="carousel-caption">
					
					<button type="button" class="btn btn-primary">know more</button>
				</div>
			</div>
			<a href="#mycarousel"  class="left carousel-control" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a href="#mycarousel"  class="right carousel-control" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
</body>
</html>
