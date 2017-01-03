<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import=" com.neomandi.prototype.JDBCHelper,
     com.neomandi.prototype.FarmerHistoryBean,
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
<script type='text/javascript' src='jspdf/jquery-2.1.3.js'></script>
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


function tableToJson(table) {
    var data = [];

    // first row needs to be headers
    var headers = [];
    for (var i=0; i<table.rows[0].cells.length; i++) {
        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
    }
    data.push(headers);
    // go through cells
    for (var i=1; i<table.rows.length; i++) {

        var tableRow = table.rows[i];
        var rowData = {};

        for (var j=0; j<tableRow.cells.length; j++) {

            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

        }

        data.push(rowData);
    }       

    return data;
}

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
		<li><a  href="GetSummary.do"> Summary</a></li>
		<li><a href="FarmerProfile.jsp">My Profile</a>
		<li><a href="FarmerSummaryInt.jsp" class="active">History</a></li>
	</ul>
 	<br/>
 
<center><font color="#C71585"><h1>Farmer Summary</h1></font></center>

<center>
<form action ="FarmerHistory.do" method = "get">

 From:  <input type = "date" id = "from" name="from" required/><br/><br/>
 
 To:    <input type = "date" id = "to" name="to" required/><br/>

 <br/>
<input type = "submit" value = "Get Summary" onclick="fun()"/> 
<br/><br/>
</form>
	<%if(request.getAttribute("farmerhistory")!=null)
		{
			if(request.getAttribute("farmerhistory").equals("no"))
				{
  	%>
  	<b>YOU HAVE NOT MADE ANY TRADE OPERATIONS BETWEEN THESE DATE</b>
  <%
  		} else if(request.getAttribute("farmerhistory").equals("success"))
  {%>
  <table id = 'mytable' border style="width:60%">
  	<tr>
		<th>Lot Number</th>
		<!-- <th>Produce</th> -->
		<th>Quantity </th>
		<th>Quantity Bid for</th>
		<th>Average Price</th>
		<th>Gross Earnings</th>
		<th>Deduction</th>
		<th>Net Earnings</th>
		
	</tr>
	<tr>
	<% 
		HttpSession farmerhistory=request.getSession(false);
		List al=(List)farmerhistory.getAttribute("farmerhistory");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			FarmerHistoryBean fhb=(FarmerHistoryBean)o;%>
			<%String finalprice=fhb.getFinalprice();
			double fprice=Double.parseDouble(finalprice);
			double MUCharge=1*fprice/100;
			double PACharge=100;
			double EPUCharge=100;
			double TCharge=MUCharge+PACharge+EPUCharge;
		    double myEarn=fprice-TCharge;
		    myEarn=myEarn*100;
		    myEarn=(int)myEarn;
		    myEarn=myEarn/100;
		    double deduction=TCharge;
		    deduction=deduction*100;
		    deduction=(int)deduction;
		    deduction=deduction/100;
			 %>
			<td><%=fhb.getLotnumber()  %></td>
			<!-- <td><%=fhb.getProduce()%> -->
			<td><%=fhb.getQuantity() %></td>
			<td><%=fhb.getQuantitybidfor() %></td>
			<td><%=fhb.getAverageprice()%></td>
			<td><%=fhb.getFinalprice() %></td>
			<td><%=deduction %></td>
			<td><%=fhb.getEarnings() %></td>
	</tr>
		<%
		}%>
  </table>
<br/>
<br/>		
<p align= "center"><b>Export Summary</b></p>
<br/>
<center>
<input type="button" value="Export to PDF" onclick="callme()" /></center><br><br>
<script>
		function callme(){
			var table = tableToJson($('#mytable').get(0));
			var doc = new jsPDF('l','pt','letter',true);
			$.each(table, function(i, row){
				$.each(row, function(j,cell){
			//	if(j=="Lot Number"){
				 doc.cell(1,10,110,20,cell,i);	
				//}
				//else{
					//doc.cell(1,10,90,20,cell,i);
				//}
				
				});
			});
			doc.save('FarmerHistory.pdf');
			}
		
		</script>
<center><button id = "excel">Export to XLS</button></center>
<br/>
<center><button id = "word">Export to DOC</button></center><%}}%>
</body>
</html>

</body>
</html>






