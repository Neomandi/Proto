<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import=" com.neomandi.prototype.JDBCHelper, 
     java.io.PrintWriter,
     java.sql.Connection,
     java.sql.ResultSet,
     java.sql.Statement,
     javax.servlet.ServletException,
	 javax.servlet.http.HttpServlet,
	 javax.servlet.http.HttpServletRequest,
	 javax.servlet.http.HttpServletResponse,
	 java.sql.SQLException,
	 java.text.SimpleDateFormat,
	 java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trade Summary</title>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='tableExport.js'></script>
<script type='text/javascript' src='jquery.base64.js'></script>
<script type='text/javascript' src='jspdf/libs/sprintf.js'></script>
<script type='text/javascript' src='jspdf/jspdf.js'></script>
<script type='text/javascript' src='jspdf/libs/base64.js'></script>
<script>
$(document).ready(function(e){
	$('#pdf').click(function(e){
		$('#mytable').tableExport({
			type: 'pdf',
			escape: 'false'
		});
	});
	
	$('#excel').click(function(e){
		$('#mytable').tableExport({
			type: 'excel',
			escape: 'false'
		});
	});
	
	$('#word').click(function(e){
		$('#mytable').tableExport({
			type: 'doc',
			escape: 'false'
		});
	});
});
</script>
</head>
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

<body>
<%@ include file="Fribbon.jsp" %><br><br>
 
<ul>
	 <li><a href="FarmerMaster.jsp">Auction</a></li>
	<li><a href="Lotdetails.jsp">My Lots</a></li>
	<li><a  class="active" href="FarmerTradeSummary.jsp">Trade Summary</a></li>
	
  </ul>
 
<center><font color="#C71585"><h1>Farmer Summary</h1></font></center>

<center>
<form action = "" method = "get">

 From:  <input type = "date" id = "from"/><br/><br/>
 
 To:    <input type = "date" id = "to"/><br/>

<br/>
<input type = "submit" value = "Get Summary"/> 
<br/><br/>
</form>

<%  HttpSession hs=request.getSession(false);  
	     String pass=(String)hs.getAttribute("pass");  
	    System.out.println(" in getsummary password="+pass);
	    
	    HttpSession hsr=request.getSession(false); 
	    String lotnumber=(String)hsr.getAttribute("lotnumber");
	    hsr.setAttribute("lotnumber", lotnumber);
	    System.out.println(" in getsummary lotnumber="+lotnumber);
	    String lotsize=(String)hsr.getAttribute("lotsize");
	    String quantitysold=(String)hsr.getAttribute("quantitysold");
	    String averageprice=(String)hsr.getAttribute("averageprice");
	    String finalprice=(String)hsr.getAttribute("finalprice");
	    System.out.println("in getsummary lotsize="+lotsize);
	    int lot=Integer.parseInt(lotsize);
	    int qsold=Integer.parseInt(quantitysold);
	    String status="";
	    if(lot==qsold)
	    	status+="Fully executed .waiting for your acceptance";
	    	else
	    	status+="partially executed.waiting for your acceptance";
	    	 String lotsize1=String.valueOf(lot);
			 String quantitysold1=String.valueOf(qsold);
	    %>
		
		<center>
		<form>
		 

<table id = 'mytable' border>

		<tr bgcolor = '#00FF00'>
			<th>Lot number</th>
			<th>Lot size</th>
		   <th>Quantity Sold </th>
		    <th>Average price</th>
		     <th>Final price</th>
		     <th>Status</th>
		    
		</tr>
		<tr>
		<td><%=lotnumber %></td>
		<td><%=lotsize1 %></td>
		<td><%=quantitysold1%></td>
		<td><%=averageprice%></td>
		<td><%= finalprice%></td>
		<td><%= status %></td>
		</tr>
		
</table><br/>
</form>
</center>
<br/>
<br/>		

<p align= "center"><b>Export Summary</b></p>
<br/>
<center><button id = "pdf">Export to PDF</button></center>
<br/>
<center><button id = "excel">Export to XLS</button></center>
<br/>
<center><button id = "word">Export to DOC</button></center>


</body>
</html>






