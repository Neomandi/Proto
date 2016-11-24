<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="ISO-8859-1">
<title>Farmer Registration</title>
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
function validateFForm()
{
	var name = document.fregform.f_name;
	var mob = document.fregform.f_mob;
	var aadharnum = document.fregform.f_aadharnum;
	var email = document.fregform.f_email;
	var taluk = document.fregform.f_taluk;
	var hobli = document.fregform.f_hobli;
	var village = document.fregform.f_village;
	var bankname = document.fregform.f_bankname;
	var accnum = document.fregform.f_accountnum;
	var branch = document.fregform.f_branch;
	var ifsc = document.fregform.f_ifsc;
	var uid = document.fregform.f_uid;
	var pwd = document.fregform.f_pwd;
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
select
{
	padding: 10px 10px;
	margin: 8px 0;
}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<div id = "wrapper">
<div id = "header"></div>
<div id = "content">
<br/>
<form name = "fregform" action = "FarmerRegisterInt.jsp" method = "post" enctype='multipart/form-data' onsubmit = "return validateFForm();">
	<fieldset>
		<legend>Farmer Registration Page</legend>
		<label for = "name">Name</label><br/>
		<input type = "text" id = "name" name = "f_name" placeholder = "Name" required/><br/>
		<label for = "mob">Mobile Number</label><br/>
		<input type = "text" id = "mob" name = "f_mob" placeholder = "Phone" required/><br/>
		<label for = "anum">Aadhar Number</label><br/>
		<input type = "text" id = "anum" name = "f_aadharnum" placeholder = "Aadhar Number" required/><br/>
		<label for = "email">Email</label><br/>
		<input type = "text" id = "email" name = "f_email" placeholder = "Email" required/><br/>
		<label for = "state">State</label><br/>
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
		<label for = "taluk">Taluk</label><br/>
		<input type = "text" id = "taluk" name = "f_taluk" placeholder = "Taluk" required/><br/>
		<label for = "hobli">Hobli</label><br/>
		<input type = "text" id = "hobli" name = "f_hobli" placeholder = "Hobli" required/><br/>
		<label for = "village">Village</label><br/>
		<input type = "text" id = "village" name = "f_village" placeholder = "Village" required/><br/><br/>
		<label for = "photo">Photo</label><br/>
		<input type = "file" id = "photo" name = "browse"/>
	</fieldset>
	<br/>
	<fieldset>
		<legend>Bank Account Details</legend>
		<label for = "bankname">Bank Name</label><br/>
		<input type = "text" id = "bankname" name = "f_bankname" placeholder = "Bank Name" required/><br/>
		<label for = "accountnum">Account Number</label><br/>
		<input type = "text" id = "accountnum" name = "f_accountnum" placeholder = "Account Number" required/><br/>
		<label for = "branch">Branch</label><br/>
		<input type = "text" id = "branch" name = "f_branch" placeholder = "Branch" required/><br/>
		<label for = "ifsc">IFSC Code</label><br/>
		<input type = "text" id = "ifsc" name = "f_ifsc" placeholder = "IFSC Code" required/><br/><br/>
	</fieldset>
	<br/>
	<input type = "submit" value = "Register"/>
	<input type = "reset" value = "Reset"/>
</form>
<br/>

</div>
<div id = "footer"></div>
</div>

</body>
</html>