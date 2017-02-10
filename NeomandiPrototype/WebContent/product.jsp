<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,java.io.Reader,java.io.OutputStream, 
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
<style>
.whiteclsbc{
background-color:#ffffff;
width:5%;
border-top:1px solid #fff !important;
}
tbody:before {
    display: block;
    line-height:10px;
    color: transparent;
}
.from table{
margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td, .pstable .table tbody tr td, .sum2tab .table tbody tr td {
border-top:2px solid #fff !important;
}
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<% 		    HttpSession tlog=request.getSession(false);
			if((String)tlog.getAttribute("name")==null)
			{    out.println("<script type=\"text/javascript\">");
			  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
			  	 out.println("location='TraderLogin.jsp';");
			 	 out.println("</script>");
			}
%>			
<div class="col-lg-offset-3 col-lg-8 col-sm-10 col-md-10 col-xs-10 far"><h1><%=(String)tlog.getAttribute("name")%> ,welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="container">
  <ul class="nav nav-tabs" style="border-bottom: 1px solid #ddd;">
    <li class="active"><a href="productsearch.html">Product Search</a></li>
    <li><a href="TraderBlock.do">Hold Funds</a></li>
    <li><a href="TradeorAuction.do">Trade</a></li>
    <li><a href="OrderStatus.do">Status</a></li>
    <li><a href="TradeSummary.jsp">Summary</a></li>
    <li><a href="TraderProfile.jsp">My Profile</a></li> 
  </ul>
</div>
</div>
</div>  
    <div id="home" class="tab-pane fade in active">
       <div class="container-fluid psearch" style="border-top: 1px solid white;">
<div class="container release">
<table class="table">
<tr>
<td><select class="form-control" id="kproduce" name = "kproduce" style="border-top: -4px solid #ddd;" >
       <option selected value = "base">Select Category</option> 
					<option value = "Vegetable">VEGETABLES</option>
					<option value = "FRUITS">FRUITS</option>
					<option value = "GRAINS">GRAINS</option>
					<option value = "PULSES">PULSES</option>
      </select></td>
<td><select class="form-control" id="produce" name = "quality" >
       <option selected value = "base">Select Produce</option> 
      </select></td>
<td><select class="form-control" id="grade">
       <option selected value = "base">Choose Grade</option> 
					<option value = "A">A</option>
					<option value = "B">B</option>
					<option value = "C">C</option>
      </select></td>
      <td><select class="form-control" id="slot">
     <option selected value = "base">Auction Slot</option> 
					<option value = "slot1" >Slot 1 (10:30-10:35)</option>
					<option value = "slot2">Slot 2 (10:40-10:45)</option>
					<option value = "slot3">Slot 3 (10:50-10:55)</option>
      </select></td>
<td><a href="#" onclick="fun()" class="reg">Search</a></td>
</tr>
</table>
<script>
function fun()
{
	console.log("kproduce="+document.getElementById("kproduce").value+" slot="+document.getElementById("slot").value+" grade="+document.getElementById("grade").value)
	if(document.getElementById("kproduce").value=="base"&&document.getElementById("slot").value=="base")
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
</script></div><script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</div>
<% // if(msg2!=null||msg3!=null)
  {}
	%>
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
	  <tr class="gradeX"><td><button onMouseOver="this.style.color='black'"  onMouseOut="this.style.color='white'" type="button" style="color: white; border-radius:9px; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="number" min='0' class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td></tr>
	  <tr class="gradeX"><td><button onMouseOver="this.style.color='black'"  onMouseOut="this.style.color='white'" type="button" style="color: white; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="number" min='0'class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td></tr>
	  <tr class="gradeX"><td><button onMouseOver="this.style.color='black'"  onMouseOut="this.style.color='white'" type="button" style="color: white; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="number" class="form-control" min='0' id="pwd" placeholder="Enter Required quantity"></td><td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td></tr>
	  <tr class="gradeX"><td><button onMouseOver="this.style.color='black'"  onMouseOut="this.style.color='white'" type="button" style="color: white; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button></td><td><h4>CBPCARA0173</h4></td><td><h4>Carrot</h4></td><td><h4>A</h4></td><td><h4>2500</h4></td><td><input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity"></td><td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td></tr>
	  </tbody>
	  </table>
</div>
</div>    
<!---------modal image--------------->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <img src="images/traderori.png" class="img-responsive trad">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!--------modal image end------------>
   </div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>