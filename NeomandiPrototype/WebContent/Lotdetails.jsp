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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<ul>
   <li><a  href="FarmerPage2.jsp">Auction</a></li>
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
	//String pass= request.getParameter("fpwd");
	
	 HttpSession session1=request.getSession(false);  
     String pass=(String)session1.getAttribute("pass");  
	 
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
    
     con = JDBCHelper.getConnection();
	%>
	<h1><font color="#FF1493">
	     <u>Lot Details</u>
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
     	<table><tr><th><font color="blue" size="5"></font></th></tr>
     	<!-- <tr><td background="pink"><%= resultSet.getString("aadharnum")%></td></tr>  -->
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
<br/><table  width="100%" height="50%" border="2" bgcolor="ADFF2F">
								<tr>
								<h2><b>
								<th>Lotnumber</th>		
								<th>Produce</th>
								<th>Product</th>
								<th>Grade</th>
								<th>Quantity</th></b></h2></tr>
<%
//fetching lotdetails

	        			try{	
							if(con == null)
							{
								System.out.println("Connection establish failed");
							}
							statement = con.createStatement();
							
							String sql5 = "select lotnumber,produce,kindofpro,qualitygrade,quantity from productentry where farmerid='"+s+"'";
							System.out.println(sql5);		
							resultSet = statement.executeQuery(sql5);
							
							while(resultSet.next()){
								
						%>
							
								<tr>
								<td><%= resultSet.getString("lotnumber")%></td>
								<td><%= resultSet.getString("produce")%> </td>
								<td><%= resultSet.getString("kindofpro")%></td>
								<td> <%=resultSet.getString("qualitygrade")%></td>
								<td><%= resultSet.getString("quantity")%></td>
								
							<% 	
							}
							
						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
						</table>

</body>
</html>