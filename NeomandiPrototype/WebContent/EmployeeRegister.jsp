<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<title>Employee Registration</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 
$(function(){
  $("#header").load("Header.html"); 
  $("#footer").load("Footer.html");
 
});


function validateTForm()
{
	
	var mob = document.Eregform.employeemob;
	var name = document.Eregform.employeename;
	var pwd = document.Eregform.employeepwd;
	var cpwd = document.Eregform.cemployeepwd;
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
		
		alert(" Your Mobile Number must be 1 to 10 Integers");
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
	
	
	if( cpwd.value!=pwd.value){
		 alert("passwords do not match");
		 cpwd.focus();
		    return false;
	}
	
}
</script> 
<style type = "text/css">

	#password{
		
	border-left: 20px solid rgb(189,209,2);
	padding: 20px;
	margin: 10px;
	float: left;
	background-color: rgb(242,242,242);
	
	}
	#details{
		border-left: 20px solid rgb(20,157,218);
	padding: 20px;
	margin: 10px;
	float: left;
	background-color: rgb(242,242,242);
	
	}
	h2{
	color: white;
}
p{
	font-size: 24px;
}
input[type=submit]
{
	color: white;
	background-color: rgb(20,157,218);
	width: 80px;
	height: 30px;
}
input[type=reset]
{
	color: white;
	background-color: rgb(20,157,218);
	width: 80px;
	height: 30px;
}
#head{
	color:#00008B; 
}
	
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<div id = "wrapper">
<div id = "header"></div>

<div id = "content">
<br/>
<center><p id="head"><b><i>Welcome to NeoMandi's Employee registration page</i></b></p></center>
<form name = "Eregform" action = "EmployeeRegisterInt.jsp" method = "post" onsubmit = "return validateTForm();">
<div id="details" >	
		<div style="background-color: rgb(191,191,191); text-align: center;"><h2>My Details</h2></div>
		<label for = "name">Name</label><br />
		<input type = "text" id = "name" name = "employeename" placeholder = "Name" required/><br/><br/>
		<label for = "mob">Mobile Number</label><br />
		<input type = "text" id = "mob" name = "employeemob" placeholder = "Mobile Number" required/><br/><br/>
</div>
	<br/>



<div id="password">
	
		 <div style="background-color: rgb(191,191,191); text-align: center;"><h2>My Password</h2></div>
		<label for = "pwd">Enter Password</label><br />
		<input type = "password" id = "pwd" name = "employeepwd" placeholder = "Password" required/><br/><br/>
		<label for = "cpwd">Confirm Password</label><br />
		<input type = "password" id = "cpwd" name = "cemployeepwd" placeholder = " Retype Password" required/><br/><br/><br/>
		<label for = "otp">Enter OTP</label><br />
		<input type = "text" id = "otp" name = "empOTP" placeholder = "OTP" required/><br/><br/>
		<input type = "checkbox" name="v" value="Terms and Condtions" required>I accept Terms and Conditions<br/><br/>
		
</div>&nbsp;&nbsp;
	<img src="Images/emp.jpg" >&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "submit" name = "submit" value = "Register">&nbsp;&nbsp;
		<input type = "reset" value = "Reset"/>

	</form>
	<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null)
							out.print(msg);
						%></b></p>
</div>

</div>
<div id = "footer"></div>

</body>
</html>