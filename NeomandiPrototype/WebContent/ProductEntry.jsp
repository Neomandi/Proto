<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import="java.io.*,java.io.InputStream"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<meta charset="ISO-8859-1">
<title>Product Entry</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	  $("#header").load("Header.html"); 
	  $("#footer").load("Footer.html");
	});

function ProductEntry(){
	
	var farmerid=document.ProductEntryForm.farmerid;
	var quantity=document.ProductEntryForm.quantity;
	var marketcode=document.ProductEntryForm.marketcode;
	
	//farmerid validation
	if(isNaN(farmerid.value)){
		alert("Enter the valid farmerid ");
		farmerid.focus();
		return false;
	}
	if((farmerid.value.length < 1) || (farmerid.value.length > 12)){
		
		alert(" Your farmerid must contain 12 digits");
		farmerid.focus();
		return false;
	}
	
	//marketcode validation
	var letters = /^[0-9a-zA-Z]+$/;
	if(!marketcode.value.match(letters)){
		alert('Your marketcode should contain alphanumeric characters only');
		marketcode.focus();
		return false;
	}
	
	//quantity validation
	if(isNaN(quantity.value)){
		alert("Enter the valid quantity value ");
		quantity.focus();
		return false;
	}
	if(quantity.value==0){
		alert("please enter atleast minimum 1 kg");
		quantity.focus();
		return false;
	}
}
$( function() {
    var marketcode = [
      "KLR563101",
      "CBP563102",
      "BLR560078",
      "BPT563103",
      "MBL563104",
      "MLR563107",
      "ABC520014",
      "BBC520014",
      "CBC520014",
      "DBC520014",
      "EBC520014",
      "FBC520014",
      "GBC520014",
      "HBC520014",
      "IBC520014",
      "JBC520014",
      "KBC520014",
      "LBC520014",
      "MBC520014",
      "NBC520014",
      "OBC520014",
      "PBC520014",
      "QBC520014",
      "RBC520014",
      "SBC520014",
      "UBC520014",
    ];
    $( "#marketcode" ).autocomplete({
      source: marketcode
    });
  });
</script>
<style type = "text/css">
#logtable {
    width: 800px;
    float: left;
}
#produceimage
{
	width: 200px;
    position: right;
    right:-5px;
    top: -20px;
}
table
{
	border-collapse: collapse;
	width: 480px;
	height: 200px;
	text-align: left;
	position: absoulte;
	
}
th 
{
    background-color: rgb(182,228,31);
    color: black;
}
input[type=file]
{
	width: 95%;
}
td
{
	width: 50%;
}
input[type = text]
{
	border: none;
	font-size: 20px;
}
#pic
{
	position: absolute;
	top: 500px;
	left: 500px;
}
.bc
{
	text-decoration: none;
}
.logout
{
	text-decoration: none;
	color: red;
	position: absolute;
	top: 6px;
	right: 30px;
	font-size: 32px;
}
#kproduce
{
	size: 15;
}
input[type=submit]
{
	background-color: rgb(30,115,190);
	border: none;
	text-align: center;
	color: white;
	font-size:20px;
	display: inline-block;
	cursor: pointer;
	border-radius: 4px;
	height: 30px;
    width: 75px;
}
input[type=reset]
{
	background-color: rgb(30,115,190);
	border: none;
	text-align: center;
	color: white;
	font-size:20px;
	display: inline-block;
	cursor: pointer;
	border-radius: 4px;
	height: 30px;
    width: 75px;
}
body{
	background-color: white;
}


a.active {
    border: 1px solid black;
    color: brown;
    background-color: white;
    bottom: -3px;    
    border-bottom: 2px solid white;    
}
 #menu
{
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 0 0;
    background-color: blue;   
	display: inline;
	display: block;
    color: white;
	width: 160px;
	text-decoration: none;
	padding: 10px 20px;
}
#pentry
{
	background-color: white;
}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<%@ include file="ERibbon.jsp" %><br><br>
<ul id = "pentry">
<li><a id="menu" class="active" href="ProductEntry.jsp">Product Entry</a></li>
<li><a id="menu" href="Revenue.jsp">Revenue</a></li>
<li><a id="menu" href="Dispatch.do">Dispatch</a></li>
</ul><br>
<!-- <div id = "header"></div>  -->
<br/>
<input type = "hidden" id = "nm" value = ""/>
<center><h2>Market Yard Window: Product Entry Screen</h2></center><br/>
<center><form name = "ProductEntryForm" action = "ProductEntry.do" method = "post" enctype="multipart/form-data" onsubmit = "return ProductEntry();" oninput = "lotnum.value = farmerid.value.substring(0,3) + produce.value.substring(0,3) + quality.value + nm.value">
	<table border = '2'>
		<tr>
			<th>Farmer ID</th>
			<td><input type = "text"  name = "farmerid" id = "farmerid" placeholder = "Enter farmerid" style = "width: 235px;" required/></td>
		</tr>
		<tr>
			<th>Market Code</th>
			<td><input type = "text" name = "marketcode" id = "marketcode" placeholder = "Enter the market code" style = "width: 235px;" required/></td>
		</tr>
		<tr>
			<th>Kind of produce</th>
			<td><select name = "kproduce" id = "kproduce" style = "width: 235px;">
					<option selected value = "base">Please Select</option>
					<option value = "Vegetable">VEGETABLES</option>
					<option value = "FRUITS">FRUITS</option>
					<option value = "GRAINS">GRAINS</option>
					<option value = "PULSES">PULSES</option>
			</select></td>
		</tr>
		<tr>
			<th>Produce</th>
			<td><select name = "produce" id = "produce" style = "width: 235px;">
					<option>Please choose from above</option>
				</select></td>
		</tr>
		<tr> 
			<th>Quality grade</th>
			<td><select required name = "quality" id = "quality" style = "width: 235px;">
					<option></option>
					<option>A</option>
					<option>B</option>
					<option>C</option>	
				</select>
			</td>
		</tr>
		<tr>
			<th>Quantity</th>
			<td><input type = "text" name = "quantity" placeholder = "Enter the quantity" style = "width: 235px;" required/></td>
		</tr>
		<tr>
			<th>Image</th>
			<td><input type="file" name = "photo" onchange="readURL(this);" required/></td>
		</tr>
		<tr>
			<th>Lot Number</th>
			<td><input type = "text" name = "lotnum" id = "lotnum" style = "width: 235px;"/></td>
		</tr>
	</table>
	<br/>
	
    <img id="pic" name = "pic" src="#" alt="your image" />
	<input type = "submit" value = "Submit"/>&nbsp &nbsp
	<input type = "reset" value = "Reset"/><br/><br/>
	
	<% String msg = (String)request.getAttribute("errmsg");  %>
	<p align = "center"><b><% if(msg!=null)
							out.print(msg);
									%></b></p><br/>
									
	<!-- <a class = 'bc' href = "EmployeeLogin.jsp"><h3>Back</h3></a>  -->
	<a class = 'logout' href = "ELogout.do"><b><i>Logout</i></b></a>

</form>
</center>
<script>
$("#kproduce").change(function() {
	   $("#produce").load("ProduceData/" + $(this).val() + ".txt");
	   console.log("ProduceData/" + $(this).val()+ ".txt");
	});
	
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pic')
                .attr('src', e.target.result)
                .width(400)
                .height(150);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<script>
var num = Math.floor(Math.random() * 9999) + 1000;
console.log("num: "+num);
document.getElementById('nm').value = num;
</script>
</body>
</html>