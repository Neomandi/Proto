<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
function populate1(s1, s2)
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
	var name = document.tregform.traderName;
	var mob = document.tregform.traderMobile;
	var aadhar = document.tregform.traderAadharnum;
	var email = document.tregform.traderEmail;
	var taluk = document.tregform.traderTaluk;
	var hobli = document.tregform.traderHobli;
	var village = document.tregform.traderVillage;
	var pin = document.tregform.traderPin;
	var bankname = document.tregform.traderBankName;
	var accountnum = document.tregform.traderAccountNum;
	var branch = document.tregform.traderBranch;
	var ifsc = document.tregform.traderIfscCode;
	var licensenumber = document.tregform.traderLicenseNum;
	var traderlpin = document.tregform.traderLicensePin;
	var placeofregistration = document.tregform.traderPlaceOfRegistration;
	var password = document.tregform.traderPassword;
	var rpassword = document.tregform.traderConfirmPassword;
	var ltaluk=document.tregform.traderLicenseTaluk;
	var lpin=document.tregform.traderLicensePin;
	var letters = /^[A-Za-z ]+$/;
	
	//Name validation
	if(!name.value.match(letters))
	{
		window.alert("Please enter only alphabets for name.");
		name.focus();
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
	
	//Aadhar number validation
	var aval = aadhar.value;
	if(aval==""){
		alert("Please enter your Aadhar number");
		aadhar.focus();
		    return false;
	}
	if(isNaN(aval)){
		alert("Enter the valid Aadhar Number");
		aadhar.focus();
		return false;
	}
	if(aval.length!=12){
		
		alert(" Your Aadhar number must be 12 digits");
		aadhar.focus();
		return false;
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
		window.alert("Please enter only alphabets for taluk name.");
		taluk.focus();
		return false;
	}
	
	//Hobli name validation
	if(!hobli.value.match(letters))
	{
		window.alert("Please enter only alphabets for hobli name.");
		hobli.focus();
		return false;
	}
	
	//Village name validation
	if(!village.value.match(letters))
	{
		window.alert("Please enter only alphabets for village name.");
		village.focus();
		return false;
	}
	
	//PIN Code validation
	var pinval = pin.value;
	if(/^[0-9]{6}$/.test(pinval))
	{
		//value is ok
	}
	else
	{
		window.alert("Please enter valid PIN Code.");
		pin.focus();
		return false;
	}
	
	//Bank name validation
	if(!bankname.value.match(letters))
	{
		window.alert("Please enter only alphabets for bank name.");
		bankname.focus();
		return false;
	}
	
	//accountnumber validation
	var acc = accountnum.value;
	if(acc==""){
		alert("Please enter your Account number");
		accountnum.focus();
		    return false;
	}
	if(isNaN(acc)){
		alert("Enter the valid Account Number");
		accountnum.focus();
		return false;
	}
	if(acc.length!=12){
		
		alert(" Your Account number must be 12 digits");
		accountnum.focus();
		return false;
	}
	
	//Account Branch name validation
	if(!branch.value.match(letters))
	{
		window.alert("Please enter only alphabets for branch name.");
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
		window.alert("Please enter valid IFSC Code.");
		ifsc.focus();
		return false;
	}
	
	//license validation
	var license=licensenumber.value;
	if(isNaN(license)){
		alert("Enter the valid License Number");
		licensenumber.focus();
		return false;
	}
	
	//place of registration
	var placereg=placeofregistration.value;
	if(!placeofregistration.value.match(letters))
	{
		window.alert("Please enter only alphabets for place of registration.");
		placeofregistration.focus();
		return false;
	}
	
	//LTaluk Validation
	if(!ltaluk.value.match(letters))
	{
		window.alert("Please enter only alphabets for taluk.");
		ltaluk.focus();
		return false;
	}
	
	//PIN Code validation
	var pinval1 = traderlpin.value;
	if(/^[0-9]{6}$/.test(pinval1))
	{
		//value is ok
	}
	else
	{
		window.alert("Please enter valid PIN Code.");
		traderlpin.focus();
		return false;
	}
	
	//Password validation
	if(password.value != rpassword.value)
	{
		window.alert("Password does not match.")
		return false;
	}
	return true;
}
</script> 
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<style>
#div1{
	border-left: 20px solid rgb(20,157,218);
	padding: 20px;
	margin: 10px;
	float: left;
	background-color: rgb(242,242,242);
}
#div2{
	border-left: 20px solid rgb(20,157,218);
	padding: 20px;
	margin: 10px;
	float: left;
	background-color: rgb(242,242,242);
}
#div3{
	border-left: 20px solid rgb(189,209,2);
	padding: 20px;
	margin: 10px;
	float: left;
	background-color: rgb(242,242,242);
}
#div5{
	border-left: 20px solid rgb(189,209,2);
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
</style>
<body>
<div id = "wrapper">
<div id = "header"></div>
<div id = "content">
<br/>
<center><p><b><i>Welcome to NeoMandi's Trader registration page</i></b></p></center>
<form name = "tregform" action = "TraderRegister.do" method = "post" enctype = 'multipart/form-data' onsubmit = "return validateTForm();">
	<div id = "div1">
		<div id = "b1">
		<div style="background-color: rgb(191,191,191); text-align: center;"><h2>My Details</h2></div>
		<label for = "name">Name</label><br />
		<input type = "text" id = "name" name = "traderName" placeholder = "Name" required/><br/>
		<label for = "mob">Mobile Number</label><br />
		<input type = "text" id = "mob" name = "traderMobile" placeholder = "Mobile Number" required/><br/>
		<label for = "anum">Aadhar Number</label><br />
		<input type = "text" id = "anum" name = "traderAadharnum" placeholder = "Aadhar Number" required/><br/>
		<label for = "email">Email</label><br />
		<input type = "text" id = "email" name = "traderEmail" placeholder = "Email" required/><br/>
		<label for = "state">State</label><br />
		<select id = "state" name = "traderState" onchange = "populate('state','district')">
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
		<select id = "district" name = "traderDistrict">
		</select><br/>
		<label for = "taluk">Taluk</label><br />
		<input type = "text" id = "taluk" name = "traderTaluk" placeholder = "Taluk" required/><br/>
		<label for = "hobli">Hobli</label><br />
		<input type = "text" id = "hobli" name = "traderHobli" placeholder = "Hobli" required/><br/>
		<label for = "village">Village</label><br />
		<input type = "text" id = "village" name = "traderVillage" placeholder = "Village" required/><br/>
		<label for = "photo">Photo</label><br/>
		<input type = "file" id = "photo" name = "traderPhoto"/><br/> <!-- Use (enctype = 'multipart/form-data') in form -->
		<label for = "pin">PIN</label><br />
		<input type = "text" id = "pin" name = "traderPin" placeholder = "PIN" required/>
		</div>
	</div>
	<div id = "div2">
		<div style="background-color: rgb(191,191,191); text-align: center;"><h2>My Bank Account Details</h2></div>
		<label for = "bankname">Bank Name</label><br />
		<input type = "text" id = "bankname" name = "traderBankName" placeholder = "Bank Name" required/><br/>
		<label for = "accountnum">Account Number</label><br />
		<input type = "text" id = "accountnum" name = "traderAccountNum" placeholder = "Account Number" required/><br/>
		<label for = "branch">Branch</label><br />
		<input type = "text" id = "branch" name = "traderBranch" placeholder = "Branch" required/><br/>
		<label for = "ifsc">IFSC Code</label><br />
		<input type = "text" id = "ifsc" name = "traderIfscCode" placeholder = "IFSC Code" required/><br/>
	</div>
	<div id = "div3">
		<div style="background-color: rgb(191,191,191); text-align: center;"><h2>My License Details</h2></div>
		<label for = "licensenumber">Trader License Number</label><br />
		<input type = "text" id = "licensenumber" name = "traderLicenseNum" placeholder = "License Number" required/><br/>
		<label for = "dateofregistration">Date of Registration</label><br />
		<input type = "date" id = "dateofregistration" name = "traderDateOfRegistration" required/><br/>
		<label for = "placeofregistration">Place of Registration</label><br />
		<input type = "text" id = "placeofregistration" name = "traderPlaceOfRegistration" placeholder = "Place Of Registration" required/><br/>
		<label for = "address">Address</label><br />
		<input type = "text" id = "address" name = "traderAddress" placeholder = "Address" required/><br/>
		<label for = "state">State</label><br />
		<select id = "lstate" name = "traderLicenseState" onchange = "populate1('lstate','ldistrict')">
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
		<select id = "ldistrict" name = "traderLiscenseDistrict">
		</select><br/>
		<label for = "taluk">Taluk</label><br />
		<input type = "text" id = "ltaluk" name = "traderLicenseTaluk" placeholder = "Taluk" required/><br/>
		<label for = "pin">PIN</label><br />
		<input type = "text" id = "lpin" name = "traderLicensePin" placeholder = "PIN" required/><br/>
	</div>
	<br/><div id = "div4"><img src = "Images/TraderPic.png" alt = "can't display"/></div>
	<div id = "div5">
		<div style="background-color: rgb(191,191,191); text-align: center;"><h2>My Password</h2></div>
		<label for = "password">Enter a Password</label><br />
		<input type = "password" id = "password" name = "traderPassword" placeholder = "Password" required/><br/>
		<label for = "confirmpassword">Confirm Password</label><br />
		<input type = "password" id = "confirmpassword" name = "traderConfirmPassword" placeholder = "Confirm Password" required/><br/>
		<label for = "otp">Enter OTP</label><br />
		<input type = "text" id = "otp" name = "traderOTP" placeholder = "OTP" required/><br/><br/>
		<input type = "checkbox" name="vehicle" value="Terms and Condtions" required>I accept Terms and Conditions<br><br/>
		<input type = "submit" name = "submit" value = "Register">
	</div>
</form>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</div>
<div id = "footer"></div>
</div>
</body>
</html>