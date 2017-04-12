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
<link href="css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="js/sweetalert.min.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.error {
    border:2px solid red;
}
body {
    background-image: url("images/nm-white-background-pattern.png");
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
<script>
function validateEForm()
{
	var num = document.EregForm1.employeenum;
	var name = document.EregForm1.employeename;
	var pwd = document.EregForm1.employeepwd;
	var cpwd = document.EregForm1.cemployeepwd;
	var otp = document.EregForm1.employeeotp;
	var tc = document.EregForm1.empt;
	var letters = /^[A-Za-z ]+$/;
	
	//Name validation
	console.log("inside name validation");
	if(name.value==""){
		swal("Please enter your name.");
		name.focus();
		return false;
	}
	if(!isNaN(name.value)){
		swal("Your name should contain only alphtabets.");
		document.Eregform.employeename.focus();
		return false;
	}
	if ((name.value.length < 1) || (name.value.length > 20)){
		swal("Your Character must be 1 to 20 Character");
		document.Eregform.employeename.focus();
	//	name.focus();
		return false;
	}
	
	//Mobile number validation
	var val = num.value;
	if(val==""){
		swal("Please enter your Employee Number");
		 num.focus();
		    return false;
	}
	if(isNaN(val)){
		swal("Enter the valid Employee Number(Like : 12345)");
		num.focus();
		return false;
	}
	if((val.length < 1) || (val.length > 5)){
		
		swal("Your Employee Number must be of 5 digits");
		num.focus();
		return false;
	}
	var val = num.value;
	if (/^\d{5}$/.test(val)) {
		
	    // value is ok, use it
	} else {
	    swal("Invalid Employee Number, must be five digits");
	    num.focus();
	    return false;
	}
	
	//password validation
	if(pwd.value == "")
	{
		swal("Please enter your password");
		pwd.focus();
		return false;
	}
	if(cpwd.value == "")
	{
		swal("Please enter your password");
		cpwd.focus();
		return false;	
	}
	if( cpwd.value!=pwd.value){
		 swal("Passwords do not match");
		 cpwd.focus();
		    return false;
	}
	
	//OTP validation
	var otpval = otp.value;
	if(otp.value == "")
	{
		swal("Please enter your OTP");
		otp.focus();
		return false;
	}
	if(isNaN(otpval)){
		swal("Enter the valid OTP number");
		otp.focus();
		return false;
	}
	if (/^\d{6}$/.test(otpval)) {
		
	    // value is ok, use it
	} else {
	    swal("Invalid OTP number, must be six digits");
	    otp.focus();
	    return false;
	}
	
	//Terms & condn validation
	//console.log("TC: "+tc.value);
	if(tc.checked == false)
	{
		swal("Please check T & C");
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
      <a class="navbar-brand" href="#"><img src="images/trad_logo.png" class="img-responsive"></a>
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
<div class="row emp"><!-- style="box-shadow: 0 0 10px #000;" -->
<form name = "EregForm1" method = "post" action = "" autocomplete="off">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 det">
<div id="d1">
<h4 id="h1" style="background: #bdd102;color:black;">My Details</h4>
<div class="detail">
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="name" name="employeename" onclick="fun()"></td></tr>
      <tr><td><label for="aadhar">Employee Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="employeenum" onclick="fun()"></td></tr>
         </table>
  
  </div>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<div id="d2">
<h4 id="h2" style="background:#149DDA;">My Password</h4>
<div class="password" id="d2">
    <table class="table">
	 
      <tr><td><label for="pwd">Enter a Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="employeepwd" onclick="fun1()"></td></tr>
      <tr><td><label for="pwd">Confirm Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="cemployeepwd" onclick="fun1()"></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="employeeotp" onclick="fun1()"></td></tr>	  

    </table>
  
  </div>
  </div>
  <table align="center">
  <tr><td><label><input type="checkbox" name="empt">I accept Terms and Conditions</label></td></tr>
  
  </table>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<table><tr><td><img src="images/Employee.png" class="img-responsive lap" alt="Cinque Terre" width="304" height="236"></td></tr></table>
<table align="center"><tr><td><a href="javascript: submitform()" class="reg">Register</a></td></tr></table>
</div>
</form>
</div>
</div><br/><br/><br/>
<% String msg = (String)request.getAttribute("errmsg");%>
<p align = "center"><b><% if(msg != null && msg.equals("SUCCESS"))
							{
								out.print("Registration Successfull");
								out.print("<br/><a href='EmployeeLogin.jsp'>Click here to login</a>");
							}
							else if(msg != null)
							{
								out.print(msg);
							}
									%></b></p>
<script>
function submitform(){
	var bool = validateEForm();
	//console.log("Bool: "+bool);
	if(bool == true)
	{
		document.EregForm1.submit();
	}
}
function fun(){
	  //console.log("selected ");
	  $("#d1").css("box-shadow","0px 0px 10px black");
	  $("#d2").css("box-shadow","0px 0px 0px black");
}
function fun1(){
	  //console.log("selected ");
	  $("#d2").css("box-shadow","0px 0px 10px black");
	  $("#d1").css("box-shadow","0px 0px 0px black");
}
</script>
<!---my detail form end----->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
