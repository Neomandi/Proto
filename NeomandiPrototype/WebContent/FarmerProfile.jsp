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
	<title>Farmer Profile</title>
	<script src = "jspdf/jspdf.min.js"></script>
	<script src = "html2canvas.js"></script>
	<script>
		function genPDF(){
			html2canvas(document.getElementById('myProfile'),{
				onrendered: function(canvas){
					var img = canvas.toDataURL("image/png");
					var doc = new jsPDF;
					doc.addImage(img,'JPEG',50,10);
					doc.save('FarmerProfile.pdf');
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
<body>
<div id = 'myProfile'>
<br/><br/>
<h1>Farmer Profile</h1>
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
		
		String sql = "SELECT * FROM freg WHERE aadharnum = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, 200000000001L);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
	%>
		<tr><th>Name</th><td><%= rs.getString("name") %></td></tr>
		<tr><th>Mobile</th><td><%= rs.getLong("mobile") %></td></tr>
		<tr><th>Aadhar Number</th><td><%= rs.getLong("aadharnum") %></td></tr>
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
<a href = "javascript:genPDF()">Download PDF</a>
</body>
</html>