<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, com.neomandi.prototype.ProductSearchResultBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Neomandi | Product Search</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

a.moree {
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

a.more {
    text-align: center;
    border: 1px solid black;
    border-radius: 9px 9px 9px 9px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 60px;
	text-decoration: none;
	padding: 10px 20px;
}

</style>
</head>
<body>
<%@ include file="Ribbon.jsp" %>
<%String lotnum="null";
String msg1=(String)request.getAttribute("notlogged");
String msg2=(String)request.getAttribute("productsearchresult");
String msg3=(String)request.getAttribute("errmsg");

if(msg1!=null)
{
	 out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
}
else
{
	HttpSession psr=request.getSession(false);
	List<ProductSearchResultBean> l=(List<ProductSearchResultBean>)psr.getAttribute("beans");
 %>
 <br><br>
<ul><li><a class="active" href="ProductSearch.do">Product Search</a></li>
  <li><a  href="TraderBlock.jsp">Block Funds</a></li>
  <li><a href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="TradeConsignment.jsp">Track Consignment</a></li></ul>

<br><br><br>
<form action = "ProductSearchInt.jsp" method = "post">
	<table border>
		<tr>
			<th>Kind of Produce</th>
			<td><select name = "kproduce" id = "kproduce">
					<option selected value = "base">Select Produce</option> 
					<option value = "Vegetable">VEGETABLES</option>
					<option value = "FRUITS">FRUITS</option>
					<option value = "GRAINS">GRAINS</option>
					<option value = "PULSES">PULSES</option>
				</select></td>
		</tr>
		<tr>
			<th>Produce</th>
			<td><select name = "produce" id = "produce" >
					<option>Choose Produce first</option>
				</select>
		</tr>		
		<tr>
			<th>Quality Grade</th>
			<td><select name = "quality" id = "quality" >
					<option selected>Please Select</option>
					<option value = "A">A</option>
					<option value = "B">B</option>
					<option value = "C">C</option>
				</select>
		</tr>
		<!-- <tr>
			<th>State</th>
			<td><select id = "state" onchange = "populate('state','district');">
					<option selected value = "base">Please Select</option>
					<option value = "andhra Pradesh">Andhra Pradesh</option>
					<option value = "arunachal Pradesh">Arunachal Pradesh</option>
					<option value = "assam">Assam</option>
					<option value = "bihar">Bihar</option>
					<option value = "chhattisgarh">Chhattisgarh</option>
					<option value = "goa">Goa</option>
					<option value = "gujarat">Gujarat</option>
					<option value = "haryana">Haryana</option>
					<option value = "himachal Pradesh">Himachal Pradesh</option>
					<option value = "jammu & Kashmir">Jammu & Kashmir</option>
					<option value = "jharkhand">Jharkhand</option>
					<option value = "karnataka">Karnataka</option>
					<option value = "kerala">Kerala</option>
					<option value = "madhya Pradesh">Madhya Pradesh</option>
					<option value = "maharashtra">Maharashtra</option>
					<option value = "manipur">Manipur</option>
					<option value = "meghalaya">Meghalaya</option>
					<option value = "mizoram">Mizoram</option>
					<option value = "nagaland">Nagaland</option>
					<option value = "odisha">Odisha</option>
					<option value = "punjab">Punjab</option>
					<option value = "rajasthan">Rajasthan</option>
					<option value = "sikkim">Sikkim</option>
					<option value = "tamil Nadu">Tamil Nadu</option>
					<option value = "telangana">Telangana</option>
					<option value = "tripura">Tripura</option>
					<option value = "uttar Pradesh">Uttar Pradesh</option>
					<option value = "uttarakhand">Uttarakhand</option>
					<option value = "west Bengal">West Bengal</option>
				</select></td>
		</tr>
		<tr>
			<th>District</th>
			<td><select id = "district">
					
				</select></td>
		</tr> -->
		<tr>
			<th>Market Code</th>
			<td><input type = "text" id = "marketcode"/></td>
		</tr>
	</table>
	<br/>
	<input type = "submit" value = "SEARCH" style="float: left;"/>
</form>
<br><br><br>
<script>
$("#kproduce").change(function() {
	   $("#produce").load("ProduceData/" + $(this).val() + ".txt");
	   console.log("ProduceData/" + $(this).val()+ ".txt");
	});
</script>
<script>
function populate(s1, s2)
{
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if(s1.value == "karnataka")
	{
		var optionArray = ["|", "bagalkot|Bagalkot", "bengaluru Urban|Bengaluru Urban", "bengaluru Rural|Bengaluru Rural", "belagavi|Belagavi", "bellary|Bellary", "bidar|Bidar", "chamarajanagar|Chamarajanagar", "chikballapur|Chikballapur", "chikkamagaluru|Chikkamagaluru", "chitradurga|Chitradurga", "dakshina Kannada|Dakshina Kannada", "davanagere|Davanagere", "dharwad|Dharwad", "gadag|Gadag", "kalaburagi|Kalaburagi", "hassan|Hassan", "haveri|Haveri", "kodagu|Kodagu", "kolar|Kolar", "koppal|Koppal", "mandya|Mandya", "mysuru|Mysuru", "raichur|Raichur", "ramanagara|Ramanagara", "shivamogga|Shivamogga", "tumakuru|Tumakuru", "udupi|Udupi", "uttara Kannada|Uttara Kannada", "vijayapura|Vijayapura", "yadgir|Yadgir"];	
	}
	for(var option in optionArray)
	{
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}
</script>
<%
  if(msg2!=null||msg3!=null)
  {
	%>
<p align = "right"></p>
<table align="center" border>

						<tr>
						<th>Lot Number</th>
						<th>Market Code</th>
						<th>Produce</th>
						<th>Quality Grade</th>
						<th>Quantity</th>
						<th></th>
						</tr>
						
					<%
						for(Object o:l)
						{						
							ProductSearchResultBean psr1=(ProductSearchResultBean)o;
							lotnum=psr1.getLotnumber();							
					%>
						<tr>
						<th><% out.println(psr1.getLotnumber()); %></th>
						<th><% out.println(psr1.getMarketcode()); %></th>
						<th><% out.println(psr1.getProduce()); %></th>
						<th><% out.println(psr1.getQualitygrade()); %></th>
						<th><% out.println(psr1.getQuantity());%></th>
						<td><a href ="AddTrade.do?s1=<%= lotnum %>" class="moree">Add to trade List</a></td>
						</tr>
					<%
						}
					%>					
</table>
<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center" class="more"><b><% if(msg != null)
							out.print(msg);%></b></p>
<%}
 else
{}}%>
</body>
</html>