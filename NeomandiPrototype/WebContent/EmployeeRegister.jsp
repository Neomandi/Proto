<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
function validateEForm()
{
	
	var mob = document.EregForm1.employeemob;
	var name = document.EregForm1.employeename;
	var pwd = document.EregForm1.employeepwd;
	var cpwd = document.EregForm1.cemployeepwd;
	var otp = document.EregForm1.employeeotp;
	var tc = document.EregForm1.empt;
	var letters = /^[A-Za-z ]+$/;
	
	//Name validation
	console.log("inside name validation");
	if(name.value==""){
		alert("Please enter your name.");
		name.focus();
		return false;
	}
	if(!isNaN(name.value)){
		window.alert("Your name should contain  only alphtabets.");
		document.Eregform.employeename.focus();
		return false;
	}
	
	if ((name.value.length < 1) || (name.value.length > 20)){
		alert("Your Character must be 1 to 20 Character");
		
		document.Eregform.employeename.focus();
	//	name.focus();
		return false;
	}
	
	//Mobile number validation
	var val = mob.value;
	if(val==""){
		alert("Please enter your mobile number");
		 mob.focus();
		    return false;
	}
	if(isNaN(val)){
		alert("Enter the valid Mobile Number(Like : 9566137117)");
		mob.focus();
		return false;
	}
	if((val.length < 1) || (val.length > 10)){
		
		alert(" Your Mobile Number must be 0 to 9 Integers");
		mob.focus();
		return false;
	}
	var val = mob.value;
	if (/^\d{10}$/.test(val)) {
		
	    // value is ok, use it
	} else {
	    alert("Invalid mobile number, must be ten digits");
	    mob.focus();
	    return false;
	}
	
	//password validation
	if(pwd.value == "")
	{
		alert("Please enter your password");
		pwd.focus();
		return false;
	}
	if(cpwd.value == "")
	{
		alert("Please enter your password");
		cpwd.focus();
		return false;	
	}
	if( cpwd.value!=pwd.value){
		 alert("passwords do not match");
		 cpwd.focus();
		    return false;
	}
	
	//OTP validation
	var otpval = otp.value;
	if(otp.value == "")
	{
		alert("Please enter your OTP");
		otp.focus();
		return false;
	}
	if(isNaN(otpval)){
		alert("Enter the valid OTP number");
		otp.focus();
		return false;
	}
	if (/^\d{6}$/.test(otpval)) {
		
	    // value is ok, use it
	} else {
	    alert("Invalid OTP number, must be six digits");
	    otp.focus();
	    return false;
	}
	
	//Terms & condn validation
	console.log("TC: "+tc.value);
	if(tc.value == "")
	{
		alert("Please check T & C");
	    tc.focus();
	    return false;
	}
	return true;
}
</script> 
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
      <a class="navbar-brand" href="#"><img src="images/logo.jpg" class="img-responsive"></a>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.html">About Us</a></li>
        <li><a href="Vision.html">Vision</a></li>
        <li><a href="Mission.html">Mission</a></li>
		<li><a href="Howitworks.html">How it works</a></li>
        <li><a href="News.html">News</a></li>
		<li><a href="ContactUs.html">Contact Us</a></li>
		<li class="active" class="dropdown">
          <a class="dropdown-toggle" href="Register.html">Register</a>
          
        </li>
        <li><a href="Login.html">Login</a></li>
      </ul>
      
    </div>
  </div>
</nav> 
<!-----menu bar end------>

<div class="container  register">
<h4>Welcome to NeoMandi's Employee registration page</h4>
</div>
<!---my detail form----->
<div class="container">
<div class="row emp">
<form name = "EregForm1" method = "post" action = "EmployeeRegisterInt.jsp">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 det">
<h4>My Details</h4>
<div class="detail">
<<<<<<< HEAD
<form name = "EregForm1" method = "get" action = "EmployeeRegisterInt.jsp">
=======

>>>>>>> branch 'master' of https://github.com/Neomandi/Proto.git
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="employeename"></td></tr>
      <tr><td><label for="aadhar">Employee Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="employeemob"></td></tr>
         </table>
  
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<h4>My Password</h4>
<div class="password">
<<<<<<< HEAD
<form name = "EregForm2" method = "get" action = "EmployeeRegisterInt.jsp">
=======

>>>>>>> branch 'master' of https://github.com/Neomandi/Proto.git
    <table class="table">
	 
      <tr><td><label for="pwd">Enter a Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="employeepwd" required></td></tr>
      <tr><td><label for="pwd">Confirm Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="cemployeepwd" required></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="employeeotp" required></td></tr>	  

    </table>
  
  </div>
  <table align="center">
  <tr><td><label><input type="checkbox" name="empt">I accept Terms and Condition</label></td></tr>
  
  </table>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<table><tr><td> <img src="images/employeeori.png" class="img-responsive lap" alt="Cinque Terre" width="304" height="236"></td></tr></table>
<table align="center"><tr><td><a href="javascript: submitform()" class="reg">Register</a></td></tr></table>
</div>
</form>
</div>
</div><br/><br/><br/>
<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null && msg.equals("SUCCESS"))
							{
								out.print("Registration Successfull");
								out.print("<br/><a href='Login.html'>Click here to login</a>");
							}
							else if(msg != null)
							{
								out.print(msg);
							}
									%></b></p>
<script>
function submitform(){
	var bool = validateEForm();
	console.log("Bool: "+bool);
	console.log()
	if(bool == true)
	{
		document.EregForm1.submit();
	}
}
</script>
<!---my detail form end----->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
