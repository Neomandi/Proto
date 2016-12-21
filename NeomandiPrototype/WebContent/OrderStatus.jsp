<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Status</title>
</head>
<style>
table
{
border-collapse: collapse;

}</style>

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

</style>
<body>
<%@ include file="TRibbon.jsp" %><br><br>
<ul><li><a  href="product.jsp">Product Search</a></li>
  <li><a href="TraderBlock.do">Hold Funds</a></li>
  <li><a href=" TradeorAuction.do">Trade/Auction</a></li>
  <li><a class="active" href="TradeSummary.jsp">Trade Summary</a></li>
  <li><a href = "OrderStatus.do">Order Status</a></li></ul><br><br><br><br><br><br><br>

<h2>ORDER STATUS</h2><br><br>
STATUS:PENDING
<br><br>
<table id = "t1" border = "border" style="width:100%">
	<tr>
		<th>LOT NUMBER</th>
		<th>LOT COST</th>
		<th>MARKET CODE</th>
		<th>PRODUCE</th>
		<th>QUALITY GRADE</th>
		<th>BEST BID(Rs/kg)</th>
		<th>MY BID(Rs/kg)</th>
		<th>VOLUME BIDDING FOR(kg)</th>
		<th>VOLUME ASSIGNED(kg)</th>
		<th>MY FINAL COST</th>
		<th>AUCTION RESULT</th>
		<th>STATUS</th>
	</tr>
<%
  RequestDispatcher rd=null;
  int check=0;
  Myclass2 mc=(Myclass2)request.getAttribute("errmsg");
  List al=mc.getAl();
  for(Object o:al)
  {
	  OrderStatusBean osbn=(OrderStatusBean)o;
	if(osbn.getSlotnumber()!=null && osbn.getSlotnumber().equals("slot1"))
	{
		/*List bl=mc.getBl();
		for(Object m1:bl)
		
			MyFinalCostBean mfcb=(MyFinalCostBean)m1;
			if(mfcb.getLotnum().equals(tlb.getLotnum()))
			{}*/
%>
<tr>
<td align="center"><%out.println(" "+osbn.getLotnum()+" ");%></td>
<td align="center"><%System.out.println("lotcost"+osbn.getLotcost()); out.println(" "+osbn.getLotcost()+" ");%></td>
<td align="center" width="110"><%= osbn.getMarketcode() %></td>
<td align="center" width="90"><%= osbn.getProduce() %></td>
<td align="center" width="110"><%= osbn.getQualitygrade() %></td>
<td align="center" width="160"><%= osbn.getBestbid() %></td>
<td align="center"><%out.println(osbn.getBidprice());%> </td>
<td align="center"><%=osbn.getQuantityneeded()%></td>
<td><%=osbn.getVolumesold() %></td>
<td align="center"><%=osbn.getMyfinalcost()%></td>
<td><%=osbn.getResult() %></td>
<td>PENDING</td>
<td align="center"><output type="text" id="status"></td>

</tr>
<%}} 
  while(check!=1)
  {
	  HttpSession farmerstatus=request.getSession(false); 
	  if(farmerstatus.getAttribute("msg")==null)
			out.println(""); 
	  else if(farmerstatus.getAttribute("msg").equals("accept"))
	  {
		request.setAttribute("lotnum",farmerstatus.getAttribute("lotnum"));
		request.setAttribute("accno",farmerstatus.getAttribute("accountnumber"));
		rd=request.getRequestDispatcher("farmeracceptstatus.do");
		try 
		{
			rd.forward(request, response);			
		}			
		catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	  else if(farmerstatus.getAttribute("msg").equals("reject"))
	  {
		  request.setAttribute("lotnum",farmerstatus.getAttribute("lotnum"));
		/* // rd=request.getRequestDispatcher("farmeracceptstatus.do");
		  try 
		  {
		 	rd.forward(request, response);			
		  }			
		  catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  }*/
	  }
  }
%>
	</table>
</body>
</html>