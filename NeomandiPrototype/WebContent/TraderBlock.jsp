<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Block Funds</title>
<head>
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
</style></head>
<body>
<%@ include file="Ribbon.jsp" %><br><br>
 
<ul><li><a href="ProductSearch.jsp">Product Search</a></li>
  <li><a  class="active" href="TraderBlock.jsp">Block Funds</a></li>
  <li><a href="TradeorAuction.jsp">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="TradeConsignment.jsp">Track Consignment</a></li></ul>

<font color="red">
<u><h2>Block Funds</h2></u>
</font>
<form action=" " method="post">
<font color="green"><h3>Choose Account:
<select>
</select>
</h3></font>
<font color="blue" >
<h3>Account Details:<br/>
<input type="text" name="a1"/><br/>
<input type="text" name="a2"/><br/>
<input type="text" name="a3"/><br/>
<input type="text" name="a4"/><br/>
<input type="text" name="a5"/><br/>
</h3>
</font>
<input type="button" name="balance" value="Get Balance"/><br/><br/>
Balance Available:<input type="text" name="a5"/><br/><br/>
Enter amount to be blocked:<input type="text" name="a5"/><br/><br/>
<input type="button" name="block" value="BLOCK"/><br/><br/>
</form>
</body>