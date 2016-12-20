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
function populate(s1, s2)
{
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "Karnataka")
	{
		var optionArray = ["|", "bagalkot|Bagalkot", "bengaluru Urban|Bengaluru Urban", "bengaluru Rural|Bengaluru Rural", "belagavi|Belagavi", "bellary|Bellary", "bidar|Bidar", "chamarajanagar|Chamarajanagar", "chikballapur|Chikballapur", "chikkamagaluru|Chikkamagaluru", "chitradurga|Chitradurga", "dakshina Kannada|Dakshina Kannada", "davanagere|Davanagere", "dharwad|Dharwad", "gadag|Gadag", "kalaburagi|Kalaburagi", "hassan|Hassan", "haveri|Haveri", "kodagu|Kodagu", "kolar|Kolar", "koppal|Koppal", "mandya|Mandya", "mysuru|Mysuru", "raichur|Raichur", "ramanagara|Ramanagara", "shivamogga|Shivamogga", "tumakuru|Tumakuru", "udupi|Udupi", "uttara Kannada|Uttara Kannada", "vijayapura|Vijayapura", "yadgir|Yadgir"];	
	}
	for(var option in optionArray)
	{
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}
function validateTForm()
{
	var name = document.tregform.employeename;
	var mob = document.tregform.employeemob;
	var aadharnum = document.tregform.employeeaadharnum;
	var email = document.tregform.employeeemail;
	var uid = document.tregform.employeeuid;
	var pwd = doucment.tregform.employeepwd;
	var letters = /^[A-Za-z ]+$/;
	
	//Name validation
	if(!name.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		name.focus();
		return false;
	}
	
	//Mobile number validation
	var val = mob.value;
	if (/^\d{10}$/.test(val)) {
	    // value is ok, use it
	} else {
	    alert("Invalid mobile number, must be ten digits");
	    mob.focus();
	    return false
	}
	
	//Aadhar number validation
	var val = aadharnum.value;
	if (/^\d{12}$/.test(val)) {
	    // value is ok, use it
	} else {
	    alert("Invalid aadhar number, must be twelve digits");
	    aadharnum.focus();
	    return false
	}
	
	//Email validation
	if(email.value.indexOf("@", 0) < 0)
	{
		window.alert("Please enter a valid email id");
		email.focus();
		return false;
	}
	if (email.value.indexOf(".", 0) < 0)
    {
        window.alert("Please enter a valid e-mail address.");
        email.focus();
        return false;
    }
}
</script> 
<style type = "text/css">
fieldset
{
	text-align: left;
	vertical-align:middle;
}
legend 
{
 	font-size: 1.4em;
 	margin-bottom: 10px;
}
form 
{
      max-width: 300px;
	  margin: 10px auto;
	  padding: 10px 20px;
	  background: rgb(30,115,119);
	  border-radius: 8px;
}
label
{
	font-size: 20px;
}
input[type=text]
{
	padding: 10px 10px;
	margin: 8px 0;
}
input[type=submit]
{
	color: blue;
	padding: 12px 20px;
}
input[type=submit]:hover 
{
    background-color: lightblue;
}
input[type=reset]
{
	color: blue;
	padding: 12px 20px;
}
input[type=reset]:hover
{
	background-color: lightblue;
}
input[type=password]
{
	padding: 12px 20px;
	margin: 8px 0;
}
select
{
	padding: 10px 10px;
	margin: 8px 0;
}
button
{
	color: blue;
	padding: 12px 20px;
}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<div id = "wrapper">
<div id = "header"></div>
<div id = "content">
<br/>
<form name = "Eregform" action = "EmployeeRegisterInt.jsp" method = "post" onsubmit = "return validateTForm();">
	<div style = "align-content: center;">
	<fieldset>
		<legend>Employee Registration Page</legend>
		<label for = "name">Name</label><br />
		<input type = "text" id = "name" name = "employeename" placeholder = "Name" required/><br/>
		<label for = "mob">Mobile Number</label><br />
		<input type = "text" id = "mob" name = "employeemob" placeholder = "Mobile Number" required/><br/>
		<label for = "anum">Aadhar Number</label><br />
		<input type = "text" id = "anum" name = "employeeaadharnum" placeholder = "Aadhar Number" required/><br/>
		<label for = "email">Email</label><br />
		<input type = "text" id = "email" name = "employeeemail" placeholder = "Email" required/><br/>
		<label for = "state">State</label><br />
		<select id = "state" name = "employeestate" onchange = "populate('state','district')">
			<option value = ""></option>
			<option value = "Andhra Pradesh">Andhra Pradesh</option>
			<option value = "Arunachal Pradesh">Arunachal Pradesh</option>
			<option value = "Assam">Assam</option>
			<option value = "Bihar">Bihar</option>
			<option value = "Chhattisgarh">Chhattisgarh</option>
			<option value = "Goa">Goa</option>
			<option value = "Gujarat">Gujarat</option>
			<option value = "Haryana">Haryana</option>
			<option value = "Himachal Pradesh">Himachal Pradesh</option>
			<option value = "Jammu & Kashmir">Jammu & Kashmir</option>
			<option value = "Jharkhand">Jharkhand</option>
			<option value = "Karnataka">Karnataka</option>
			<option value = "Kerala">Kerala</option>
			<option value = "Madhya Pradesh">Madhya Pradesh</option>
			<option value = "Maharashtra">Maharashtra</option>
			<option value = "Manipur">Manipur</option>
			<option value = "Meghalaya">Meghalaya</option>
			<option value = "Mizoram">Mizoram</option>
			<option value = "Nagaland">Nagaland</option>
			<option value = "Odisha">Odisha</option>
			<option value = "Punjab">Punjab</option>
			<option value = "Rajasthan">Rajasthan</option>
			<option value = "Sikkim">Sikkim</option>
			<option value = "Tamil Nadu">Tamil Nadu</option>
			<option value = "Telangana">Telangana</option>
			<option value = "Tripura">Tripura</option>
			<option value = "Uttar Pradesh">Uttar Pradesh</option>
			<option value = "Uttarakhand">Uttarakhand</option>
			<option value = "West Bengal">West Bengal</option>
		</select><br/>
		<label for = "district">District</label><br />
		<select id = "district" name = "employeedistrict">
		</select><br/>
	</fieldset>
	<br/>
	<fieldset>
		<legend>User ID</legend>
		<label for = "uid">Preferred User ID</label><br />
		<input type = "text" id = "uid" name = "employeeuid" placeholder = "User ID" required/><br/>
		<label for = "password">Password</label><br />
		<input type = "password" id = "password" name = "employeepwd" placeholder = "Password" required/><br/><br/>
	</fieldset>
	</div>
	<br />
	<input type = "submit" value = "Register"/>&nbsp &nbsp
	<input type = "reset" value = "Reset"/>
</form>
<br/>

<!--  <form action = "EmployeeLogin.html" name = "f2">
<p>Already Registered? Click here to login.</p><br/>
<input type = "submit" value = "Login"/>
</form> -->

<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null)
							out.print(msg);
									%></b></p>
</div>
<div id = "footer"></div>
</div>
</body>
</html>