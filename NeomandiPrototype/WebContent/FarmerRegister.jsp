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
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="http://gc.kis.v2.scr.kaspersky-labs.com/FD9ECA30-3AD0-9445-B7F7-37B6DC12D43A/main.js" charset="UTF-8"></script></head>

<body class="">
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
		<li class="dropdown" class="active">
          <a class="dropdown-toggle" href="registermain.html">Register</a>          
        </li>
        <li><a href="login.html">Login</a></li>
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
<h4>My Details</h4>
<div class="detail">
<form id="personal" method="post" action="FarmerRegisterInt.jsp">
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" name="farmername" id="usr"></td></tr>
      <tr><td><label for="aadhar">Aadhar Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" name="farmeraadharnumber" id="usr"></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" name="farmermobilenumber" id="usr"></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" id="email" name="farmeremail" placeholder="Enter email"></td></tr>
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><select class="form-control" id="sel1">
        <option>State</option>
        <option>TamilNadu</option>
        <option>Karnataka</option>
        <option>Andhra Pradesh</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1">
        <option>Taluk</option>
        <option>ottanchadiram taluk</option>
        <option>palani taluk</option>
        <option>Vadamadurai taluk</option>
      </select></td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
    </table>
  </form>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bank">
<h4>My Bank Account Details</h4>
<div class="bankacc">
<form id="bank" method="post" action="FarmerRegisterInt.jsp">
    <table class="table">
      <tr><td><label for="name">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">Branch</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>	  

      <tr><td><label for="address">IFSC</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><select class="form-control" id="sel1">
        <option>State</option>
        <option>TamilNadu</option>
        <option>Karnataka</option>
        <option>Andhra Pradesh</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1">
        <option>District</option>
        <option>Dindigul</option>
        <option>Chennai</option>
        <option>Madurai</option>
      </select></td></tr>
	  <tr><td><select class="form-control" id="sel1">
        <option>Taluk</option>
        <option>ottanchadiram taluk</option>
        <option>palani taluk</option>
        <option>Vadamadurai taluk</option>
      </select></td></tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
    </table>
  </form>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<table><tr><td> <img src="images/farmerori.png" class="img-responsive" alt="Cinque Terre" width="304" height="236"></td></tr></table>
</div>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pass">
<h4>My Bank Account Details</h4>
<div class="password">
<form>
    <table class="table">
	 
      <tr><td><label for="pwd">Enter a Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd"></td></tr>
      <tr><td><label for="pwd">Confirm Password</label></td></tr>
	  <tr><td><input type="password" class="form-control" id="pwd"></td></tr>
      <tr><td><label for="pwd">Enter OTP</label></td></tr>
<tr><td><input type="password" class="form-control" id="pwd"></td></tr>	  

    </table>
  </form>
  </div>
  
  <table align="center">
  <tr><td><label><input type="checkbox">I accept Terms and Condition</label></td></tr>
  <table align="center"><tr><td><a onclick="register()" class="reg">Register</a></td></tr></table>
  <script>
  function register(){
	  document.getElementById("bank").submit();
	  document.getElementById("personal").submit();
  }
  </script>
  </table>
</div>
</div>
</div>
<!---my detail form end----->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/owl.carousel.min.js" type="text/javascript"></script>

  


</body>
</html>