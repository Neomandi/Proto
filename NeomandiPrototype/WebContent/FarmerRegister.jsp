<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeoMandi</title>
    <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
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
    <script type="text/javascript" src="http://gc.kis.v2.scr.kaspersky-labs.com/FD9ECA30-3AD0-9445-B7F7-37B6DC12D43A/main.js" charset="UTF-8"></script>
    <style>
        #myclass1 {
            margin-right: 5px;
            float: left;
            box-shadow: 0px 0px 2px black;
        }
        
        #class1 {
            float: right;
        }
        
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .error {
    border:2px solid red;
}
		body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat: no-repeat;
		    background-size: cover;
		}
    </style>
</head>

<body class="">
 
        <!---menu bar------>
        <nav class="navbar navbar-inverse menu">
            <div class="container-fluid">
                <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="images/trad_logo.png" class="img-responsive"></a>
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
         <form id="bank" method="get" action="FarmerRegisterInt.jsp" name="fregform" autocomplete="off">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 det">
                    <div id="h1">
                        <h4 style="background: #bdd102;color:black;">My Details</h4>
                        <div class="detail">
                           
                                <table class="table">
                                    <tr>
                                        <td>
                                            <label for="name">Name</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" onclick="fun()" placeholder="Name" name="farmername" id="name" required>
                                        </td>
                                    </tr>
                                    <script>
                                        function fun() {
                                            $("#h1").css("box-shadow", "0px 0px 14px black");
                                            $("#h2").css("box-shadow", "0px 0px 0px black");
                                            $("#h3").css("box-shadow", "0px 0px 0px black");
                                        }
                                    </script>
                                    <tr>
                                        <td>
                                            <label for="number">Aadhar Number</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="number" class="form-control" min="0" onclick="fun()" placeholder="Aadharnumber" name="farmeraadharnum" id="aadharnumber" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="mobno">Mobile Number</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="number" class="form-control" min="0" onclick="fun()" placeholder="Mobile Number" name="farmermobile" id="mob" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email">Email:</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="email" class="form-control" onclick="fun()" placeholder="Email-Id" id="email" name="farmeremail" placeholder="Enter email" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="address">Address</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" onclick="fun()" id="usr"  name="address" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" onclick="fun()" id="usr">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select class="form-control" id="state1" name="farmerstate" onclick="fun()" onchange="populate1('state1','district1')">
                                                <option>State</option>
                                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                                <option value="Assam">Assam</option>
                                                <option value="Bihar">Bihar</option>
                                                <option value="Chhattisgarh">Chhattisgarh</option>
                                                <option value="Goa">Goa</option>
                                                <option value="Gujarat">Gujarat</option>
                                                <option value="Haryana">Haryana</option>
                                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                <option value="Jammu & Kashmir">Jammu & Kashmir</option>
                                                <option value="Jharkhand">Jharkhand</option>
                                                <option value="Karnataka">Karnataka</option>
                                                <option value="Kerala">Kerala</option>
                                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                                <option value="Maharashtra">Maharashtra</option>
                                                <option value="Manipur">Manipur</option>
                                                <option value="Meghalaya">Meghalaya</option>
                                                <option value="Mizoram">Mizoram</option>
                                                <option value="Nagaland">Nagaland</option>
                                                <option value="Odisha">Odisha</option>
                                                <option value="Punjab">Punjab</option>
                                                <option value="Rajasthan">Rajasthan</option>
                                                <option value="Sikkim">Sikkim</option>
                                                <option value="Tamil Nadu">Tamil Nadu</option>
                                                <option value="Telangana">Telangana</option>
                                                <option value="Tripura">Tripura</option>
                                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                <option value="Uttarakhand">Uttarakhand</option>
                                                <option value="West Bengal">West Bengal</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <!-- id = "district" -->
                                    <tr>
                                        <td>
                                            <label for="district">District</label>
                                            <br />
                                            <select class="form-control" id="district1" name="farmerdistrict" onclick="fun()">
                                            </select>
                                            <br/>
                                            <tr>
                                                <td><label for="district">Taluk</label>
                                                    <input type="text" id="sell" name="farmertaluk" class="form-control" placeholder="Taluk" onclick="fun()" required/>
                                                    <br/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="pin">Pin</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="number" onclick="fun()" min="0" class="form-control" placeholder="Pin" id="pin" name="pin" required>
                                                </td>
                                            </tr>
                                </table>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bank">
                    <div id="h2">
                        <h4 style="background: #bdd102;color:black;">My Bank Account Details</h4>
                        <div class="bankacc">

                                <table class="table">
                                    <tr>
                                        <td>
                                            <label for="name">Account Number</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="number" min="0" class="form-control" placeholder="account number" onclick="fun1()" name="farmeraccountnum" id="acc" required>
                                        </td>
                                    </tr>
                                    <script>
                                        function fun1() {
                                            $("#h2").css("box-shadow", "0px 0px 14px black");
                                            $("#h1").css("box-shadow", "0px 0px 0px black");
                                            $("#h3").css("box-shadow", "0px 0px 0px black");
                                        }
                                    </script>
                                    <tr>
                                        <td>
                                            <label for="aadhar">Bank Name</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" onclick="fun1()" placeholder="Bank name" name="farmerbankname" id="farmerbank" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="mobno">Branch</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" id="branch" onclick="fun1()" placeholder="Branch name" name="farmerbranch" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="address">IFSC</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="text" class="form-control" id="ifsc" onclick="fun1()" placeholder="Bank IFSC" name="farmerifsccode" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select class="form-control" id="state" name="state" onclick="fun1()" onchange="populate('state','district')">
                                                <option>State</option>
                                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                                <option value="Assam">Assam</option>
                                                <option value="Bihar">Bihar</option>
                                                <option value="Chhattisgarh">Chhattisgarh</option>
                                                <option value="Goa">Goa</option>
                                                <option value="Gujarat">Gujarat</option>
                                                <option value="Haryana">Haryana</option>
                                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                <option value="Jammu & Kashmir">Jammu And Kashmir</option>
                                                <option value="Jharkhand">Jharkhand</option>
                                                <option value="Karnataka">Karnataka</option>
                                                <option value="Kerala">Kerala</option>
                                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                                <option value="Maharashtra">Maharashtra</option>
                                                <option value="Manipur">Manipur</option>
                                                <option value="Meghalaya">Meghalaya</option>
                                                <option value="Mizoram">Mizoram</option>
                                                <option value="Nagaland">Nagaland</option>
                                                <option value="Odisha">Odisha</option>
                                                <option value="Punjab">Punjab</option>
                                                <option value="Rajasthan">Rajasthan</option>
                                                <option value="Sikkim">Sikkim</option>
                                                <option value="Tamil Nadu">Tamil Nadu</option>
                                                <option value="Telangana">Telangana</option>
                                                <option value="Tripura">Tripura</option>
                                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                <option value="Uttarakhand">Uttarakhand</option>
                                                <option value="West Bengal">West Bengal</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <!-- id = "district" -->
                                    <tr>
                                        <td>
                                            <label for="district">District</label>
                                            <br />
                                            <select class="form-control" id="district" name="district" onclick="fun1()">
                                            </select>
                                            <br/>
                                            <tr>
                                                <td>
                                                    <input type="text" id="sell" name="bTaluk" class="form-control" placeholder="Taluk" onclick="fun1()" required/>
                                                    <br/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="pin">Pin</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="number" class="form-control" onclick="fun1()" placeholder="pincode" id="usr"  name="bpin" required>
                                                </td>
                                            </tr>
                                </table>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
                    <table>
                        <tr>
                            <td> <img src="images/farmerori.png" class="img-responsive" alt="Cinque Terre" width="304" height="236"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pass" id="class">
                    <div id="h3">
                        <h4 style="background:#149DDA;">My Password</h4>
                        <div class="password">
                           
                                <table class="table">
                                    <tr>
                                        <td>
                                            <label for="pwd">Enter a Password</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="password" class="form-control" onclick="fun2()" placeholder="" id="pwd" name="password" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd">Confirm Password</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="password" class="form-control" onclick="fun2()" placeholder="" id="cpwd" name="cpassword" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd">Enter OTP</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="number" class="form-control" onclick="fun2()" placeholder="" id="pwd" name="otpval">
                                        </td>
                                    </tr>
                                </table>
                                <script>
                                    function fun2() {
                                        $("#h2").css("box-shadow", "0px 0px 0px black");
                                        $("#h1").css("box-shadow", "0px 0px 0px black");
                                        $("#h3").css("box-shadow", "0px 0px 14px black");
                                    }
                                </script>
                            
                        </div>
                    </div>
                    <table align="center">
                        <tr>
                            <td>
                                <label>
                                    <input type="checkbox" id="terms" name="tc">I accept Terms and Condition</label>
                            </td>
                        </tr>
                        <table align="center">
                            <tr>
                                <td><a href="javascript:submitform()" id="reg" class="reg">Register</a></td>
                            </tr>
                        </table>
                       
                       
                    </table>
                </div>
            </div>
        </div>
        </form>
         <script>
                            function populate1(s1, s2) {
                                var s1 = document.getElementById(s1);
                                var s2 = document.getElementById(s2);
                                s2.innerHTML = "";
                                if (s1.value == "Karnataka") {
                                    var optionArray = ["|", "bagalkot|Bagalkot", "bengaluru Urban|Bengaluru Urban", "bengaluru Rural|Bengaluru Rural", "belagavi|Belagavi", "bellary|Bellary", "bidar|Bidar", "chamarajanagar|Chamarajanagar", "chikballapur|Chikballapur", "chikkamagaluru|Chikkamagaluru", "chitradurga|Chitradurga", "dakshina Kannada|Dakshina Kannada", "davanagere|Davanagere", "dharwad|Dharwad", "gadag|Gadag", "kalaburagi|Kalaburagi", "hassan|Hassan", "haveri|Haveri", "kodagu|Kodagu", "kolar|Kolar", "koppal|Koppal", "mandya|Mandya", "mysuru|Mysuru", "raichur|Raichur", "ramanagara|Ramanagara", "shivamogga|Shivamogga", "tumakuru|Tumakuru", "udupi|Udupi", "uttara Kannada|Uttara Kannada", "vijayapura|Vijayapura", "yadgir|Yadgir"];
                                }
                                for (var option in optionArray) {
                                    var pair = optionArray[option].split("|");
                                    var newOption = document.createElement("option");
                                    newOption.value = pair[0];
                                    newOption.innerHTML = pair[1];
                                    s2.options.add(newOption);
                                }
                            }
                            function populate(s1, s2) {
                                var s1 = document.getElementById(s1);
                                var s2 = document.getElementById(s2);
                                s2.innerHTML = "";
                                if (s1.value == "Karnataka") {
                                    var optionArray = ["|", "bagalkot|Bagalkot", "bengaluru Urban|Bengaluru Urban", "bengaluru Rural|Bengaluru Rural", "belagavi|Belagavi", "bellary|Bellary", "bidar|Bidar", "chamarajanagar|Chamarajanagar", "chikballapur|Chikballapur", "chikkamagaluru|Chikkamagaluru", "chitradurga|Chitradurga", "dakshina Kannada|Dakshina Kannada", "davanagere|Davanagere", "dharwad|Dharwad", "gadag|Gadag", "kalaburagi|Kalaburagi", "hassan|Hassan", "haveri|Haveri", "kodagu|Kodagu", "kolar|Kolar", "koppal|Koppal", "mandya|Mandya", "mysuru|Mysuru", "raichur|Raichur", "ramanagara|Ramanagara", "shivamogga|Shivamogga", "tumakuru|Tumakuru", "udupi|Udupi", "uttara Kannada|Uttara Kannada", "vijayapura|Vijayapura", "yadgir|Yadgir"];
                                }
                                for (var option in optionArray) {
                                    var pair = optionArray[option].split("|");
                                    var newOption = document.createElement("option");
                                    newOption.value = pair[0];
                                    newOption.innerHTML = pair[1];
                                    s2.options.add(newOption);
                                }
                            }
//Input validation-------------------------------------------------------------

							function submitform(){
									var bool = validateForm();
									console.log("Bool: "+bool);
									console.log()
									if(bool == true)
										{
											document.fregform.submit();
										}
								}
                            function validateForm() {
                            	console.log("inside the register()");
                            	var letters = /^[A-Za-z ]+$/;
                            	//name validation
                            	 
                                var name=document.fregform.farmername;
                                
                                if (name.value=="" ) {
                                 
                                    swal("Please enter your name");
                                    document.getElementById("name").classname='error';
                                    name.focus();
                                    return false;
                                   
                                } 
                                if(!name.value.match(letters))
                            	{
                            		swal("Please enter only alphabets for name.");
                            		name.focus();
                            		return false;
                            	}
                              //Aadhar number validation
                              var aadhar=document.fregform.farmeraadharnum;
                            	var aval = aadhar.value;
                            	if(aval==""){
                            		swal("Please enter your Aadhar number");
                            		aadhar.focus();
                            		    return false;
                            	}
                            	if(isNaN(aval)){
                            		swal("Enter the valid Aadhar Number");
                            		aadhar.focus();
                            		return false;
                            	}
                            	if(aval.length!=12){
                            		
                            		swal(" Your Aadhar number must be 12 digits");
                            		aadhar.focus();
                            		return false;
                            	}
                            	//Mobile number validation
                            	var mob=document.fregform.farmermobile;
                            	var val = mob.value;
                            	if(val==""){
                            		swal("Please enter your mobile number");
                            		 mob.focus();
                            		    return false;
                            	}
                            	if(isNaN(val)){
                            		swal("Enter the valid Mobile Number(Like : 9566137117)");
                            		mob.focus();
                            		return false;
                            	}
                            	
                            	var val = mob.value;
                            	if (/^\d{10}$/.test(val)) {
                            		
                            	    // value is ok, use it
                            	} else {
                            	    swal("Invalid mobile number, must be ten digits");
                            	    mob.focus();
                            	    return false;
                            	}
                            	

                            	//Email validation
                            	var email=document.fregform.farmeremail;
                            	if(email.value==""){
                            		swal("Please enter your email id");
                            		email.focus();
                            		return false;
                            	}
                            	if(email.value.indexOf("@", 0) < 0)
                            	{
                            		swal("Please enter a valid email id");
                            		email.focus();
                            		return false;
                            	}
                            	if (email.value.indexOf(".", 0) < 0)
                                {
                                    swal("Please enter a valid e-mail address.");
                                    email.focus();
                                    return false;
                                }
                            	
                            	//address validation
                            	var address=document.fregform.address;
                            	if(address.value==""){
                            		swal("Please enter your address.");
                            		address.focus();
                            		return false;
                            	}
                            	
                            	
                            	//Taluk name validation
                            	var taluk=document.fregform.farmertaluk;
                            	
                            	if(taluk.value==""){
                            		swal("Please enter your taluk name.");
                            		taluk.focus();
                            		return false;
                            	}
                            	if(!taluk.value.match(letters))
                            	{
                            		swal("Please enter only alphabets for taluk name.");
                            		taluk.focus();
                            		return false;
                            	}
                            	//PIN Code validation
                            	var pin=document.fregform.pin;
                            	if(pin.value==""){
                            		swal("Please enter your pincode.");
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
                            		swal("Please enter valid PIN Code.");
                            		pin.focus();
                            		return false;
                            	}
                            	//accountnumber validation
                            	var farmeraccountnum=document.fregform.farmeraccountnum;
                            	var acc = farmeraccountnum.value;
                            	if(acc==""){
                            		swal("Please enter your Account number.");
                            		farmeraccountnum.focus();
                            		    return false;
                            	}
                            	if(isNaN(acc)){
                            		swal("Enter the valid Account Number.");
                            		farmeraccountnum.focus();
                            		return false;
                            	}
                            	if(acc.length!=12){
                            		
                            		swal(" Your Account number must be 12 digits.");
                            		farmeraccountnum.focus();
                            		return false;
                            	}
                            	//Bank name validation
                            	var bankname=document.fregform.farmerbankname;
                            	if(bankname.value==""){
                            		swal("Please enter your Bank name.");
                            		bankname.focus();
                            		return false;
                            	}
                            	if(!bankname.value.match(letters))
                            	{
                            		swal("Please enter only alphabets for bank name.");
                            		bankname.focus();
                            		return false;
                            	}

                            	//Account Branch name validation
                            	var branch=document.fregform.farmerbranch;
                            	if(branch.value==""){
                            		swal("Please enter your Branch name.");
                            		branch.focus();
                            		return false;
                            	}
                            	if(!branch.value.match(letters))
                            	{
                            		swal("Please enter only alphabets for branch name.");
                            		branch.focus();
                            		return false;
                            	}
                            	//IFSC Code validation
                            	var ifsc=document.fregform.farmerifsccode;
                            	if(ifsc.value==""){
                            		swal("Please enter your IFSC code");
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
                            		swal("Please enter valid IFSC Code.");
                            		ifsc.focus();
                            		return false;
                            	}
                            	// bank taluk validation
                            	var btaluk=document.fregform.bTaluk;
                            	if( btaluk.value==""){
                            		swal("Please enter taluk of your bank");
                            		 btaluk.focus();
                            		return false;
                            	}
                            	
                            	// bank pinncode validation
                            	var bpin=document.fregform.bpin;
                            	if(bpin.value==""){
                            		swal("Please enter your pincode");
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
                            		swal("Please enter valid PIN Code.");
                            		bpin.focus();
                            		return false;
                            	}
                            	//Password validation
                            	var password=document.fregform.password;
                            	if(password.value==""){
                            		swal("Please enter your password");
                            		password.focus();
                            		return false;
                            	}
                            	
                           
                            var cpassword=document.fregform.cpassword;
                            if(cpassword.value==""){
                        		swal("Please enter your password again");
                        		cpassword.focus();
                        		return false;
                        	}
                        	
                        	if(password.value != cpassword.value)
                        	{
                        		swal("Password does not match.")
                        		return false;
                        	}
                        	//otp validation
                        	var otp=document.fregform.otpval;
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
                        	var tc=document.fregform.tc;
                        	if(tc.checked == false)
                        	{
                        		swal("Please check T & C");
                        	    tc.focus();
                        	    return false;
                        	}
                        	return true;
                       }
                        </script>
        <!---my detail form end----->
        <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
       <% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b>
<% if(msg != null && msg.equals("success"))
	{
		out.print("Registration Successfull");
		out.print("<br/><a href='Login.html'>Click here to login</a>");
	}
	else if(msg != null)
	{
		out.print(msg);
	}
%></b></p>
</body>
</html>