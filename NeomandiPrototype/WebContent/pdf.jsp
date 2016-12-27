<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TradeSummaryBean, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='tableExport.js'></script>
<script type='text/javascript' src='jquery.base64.js'></script>
<script type='text/javascript' src='jspdf/libs/sprintf.js'></script>
<script type='text/javascript' src='jspdf/jspdf.js'></script>
<script type='text/javascript' src='jspdf/libs/base64.js'></script>
<script type='text/javascript' src='jspdf/jquery-2.1.3.js'></script>
<script>
$(document).ready(function(e){
		$('#mytable').tableExport({
			type: 'pdf',
			escape: 'false'
		});
})
	</script>
</head>
<body>
<table id = 'mytable' >
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
		for(Object o:al)
		{
			TradeSummaryBean tsb=(TradeSummaryBean)o;%>
			<td><%=tsb.getLotnum() %></td><br>
			<td><%=tsb.getQuantity() %></td>
			<td><%=tsb.getQuantityneeded() %></td>
			<td><%=tsb.getVolumesold()%></td>
			<td><%=tsb.getBidprice() %></td>
			<td><%=tsb.getMyfinalcost() %></td>
			<td><%=tsb.getResult() %></td>
	</tr>
		<%}%></table>
		<a href="javascript:callme()"></a>
		<script>
		function callme(){
			var table = tableToJson($('#mytable').get(0));
			var doc = new jsPDF('l','pt','letter',true);


			$.each(table, function(i, row){
				$.each(row, function(j,cell){
				if(j=="Lot Number" | j==1){
				 doc.cell(1,10,190,20,cell,i);	
				}
				else{
					doc.cell(1,10,90,20,cell,i);
				}
				
				});
			});

			doc.save('TradeSummary.pdf');
			}
		
		</script>
</body>
</html>