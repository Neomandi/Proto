<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<title>Trader Registration</title>
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
	var name = document.tregform.t_name;
	var mob = document.tregform.t_mob;
	var aadharnum = document.tregform.t_aadharnum;
	var email = document.tregform.t_email;
	var taluk = document.tregform.t_taluk;
	var hobli = document.tregform.t_hobli;
	var village = document.tregform.t_village;
	var bankname = document.tregform.t_bankname;
	var accnum = document.tregform.t_accountnum;
	var branch = document.tregform.t_branch;
	var ifsc = document.tregform.t_ifsc;
	var uid = document.tregform.t_uid;
	var license = document.tregform.t_licensenum;
	var pwd = doucment.tregform.t_pwd;
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
	
	//Taluk name validation
	if(!taluk.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		taluk.focus();
		return false;
	}
	
	//Hobli name validation
	if(!hobli.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		hobli.focus();
		return false;
	}
	
	//Village name validation
	if(!village.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		village.focus();
		return false;
	}
	
	//Bank name validation
	if(!bankname.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		bankname.focus();
		return false;
	}
	
	//Account Branch name validation
	if(!branch.value.match(letters))
	{
		window.alert("Please enter only alphtabets.")
		branch.focus();
		return false;
	}
	
	//IFSC Code validation
	var ifscval = ifsc.value;
	if(/^[A-Za-z]{4}0[0-9]{6}$/.test(ifscval))
	{
		//value is ok
	}
	else
	{
		window.alert("Please enter valid IFSC Code.")
		ifsc.focus();
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
<form name = "tregform" action = "tregister" method = "post" enctype='multipart/form-data' onsubmit = "return validateTForm();" >
	<div style = "align-content: center;">
	<fieldset>
		<legend>Trader Registration Page</legend>
		<label for = "name">Name</label><br />
		<input type = "text" id = "name" name = "t_name" placeholder = "Name" required/><br/>
		<label for = "mob">Mobile Number</label><br />
		<input type = "text" id = "mob" name = "t_mob" placeholder = "Mobile Number" required/><br/>
		<label for = "anum">Aadhar Number</label><br />
		<input type = "text" id = "anum" name = "t_aadharnum" placeholder = "Aadhar Number" required/><br/>
		<label for = "email">Email</label><br />
		<input type = "text" id = "email" name = "t_email" placeholder = "Email" required/><br/>
		<label for = "state">State</label><br />
		<select id = "state" name = "state" onchange = "populate('state','district')">
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
		<select id = "district" name = "district">
		</select><br/>
		<label for = "taluk">Taluk</label><br />
		<input type = "text" id = "taluk" name = "t_taluk" placeholder = "Taluk" required/><br/>
		<label for = "hobli">Hobli</label><br />
		<input type = "text" id = "hobli" name = "t_hobli" placeholder = "Hobli" required/><br/>
		<label for = "village">Village</label><br />
		<input type = "text" id = "village" name = "t_village" placeholder = "Village" required/><br/><br/>
		<label for = "photo">Photo</label><br/>
		<input type = "file" id = "photo" name = "browse"/>
	</fieldset>
	<br/>
	<fieldset>
		<legend>Bank Account Details</legend>
		<label for = "bankname">Bank Name</label><br />
		<input type = "text" id = "bankname" name = "t_bankname" placeholder = "Bank Name" required/><br/>
		<label for = "accountnum">Account Number</label><br />
		<input type = "text" id = "accountnum" name = "t_accountnum" placeholder = "Account Number" required/><br/>
		<label for = "branch">Branch</label><br />
		<input type = "text" id = "branch" name = "t_branch" placeholder = "Branch" required/><br/>
		<label for = "ifsc">IFSC Code</label><br />
		<input type = "text" id = "ifsc" name = "t_ifsc" placeholder = "IFSC Code" required/><br/><br/>
	</fieldset>
	<br/>
	<fieldset>
		<legend>User ID</legend>
		<label for = "uid">Preferred User ID</label><br />
		<input type = "text" id = "uid" name = "t_uid" placeholder = "User ID" required/><br/>
		<label for = "licensenum">License Number</label><br />
		<input type = "text" id = "licensenum" name = "t_licensenum" placeholder = "License Number" required/><br/>
		<label for = "password">Password</label><br />
		<input type = "password" id = "password" name = "t_pwd" placeholder = "Password" required/><br/><br/>
	</fieldset>
	</div>
	<br />
	<input type = "submit" value = "Register"/>
	<input type = "reset" value = "Reset"/>
</form>
<br/>

</div>
<div id = "footer"></div>
</div>
</body>
</html>