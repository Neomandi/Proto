<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.DispatchBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dispatch</title>
<style>
a.active {
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
.logout
{
	text-decoration: none;
	color: red;
	position: absolute;
	top: 6px;
	right: 30px;
	font-size: 32px;
}
table
{
	border-collapse: collapse;
	height: 150px;
	text-align: left;
	position: absoulte;
}

td
{
    text-align: center;
	width: 100px;
	height:20px;
}

th
{text-align: center;
	width: 200px;
	height:40px;
	color:white
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

.blue {
  background-color: #ADD8E6;
}
.green {
  background-color: #32CD32;
}
body
{
  background-color: white;}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<%@ include file="ERibbon.jsp" %><br><br>
<a class = 'logout' href = "ELogout.do"><b><i>Logout</i></b></a>

<ul>
<li><a href="ProductEntry.jsp">Product Entry</a></li>
<li><a href="ProductEntry.jsp">Revenue</a></li>
<li><a class="active" href="Dispatch.do">Dispatch</a></li>
</ul><br><br><br>
<center>
<table id = "t1" border = "border">
 <colgroup>
    <col class="blue" />
    <col class="green" />
    <col class="blue" />
    <col class="green" />
 </colgroup>
<tr bgcolor="blue">
	<th>LOT NUMBER</th>
	<th> TRADER NAME </th>
	<th>AADHAR NUMBER</th>
	<th>QUANTITY ASSIGNED(kg)</th>
	</tr>
	<%
		HttpSession dispatch=request.getSession();
		List al=(List)dispatch.getAttribute("al");
	 	for(Object o:al)
	    {
		  DispatchBean dp=(DispatchBean)o;
	%>
	<tr>
	<td><%out.println(dp.getLotnum()); %></td>
	<td><%out.println(dp.getName()); %></td>
	<td><%out.println(dp.getAadharnumber()); %></td>
    <td><%out.println(dp.getQuantityassigned()); %></td>
	<%  }
	%></tr>
	</table></center>
</body>
</html>