<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,
    java.io.Reader,java.io.OutputStream, 
    com.neomandi.prototype.ProductSearchResultBean,java.io.BufferedInputStream,
    java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,
	  java.io.IOException,
	 java.io.InputStream,
	 java.sql.Blob,
	 java.sql.Connection,
	 java.sql.ResultSet,
	 java.sql.SQLException,
	 java.sql.Statement,
	 java.awt.image.BufferedImage,
 java.io.ByteArrayInputStream,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Search</title>

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

#search {
    width: 90px;  height: 2em;
}
table
{
float: center;
text-align: center;
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
</head>
<body>

<%@ include file="TRibbon.jsp" %>

<%
String lotnum="null";
String quantity="null";
String msg1=(String)request.getAttribute("notlogged");
String msg2=(String)request.getAttribute("productsearchresult");
String msg3=(String)request.getAttribute("errmsg");
String msg4=(String)request.getAttribute("quantity");

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
  <ul><li><a class="active" href="product.jsp">Product Search</a></li>
  <li><a href="TraderBlock.do">Hold Funds</a></li>
  <li><a href="TradeorAuction.do">Trade/Auction</a></li>
  <li><a href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href="OrderStatus.do">Order Status</a></li>
  <li><a href="TraderProfile.jsp">Your Profile</a></li>
  </ul><br>
<form action="ProductSearchInt.jsp" method = "post">
<center>
	<table border style="float:center" width="300">
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
			<th>Auction Slot</th>
			<td><select name = "slot" id = "slot" >
					<option selected>Please Select</option>
					<option value = "slot1" >Slot 1 (10:30-10:35)</option>
					<option value = "slot2">Slot 2 (10:40-10:45)</option>
					<option value = "slot3">Slot 3 (10:50-10:55)</option>
				</select>
		</tr>
	</table></center>
	<br/>
	<input type = "submit" value = "SEARCH" onclick="fun()" style="float: center;margin-right:18px;"/>
	<input type = "reset" value = "RESET" style="float: center;margin-right:14px;"/>
</form>
<br><br><br>
<script>
function fun()
{
	console.log("kproduce="+document.getElementById("kproduce").value+" slot="+document.getElementById("slot").value+" grade="+document.getElementById("quality").value)
	if(document.getElementById("kproduce").value=="base"&&document.getElementById("slot").value=="Please Select")
		alert("You need to choose atleast Slot number or kind of produce")
	else
	{
		console.log("inside else");
		//window.location.href='http://localhost:8080/NeomandiPrototype/TraderLogin.jsp'
	}
}
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
  System.out.println("msg2="+msg2);
  if(msg2!=null||msg3!=null)
  {
	%>
<p align = "right"></p>
<center>
<% 

Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String image = null;  
byte[] imgData = null;
OutputStream os=null;

%>
	<table align="center" border>

						<tr>
						<th>Lot Number</th>
						<th>Market Code</th>
						<th>Produce</th>
						<th>Quality Grade</th>
						<th>Quantity Available</th>
						<th>Quantity Needed</th>
						<th></th>
						</tr>						
					<%
						for(Object o:l)
						{						
							ProductSearchResultBean psr1=(ProductSearchResultBean)o;
							lotnum=psr1.getLotnumber();		
							quantity=psr1.getQuantity();
							System.out.println("in for loop"+psr1.getPhoto());
							
			            	
					%>	<tr>						
						<td >
						<%
							System.out.println(" photo="+psr1);
							System.out.println("image="+psr1.getPhoto());
						image = psr1.getPhoto(); 
						String img[]=image.split("/");
						String photo=img[img.length-2]+"/"+img[img.length-1];
						System.out.println("photo="+photo);
					%>
					<button><div class="tiptext"><%out.println(psr1.getLotnumber()); %>
					<div class="description"><img src="<%=photo %>" alt="cont display" width = "400" height = "300"/></div>
					</div></button>
					<script>
					$(".tiptext").click(function() {
					    $(this).children(".description").show();
					}).mouseout(function() {
					    $(this).children(".description").hide();
					});
					
					</script>
						
						<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
						<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
						<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
						
						<script>
								
									
									
								$(document).ready(function(){
  								$(".mybtn").click(function(){
   								 $( ".dialog" ).dialog( "open" );
  									}); 
  								$( ".dialog" ).dialog({ autoOpen: false });
								});
 									$( window ).load(function() {
        								$(".dialog").hide();
   											 });
								
									
							
						</script> 
						
					  <div class="Table" style="display: table;" >
						<div style="display: table-row;">
						<div style="display: table-cell;" class = "test">
						<button class = "mybtn"  ><%out.println(psr1.getLotnumber()); %></button>
						<div data-role="popup" class="dialog">
						
						
							 <img id="pic" src="<%=photo %>"  width="70%" height="60%"/>
							 
							<figcaption><%=lotnum%></figcaption>
							</div>
							
			</div>
			</div>
			</div>	 --> 
						</td>
						<td><% out.println(psr1.getMarketcode()); %></td>
						<td><% out.println(psr1.getProduce()); %></td>
						<td><% out.println(psr1.getQualitygrade()); %></td>
						<td><% out.println(psr1.getQuantity());%></td>
						<input type="hidden" id="quantity<%= psr1.getLotnumber()%>" value="<%= psr1.getQuantity()%>">
						<input type="hidden" id="product<%= psr1.getLotnumber()%>" value="<%= psr1.getLotnumber()%>">						
						<td><input type="number" name="quantityneeded" id="quantityneeded<%=psr1.getLotnumber() %>" placeholder="enter quantity" required step="100" min="100"/></td>
					    <!-- <td><a href="AddTrade.do?s1=<%=psr1.getLotnumber() %>" onclick="fun()">ADD TO TRADE LIST</a></td> -->
						<td><input type="button" onclick="fun<%=psr1.getLotnumber() %>()" value="ADD TO TRADE LIST"/>	
						<script> 
						function fun<%=psr1.getLotnumber() %>()
						{							
							var total=document.getElementById("quantity<%= psr1.getLotnumber()%>").value;
							var totals=parseInt(total);
							var needed=document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value;
							var neededs=parseInt(needed);
							console.log("QUANTITY needed IS needed="+needed);
							console.log("total is "+totals)
							var product=document.getElementById("product<%= psr1.getLotnumber()%>").value;
							console.log(product);
							var quantity=document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value;
							if(neededs>totals)
							{
								alert("YOU CANT BID FOR MORE QUANTITY THAN AVAILABLE");
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
							}
							else if(isNaN(neededs))
							{
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
								alert("YOU SHOULD ENTER THE QUANTITY YOU WILL BID FOR BEFORE SELECTING THE LOT ");									
							}
							else 
							{
								alert("SUCCESSFULLY ADDED THE LOT "+product+" WITH QUANTITY "+neededs+"  Kgs");
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
								window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs
							}													
						}
						</script></td>
						</tr>
					<%}}}%>					
</table>

</center>
</body>
</html>