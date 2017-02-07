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
<script type="text/javascript" src="http://gc.kis.v2.scr.kaspersky-labs.com/FD9ECA30-3AD0-9445-B7F7-37B6DC12D43A/main.js" charset="UTF-8"></script>
<style>
#myclass1
{
	margin-right: 5px;
	float: left;
	box-shadow: 0px 0px 2px black;
}
#class1
{
	float:right;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button 
 { 
  -webkit-appearance: none; 
  margin: 0; 
}
</style>
</head>
<body class="">
<%if(request.getAttribute("errmsg")!=null && (request.getAttribute("errmsg").equals("FAIL")))
{    
	 out.println("<script type=\"text/javascript\">");
	 out.println("alert('THIS AADHARNUMBER HAS ALREADY BEEN REGISTERED');");
     out.println("</script>");
}
else
{
	if(request.getAttribute("errmsg")!=null && (request.getAttribute("errmsg").equals("success")))
	{    
		 out.println("<script type=\"text/javascript\">");
		 out.println("alert('YOU HAVE SUCCESSFULLY REGISTERED');");
    	 out.println("</script>");
	}%>
<!---menu bar------>
 <nav class="navbar navbar-inverse menu">
  <div class="container-fluid">
    <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                       
      </button>
      <a class="navbar-brand" href="#"><img src="images/logo.jpg" class="img-responsive"></a>
    </div>    
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="HomePage.html">About Us</a></li>
        <li><a href="Vission.html">Vision</a></li>
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
<h4>Welcome to NeoMandi's farmer registration page</h4>
</div>
<!---my detail form----->
<div class="container">
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 det">
<div id="h1">
<h4>My Details</h4>
<div class="detail">
<form id="bank" method="get" action="FarmerRegisterInt.jsp">
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" onclick="fun()" placeholder="Name" name="farmername" id="name" required></td></tr>
	  <script>
	  function fun(){
		  $("#h1").css("box-shadow","0px 0px 14px black");
		  $("#h2").css("box-shadow","0px 0px 0px black");
		  $("#h3").css("box-shadow","0px 0px 0px black");
	  }</script>
      <tr><td><label for="number">Aadhar Number</label></td></tr>
	  <tr><td><input type="number" class="form-control" min="0" onclick="fun()" placeholder="Aadharnumber" name="farmeraadharnum" id="aadharnumber" required></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
	  <tr><td><input type="number" class="form-control" min="0" onclick="fun()" placeholder="Mobile Number" name="farmermobile" id="mob" required></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" onclick="fun()" placeholder="Email-Id" id="email" name="farmeremail" placeholder="Enter email" required></td></tr>
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control"  onclick="fun()" id="usr" required></td></tr>
      <tr><td><input type="text" class="form-control"  onclick="fun()" id="usr"></td></tr>
<<<<<<< HEAD
      <tr><td><select class="form-control" id="s1" name="farmerState" onclick="fun()" onchange = "populate('state','district')">
        	<option>State</option>
       		<option value = "Andhra Pradesh">Andhra Pradesh</option>
=======
      <tr><td><select class="form-control" id="state1" name="farmerState" onclick="fun()" onchange = "populate1('state1','district1')">
        <option>State</option>
        <option value = "Andhra Pradesh">Andhra Pradesh</option>
>>>>>>> branch 'master' of https://github.com/Neomandi/Proto.git
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
<<<<<<< HEAD
		<select id = "d1" name = "traderDistrict" onclick="fun()">
	    </select><br/>	  
=======
		<select id = "district1" name = "traderDistrict" onclick="fun()">
		</select><br/>	  
>>>>>>> branch 'master' of https://github.com/Neomandi/Proto.git
	  <tr><td>
	  <input type = "text" id = "sell" name = "farmerTaluk" class="form-control" placeholder = "Taluk" onclick="fun()" required/><br/>
      </td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="number" onclick="fun()" min="0" class="form-control" placeholder="Pin" id="pin" required></td></tr>
    </table>
  </form>
  </div>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bank"  >
<div id="h2">
<h4 >My Bank Account Details</h4>
<div class="bankacc">
<form id="bank" method="get" action="FarmerRegisterInt.jsp">
    <table class="table">
      <tr><td><label for="name">Account Number</label></td></tr>
	  <tr><td><input type="number" min="0" class="form-control" placeholder="account number" onclick="fun1()" name="farmeraccountnum" id="acc" required></td></tr>
      <script>
	  function fun1(){		  
		  $("#h2").css("box-shadow","0px 0px 14px black");
		  $("#h1").css("box-shadow","0px 0px 0px black");
		  $("#h3").css("box-shadow","0px 0px 0px black");
	  }</script>
      <tr><td><label for="aadhar">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" onclick="fun1()" placeholder="Bank name" name="farmerbankname" id="farmerbank" required></td></tr>
      <tr><td><label for="mobno">Branch</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="branch" onclick="fun1()" placeholder="Branch name" name="farmerbranch" required></td></tr>	  
      <tr><td><label for="address">IFSC</label></td></tr>
      <tr><td><input type="number" class="form-control" id="ifsc" onclick="fun1()" placeholder="Bank IFSC" name="farmerifsc" required></td></tr>
      <tr><td><select class="form-control" id="s2" name="farmerState" onclick="fun1()" onchange = "populate('state','district')">
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
			<option value = "Jammu & Kashmir">Jammu And Kashmir</option>
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
		<select id = "d2" name = "traderDistrict" onclick="fun1()">
		</select><br/>	  
	  <tr><td>
	  <input type = "text" id = "sell" name = "farmerTaluk" class="form-control" placeholder = "Taluk" onclick="fun1()" required/><br/>
    </td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="number" class="form-control" onclick="fun1()" placeholder="Pin" id="usr" required></td></tr>
    </table>
  </form>
  </div>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<table><tr><td> <img src="images/farmerori.png" class="img-responsive" alt="Cinque Terre" width="304" height="236"></td></tr></table>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pass" id="class">
<div id="h3">
<h4>My Bank Account Details</h4>
<div class="password">
<form>
    <table class="table">	 
      <tr><td><label for="pwd">Enter a Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" onclick="fun2()" placeholder="" id="pwd" required></td></tr>
      <tr><td><label for="pwd">Confirm Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" onclick="fun2()" placeholder="" id="cpwd" required></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
	  <tr><td><input type="number" class="form-control" onclick="fun2()" placeholder="" id="pwd"></td></tr>	  
    </table>
    <script>
	  function fun2(){		  
		  $("#h2").css("box-shadow","0px 0px 0px black");
		  $("#h1").css("box-shadow","0px 0px 0px black");
		  $("#h3").css("box-shadow","0px 0px 14px black");
	  }</script>
  </form>
  </div>
  </div>  
  <table align="center">
  <tr><td><label><input type="checkbox" id="terms" >I accept Terms and Condition</label></td></tr>
  <table align="center"><tr><td><a onclick="register()" id="reg" class="reg">Register</a></td></tr></table>
  <script>
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
  
  function register()
  {	  	  
	    var msg="";
	    var regex=/^[a-zA-Z]+$/;
        if(document.getElementById("name").value==null|| document.getElementById("name").value === undefined || document.getElementById("name").value === "")
        {
        	console.log(document.getElementById("name").value.match(regex));
        	msg="NAME";
        }
        else
        {
        	/*console.log(document.getElementById("name").value);
        	//console.log(document.getElementById("name").value.match(regex));
	       	if(!(document.getElementById("name").value.match(regex)))
	    	{
	    		window.alert("DONT ENTER NUMBERS FOR NAME");
	    	//	document.getElementById("name").focus();
	    		return false;
	    	}	*/
        }
        if(document.getElementById("aadharnumber").value==null|| document.getElementById("aadharnumber").value === undefined || document.getElementById("aadharnumber").value === "")
        {
        	msg=msg+" AADHARNUMBER";
        }
        else
        	{
        		console.log(document.getElementById("aadharnumber").value+"+");
	        	if (/^\d{12}$/.test(document.getElementById("aadharnumber").value)) {
	    		}
	        	else
	        	{
	    		    alert("AADHARNUMBER NUMBER MUST BE 12 DIGITS");
	    		    return false
	    		}
        	}
        if(document.getElementById("mob").value==null|| document.getElementById("mob").value === undefined || document.getElementById("mob").value === "")
        {
        	//window.alert("ENTER MOBILE");
        	msg=msg+" MOBILE";
        }
        else
        	{
        	console.log("mob is defined"+document.getElementById("mob").length+" "+document.getElementById("mob").value);
        	if (/^\d{10}$/.test(document.getElementById("mob").value)) {
    		    // value is ok, use it
    		} else {
    			
    		    alert("MOBILE NUMBER MUST BE 10 DIGITS");
    		  //  document.getElementById("mob").focus();
    		    return false
    		}
        	}
        if(document.getElementById("email").value==null|| document.getElementById("email").value === undefined || document.getElementById("email").value === "")
        {      
        	msg=msg+" EMAIL-ID ";
        }
        else
        {
        	console.log("email is defined");
        	if(document.getElementById("email").value.indexOf("@", 0) < 0)        		
        	{
        			window.alert("ENTER VALID EMAIL ID");
        		//	document.getElementById("email").focus();
        			return false;
        	}        		
        	if (document.getElementById("email").value.indexOf(".", 0) < 0)
        	    {
        		    window.alert("ENTER VALID EMAIL ID");
        		//    document.getElementById("email").focus();
        	        return false;
        	    }
        }
        if(document.getElementById("pin").value==null|| document.getElementById("pin").value === undefined || document.getElementById("pin").value === "")
        {
        	//window.alert("ENTER PIN CODE");
        	msg=msg+" PINCODE";
        	//document.getElementById("pin").focus();
        }
        else
        	{
        		console.log("pin is defined");
        	 	if((document.getElementById("pin").value.match(regex)))
    	    	{
        	 		 window.alert("ENTER VALID PINCODE");
    	    	}
        	}
        if(document.getElementById("acc").value==null|| document.getElementById("acc").value === undefined || document.getElementById("acc").value === "")
        {
        	//window.alert("ENTER ACCOUNT NUMBER");
        	msg=msg+" ACCOUNT NUMBER";
        	//document.getElementById("acc").focus();
        }
        else
        	{
        		if((document.getElementById("acc").value.match(regex)))
	    		{    	 	
	    			window.alert("DONT ENTER ALPHABETS FOR ACCOUNT NUMBER")
	    			document.getElementById("acc").focus();
	    			return false;
	    		}
        	}
        if(document.getElementById("farmerbank").value==null|| document.getElementById("farmerbank").value === undefined || document.getElementById("farmerbank").value === "")
        {
        	//window.alert("ENTER BANK NAME");
        	console.log("bank name is"+document.getElementById("farmerbank").value);
        	msg=msg+" BANK NAME";
        }
        else
        	{
        		if(!(document.getElementById("farmerbank").value.match(regex)))
    			{ 
	    			window.alert("DONT ENTER NUMBERS FOR BANK NAME")
	    		//	document.getElementById("bank").focus();
	    			return false;
	    		}
        	}
        if(document.getElementById("branch").value==null|| document.getElementById("branch").value === undefined || document.getElementById("branch").value === "")
        {
        	//window.alert("ENTER NAME OF BRANCH");
        	msg=msg+" BRANCH NAME";
        }
        else
        	{
        		if(!(document.getElementById("branch").value.match(regex)))
				{ 
	    			window.alert("DONT ENTER NUMBERS FOR BANK BRANCH")
	    		//	document.getElementById("branch").focus();
	    			return false;
	    		}
        	}
        if(document.getElementById("ifsc").value==null|| document.getElementById("ifsc").value === undefined || document.getElementById("ifsc").value === "")
        {
        //	window.alert("ENTER BANK'S IFSC");
        	msg=msg+" IFSC";
        }
        else
        	{
        			console.log(document.getElementById("ifsc").value);
		        	//if(/^[A-Za-z]{4}0[0-9]{6}$/.test(document.getElementById("ifsc").value))
		    		{
		    			//value is ok
		    		}
		    		//else
		    		{
		    			//window.alert("ENTER ONLY NUMBERS FOR IFSC")
		    			//ifsc.focus();			
		    		}
        	}
        if(document.getElementById("pwd").value==null|| document.getElementById("pwd").value === undefined || document.getElementById("pwd").value === "")
        {
        	//window.alert("ENTER PASSWORD");
        	msg=msg+" PASSWORD";
        }
        if(document.getElementById("cpwd").value==null|| document.getElementById("cpwd").value === undefined || document.getElementById("cpwd").value === "")
        {
        	//window.alert("ENTER CONFIRM PASSWORD");
        }
        else 
        {
        	if(document.getElementById("pwd").value!=document.getElementById("cpwd").value)
        	alert("PASSWORD DOESNOT MATCH");
        }	  	
        console.log(document.getElementById("pwd").value+" "+document.getElementById("cpwd").value);
        console.log( document.getElementById("terms").checked ==true);
	  	if((document.getElementById("terms").checked==false))
  		{
	  		msg=msg+" TERMS AND CONDITION";
	  	}
        console.log(msg);
        document.getElementById("terms").focus();
        document.getElementById("name").focus();
        document.getElementById("pwd").focus();
        if(msg.length==0)
        	 document.getElementById("bank").submit();
        else
        	window.alert("PLEASE ENTER "+msg);        
	//  var name = document.bank.name;
	/*	var mob = document.bank.farmermobile;
		var aadharnum = document.bank.farmeraadharnum;
	    var email = document.bank.farmeremail;
		var taluk = document.bank.name;
		var hobli = document.bank.name;
		var village = document.bank.name;
		var bankname = document.bank.farmerbank;
		var accnum = document.bank.farmeraccountnum;
		var branch = document.bank.farmerbranch;
		var ifsc = document.bank.farmerifsc;
		//var uid = document.fregform.farmeruid;
		//var pwd = document.fregform.farmerpwd;
		var letters = /^[A-Za-z ]+$/;		
		var val = mob.value;		
		var val = aadharnum.value;
		if (/^\d{12}$/.test(val)) 
		{
		}
		else
		{
		    alert("AADHARNUMBER MUST BE 12 DIGITS");
		    document.getElementById("aadharnumber").focus();
		    return false
		}		
		if(!taluk.value.match(letters))
		{
			window.alert("DONT ENTER NUMBERS FOR TALUK")
		//	taluk.focus();
			return false;
		}		
		if(!hobli.value.match(letters))
		{
			window.alert("DONT ENTER NUMBERS FOR HOBLI")
			//hobli.focus();
			return false;
		}
		if(!village.value.match(letters))
		{
			window.alert("DONT ENTER NUMBERS FOR VILLAGE")
		//	village.focus();
			return false;
		}
		var ifscval = ifsc.value;*/	 
	  }
  </script>
  </table>
</div>
</div>
</div>
<!---my detail form end----->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script><%} %>
</body>
</html>