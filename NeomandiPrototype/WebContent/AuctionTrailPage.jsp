<%@page import="com.neomandi.prototype.AggregatingData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	table{
		width: 80%;
	}
</style>
<%
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;    

con = JDBCHelper.getConnection();
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Trails</title>
</head>
<body>
	<font color="#2425ff" ><h3>Auction Trial Page</h1></font>
	<b><font color="#bf1b6d"><u>Input</u></font></b><br/><br/>
	<form action = "ActionTrailInt.jsp" method = "post">
	<b>Max vol: </b><input type = "text" name = "maxvol" value = "${param.maxvol }"/><br/><br/>
	<table border="1" bgcolor="#d8ecff">
		<tr>
		
		<th>Trader(T)</th>
		<th>Volume(V)</th>
		<th>Assigned Volume(AV)</th>
		<th>Bid(B)</th>
		<th>Best Bid(BB)</th>
		</tr>
		<tr>
		
		<td>1</td>
		<td><input type="text"  name="v1" value = "${param. v1}"/></td>
		<td><input type="text"  name="av1" value = "${param. av1}"/></td>
		<td><input type="text"  name="b1" value = "${param. b1}"/></td>
		<td><input type="text"  name="bb1" value = "${param. bb1}"/></td>
		</tr>
		<tr>
		
		<td>2</td>
		<td><input type="text"  name="v2" value = "${param. v2}"/></td>
		<td><input type="text"  name="av2" value = "${param. av2}"/></td>
		<td><input type="text"  name="b2" value = "${param. b2}"/></td>
		<td><input type="text"  name="bb2" value = "${param. bb2}"/></td>
		</tr>
		<tr>
		
		<td>3</td>
		<td><input type="text"  name="v3" value = "${param. v3}"/></td>
		<td><input type="text"  name="av3" value = "${param. av3}"/></td>
		<td><input type="text"  name="b3" value = "${param. b3}"/></td>
		<td><input type="text"  name="bb3" value = "${param. bb3}"/></td>
		</tr>
		<tr>
		
		<td>4</td>
		<td><input type="text"  name="v4" value = "${param. v4}"/></td>
		<td><input type="text"  name="av4" value = "${param. av4}"/></td>
		<td><input type="text"  name="b4" value = "${param. b4}"/></td>
		<td><input type="text"  name="bb4" value = "${param. bb4}"/></td>
		</tr>
		<tr>
		
		<td>5</td>
		<td><input type="text"  name="v5" value = "${param. v5}"/></td>
		<td><input type="text"  name="av5" value = "${param. av5}"/></td>
		<td><input type="text"  name="b5" value = "${param. b5}"/></td>
		<td><input type="text"  name="bb5" value = "${param. bb5}"/></td>
		</tr>
		<tr>
		
		<td>6</td>
		<td><input type="text"  name="v6" value = "${param. v6}"/></td>
		<td><input type="text"  name="av6" value = "${param. av6}"/></td>
		<td><input type="text"  name="b6" value = "${param. b6}"/></td>
		<td><input type="text"  name="bb6" value = "${param. bb6}"/></td>
		</tr>
		<tr>
		
		<td>7</td>
		<td><input type="text"  name="v7" value = "${param. v7}"/></td>
		<td><input type="text"  name="av7" value = "${param. av7}"/></td>
		<td><input type="text"  name="b7" value = "${param. b7}"/></td>
		<td><input type="text"  name="bb7" value = "${param. bb7}"/></td>
		</tr>
		<tr>
		
		<td>8</td>
		<td><input type="text"  name="v8" value = "${param. v8}"/></td>
		<td><input type="text"  name="av8" value = "${param. av8}"/></td>
		<td><input type="text"  name="b8" value = "${param. b8}"/></td>
		<td><input type="text"  name="bb8" value = "${param. bb8}"/></td>
		</tr>
		</table>
	<br/>
	<input type="submit" value="Submit"  style="position:absolute; right:400px; top:350px" />
	<input type="reset" value="Reset"  style="position:absolute; right:300px; top:350px" />
	</form>
	
	<font color="#bf1b6d"><b><u>Output</b></u></font></b>
	
	<form action = "" method = "post">
	<table border="1" bgcolor="#d8ecff" style = "width: 59%">
		<tr>
		
		<th>Trader(T)</th>
		<th>Volume(V)</th>
		<th>Assigned Volume(AV)</th>
		<th>Bid(B)</th>
		<th>Best Bid(BB)</th>
		</tr>

		
		<%
			try{	
				if(con == null)
				{
					out.println("Connection establish failed");
				}
				statement = con.createStatement();
				AggregatingData.aggregate();
				String sql = "SELECT * FROM biddingdata ORDER BY Price desc, Volume desc";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next())
				{ 
		%>
		
		<tr>
			<td><%= resultSet.getString("Trader") %></td>
			<td bgcolor = "white"><%= resultSet.getInt("Volume") %></td>
			<td bgcolor = "white"><%= resultSet.getString("AssignedVolume") %></td>
			<td bgcolor = "white"><%= resultSet.getInt("Price") %></td>
			<td bgcolor = "white"><%= resultSet.getString("BestBid") %></td>
		</tr>
		
		
		<%
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();	
			}
		%>
		
		
		</table>

	</form>
</body>
</html>