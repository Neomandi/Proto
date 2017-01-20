<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import = "java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revenue</title>
</head>
<style>
.logout
{
	text-decoration: none;
	color: red;
	position: absolute;
	top: 6px;
	right: 30px;
	font-size: 32px;
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

			.active {
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
			width: 150px;
			text-decoration: none;
			padding: 10px 20px;
		}
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    overflow: hidden;
		    background-color: white;
		    border-radius: 9px 9px 0 0;    
		}
		
		 li
		{
			display: inline;
		    float: left;    
		}
		.active {
		    border: 1px solid black;
		    color: brown;
		    background-color: white;
		    bottom: -3px;    
		    border-bottom: 2px solid white;    
		}
table
{
	border: border;
	border-Collapse: collapse;
	width: 80%;
}
td
{
	text-align: center;
}
</style>
<body>
<%@ include file="ERibbon.jsp" %><br><br>
<ul>
	<li><a id="menu" href="ProductEntry.jsp">Product Entry</a></li>
	<li><a id="menu" class="active" href="Revenue.jsp">Revenue</a></li>
	<li><a id="menu" href="Dispatch.do">Dispatch</a></li>
</ul><br><br><br>

<center>
<table border>
	<tr>
		<th bgcolor="#F2F2F2">Lot Number</th>
		<th bgcolor="#F2F2F2">Lot Cost</th>
		<th bgcolor="#6FC3E8">TLC*</th>
		<th bgcolor="#6FC3E8">Commission</th>
		<th bgcolor="#6FC3E8">Market Cess</th>
		<th bgcolor="#6FC3E8">EPC#</th>
		<th bgcolor="#D1DF4D">TLC*</th>
		<th bgcolor="#D1DF4D">Market Cess</th>
		<th bgcolor="#D1DF4D">EPC#</th>
		<th bgcolor="#D1DF4D">PMVA$</th>
		<th bgcolor="#F2F2F2">NeoMandi Revenue</th>
	</tr>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	
	try{
	con = JDBCHelper.getConnection();
	
	if(con == null)
	{
		System.out.println("Connection not established.");
	}
	else
	{
		String sql = "select ar.lotnumber, sum(ar.quantityassigned), ar.aadharnumber, tb.bidprice, tb.bestbid, hs.averageprice, hs.quantitybidfor from traders_bid_price tb, auction_result ar, history hs where (tb.lotnum = ar.lotnumber) and (tb.aadharnumber = ar.aadharnumber) and (hs.lotnumber = tb.lotnum)";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(!rs.isBeforeFirst())
		{
			while(rs.next())
			{
				String lotnumber = rs.getString("lotnumber");
				int quantityassigned = Integer.parseInt(rs.getString("sum(ar.quantityassigned)"));
				String aadharnumber = rs.getString("bidprice");
				int bestbid = Integer.parseInt(rs.getString("bestbid"));
				double averageprice = Double.parseDouble(rs.getString("averageprice"));
				int lotcost = (int)(quantityassigned*averageprice);
				int commission = (int)(lotcost*0.05);
				int marketcess = (int)(lotcost*0.01);
				double quantitybidfor = Double.parseDouble(rs.getString("quantitybidfor"));
				int fmarketcess = (int)((averageprice * quantitybidfor) * 0.01);
				int nmr = commission + marketcess + 100 + 100 + fmarketcess;
%>
	<tr>
		<td bgcolor="#F2F2F2"><%= lotnumber %></td>
		<td bgcolor="#F2F2F2"><%= lotcost %></td>
		<td bgcolor="#6FC3E8">3000</td>
		<td bgcolor="#6FC3E8"><%= commission %></td>
		<td bgcolor="#6FC3E8"><%= marketcess %></td>
		<td bgcolor="#6FC3E8">100</td>
		<td bgcolor="#D1DF4D">3000</td>
		<td bgcolor="#D1DF4D"><%= fmarketcess %></td>
		<td bgcolor="#D1DF4D">100</td>
		<td bgcolor="#D1DF4D">100</td>
		<td bgcolor="#F2F2F2"><%= nmr %></td>
	</tr>
<%
			}
		}
		else
		{
			System.out.println("No revenues.");
		}
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
</center>

<a class = 'logout' href = "ELogout.do"><b><i>Logout</i></b></a>
<pre><p style="position: fixed; bottom: 20px; left: 180px; font-size: 20px;">*Transportation/Loading Charges   #E-Platform Charges   $Pre-Market Value Addition Charges</p></pre>
</body>
</html>