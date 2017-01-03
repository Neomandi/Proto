<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, com.neomandi.prototype.ProductSearchResultBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%// = (List)request.getAttribute("productsearch");

String msg1=(String)request.getAttribute("notlogged");
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
List<ProductSearchResultBean> l=(List)psr.getAttribute("beans");

%>
<p align = "center"></p>
<center><table border>

						<tr>
						<th>Lot Number</th>
						<th>Market Code</th>
						<th>Produce</th>
						<th>Quality Grade</th>
						<th>Quantity</th>
						<th></th>
						</tr>
						
					<% for(Object o:l)
						{
							ProductSearchResultBean psr1=(ProductSearchResultBean)o;
							String lotnum=psr1.getLotnumber();
							
					%>
						<tr>
						<th><% out.println(psr1.getLotnumber()); %></th>
						<th><% out.println(psr1.getMarketcode()); %></th>
						<th><% out.println(psr1.getProduce()); %></th>
						<th><% out.println(psr1.getQualitygrade()); %></th>
						<th><% out.println(psr1.getQuantity()); %></th>
						<td><a href ="AddTrade.do?s1=<%= lotnum %>">Add to trade List</a></td>
						</tr>
					<%
						}
					%>					
</table></center>
<center>

<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null)
							out.print(msg);
									}%></b></p><br><br><br><a href = "ProductSearch.jsp"><b>Back</b></a></center>
</body>
</html>