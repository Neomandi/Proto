<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
<style>
.tales 
{
  width: 100%;
}
.carousel-inner
{
  width:100%;
  max-height: 319px !important;
}
/* Smaller than standard 960 (devices and browsers) */
@media only screen and (max-width: 959px) {}

/* Tablet Portrait size to standard 960 (devices and browsers) */
@media only screen and (min-width: 768px) and (max-width: 959px) {}

/* All Mobile Sizes (devices and browser) */
@media only screen and (max-width: 767px) {}

/* Mobile Landscape Size to Tablet Portrait (devices and browsers) */
@media only screen and (min-width: 480px) and (max-width: 767px) {}

/* Mobile Portrait Size to Mobile Landscape Size (devices and browsers) */
@media only screen and (max-width: 479px) {}

.container-fluid {
    padding-right: 0px !important;
    padding-left: 0px !important;
    margin-right: 0px !important;
    margin-left: 0px !important;
}
a{
	cursor:pointer;
}
.emplog {
    border: 0px;
    border-left: 30px solid #149dda;
	border-right: 30px solid #149dda;
	background: #bdd102;
	margin-top: 3%;
position: relative;
}
</style>
</head>
<body class="">
<!---menu bar------>
 <nav class="navbar navbar-inverse menu">
  <div class="container-fluid">
    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="HomePage.html"><img src="images/trad_logo.png" class="img-responsive"></a>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.jsp"><%= session.getValue("About.Us")%></a></li>
        <li><a href="Vision.jsp"><%=session.getValue("Vision") %></a></li>
        <li><a href="Mission.jsp"><%=session.getValue("Mission") %></a></li>
		<li><a href="Howitworks.jsp"><%=session.getValue("How.it.works") %></a></li>
        <li><a href="News.jsp"><%=session.getValue("News") %></a></li>
		<li><a href="ContactUs.jsp"><%=session.getValue("Contact.Us") %></a></li>
		<li class="dropdown">
          <a class="dropdown-toggle" href="Register.jsp"><%=session.getValue("Register") %></a>          
        </li>
        <li class="active"><a href="Login.jsp"><%=session.getValue("Login") %></a></li>
      </ul>      
    </div>
  </div>
</nav> 
<!-----menu bar end------>
<div class="container-fluid emplog pad">
<div class="row">
<div class="col-lg-2 col-md-3 hidden-sm hidden-xs pad loginlogo"><img src="images/trad_logo.png" class="img-responsive" alt="Cinque Terre" style="height:100%"></div>
<div class="col-lg-offset-8 col-lg-2 col-md-offset-5 col-md-3 col-sm-offset-4 col-sm-4 col-xs-offset-1 col-xs-6">
<table class="table login">
<tbody>
<tr><td><h2><%=session.getValue("trader.login.text")  %></h2></td></tr>
<tr><td><input type="text" class="form-control" id="name" name="tname" placeholder="User name"></td></td></tr>
<tr><td><input type="password" class="form-control" id="pwd" name="tpwd" placeholder="Password"></td></td></tr>
<tr align="center"><td><a onclick="fp()" class="frgt"><%=session.getValue("trader.login.passwordforgot") %> ?</a></td></tr>
<tr align="center"><td><button class="btn btn-primary" onclick="submitform()" style="width: 244px; border-radius:0px; background-color:#149DDA" id="login"><%=session.getValue("trader.login.loginbutton")  %></button></td></tr><br>
</tbody></table>
</div>
</div>
</div>
<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null)
							out.print(msg);
									%></b></p>									
<script>
var meta = document.createElement('meta');
meta.httpEquiv = "X-UA-Compatible";
meta.content = "IE=edge";
meta.charset="utf-8";
document.getElementsByTagName('head')[0].appendChild(meta);

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
	swal(    	{
        		  title:"",
	        	  text: "Please contact Admin for password regenaration",
	        	  type: "warning",
	        	  showCancelButton: false,
	        	  showConfirmButton: true,
	        	  confirmButtonColor: "green",
	        	  confirmButtonText: "Okay",
	        	  closeOnConfirm: true,
        	},
        	function(isConfirm)
        	{
        		/* console.log("inside confirm")
        		  if(isConfirm)
        		  {
        			//swal({text:"",title:"This lot has been added for auction with new quantity of  Kgs"});
        	 	  }
        		  else 
        		  { 
        			//  swal("You will auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
        		  } */
            }); 
            
		<%-- swal("<%=session.getValue("trader.forgotpassword")%>");
        swal("ಕನ್ನಡ ");
        alert("<%=session.getValue("trader.forgotpassword")%>");
        alert("ಕನ್ನಡ "); --%>
}

function submitform(){
	console.log("inside submitform")
	var msg="";
	if(document.getElementById("name").value==null|| document.getElementById("name").value === undefined || document.getElementById("name").value === "")
    {
    	console.log(document.getElementById("name").value);
    	msg="USER NAME ";
    }	
	if(document.getElementById("pwd").value==null|| document.getElementById("pwd").value === undefined || document.getElementById("pwd").value === "")
    {
    	console.log(document.getElementById("name").value);
    	msg=msg+"PASSWORD";
    }	
	console.log(msg.length);
	if(msg.length!=0)
		swal("PLEASE ENTER "+msg);	
	else
	{
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
		{
			if(this.readyState==4 && this.status==200)
			{
			 	var string=xmlhttp.responseText;
			 	console.log("string is "+string);
		    	if(string.includes("SUCCESS"))
		    	{
		    		window.location="product.jsp";
		    		
		    	}
		    	else 
		    	{
		    		swal("Username does not exist. Please register and then login");		
		    	}
			}		
		};
		xmlhttp.open("POST", "TraderLogin.do", true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("name="+document.getElementById("name").value+"&pwd="+document.getElementById("pwd").value);
  	}
}
</script>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<div class="container-fluid" style="margin-top: 0%; margin-bottom: 0%;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators 
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
      <li data-target="#myCarousel" data-slide-to="8"></li>
      <li data-target="#myCarousel" data-slide-to="9"></li>
      <li data-target="#myCarousel" data-slide-to="10"></li>
      <li data-target="#myCarousel" data-slide-to="11"></li>
      <li data-target="#myCarousel" data-slide-to="12"></li>
      <li data-target="#myCarousel" data-slide-to="13"></li>
      <li data-target="#myCarousel" data-slide-to="14"></li>
      <li data-target="#myCarousel" data-slide-to="15"></li>
      <li data-target="#myCarousel" data-slide-to="16"></li>
      <li data-target="#myCarousel" data-slide-to="17"></li>
      <li data-target="#myCarousel" data-slide-to="18"></li>
      <li data-target="#myCarousel" data-slide-to="19"></li>
      <li data-target="#myCarousel" data-slide-to="20"></li>
      <li data-target="#myCarousel" data-slide-to="21"></li>
      <li data-target="#myCarousel" data-slide-to="22"></li>         
    </ol>-->
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="Farmer/onion3.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Onion</h3>          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/tomato.jpg" alt="image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Tomato</h3>
        </div>
      </div>    
      <div class="item">
        <img src="Farmer/cucumber.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Cucumber</h3>
        </div>
      </div>

      <div class="item">
        <img src="Farmer/carrot.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Carrot</h3>
          
        </div>
      </div>
    <div class="item">
        <img src="Farmer/Apples.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Apple</h3>
          
        </div>
      </div>
        <div class="item">
        <img src="Farmer/orange.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Orange</h3>
          
        </div>
      </div>
        <div class="item">
        <img src="Farmer/mango.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Mango</h3>
          
        </div>
        
        <div class="item">
        <img src="Farmer/wheat.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Wheat</h3>
          
        </div>
      </div>
      </div>
        <div class="item">
        <img src="Farmer/arecanut.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Carrot</h3>
          
        </div>
      </div>
        <div class="item">
        <img src="Farmer/corn.jpeg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Corn</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/rose.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Rose</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/jasmine1.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Jasmine</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/marygold.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>MaryGold</h3>
          
        </div>
      </div>
       <div class="item">
        <img src="Farmer/capsicum.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Capsicum</h3>
          
        </div>
      </div>
       <div class="item">
        <img src="Farmer/coconut.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Coconut</h3>
          
        </div>
      </div>
       <div class="item">
        <img src="Farmer/wheat.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Wheat</h3>
          
        </div>
      </div>
      
      <div class="item">
        <img src="Farmer/green gram.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Green gram</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/groundnut.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Groung nut</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/chickpea.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Chick pea</h3>
          
        </div>
      </div>
       <div class="item">
        <img src="Farmer/horsegram.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Horse gram</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/pea.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3> pea</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/grapes.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Grapes</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/banana.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Banana</h3>
          
        </div>
      </div>
      <div class="item">
        <img src="Farmer/ARECANUT-C.jpg" alt="Image not found" width="100%" height="345">
        <div class="carousel-caption">
          <h3>Areca nut</h3>
          
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
 <script>
  $('.carousel').carousel({
   interval: 2000
  });
 </script> 
	
</body>
</html>
