<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trade Summary</title>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='tableExport.js'></script>
<script type='text/javascript' src='jquery.base64.js'></script>
<script type='text/javascript' src='jspdf/libs/sprintf.js'></script>
<script type='text/javascript' src='jspdf/jspdf.js'></script>
<script type='text/javascript' src='jspdf/libs/base64.js'></script>
<script>
$(document).ready(function(e){
	$('#pdf').click(function(e){
		$('#mytable').tableExport({
			type: 'pdf',
			escape: 'false'
		});
	});
	
	$('#excel').click(function(e){
		$('#mytable').tableExport({
			type: 'excel',
			escape: 'false'
		});
	});
	
	$('#word').click(function(e){
		$('#mytable').tableExport({
			type: 'doc',
			escape: 'false'
		});
	});
});
</script>
</head>
<style>
table
{
	border-collapse: collapse;
}
#ext
{
	position: absolute;
	left: 625px;
}
#export
{
	position: absolute;
	left: 690px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: white;
    
}
 li
{
	display: inline;
    float: left;
    
}
li a:hover:not(.active) {
    color: white;
    
}
.active {
    border: 1px solid black;
    color: brown;
    background-color: white;
    bottom: -3px;    
    border-bottom: 2px solid white;
    
}

 a
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
<body>

<ul><li><a  href="Search.html">Product Search</a></li>
  <li><a href="TraderBlock.jsp">Block Funds</a></li>
  <li><a href="Trade/Auction.jsp">Trade/Auction</a></li>
  <li><a class="active" href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="TradeConsignment.jsp">Trade Consignment</a></li></ul>


<center><h1>Trade Summary</h1></center>
<center>
<form action = "" method = "get">

 From:  <input type = "date" id = "from"/><br/><br/>
 
 To:    <input type = "date" id = "to"/><br/>

<br/>
<input type = "submit" value = "Get Summarry"/>
<br/><br/>

<table id = 'mytable' border>
	<tr bgcolor = '#00FF00'>
		<th>Lot Number</th>
		<th>Quantity</th>
		<th>Bid</th>
		<th>Final Price</th>
	</tr>
	<tr bgcolor = '#00FFFF'>
		<td>312POTB2013</td>
		<td>1500</td>
		<td>22</td>
		<td>26500</td>
	</tr>
	<tr bgcolor = '#00FFFF'>
		<td>312RAGA2013</td>
		<td>5000</td>
		<td>18</td>
		<td>20000</td>
	</tr>
	<tr bgcolor = '#00FFFF'>
		<td>312APPC2013</td>
		<td>3000</td>
		<td>15</td>
		<td>10000</td>
	</tr>
	<tr bgcolor = '#00FFFF'>
		<td>312BARa2013</td>
		<td>8000</td>
		<td>10</td>
		<td>30000</td>
	</tr>
</table><br/>
</form>
</center>
<br/>
<br/>
<p align= "center"><b>Export Summary</b></p>
<br/>
<center><button id = "pdf">Export to PDF</button></center>
<br/>
<center><button id = "excel">Export to XLS</button></center>
<br/>
<center><button id = "word">Export to DOC</button></center>
</body>
</html>