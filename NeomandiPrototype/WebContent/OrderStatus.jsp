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
<body>
<%@ include file="TRibbon.jsp" %><br><br>
<h2>ORDER STATUS</h2><br><br>
STATUS:PENDING
<br><br>
<table id = "t1" border = "border">
	<tr>
		<th>Lot Number</th>
		<th>Lot_Cost</th>
		<th>Market Code</th>
		<th>Produce</th>
		<th>Quality Grade</th>
		<th>Best_Bid(Rs/kg)</th>
		<th>My_Bid(Rs/kg)</th>
		<th>Volume_Bidding_for(kg)</th>
		<th>My_Final_Cost</th>
		<th>Status</th>
	</tr>
<%
  RequestDispatcher rd=null;
  int check=0;
  Myclass2 mc=(Myclass2)request.getAttribute("errmsg");
  List al=mc.getAl();
  for(Object o:al)
  {
	TradeListBean tlb=(TradeListBean)o;
	if(tlb.getSlotnumber()!=null && tlb.getSlotnumber().equals("slot1"))
	{
		List bl=mc.getBl();
		for(Object m1:bl)
		{
			MyFinalCostBean mfcb=(MyFinalCostBean)m1;
			if(mfcb.getLotnum().equals(tlb.getLotnum()))
			{
%>
<tr>
<td align="center"><%out.println(" "+tlb.getLotnum()+" ");%></td>
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ System.out.println("lotcost"+mfcb.getLotcost()); out.println(" "+mfcb.getLotcost()+" ");} else{ System.out.println(""); System.out.println("");}%></td>
<td align="center" width="110"><%= tlb.getMarketcode() %></td>
<td align="center" width="90"><%= tlb.getProduce() %></td>
<td align="center" width="110"><%= tlb.getQualitygrade() %></td>
<td align="center" width="160"><%= mfcb.getBestbid() %></td>
<td align="center"><%if(tlb.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%> </td>
<td align="center"><%=tlb.getQuantityneeded()%></td>
<td align="center"><%=mfcb.getMyfinalcost()%></td>
<td align="center"><output type="text" id="status"></td>
<td>PENDING</td>
</tr>
<%}}}} 
  while(check!=1)
  {
	  HttpSession farmerstatus=request.getSession(false); 
	  if(farmerstatus.getAttribute("msg")==null)
			out.println(""); 
	  else if(farmerstatus.getAttribute("msg").equals("accept"))
	  {
		request.setAttribute("lotnum",farmerstatus.getAttribute("lotnum"));
		request.setAttribute("msg", "accept");
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
		  request.setAttribute("msg", "reject");
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