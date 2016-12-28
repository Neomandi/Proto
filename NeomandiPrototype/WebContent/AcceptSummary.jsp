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
<style>

 #mytable table, td, th {
    border: 1px solid black;
    text-align:center;
}

table {
    border-collapse: collapse;
    width: 70%;
}

th {
    text-align:center;
}
}

</style>

<body>
	<%@ include file="Fribbon.jsp" %><br><br>
 	<ul>
	 	<li><a href="FarmerMaster.jsp">Auction</a></li>
		<li><a href="Lotdetails.jsp">My Lots</a></li>
		<li><a  class="active" href="FarmerTradeSummary.jsp">Trade Summary</a></li>
	</ul>
 	<center>
 		<font color="#C71585"><h1>Farmer Summary</h1></font>
	</center>
	<center>
		<form action = "" method = "get">
			From:  <input type = "date" id = "from" name="from"/><br/><br/>
 			To:    <input type = "date" id = "to" name="to"/><br/><br/>
			<input type = "submit" value = "Get Summary"/> <br/><br/>
		</form>
		<%  
		HttpSession hs=request.getSession(false);  
     	String pass=(String)hs.getAttribute("pass");  
    	System.out.println(" in getsummary password="+pass);
	    HttpSession hsr=request.getSession(false); 
	    String lotnumber=(String)hsr.getAttribute("lotnumber");
	    hsr.setAttribute("lotnumber", lotnumber);
	    System.out.println(" in getsummary lotnumber="+lotnumber);
	    String lotsize=(String)hsr.getAttribute("lotsize");
	    String quantitysold=(String)hsr.getAttribute("quantitysold");
	    String averageprice=(String)hsr.getAttribute("averageprice");
	    double aprice=Double.parseDouble(averageprice);
	    aprice=aprice*100;
	    aprice=(int)aprice;
	    aprice=aprice/100;
	    double qsold=Double.parseDouble(quantitysold);
	    qsold=qsold*100;
	    qsold=(int)qsold;
	    qsold=qsold/100;
	    double fprice=aprice*qsold;
	    fprice=fprice*100;
	    fprice=(int)fprice;
	    fprice=fprice/100;
		double MUCharge=1*fprice/100;
		double PACharge=100;
		double EPUCharge=100;
		double TCharge=MUCharge+PACharge+EPUCharge;
	    double myEarn=fprice-TCharge;
	    myEarn=myEarn*100;
	    myEarn=(int)myEarn;
	    myEarn=myEarn/100;
	    System.out.println("in getsummary lotsize="+lotsize);
	    double lot=Integer.parseInt(lotsize);
		    String status="";
		    if(lot==qsold)
	    		status+="Fully executed .Accepted by you";
	    			else
	    		status+="Partially executed.Accepted by you";
	    	 	String lotsize1=String.valueOf(lot);
	    	 	double lsize=Double.parseDouble(lotsize1);
	    	 	lsize=lsize*100;
	    	 	lsize=(int)lsize;
	    	 	lsize=lsize/100;
			 	String quantitysold1=String.valueOf(qsold);
			 	double qs=Double.parseDouble(quantitysold1);
			 	qs=qs*100;
			 	qs=(int)qs;
			 	qs=qs/100;
	    %>
		<center>
			<form>
		 	<table  width="65%" height="70%" id = 'mytable' border>
			<tr bgcolor = '#00FF00'>
				<th width="10%" height="5%">From</th>
				<th width="10%" height="5%">To</th>
				<th width="10%" height="5%">Lot number</th>
				<th width="10%" height="5%">Lot size</th>
		   		<th width="10%" height="5%">Quantity Sold </th>
		    	<th width="10%" height="5%">Average price</th>
		    	<th width="10%" height="5%">Final price</th>
		     	<th >Status</th>
		     	<th width="10%" height="5%">My Earnings</th>
		   </tr>
			<tr>
				<td width="10%" height="5%"><%=request.getParameter("from") %></td>
				<td width="10%" height="5%"><%=request.getParameter("to") %></td>
				<td width="10%" height="5%"><%=lotnumber %></td>
				<td width="10%" height="5%"><%=lsize %></td>
				<td width="10%" height="5%"><%=qs%></td>
				<td width="10%" height="5%"><%=aprice%></td>
				<td width="10%" height="5%"><%= fprice%></td>
				<td width="40%" height="5%"><font color="blue"><b><%= status %></b></font></td>
				<td width="10%" height="5%"><%=myEarn %></td>
			</tr>
		</table><br/>
	</form>
</center>
<br/>
<br/>		
 <p align= "center"><b>Export Summary</b></p><br/>
	<center><button id = "pdf">Export to PDF</button></center><br/>
	<center><button id = "excel">Export to XLS</button></center><br/>
	<center><button id = "word">Export to DOC</button></center>
		

</body>
</html>






