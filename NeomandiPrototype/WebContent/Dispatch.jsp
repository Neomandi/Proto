<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.neomandi.prototype.OrderStatusResult, com.neomandi.prototype.DispatchBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dispatch</title>
<style>
a#active 
{
  border: 1px solid black;
    color: brown;
    background-color: white;
    bottom: -3px;    
    border-bottom: 2px solid white;    
	
}
.menu
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
{
    text-align: center;
	width: 200px;
	height:40px;
	color: black;
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

.blue 
{
  background-color: #ADD8E6;
}
.green 
{
  background-color: #32CD32;
}
body
{
  background-color: white;
}
</style>
</head>
<link rel="stylesheet" href="Header&footerstyle.css">
<body>
<%@ include file="ERibbon.jsp" %><br><br>
<a class = 'logout' href = "ELogout.do"><b><i>Logout</i></b></a>

<ul>
<li><a class="menu" href="ProductEntry.jsp">Product Entry</a></li>
<li><a class="menu" href="Revenue.jsp">Revenue</a></li>
<li><a id="active" class="menu" href="Dispatch.do">Dispatch</a></li>
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
	    LinkedList<String> ls=new LinkedList<String>();
		HttpSession dispatch=request.getSession();
		OrderStatusResult osrb=(OrderStatusResult)dispatch.getAttribute("al");
		HashMap<String, Integer> a=osrb.getA();
		List al=osrb.getAl();
		System.out.println(al);
	 	for(Object o:al)
	    {
	 	   DispatchBean dp=(DispatchBean)o;
	       int size= a.get(dp.getLotnum());
	     
	       System.out.println("ls.contains(dp.getLotnum())"+ls.contains(dp.getLotnum()));
	       System.out.println(ls);
	       if(ls.contains(dp.getLotnum()))
	       {
	  %><tr> <% for(int i=1;i<size;i++)
	       {
	    	  System.out.println(i);%>
	  <td><%out.println(dp.getName()); %></td>
	  <td><%out.println(dp.getAadharnumber()); %></td>
      <td><%out.println(dp.getQuantityassigned()); %></td>
      <%}%></tr>
      <%}
	    else
	    {   
	    	System.out.println("insde else "+dp.getLotnum());
		    ls.add(dp.getLotnum());
		    System.out.println("inside ls"+ls);%>
	  <tr>
      <th rowspan=<%=size%>><%=dp.getLotnum()%></th>
      <% for(int i=0;i<1;i++)
         {
    	  System.out.println(i);%>
	  <td><%out.println(dp.getName()); %></td>
	  <td><%out.println(dp.getAadharnumber()); %></td>
      <td><%out.println(dp.getQuantityassigned()); %></td>
      <%}%></tr>
      <%}} %>
</table></center>
</body>
</html>