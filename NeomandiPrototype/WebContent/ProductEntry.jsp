<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<meta charset="ISO-8859-1">
<title>Product Entry</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	  $("#header").load("Header.html"); 
	  $("#footer").load("Footer.html");
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
	top: 400px;
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
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<%@ include file="ERibbon.jsp" %><br><br>
<ul>
<li><a id="menu" class="active" href="ProductEntry.jsp">Product Entry</a></li>
<li><a id="menu" href="Revenue.jsp">Revenue</a></li>
<li><a id="menu" href="Dispatch.do">Dispatch</a></li>
</ul><br><br><br>
<!-- <div id = "header"></div>  -->
<br/>
<center><h2>Market Yard Window: Product Entry Screen</h2></center><br/>
<center><form action = "ProductEntry.do" method = "post" enctype="multipart/form-data" oninput = "lotnum.value = farmerid.value.substring(0,3) + produce.value.substring(0,3) + quality.value + 2013">
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
                .height(250);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</body>
</html>