<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import=" com.neomandi.prototype.JDBCHelper, 
    java.io.PrintWriter, java.sql.Connection, 
    java.sql.ResultSet,java.sql.Statement,
    javax.servlet.ServletException,
	javax.servlet.http.HttpServlet,
 	javax.servlet.http.HttpServletRequest,
	javax.servlet.http.HttpServletResponse,
	java.sql.SQLException,java.text.SimpleDateFormat,
	java.util.*"
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
.tiptext {
    background:#ccc;
   
    padding:5px;
    width:100px;
}
.description {
    display:none;
    position:absolute;
   
    width:400px;
    height:400px;
}

</style>

</head>
<body>
<%
	
	 HttpSession hs1=request.getSession(false);  
     String pass=(String)hs1.getAttribute("pass");  
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     con = JDBCHelper.getConnection();
%>
<%@ include file="Fribbon.jsp" %><br><br>

<ul>
   	 <li><a href="FarmerMaster.jsp" >Auction</a></li>
 	 <li><a class="active"  id="ld" href="Lotdetails.jsp">My Lots</a></li>
	 <li><a class="classbeauty" id="ts" href="GetSummary.do"> Summary</a></li>
	 <li><a href="FarmerProfile.jsp">My Profile</a>
	 <li><a href="FarmerSummaryInt.jsp">History</a></li>
	
</ul>
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
  			s+=resultSet.getString("aadharnum");
		    System.out.println("aadhar number="+s);
		
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
  <br/><br/>
  <table  width="65%" height="50%" border="2" bgcolor="ADFF2F">
		<tr>
			<h2><b>
				<th>Lotnumber</th>		
				<th>Produce</th>
				<th>Product</th>
				<th>Grade</th>
				<th>Quantity</th>
			</b></h2>
		</tr>						
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
			<td>
			 <%String lotnumber=resultSet.getString("lotnumber");
			 String imgsrc="ProductImages/"+lotnumber+".jpg";
			%>
			<button><div class="tiptext"><%=lotnumber %>
					<div class="description"><img src="<%=imgsrc %>" alt="cont display" width = "400" height = "300"/></div>
					</div></button>
					<script>
					$(".tiptext").click(function() {
					    $(this).children(".description").show();
					}).mouseout(function() {
					    $(this).children(".description").hide();
					});
					
					</script>
			 
			 
			</td>
			<td><%= resultSet.getString("produce")%> </td>
			<td><%= resultSet.getString("kindofpro")%></td>
			<td><%=resultSet.getString("qualitygrade")%></td>
			<td><%= resultSet.getString("quantity")%></td>
		</tr>						
<% 	
		}
	} catch (Exception e) {
		e.printStackTrace();
}
%>
</table>

</body>
</html>