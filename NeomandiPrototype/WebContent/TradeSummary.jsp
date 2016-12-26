 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TradeSummaryBean" errorPage="Error.jsp"%>
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
	width: 160px;
	text-decoration: none;
	padding: 10px 20px;
}
td
{
text-align:center
}
</style>
<body>
 <%@ include file="TRibbon.jsp" %><br><br>
<ul><li><a  href="product.jsp">Product Search</a></li>
  <li><a href="TraderBlock.do">Hold Funds</a></li>
  <li><a href=" TradeorAuction.do">Trade/Auction</a></li>
  <li><a class="active" href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li>  <li><a href="TraderProfile.jsp">Your Profile</a></li></ul><br><br>
<center><h1>Trade Summary</h1></center>
<center>
<form action = "tradeSummary.do" method = "post">
 From:  <input type = "date" name="from" id = "from" required/><br/><br/>
 To:    <input type = "date" name="to" id = "to" required/><br/>
<br/>
<input type = "submit" value = "Get Summary" onclick="fun()"/>
</form>
<br/><br/>
<%if(request.getAttribute("tradesummary")!=null)
{
if(request.getAttribute("tradesummary").equals("no"))
{
  %><b>YOU HAVE NOT MADE ANY TRADE OPERATIONS BETWEEN THESE DATE</b>
  <%} else if(request.getAttribute("tradesummary").equals("success"))
  {%>
<table id = 'mytable' border style="width:60%">
	<tr>
		<th>Lot Number</th>
		<th>Quantity Available</th>
		<th>Quantity Bid for</th>
		<th>Quantity Assigned</th>
		<th>Bid Price</th>
		<th>Final Cost</th>
		<th>Auction Result</th>
	</tr>
	<tr>
	<% 
		HttpSession tradesummary=request.getSession(false);
		List al=(List)tradesummary.getAttribute("tradesummary");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			TradeSummaryBean tsb=(TradeSummaryBean)o;%>
			<td><%=tsb.getLotnum() %></td>
			<td><%=tsb.getQuantity() %></td>
			<td><%=tsb.getQuantityneeded() %></td>
			<td><%=tsb.getVolumesold()%></td>
			<td><%=tsb.getBidprice() %></td>
			<td><%=tsb.getMyfinalcost() %></td>
			<td><%=tsb.getResult() %></td>
	</tr>
		<%}%>
</table><br/>
</center>
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
				 doc.cell(1,10,135,20,cell,i);	
				//}
				//else{
					//doc.cell(1,10,90,20,cell,i);
				//}
				
				});
			});
			doc.save('TradeSummary.pdf');
			}
		
		</script>
<center><button id = "excel">Export to XLS</button></center>
<br/>
<center><button id = "word">Export to DOC</button></center><%}}%>
</body>
</html>