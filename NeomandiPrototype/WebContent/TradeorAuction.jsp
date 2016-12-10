<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*" %>
<html><head>
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
}

$(document).ready(function(){

 $("#tbUser").on('click','.btnDelete',function(){
       $(this).closest('tr').remove();
     });

});

</script>
<link rel="stylesheet" href="Header&footerstyle.css">
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

a.more {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 110px;
	text-decoration: none;
	padding: 10px 20px;
}

table
{
border-collapse: collapse;

}
</style></head>
<body>
 <%@ include file="Ribbon.jsp" %><br><br>
<ul><li><a href="ProductSearch.jsp">Product Search</a></li>
  <li><a  href="TraderBlock.jsp">Block Funds</a></li>
  <li><a class="active"  href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="TradeConsignment.jsp">Track Consignment</a></li></ul><br><br><br>
<nav>
	<ul id = "tradernav">
		<li><a href = "ProductBuyingScreen.html">Buy</a></li>
		<li><a href = "OrderStatusScreen.html">Order Status</a></li>
		<!-- <li><a href = "Search.html">Product Search</a></li>  -->
		<li><a href = "PaymentScreen.html">Payment</a></li>
		<li><a href = "logout">Logout</a></li>
	</ul>
</nav><br/>
<h2 align="center"><font><strong>Trade List</strong></font></h2>
<form onsubmit = "return false" oninput = "lotcost.value = price.value * 1000; commission.value = ((5*price.value))*10; marketcess.value = price.value*10; finalcost.value = parseInt(lotcost.value) + parseInt(commission.value) + parseInt(marketcess.value) + parseInt(transport.value);">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr></tr>
<tr bgcolor="yellow">
		<td><b>Lot Number</b></td>
		<td><b>Lot Cost</b></td>
		<td><b>Transportation Cost</b></td>
		<td><b>Commission Charges</b></td>
		<td><b>Market Cess</b></td>
		<td><b>Market Code</b></td>
		<td><b>Produce</b></td>
		<td><b>Grade</b></td>
		<td><b>Best Bid(Rs/Kg)</b></td>
		<td><b>Revise Bid</b></td>
		<td><b>Quantity</b></td>
		<td><b>My Final Cost</b></td>
		<td><b>Progress</b></td>
		<td></td>
	</tr>   
<%			List<TradeListBean> al=(List<TradeListBean>)request.getAttribute("msg");
			for(Object o:al)
			{
				TradeListBean tlb=(TradeListBean)o;
%><tr bgcolor="#DEB887">
			<td><% out.println(tlb.getLotnum()); %></td>
			<td><output name = "lotcost" id = "lotcost"></output></td> <!-- Lot Cost -->
			<td>3000</td> <!-- Transportation Charges -->
			<td><output name = "commission" id = "commission"></output></td> <!-- Commission Charges -->
			<td><output name = "marketcess" id = "marketcess"></output></td> <!-- Market Cess -->
			<td><%= tlb.getMarketcode() %></td> <!-- Market Code -->
			<td><%= tlb.getProduce() %></td>  
			<td><%= tlb.getQualitygrade() %></td> <!-- Grade -->
			<td><input type = "number" id = '<%= tlb.getLotnum() %>' name = "price" readonly/></td> <!-- Best Bid -->
			<td> <input type="button" onclick = "fun<%= tlb.getLotnum() %>()" value="Increment Price" /></form>
			<script>
				function fun<%=tlb.getLotnum() %>()
				{
				    var value = parseInt(document.getElementById('<%= tlb.getLotnum()%>').value, 10);
				    value = isNaN(value) ? 0 : value;
				    value++;
				    document.getElementById('<%= tlb.getLotnum() %>').value = value;
				}
			</script>  </td>
			<td><%= tlb.getQuantity() %></td> <!-- Quantity -->
			<td><output name = "finalcost" id = "finalcost"></output></td> <!-- My Final Cost -->
			<td><div id="pbar_outerdiv" style="width: 75px; height: 18px; border: 1px solid grey; z-index: 1; position: relative; border-radius: 5px; -moz-border-radius: 5px;">
		<div id="pbar_innerdiv" style="background-color: lightblue; z-index: 2; height: 100%; width: 0%;"></div>
		<div id="pbar_innertext" style="z-index: 3; position: absolute; top: 0; left: 0; width: 100%; height: 100%; color: black; font-weight: bold; text-align: center;">0%</div>
		</div></td>
			<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>"  class="more">REMOVE</a></td>
		</tr>
<%}%>
 </table> 
</body>
</html>