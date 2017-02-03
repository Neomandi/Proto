<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,
    java.io.Reader,java.io.OutputStream, 
    com.neomandi.prototype.ProductSearchResultBean,java.io.BufferedInputStream,
    java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,
	  java.io.IOException,
	 java.io.InputStream,
	 java.sql.Blob,
	 java.sql.Connection,
	 java.sql.ResultSet,
	 java.sql.SQLException,
	 java.sql.Statement,
	 java.awt.image.BufferedImage,
 java.io.ByteArrayInputStream,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
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
<div class="col-lg-1 col-md-1  hidden-sm hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="container">

<div class="col-lg-10 col-sm-10 col-md-10 col-xs-10 far"><h1>Trade1 ,welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-2 col-sm-2 col-md-2 col-xs-2 power"><i class="fa fa-power-off" aria-hidden="true"></i></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="product.jsp">Product Search</a></li>
    <li><a data-toggle="tab" href="TraderBlock.do">Hold Funds</a></li>
    <li><a data-toggle="tab" href="TradeorAuction.do">Trade/Auction</a></li>
    <li><a data-toggle="tab" href="TradeSummary.jsp">Trade Summary</a></li>
<li><a data-toggle="tab" href="OrderStatus.do">Order Status</a></li>
    <li><a data-toggle="tab" href="TraderProfile.jsp">My Profile</a></li>

  </ul>


</div>
</div>
</div>
<div class="aution">
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
       <div class="container-fluid psearch">
<div class="container release">
<table class="table">
<tr>
<td><select class="form-control" name = "kproduce" id = "kproduce" selected value = "base">
        <option >Kind of produce</option> 
        <option value = "Vegetable">VEGETABLES</option>
		<option value = "FRUITS">FRUITS</option>
		<option value = "GRAINS">GRAINS</option>
		<option value = "PULSES">PULSES</option>
      </select></td>
<td><select class="form-control"   name = "produce" id = "produce">
        <option> Produce</option>
        <option>Choose Produce first</option>
      </select></td>
<td><select class="form-control"  name = "quality" id = "quality">
        <option>Quality Grade</option>
        
		<option value = "A">A</option>
		<option value = "B">B</option>
		<option value = "C">C</option>
      </select></td>
<td><select class="form-control" name = "slot" id = "slot">
        <option>Auction Slot</option>
       
		<option value = "slot1" >Slot 1 (10:30-10:35)</option>
		<option value = "slot2">Slot 2 (10:40-10:45)</option>
		<option value = "slot3">Slot 3 (10:50-10:55)</option>
      </select></td>
<td><a href="javascript: fun()" class="reg">Search</a></td>
</tr>
</table>
</div>
</div>
<script>
function fun()
{
	console.log("kproduce="+document.getElementById("kproduce").value+" slot="+document.getElementById("slot").value+" grade="+document.getElementById("quality").value)
	if(document.getElementById("kproduce").value=="base"&&document.getElementById("slot").value=="Please Select")
		alert("You need to choose atleast Slot number or kind of produce")
	else
	{
		console.log("inside else");
		//window.location.href='http://localhost:8080/NeomandiPrototype/TraderLogin.jsp'
	}
}
$("#kproduce").change(function() {
	   $("#produce").load("ProduceData/" + $(this).val() + ".txt");
	   console.log("ProduceData/" + $(this).val()+ ".txt");
	});
</script>
<div class="container tabin">
<div class="pstable">
	  <table class="table pstab">
<thead><tr align="center">
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Market Code</h4></td>
	  <td><h4>Produce</h4></td>
	  <td><h4>Grade</h4></td>
	  <td><h4>Quantity Available</h4></td>
	  <td><h4></h4></td>
	  <td><h4></h4></td>
	  </tr></thead>
	  <tbody>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td><a href="#" class="reg">Add to Trade List</a></td></tr>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td><a href="#" class="reg">Add to Trade List</a></td></tr>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td><a href="#" class="reg">Add to Trade List</a></td></tr>
<tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td><a href="#" class="reg">Add to Trade List</a></td></tr>
	  </tbody>
	  </table>
</div>
	  </div>
    </div>
    <div id="menu1" class="tab-pane fade">
      <div class="container">
	  <br><br>
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<h4>My Account Details</h4>
<div class="detail">
<form>
    <table class="table">
      <tr><td><label for="name">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">IFSC</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>	  
      <tr><td><label for="branch">Bank Branch</label></td></tr>
      <tr><td><input type="text" class="form-control" id="email" ></td></tr>
      <tr><td><label for="address">Available Balance</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr> 
 <table align="center"><tr><td><a href="#" class="reg">Get Balance</a></td></tr></table>
    </table>
  </form><br><br>
  </div>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hold">
<h4>Hold Funds</h4>
<div class="bankacc">
<br><br>
<form>
    <table class="table">      
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
	   <table align="center"><tr><td><a href="#" class="reg">Hold</a></td></tr></table>
    </table>
  </form><br><br>
  </div>
</div>

<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 release">
<h4>Release Funds</h4>
<div class="password">
<form>
    <table class="table">   
<tr><td><label for="name">Fund Utilized</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Net Amount on Hold</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
	  
	  <table align="center"><tr><td><a href="#" class="reg">Release</a></td></tr></table>
    </table>
  </form><br><br>
  </div>

</div>
</div>
</div>
    </div>
    <div id="menu2" class="tab-pane fade">
        <!----row1--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-1 col-md-1 col-sm-2 hidden-xs text-center"><h1>1</h1></div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-9 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-5 col-xs-12 sec">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 inc release">
	<table align="center"><tr><td><a href="#" class="reg">Increment by 1</a></td></tr></table><br>
				 <table align="center"><tr><td><a href="#" class="reg">Submit</a></td></tr></table></div>
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 sec">
	<table align="center"><tbody><tr><td><br><br><a href="#" class="reg">Remove a lot</a><br><br></td></tr></tbody></table>
	</div>
	</div>
	</div></div><!-----row1 end----->
<!---second row--->

	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-1 col-md-1 col-sm-2 hidden-xs text-center"><h1>2</h1></div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-9 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-5 col-xs-12 sec">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 inc release">
	<table align="center"><tr><td><a href="#" class="reg">Increment by 1</a></td></tr></table><br>
				 <table align="center"><tr><td><a href="#" class="reg">Submit</a></td></tr></table></div>
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 sec">
	<table align="center"><tbody><tr><td><br><br><a href="#" class="reg">Remove a lot</a><br><br></td></tr></tbody></table>
	</div>
	</div>
	</div></div>
<!---second row end--->
<!---third row--->

	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-1 col-md-1 col-sm-2 hidden-xs text-center"><h1>3</h1></div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-9 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-5 col-xs-12 sec">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-5 col-sm-5 col-xs-12 inc release">
	<table align="center"><tr><td><a href="#" class="reg">Increment by 1</a></td></tr></table><br>
				 <table align="center"><tr><td><a href="#" class="reg">Submit</a></td></tr></table></div>
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 sec">
	<table align="center"><tbody><tr><td><br><br><a href="#" class="reg">Remove a lot</a><br><br></td></tr></tbody></table>
	</div>
	</div>
	</div></div>
<!---third row end--->
    </div>
    <div id="menu3" class="tab-pane fade">
	<!----row1--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12 sec">
	<table align="center">
	<tbody>
        <tr><td><h4></h4></td><td></td></tr>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-3 col-sm-6 col-xs-12 second">
	<table align="center"><tbody><tr><h4>Auction Complete. Waiting for Farmer's Acceptance.</h4></tr></tbody></table>
	</div>
	</div>
	</div></div><!-----row1 end----->
	<!----row2----->
	<div class="two">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12 sec">
	<table align="center">
	<tbody>
        <tr><td><h4></h4></td><td><h4></h4></td></tr>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-3 col-sm-6 col-xs-12 second">
	<table><tbody><tr><h4>Auction Complete. Waiting for Farmer's Acceptance.</h4></tr></tbody></table>
	</div>
	</div>
	</div></div><!----row2 end--->
	<!----row 3----->
	<div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12 sec">
	<table align="center">
	<tbody>
        <tr><td><h4></h4></td><td><h4></h4></td></tr>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-3 col-sm-6 col-xs-12 second">
	<table align="center"><tbody><tr><h4>Auction Complete. Waiting for Farmer's Acceptance.</h4></tr></tbody></table>
	</div>
	</div>
	</div></div><!---row 3 end--->
	<!----row 4---->
	<div class="two">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 fir">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-4 col-md-3 col-sm-6 col-xs-12 sec">
	<table align="center">
	<tbody>
         <tr><td><h4></h4></td><td><h4></h4></td></tr>
	<tr><td><h4>Lost Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 first">
	
	
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td><input type="text" class="form-control" id="usr"></td><td><input type="text" class="form-control" id="usr"></td></tr>
	</tbody>
	</table>
	</div> 
	<div class="col-lg-2 col-md-3 col-sm-6 col-xs-12 second">
	<table align="center"><tbody><tr><h4>Auction Complete. Waiting for Farmer's Acceptance.</h4></tr></tbody></table>
	</div>
	</div>
	</div></div><!----row4 end--->
</div>
<div id="menu4" class="tab-pane fade">
       <div class="container-fluid today">
<div class="container"><h2>Today's Summary</h2></div>
</div>
<div class="container-fluid sum1">
	  <div class="container tabin tsum">
	  <div class="row tfrom">
	  <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
<div class="sum1tab table-responsive">
	  <table class="table sum1table">
<thead><tr>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Lot Size</h4></td>
	  <td><h4>Quantity</h4></td>
	  <td><h4>Avg Price</h4></td>
	  <td><h4>Gross Earnings</h4></td>
	  <td><h4>TLC*</h4></td>
<td><h4>Market Cess</h4></td>
<td><h4>EPC</h4></td>
<td><h4>PMVA</h4></td>
<td><h4>Deductions</h4></td>
<td><h4>My Net Earnings</h4></td>
	  </tr></thead>
	  <tbody>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td><h4>19,100</h4></td></tr>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td><h4>19,100</h4></td></tr>
	  <tr class="gradeX"><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td><h4>19,100</h4></td></tr>
	  </tbody>
	  </table>
</div></div>
<div class="col-lg-3 col-md-5 col-sm-5 col-xs-12 from">
<table class="table" align="center">
<tr>

   <td></td>
   <td></td>
<td><a href="#" class="reg">Get Summary</a></td>

</tr>
</table>
<table class="table" align="center">
<tr>

   <td></td>
   <td></td>
<td></td>
<td><a href="#" class="reg">Export as PDF</a></td>
</tr>
</table>
</div>
</div>
	  </div>
	  </div>
<div class="container-fluid  history"><div class="container tsum"><h2>History</h2></div></div>
<div class="container-fluid tfrom">
<div class="container tsum from">
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
<table align="center">
<tr>

   <td><span>From</span></td>
   <td><span>To</span></td>
<td><a href="#" class="reg">Get Summary</a></td>
<td><a href="#" class="reg">Export as PDF</a></td>
</tr>
</table></div>
</div></div>
    </div>
<div id="menu5" class="tab-pane fade">
      <div class="container">
	  <br><br>
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
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
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bank">
<h4>My License Details</h4>
<div class="bankacc">
<form>
    <table class="table">
      <tr><td><label for="name">Trade License Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Date of Registration</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">Place of Registration</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>	  

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
  </div><br>
 <table align="center"><tr><td><a href="#" class="reg">Export as PDF</a></td></tr></table>
</div>

<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<h4>My Account Details</h4>
<div class="password">
<form>
    <table class="table"> 
  <tr><td><label for="name">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="aadhar">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">IFSC</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"></td></tr>	  

      <tr><td><label for="address">Bank Branch</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
    </table>
  </form>
  </div>
</div>
</div>
</div>

    </div>

</div>
</div>
    

<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>

</html>