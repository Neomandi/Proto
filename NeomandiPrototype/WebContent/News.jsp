<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="Images1/Neomandi1.png">
<title>News | NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
 html {
            position: relative;
            min-height: 100%;
        }
        
        .body {
            margin: 0 0 100px;
            /* bottom = footer height */
            padding: 25px;
        }
        
        #footer {
			width: 100%;
			height: auto;
			left: 0;
			position: absolute;
			bottom: 0;	
        }
        @media only screen and (min-width: 700px) {
        #header{
        	position: absolute;
            left: 0;
            top: 0;
            height: 100px;
            width: 100%;
            overflow: hidden;
        }
        }
        @media only screen and (max-width: 577px) and (max-height: 1300px) {
        #header{
        	/*position: absolute;
            left: 0;
            top: 0;
            height: 100px;
            width: 100%;
            overflow: hidden;*/
        }
        }
        p,a 
        {
            font-family: Arial, Helvetica, sans-serif;
            line-height: 200%;
        }
</style>
</head>

<body class="">
<!---menu bar------>

<div id="header">
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
        <li><a href="HomePage.jsp"><%=session.getValue("About.Us") %></a></li>
        <li><a href="Vision.jsp"><%=session.getValue("Vision") %></a></li>
        <li><a href="Mission.jsp"><%=session.getValue("Mission") %></a></li>
		<li><a href="Howitworks.jsp"><%=session.getValue("How.it.works") %></a></li>
        <li class="active"><a href="News.jsp"><%=session.getValue("News") %></a></li>
		<li><a href="ContactUs.jsp"><%=session.getValue("Contact.Us") %></a></li>
		<li class="dropdown">
          <a class="dropdown-toggle" href="Register.jsp"><%=session.getValue("Register") %></a>
          
        </li>
        <li><a href="Login.jsp"><%=session.getValue("Login") %></a></li>
      </ul>
      
    </div>
  </div>
</nav> 
</div>
<!-----menu bar end------>
<br/><br/>
<div class="container-fluid body">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h1><%=session.getValue("News") %></h1><br/>
            <p>
            <%=session.getValue("news.p1") %>
            </p><br/>
            <p align="justify">
                <%=session.getValue("news.p2") %>
            </p>

            <h3><%=session.getValue("news.h3") %></h3>

            <p align="justify">
            	<%=session.getValue("news.p3") %>
            </p>

            <h3><%=session.getValue("news.h31") %></h3>

            <p align="justify">
            	<%=session.getValue("news.p4") %>
            </p>
	<div class="col-md-1"></div>
	</div>
</div>
</div>

<div id="footer">
<nav class="navbar navbar-inverse menu">
	    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myfNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                         
      </button>
    </div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myfNavbar">
		<ul class="nav navbar-nav">
						<li><a title = "Follow us on twitter" href = "https://twitter.com/Neomanditech" target="_blank"><img src = "Images1/Twitter-icon.png" alt = "Can't display" width = "30" height = "30"></a></li>
			<li><a title = "Follow Us on Youtube" href = "https://youtu.be/224nj8EdAPE" target="_blank"><img src = "Images1/Youtube-icon.png" alt = "Can't display" width = "30" height = "30"></a></li>
			<li><a title = "Follow Us on Linkedin" href = "https://www.linkedin.com/company/neomandi-technologies-pvt.-ltd.?report%2Esuccess=KJ_KkFGTDCfMt-A7wV3Fn9Yvgwr02Kd6AZHGx4bQCDiP6-2rfP2oxyVoEQiPrcAQ7Bf" target="_blank"><img src = "Images1/Linkedin-icon.png" alt = "Can't display" width = "30" height = "30"></a></li>
		</ul>
	</div>
</nav>
</div>

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>

</body>
</html>