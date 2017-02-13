<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Farmer Register</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script> 
$(function(){
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
</script>
<style type = "text/css">
submit
{
position:absolute;
bottom:0;
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
select
{
	padding: 10px 10px;
	margin: 8px 0;
}
.active {
    border: 1px solid black;
    color: brown;
    background-color: white;
    bottom: -3px;    
    border-bottom: 2px solid white;   
}
div 
{
    background-color: #EBEBEB;
    width: 300px;
    border-left: 25px solid  #07C1DE;
    border-top: 30px  solid silver;
    padding: 51px;
    margin: 5px;
}
fieldset
{
	text-align: left;
}
legend
{
	text-align: center;
}
</style>
<header style = "position: absolute; top: 0; left: 0; width: 100%;">
<nav>
	<ul>
		<li><img alt="Can't display" src="Images/Neomandi1.png" width = "40" height = "43"></li>
		<li><a href = "HomePage.html">About Us</a></li>
		<li><a href = "Vision.html">Vision</a></li>
		<li><a href = "Mission.html">Mission</a></li>
		<li class = "dropdown">
			<a href = "Howitworks.html" class = "dropbtn">How it works</a>
			<div class = "dropdown-content">
				<a href = "NeomandiFarmer.html">How Neomandi Works For A Farmer?</a>
				<a href = "NeomandiTrader.html">How Neomandi Works For A Trader?</a>
			</div>
		</li>
		<li><a href = "News.html">News</a></li>
		<li><a href = "ContactUs.html">Contact Us</a></li>
		<li><a class = "active" href = "Register.html">Register</a></li>
		<li><a href = "Login.html">Login</a></li>
	</ul>
</nav>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<h2 align="center">Welcome to NeoMandi's farmer registration page</h2>
<form name = "fregform" action = "FarmerRegister.do" enctype='multipart/form-data' method = "post"  onsubmit = "return validateFForm();">
	<div style="position:absolute; left:80px; top:110px; width:235px; height:680px;  padding: 51px; ">
	<fieldset>
		<legend>My Details</legend>
		<label for = "name">Name</label><br/>
		<input type = "text" id = "name" name = "farmerName" placeholder = "Name" required/><br/>
		<label for = "mob">Mobile Number</label><br/>
		<input type = "number" id = "mob" min=0 maxlength="10" size="10" name = "farmerMobile" placeholder = "Phone" required/><br/>
		<label for = "anum">Aadhar Number</label><br/>
		<input type = "number" id = "anum" min=0 maxlength="12" size="12" name = "farmerAadharnum" placeholder = "Aadhar Number" required/><br/>
		<label for = "email">E-mail ID</label><br/>
		<input type = "text" id = "email" name = "farmerEmail" placeholder = "Email" required/><br/>
		<label for = "address">Address</label><br/>
		<input type="text">
		<input type="text"><br/>
			<select id = "state" name = "farmerState" placeholder = "State" onchange = "populate('state','district')">
			<option value="" disabled selected>State</option>
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
		<select id = "district" name = "farmerDistrict">
		</select><br/>
		<label for = "taluk">Taluk</label><br/>
		<input type = "text" id = "taluk" name = "farmerTaluk" placeholder = "Taluk" required/><br/>
		<label for = "Pin">Pin</label><br/>
		<input type = "text" id = "pin" name = "farmerPin" placeholder = "Pin" required/><br/>
		<label for = "photo">Photo</label><br/>
		<input type = "file" id = "photo" name = "farmerPhoto"/> <!-- use (enctype='multipart/form-data') for photo in form -->
	</fieldset>
	</div>
	<br/>
	<div style="position:absolute; left:690px; top:110px; width:190px; border-left: 30px  solid  #07DA17;">
	<fieldset>
		<legend>Bank Account Details</legend>
		<label for = "bankname">Bank Name</label><br/>
		<input type = "text" id = "bankname" name = "farmerBankName" placeholder = "Bank Name" required/><br/>
		<label for = "accountnum">Account Number</label><br/>
		<input type = "number" id = "accountnum" name = "farmerAccountNum" placeholder = "Account Number" required/><br/>
		<label for = "branch">Branch</label><br/>
		<input type = "text" id = "branch" name = "farmerBranch" placeholder = "Branch" required/><br/>
		<label for = "ifsc">IFSC Code</label><br/>
		<input type = "number" id = "ifsc" name = "farmerIfscCode" placeholder = "IFSC Code" required/><br/><br/>
	</fieldset>
	</div>
	<div style="position:absolute; left:690px; top:610px; width:190px; border-left: 30px  solid  #07DA17;">
	<fieldset>
		<legend>My Password</legend>
		<label for = "branch">Enter a Password</label><br/>
		<input type = "text" id = "branch" name = "farmerBranch" required/><br/>
		<label for = "ifsc">Confirm a Password</label><br/>
		<input type = "text" id = "ifsc" name = "farmerIfscCode" required/><br/><br/>
	</fieldset>	
	<br/><br/><br/><br>
	<input type = "submit" value = "Register" />
	<input type = "reset" value = "Reset"/></div>
</form>
</body>
</html>