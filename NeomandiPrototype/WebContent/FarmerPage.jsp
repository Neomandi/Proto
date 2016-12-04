
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1  import java.io.IOException;">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="script.js"></script>
<script>
var start = new Date();
var maxTime = 60000;
var timeoutVal = Math.floor(maxTime/100);
animateUpdate();

function updateProgress(percentage) {
    $('#pbar_innerdiv').css("width", percentage + "%");
    $('#pbar_innertext').text(percentage + "%");
}

function animateUpdate() {
    var now = new Date();
    var timeDiff = now.getTime() - start.getTime();
    var perc = Math.round((timeDiff/maxTime)*100);
    console.log(perc);
      if (perc <= 100) {
       updateProgress(perc);
       setTimeout(animateUpdate, timeoutVal);
      }
}</script>




<style>

</style>
</head>
<body> 
<%@ include file="Ribbon.jsp" %><br>
<font color="#FF1493" size="9">
<u>Farmer Page</u>
</font>

	<%
	String farmerid = request.getParameter("farmerid");
	String lotnum = request.getParameter("lotnum");
	String marketcode = request.getParameter("marketcode");
	String kproduce = request.getParameter("kproduce");
	String produce = request.getParameter("produce");
	String quality = request.getParameter("quality");
	String qunatity = request.getParameter("photo");
	 String pass=request.getParameter("fpwd");  
     
       
     HttpSession session1=request.getSession();  
     session1.setAttribute("pass",pass);  

	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     ResultSet resultSet1 = null;    
     con = JDBCHelper.getConnection();
	
	
	 
	//display aadhar number 
     String s="";
	 String name="";
     try{	
     	if(con == null)
     	{
     		System.out.println("Connection establish failed");
     	}
     	statement = con.createStatement();
     	String sql = "select aadharnum,name from freg where pass='"+pass+"' ";
     	//System.out.println(sql);
     	resultSet = statement.executeQuery(sql);
    	while(resultSet.next()){
     	%>
     	<table><tr><th><font color="blue" size="5">Aadhar number</font></th></tr>
     	<tr><td background="pink"><%= resultSet.getString("aadharnum")%></td></tr>
     	<% s+=resultSet.getString("aadharnum");
     	 name+=resultSet.getString("name");
		        //	System.out.println("aadhar number="+s); %>
		<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
  
</table>
<!-- ------------------------------------------------------------------------------------------------- -->
<!-- display lotdetails -->
<table border="1"><th><font color="#C71585" size="5">Lot number</font></th>
	        			<th><font color="#C71585" size="5">Average price</font></th>
	        			<th><font color="#C71585" size="5">Lot size</font></th>
	        			<th><font color="#C71585" size="5">Quantity bid for</font></th>
	        			<th></th>
	        			<th></th>
	        			<th><font color="#C71585" size="5">Time progress</font></th>
	        			</tr>
<%
//fetching lotnumber 
String lot="";
try{	
	if(con == null)
	{
		System.out.println("Connection establish failed");
	}
	statement = con.createStatement();
	String sql = "select lotnumber,quantity from productentry where farmerid='"+s+"' ";
	//System.out.println(sql);
	resultSet = statement.executeQuery(sql);

    	while(resultSet.next()){
%>
						
	     				<tr><td background="pink"><span><form action=" " >
	     				<input type ="button" name ="lotno1" value =<%=resultSet.getString("lotnumber")%>></form></span>
	        			
				</td><td></td><td><%=resultSet.getString("quantity") %></td><td></td><td><input type="button" value="Accept ">
				</td><td><input type="button" value="Reject"></td>
				<td><div id="pbar_outerdiv" style="width: 140px; height: 18px; border: 1px solid grey; z-index: 1; position: relative; border-radius: 5px; -moz-border-radius: 5px;">
		<div id="pbar_innerdiv" style="background-color: lightgreen; z-index: 2; height: 100%; width: 0%;"></div>
		<div id="pbar_innertext" style="z-index: 3; position: absolute; top: 0; left: 0; width: 100%; height: 100%; color: black; font-weight: bold; text-align: center;">0%</div>
		</div></td></tr>
			<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
	  </table>  
	  
	  
	  <!-- ---------------------------------------------------------------------------------------------- -->  
	   <%
//fetching date and time
String date="";
String time="";
String slot="";
try{	
	if(con == null)
	{
		System.out.println("Connection establish failed");
	}
	statement = con.createStatement();
	String sql = "select Date,Time,Slots from productentry where farmerid='"+s+"' ";
	//System.out.println(sql);
	resultSet = statement.executeQuery(sql);

    	while(resultSet.next()){

			%>
			<font size="5" color="#9785f"></font>
			  <script type="text/javascript">
       window.onload();
    </script>
			<% 
			date+=resultSet.getString("Date");
			time+=resultSet.getString("Time");
			slot+=resultSet.getString("Slots");
			System.out.println("date="+date);
			System.out.println("time="+time);
			System.out.println("slot="+slot);
			 HttpSession session2=request.getSession();  
		     session2.setAttribute("time",time);  
		     session2.setAttribute("slot",slot);  
		     session2.setAttribute("date",date);  
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
	
	</form>
	<br><br>	
	<form action="CountDown.jsp" method="post">
	<font color="violet" ><h3>click to see your auction schedule</h3><input type="submit" value="CLICK"/></font>
	</form>				
</body>
</html>