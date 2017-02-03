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
	console.log("inside validateTForm()");
	var name = document.tregform.traderName;
	var aadhar = document.tregform.traderAadharnum;
	var mob = document.tregform.traderMobile;
	var email = document.tregform.traderEmail;
	var address=document.tregform.traderAddress;
	var state=document.tregform.traderState;
	var district=document.tregform.traderDistrict;
	var taluk = document.tregform.traderTaluk;
	var pin = document.tregform.traderPin;
	
	var bankname = document.tregform.traderBankName;
	var accountnum = document.tregform.traderAccountNum;
	var branch = document.tregform.traderBranch;
	var ifsc = document.tregform.traderIfscCode;
	var bstate=document.tregform.bState;
	var bdistrict=document.tregform.bDistrict;
	var btaluk=document.tregform.bTaluk;
	var bpin=document.tregform.bPin;
	var licensenumber = document.tregform.traderLicenseNum;
	var registerdate=document.tregform.traderDateOfRegistration;
	
	var placeofregistration = document.tregform.traderPlaceOfRegistration;
	var ltraderAddress=document.tregform.ltraderAddress;
	var lstate=document.tregform.traderLicenseState;
	var ldistrict=document.tregform.traderLiscenseDistrict;
	var ltaluk=document.tregform.traderLicenseTaluk;
	var lpin=document.tregform.traderLicensePin;
	var password = document.tregform.traderPassword;
	var rpassword = document.tregform.traderConfirmPassword;
	var otp=document.tregform.traderOTP;
	var tc=document.tregform.tc;
	
	var letters = /^[A-Za-z ]+$/;
	
	//Name validation
	if(name.value==""){
		alert("Please enter your name");
		name.focus();
		    return false;
	}
	
	
	if(!name.value.match(letters))
	{
		window.alert("Please enter only alphabets for name.");
		name.focus();
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
	
	
	
	//Email validation
	if(email.value==""){
		window.alert("Please enter your email id");
		email.focus();
		return false;
	}
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
	//address validation
	if(address.value==""){
		window.alert("Please enter your address");
		address.focus();
		return false;
	}
	
	/*state validation
	if(state.value==""){
		window.alert("Please enter state name");
		state.focus();
		return false;
	}
	
	
	district validation
	
	if(district.value==""){
		window.alert("Please enter district ");
		district.focus();
		return false;
	}*/
	
	//Taluk name validation
	if(taluk.value==""){
		window.alert("Please enter your taluk name");
		taluk.focus();
		return false;
	}
	if(!taluk.value.match(letters))
	{
		window.alert("Please enter only alphabets for taluk name.");
		taluk.focus();
		return false;
	}
	
	
	
	//PIN Code validation
	if(pin.value==""){
		window.alert("Please enter your pincode");
		pin.focus();
		return false;
	}
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
	
	//Bank name validation
	if(bankname.value==""){
		window.alert("Please enter your Bank name");
		bankname.focus();
		return false;
	}
	if(!bankname.value.match(letters))
	{
		window.alert("Please enter only alphabets for bank name.");
		bankname.focus();
		return false;
	}
	

	
	//Account Branch name validation
	if(branch.value==""){
		window.alert("Please enter your Branch name");
		branch.focus();
		return false;
	}
	if(!branch.value.match(letters))
	{
		window.alert("Please enter only alphabets for branch name.");
		branch.focus();
		return false;
	}
	
	//IFSC Code validation
	if(ifsc.value==""){
		window.alert("Please enter your IFSC code");
		ifsc.focus();
		return false;
	}
	
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
	/*
	//state bank validation
	
	 if( bstate.value==""){
			window.alert("Please enter statee");
			 bstate.focus();
			return false;
		}
	
	//district bank validation
	
	if( bdistrict.value==""){
		window.alert("Please enter district");
		bdistrict.focus();
		return false;
	}
	
	*/
	//taluk bank validation
	if( btaluk.value==""){
		window.alert("Please enter taluk of your bank");
		 btaluk.focus();
		return false;
	}
	
	
	// bank pinncode validation
	if(bpin.value==""){
		window.alert("Please enter your pincode");
		bpin.focus();
		return false;
	}
	var bpinval = bpin.value;
	if(/^[0-9]{6}$/.test(bpinval))
	{
		//value is ok
	}
	else
	{
		window.alert("Please enter valid PIN Code.");
		bpin.focus();
		return false;
	}
	
	//license validation
	var license=licensenumber.value;
	if(licensenumber.value==""){
		window.alert("Please enter your License number ");
		licensenumber.focus();
		return false;
	}
	
	
	
	if(isNaN(license)){
		alert("Enter the valid License Number");
		licensenumber.focus();
		return false;
	}
	// date of registraion
	
	if(registerdate.value==""){
		window.alert("Please enter date of registration");
		registerdate.focus();
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
	//license address
	
	if(ltraderAddress.value==""){
		window.alert("Please enter address");
		ltraderAddress.focus();
		return false;
	}
	/*
	//lstate validation
	
	if(lstate.value==""){
		window.alert("Please enter state");
		lstate.focus();
		return false;
	}
	//ldistrict validation
	
	if(ldistrict.value==""){
		window.alert("Please enter district");
		ldistrict.focus();
		return false;
	}
	*/
	//LTaluk Validation
	if(ltaluk.value==""){
		window.alert("Please enter taluk");
		ltaluk.focus();
		return false;
	}
	if(!ltaluk.value.match(letters))
	{
		window.alert("Please enter only alphabets for taluk.");
		ltaluk.focus();
		return false;
	}
	
	//lPIN Code validation
	if(lpin.value==""){
		window.alert("Please enter pincode");
		lpin.focus();
		return false;
	}
	
	var pinval1 =lpin.value;
	if(/^[0-9]{6}$/.test(pinval1))
	{
		//value is ok
	}
	else
	{
		window.alert("Please enter valid PIN Code.");
		lpin.focus();
		return false;
	}
	
	//Password validation
	if(password.value==""){
		window.alert("Please enter your password");
		password.focus();
		return false;
	}
	
if (/^\d{8}$/.test(password.value)) {
		
	    // value is ok, use it
	} else {
	    alert("Invalid password, must be 8 digits");
	    password.focus();
	    return false;
	}
	if(rpassword.value==""){
		window.alert("Please enter your password again");
		rpassword.focus();
		return false;
	}
	
	if(password.value != rpassword.value)
	{
		window.alert("Password does not match.")
		return false;
	}
	
	//otp validation
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
        <li ><a href="HomePage.html">About Us</a></li>
        <li><a href="Vision.html">Vision</a></li>
        <li><a href="Mission.html">Mission</a></li>
		<li><a href="Howitworks.html">How it works</a></li>
        <li><a href="News.html">News</a></li>
		<li><a href="ContactUs.html">Contact Us</a></li>
		<li class="dropdown">
          <a class="dropdown-toggle" href="Register.html" class="active">Register</a>
          
        </li>
        <li><a href="Login.html">Login</a></li>
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
	  <tr><td><input type="text" class="form-control" id="name" name="traderName" required></td></tr>
      <tr><td><label for="aadhar">Aadhar Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name = "traderAadharnum" required></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"  name = "traderMobile" required></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" id="email" placeholder="Enter email" name = "traderEmail" required></td></tr>
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" name="traderAddress" id="usr" required></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><select class="form-control" id="sel1" name="traderState" onchange = "populate('state','district')">
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
	  <label for = "district">District</label><br />
		<select id = "district" name = "traderDistrict">
		</select><br/>
	  
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
      
       <tr><td><select class="form-control" id="sel1" name="bState " onchange = "populate('state','district')">
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
     
	  <tr><td><select class="form-control" id="sel1" name="bDistrict">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><input type="text" class="form-control" id="sel1" name="bTaluk" placeholder = "Taluk" />
        </td></tr>
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
	  <tr><td><input type="date" class="form-control" id = "dateofregistration" name="traderDateOfRegistration"></td></tr>
      <tr><td><label for="mobno">Place of Registration</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr" name="traderPlaceOfRegistration"></td></tr>	  
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" name="ltraderAddress"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr" ></td></tr>
       <tr><td><select class="form-control" id="sel1" name="traderLicenseState" onchange = "populate('state','district')"> 
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
	  <tr><td><select class="form-control" id="sel1" name="traderLiscenseDistrict">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><input type="text" class="form-control" id="sel1" name="traderLicenseTaluk" placeholder = "Taluk" />
        </td></tr>
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
	  <tr><td><input type="password" class="form-control" id="pwd" name="traderConfirmPassword"></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
<tr><td><input type="password" class="form-control" id="pwd" name="traderOTP"></td></tr>	  

    </table>
  
  </div>
  </div>
  <table align="center">
  <tr><td><label><input type="checkbox" name="tc">I accept Terms and Condition</label></td></tr>
  <table align="center"><tr><td><a href="javascript: submitform()" class="reg" >Register</a></td></tr></table>
  </table>
</div>
</div>
</div>
 </form>
<!---my detail form end----->
<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b>
<% if(msg != null && msg.equals("SUCCESS"))
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
	var bool = validateTForm();
	console.log("Bool: "+bool);
	console.log()
	if(bool == true)
	{
		document.tregform.submit();
	}
}
</script>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>


 


</body>

</html>