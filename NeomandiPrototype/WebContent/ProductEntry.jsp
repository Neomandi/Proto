<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	width: 25%;
	text-align: left;
	position: absoulte;
	
}
th 
{
    background-color: #4CAF50;
    color: white;
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
}
#pic
{
	position: absolute;
	top: 75px;
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
	top: 8px;
	right: 10px;
	font-size: 32px;
}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>

 <%@ include file="ERibbon.jsp" %><br><br>
<!-- <div id = "header"></div>  -->
<br/>
<h2>Market Yard Window: Product Entry Screen</h2>
<center><form action = "ProductEntryInt.jsp" method = "post" oninput = "lotnum.value = farmerid.value.substring(0,3) + produce.value.substring(0,3) + quality.value + 2013">
	<table border = '2'>
		<tr>
			<th>Farmer ID</th>
			<td><input type = "text"  name = "farmerid" id = "farmerid" placeholder = "Enter farmerid"/></td>
		</tr>
		<tr>
			<th>Market Code</th>
			<td><input type = "text" name = "marketcode" id = "marketcode" placeholder = "Enter the market code"/></td>
		</tr>
		<tr>
			<th>Kind of produce</th>
			<td><select name = "kproduce" id = "kproduce">
					<option selected value = "base">Please Select</option>
					<option value = "Vegetable">VEGETABLES</option>
					<option value = "FRUITS">FRUITS</option>
					<option value = "GRAINS">GRAINS</option>
					<option value = "PULSES">PULSES</option>
			</select></td>
		</tr>
		<tr>
			<th>Produce</th>
			<td><select name = "produce" id = "produce">
					<option>Please choose from above</option>
				</select></td>
		</tr>
		<tr> 
			<th>Quality grade</th>
			<td><select name = "quality" id = "quality">
					<option></option>
					<option>A</option>
					<option>B</option>
					<option>C</option>	
				</select>
			</td>
		</tr>
		<tr>
			<th>Quantity</th>
			<td><input type = "text" name = "quantity" placeholder = "Enter the quantity"/></td>
		</tr>
		<!--<tr>
			<th>Image</th>
			<td><input type='file' name = 'photo' onchange="readURL(this);" /></td>
		</tr>  -->
		<tr>
			<th>Lot Number</th>
			<td><input type = "text" name = "lotnum" id = "lotnum"/></td>
		</tr>
	</table>
	<br/>
	
    <!-- <img id="pic" src="#" alt="your image" /> -->
	<input type = "submit" value = "Submit"/>
	<input type = "reset" value = "Reset"/>
	
	<% String msg = (String)request.getAttribute("errmsg");  %>
	<p align = "center"><b><% if(msg!=null)
							out.print(msg);
									%></b></p><br/>
									
	<a class = 'bc' href = "EmployeeLogin.jsp"><b>Back</b></a>
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
                .width(250)
                .height(250);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</body>
</html>