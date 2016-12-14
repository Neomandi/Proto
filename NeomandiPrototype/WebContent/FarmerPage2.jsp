
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" com.neomandi.prototype.JDBCHelper, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet,java.sql.Statement,
   javax.servlet.ServletException,
javax.servlet.http.HttpServlet,
 javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,java.sql.SQLException"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1  import java.io.IOException;
">
<title>Insert title here</title>
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
	width: 100px;
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
    background-color: blue;   
	display: inline;
	display: block;
    color: white;
	width: 150px;
	text-decoration: none;
	padding: 10px 20px;
}

#navigation_container {
   margin: 0 auto;
   width: 960px;
}

.rectangle {
	width: 1200px;
   color: white;
   text-align:center;
   background: #e5592e;
   height: 62px;
   position: relative;
   -moz-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
   box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
   -webkit-border-radius: 34px;
   -moz-border-radius: 3px;
   border-radius: 3px;
   z-index: 200; /* the stack order: foreground */
   margin: 3em 0;
   top: 0px;
}
</style>
</head>
<body>
 <%@ include file="TRibbon.jsp" %><br>
<ul>
   <li><a class="active" href="FarmerPage2.jsp">Auction</a></li>
  <li><a href="Lotdetails.jsp">My Lots</a></li>
	<li><a  href="FarmerTradeSummary.jsp">Trade Summary</a></li>
  </ul>
	<%
	String farmerid = request.getParameter("farmerid");
	String lotnum = request.getParameter("lotnum");
	String marketcode = request.getParameter("marketcode");
	String kproduce = request.getParameter("kproduce");
	String produce = request.getParameter("produce");
	String quality = request.getParameter("quality");
	String qunatity = request.getParameter("photo");
	
	 HttpSession session1=request.getSession(false);  
     String pass=(String)session1.getAttribute("pass"); 
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     ResultSet resultSet1 = null;   
     con = JDBCHelper.getConnection();
	%>
	<h1><font color="orange">
	     <u>Farmer Page</u>
	 </h1></font>
	 <%
	 
     String s="";
     try{	
     	if(con == null)
     	{
     		System.out.println("Connection establish failed");
     	}
     	statement = con.createStatement();
     	String sql = "select aadharnum from freg where pass='"+pass+"' ";
     	System.out.println(sql);
     	resultSet = statement.executeQuery(sql);
    	while(resultSet.next()){
     	%>
     	<table><tr><th><font color="blue" size="5">Aadhar number</font></th></tr>
     	<tr><td background="pink"><%= resultSet.getString("aadharnum")%></td></tr>
     	<% s+=resultSet.getString("aadharnum");
		        	System.out.println("aadhar number="+s); %>
		<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
  
</table>
<table border="1"><th><font color="green" size="5">Lot number</font></th>
	        			<th><font color="green" size="5">Average price</font></th>
	        			<th><font color="green" size="5">Lot size</font></th>
	        			<th><font color="green" size="5">Quantity bid for:</font></th>
	        			<th></th>
	        			<th></th>
	        			<th></th>
	        			</tr>
<%
//fetching lotnumber and hover the button
String lot="";
try{	
	if(con == null)
	{
		System.out.println("Connection establish failed");
	}
	statement = con.createStatement();
	String sql = "select lotnumber,quantity from productentry where farmerid='"+s+"' ";
	System.out.println(sql);
	resultSet = statement.executeQuery(sql);

    	while(resultSet.next()){
%>
	
	     				<tr><td background="pink"><span><form action=" " >
	     				<input type ="button" name ="lotno1" value =<%=resultSet.getString("lotnumber")%>></form></span>
	        			
				</td><td></td><td><%=resultSet.getString("quantity") %></td><td></td><td><input type="button" value="Accept">
				</td><td><input type="button" value="Reject "></td>
				<td><h3>Time progress:</h3><progress value="70" max="100" >70%</progress></td><div></tr>
			<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
	       
	</form>
						
</body>
</html>