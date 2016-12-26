<%@page import="java.sql.SQLException"%>
<%@page import="com.neomandi.prototype.JDBCHelper,java.sql.Connection,java.sql.ResultSet,
     java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Trader Profile</title>
	<script src = "jspdf/jspdf.min.js"></script>
	<script src = "html2canvas.js"></script>
	<script>
		function genPDF(){
			html2canvas(document.getElementById('myProfile'),{
				onrendered: function(canvas){
					var img = canvas.toDataURL("image/png");
					var doc = new jsPDF;
					doc.addImage(img,'JPEG',50,10);
					doc.save('TraderProfile.pdf');
				}
			});
		}
	</script>
</head>
<style>
table
{
	border-collapse: collapse;
	width: 30%;
}
th
{
	padding: 12px;
	height: 30px;
	text-align: left;
	background-color: rgb(1,163,226);
}
td
{
	padding: 12px;
	background-color: rgb(182,228,31);
}
</style>
<style>
table
{
border-collapse: collapse;

}</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>

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
a.pdf
{
text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}
a.moree {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}

a.more {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 60px;
	text-decoration: none;
	padding: 10px 20px;
}

#search {
    width: 90px;  height: 2em;
}

</style>
<body>
<%@ include file="TRibbon.jsp" %><br><br>
<ul><li><a  href="product.jsp">Product Search</a></li>
  <li><a href="TraderBlock.do">Hold Funds</a></li>
  <li><a href=" TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li>  <li><a class="active" href="TraderProfile.jsp">Your Profile</a></li></ul><br><br><br><br><br><br><br>

<body>
<div id = 'myProfile'>
<br/><br/>
<h1>Trader Profile</h1>
<br/>
<table border>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{
			out.println("Connection not established!");
		}
		String sql = "SELECT * FROM treg WHERE aadharnumber = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, 100000000001L);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
	%>
		<tr><th>Name</th><td><%= rs.getString("name") %></td></tr>
		<tr><th>Mobile</th><td><%= rs.getLong("mobile") %></td></tr>
		<tr><th>Aadhar Number</th><td><%= rs.getLong("aadharnumber") %></td></tr>
		<tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
		<tr><th>State</th><td><%= rs.getString("state") %></td></tr>
		<tr><th>District</th><td><%= rs.getString("district") %></td></tr>
		<tr><th>Taluk</th><td><%= rs.getString("taluk") %></td></tr>
		<tr><th>Hobli</th><td><%= rs.getString("hobli") %></td></tr>
		<tr><th>Village</th><td><%= rs.getString("village") %></td></tr>
	<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(rs);
		JDBCHelper.Close(pstmt);
		JDBCHelper.Close(con);
	}
	%>
</table>
</div><br/><br/>
<a href = "javascript:genPDF()" class="pdf">Download PDF</a>
</body>
</html>