<%@page import="java.sql.SQLException"%>
<%@page import="com.neomandi.sample.JDBCHelper"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<%
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;    

con = JDBCHelper.getConnection();
	
	
	
	
%>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/script.js"></script>

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


</script>
<script>
$(document).ready(function(){

 $("#tbUser").on('click','.btnDelete',function(){
       $(this).closest('tr').remove();
     });

});

</script>
<link rel="stylesheet" href="Header&footerstyle.css">
<style></style>
<body>
<nav>
	<ul id = "tradernav">
		<li><a href = "ProductBuyingScreen.html">Buy</a></li>
		<li><a href = "OrderStatusScreen.html">Order Status</a></li>
		<li><a href = "Search.html">Product Search</a></li>
		<li><a href = "PaymentScreen.html">Payment</a></li>
		<li><a href = "logout">Logout</a></li>
	</ul>
</nav><br/>

<h2 align="center"><font><strong>Trade List</strong></font></h2>
<form onsubmit = "return false" oninput = "lotcost.value = price.value * 1000; commission.value = ((5*price.value))*10; marketcess.value = price.value*10; finalcost.value = parseInt(lotcost.value) + parseInt(commission.value) + parseInt(marketcess.value) + parseInt(transport.value);">
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr></tr>

<tr bgcolor="#A52A2A">
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

<%
	try{	
		if(con == null)
		{
			System.out.println("Connection establish failed");
		}
		statement = con.createStatement();
		String sql = "SELECT * FROM tradelist";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){ 
	%>
	
	<tr bgcolor="#DEB887">
			
			<td><%= resultSet.getString("lotnum") %></td> <!-- Lot Num  -->
			<td><output name = "lotcost" id = "lotcost"></output></td> <!-- Lot Cost -->
			<td>3000</td> <!-- Transportation Charges -->
			<td><output name = "commission" id = "commission"></output></td> <!-- Commission Charges -->
			<td><output name = "marketcess" id = "marketcess"></output></td> <!-- Market Cess -->
			<td><%= resultSet.getString("marketcode") %></td> <!-- Market Code -->
			<td><%= resultSet.getString("produce") %></td> <!-- Produce -->
			<td><%= resultSet.getString("qualitygrade") %></td> <!-- Grade -->
			<td><input type = "number" id = '<%= resultSet.getString("lotnum") %>' name = "price"/></td> <!-- Best Bid -->
			<td> <input type="button" onclick = "fun<%= resultSet.getString("lotnum") %>()" value="Increment Price" /><script>
				function fun<%= resultSet.getString("lotnum") %>()
				{
				    var value = parseInt(document.getElementById('<%= resultSet.getString("lotnum") %>').value, 10);
				    value = isNaN(value) ? 0 : value;
				    value++;
				    document.getElementById('<%= resultSet.getString("lotnum") %>').value = value;
				}
			</script></td>
			<td><%= resultSet.getString("quantity") %></td> <!-- Quantity -->
			<td><output name = "finalcost" id = "finalcost"></output></td> <!-- My Final Cost -->
			<td><div id="pbar_outerdiv" style="width: 75px; height: 18px; border: 1px solid grey; z-index: 1; position: relative; border-radius: 5px; -moz-border-radius: 5px;">
		<div id="pbar_innerdiv" style="background-color: lightblue; z-index: 2; height: 100%; width: 0%;"></div>
		<div id="pbar_innertext" style="z-index: 3; position: absolute; top: 0; left: 0; width: 100%; height: 100%; color: black; font-weight: bold; text-align: center;">0%</div>
		</div></td>
			<td><input type = 'submit' value = 'Remove'/></td>
			
			
			
		</tr>
<%
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>

 </table>
</form>  
</body>
</html>