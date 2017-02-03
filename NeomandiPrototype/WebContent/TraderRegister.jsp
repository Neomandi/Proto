<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="Images/Neomandi1.png">

<title>Trader Registration</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script> 


function register(){
	document.getElementById("personal").submit();
	
}
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
	console.log("inside validateTForm()");
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
        <li class="active"><a href="#">About Us</a></li>
        <li><a href="#">Vision</a></li>
        <li><a href="#">Mission</a></li>
		<li><a href="#">How it works</a></li>
        <li><a href="#">News</a></li>
		<li><a href="#">Contact Us</a></li>
		<li class="dropdown">
          <a class="dropdown-toggle" href="registermain.html">Register</a>
          
        </li>
        <li><a href="login.html">Login</a></li>
      </ul>
      
    </div>
  </div>
</nav> 
<!-----menu bar end------>

<div class="container  register">
<h4>Welcome to NeoMandi's Trader registration page</h4>
</div>
<!---my detail form----->
<form id="personal" method="post" action="TraderRegisterInt.jsp" name="tregform"   >
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 det">
<h4>My Details</h4>
<div class="detail">

    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderName" required></td></tr>
      <tr><td><label for="aadhar">Aadhar Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name = "traderAadharnum" required></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"  name = "traderMobile" required></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" id="email" placeholder="Enter email" name = "traderEmail" required></td></tr>
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" name="traderAddress" id="usr" required></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><select class="form-control" id="sel1" name="traderState">
        <option>State</option>
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
      </select></td></tr>
      <!-- id = "district" -->
	  <tr><td>
	  		<select class="form-control" id="sel1" name="traderDistrict">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select>
		
	  <tr><td>
	  		<input type = "text" id = "sell" name = "traderTaluk" class="form-control" placeholder = "Taluk" required/><br/>
        
    </td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderPin"></td></tr>
    </table>
 
  </div>
</div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 bank">
<h4>My Bank Account Details</h4>
<div class="bankacc">

    <table class="table">
      <tr><td><label for="name">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderAccountNum"></td></tr>
      <tr><td><label for="aadhar">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderBankName"></td></tr>
      <tr><td><label for="mobno">Branch</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr" name="traderBranch"></td></tr>	  

      <tr><td><label for="address">IFSC</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderIfscCode"></td></tr>
      
       <tr><td><select class="form-control" id="sel1" name="bState ">
        <option>State</option>
        <option>TamilNadu</option>
        <option>Karnataka</option>
        <option>Andhra Pradesh</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1" name="bDistrict">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1" name="bTaluk">
        <option>Taluk</option>
        <option>ottanchadiram taluk</option>
        <option>palani taluk</option>
        <option>Vadamadurai taluk</option>
      </select></td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="bPin"></td></tr>
    </table>
  
  </div>
</div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 pass">
<h4>My License Details</h4>
<div class="detail1">

    <table class="table">
      <tr><td><label for="name">Trader License Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderLicenseNum"></td></tr>
      <tr><td><label for="aadhar">Date of Registration</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderDateOfRegistration"></td></tr>
      <tr><td><label for="mobno">Place of Registration</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr" name="traderPlaceOfRegistration"></td></tr>	  
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="ltraderAddress"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr" ></td></tr>
       <tr><td><select class="form-control" id="sel1" name="traderLicenseState"> 
        <option>State</option>
        <option>TamilNadu</option>
        <option>Karnataka</option>
        <option>Andhra Pradesh</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1" name="traderLiscenseDistrict">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1" name="traderLicenseTaluk">
        <option>Taluk</option>
        <option>ottanchadiram taluk</option>
        <option>palani taluk</option>
        <option>Vadamadurai taluk</option>
      </select></td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="traderLicensePin"></td></tr>
    </table>
  
  </div>
</div>
<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
<table><tr><td> <img src="images/traderori.png" class="img-responsive trad" alt="Cinque Terre" ></td></tr></table>
<div class="pass1">
<h4>My Password</h4>
<div class="password">
   <table class="table">
	 <tr><td><label for="pwd">Enter a Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd" name="traderPassword"></td></tr>
      <tr><td><label for="pwd">Confirm Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd"></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
<tr><td><input type="password" class="form-control" id="pwd"></td></tr>	  

    </table>
  
  </div>
  </div>
  <table align="center">
  <tr><td><label><input type="checkbox">I accept Terms and Condition</label></td></tr>
  <table align="center"><tr><td><a href="#" class="reg" onclick="register()">Register</a></td></tr></table>
  </table>
</div>
</div>
</div>
 </form>
<!---my detail form end----->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/owl.carousel.min.js" type="text/javascript"></script>

 


</body>

</html>