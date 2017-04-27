<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="Images1/Neomandi1.png">
<title>NeoMandi</title>
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
      <a class="navbar-brand" href="HomePage.jsp"><img src="images/trad_logo.png" class="img-responsive"></a>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.jsp"><%=session.getValue("About.Us") %></a></li>
        <li><a href="Vision.jsp"><%=session.getValue("Vision") %></a></li>
        <li><a href="Mission.jsp"><%=session.getValue("Mission") %></a></li>
		<li><a href="Howitworks.jsp"><%=session.getValue("How.it.works") %></a></li>
<%--         <li><a href="News.jsp"><%=session.getValue("News") %></a></li> --%>
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

<!---my detail form----->
<div class="container">
	<div class="row login">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			<div class="am">
			<img src="images/Farmer.png" class="img-responsive">
			<br><br>
			<div class="text-center"><a href="FarmerLogin.jsp" class="logbtn"><%=session.getValue("register.farmer") %></a></div><br>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			<div class="am">
			<img src="images/Trader.png" class="img-responsive">
			<br><br>
			<div class="text-center"><a href="TraderLogin.jsp" class="logbtn"><%=session.getValue("register.trader") %></a></div><br>
			</div>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			<div class="am">
			<img src="images/Employee.png" class="img-responsive">
			<br><br>
			<div class="text-center"><a href="EmployeeLogin.jsp" class="logbtn"><%=session.getValue("register.employee") %></a></div><br>
			</div>
		</div>
	</div>
</div>
<!---my detail form end----->

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
