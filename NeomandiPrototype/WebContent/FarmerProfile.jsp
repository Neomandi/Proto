<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">

<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Farmer1, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li ><a href="FarmerMaster.jsp">Auction</a></li>
    <li ><a  href="Lotdetails.jsp" >My Lots</a></li>
    <li ><a class="classbeauty" id="ts" href="#">Summary</a></li>
    <li class="active"><a href="FarmerpPofile.jsp">My Profile</a></li>
     <li ><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>


</div>
</div></div>
 
	<div class="container">
	<div class="row">
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 det">
<h4>My Details</h4>
<div class="detail">
<form>
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Aadhar Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" id="email" placeholder="Enter email"></td></tr>
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
<div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 aut">
<h4>My Account Details</h4>
<div class="bankacc">
<form>
    <table class="table">
      
      <tr><td><label for="aadhar">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
	  <tr><td><label for="name">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="address">IFSC</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><label for="mobno">Bank Branch</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>
    </table>
  </form>
    </div>
	<br><br>
	<table align="center"><tr><td><a href="#" class="reg">Export as PDF</a></td></tr></table>
</div>
</div>
</div>
  



<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>


     

</body>
</html>
