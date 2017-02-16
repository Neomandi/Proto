<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.neomandi.prototype.EmployeeLoginBean,java.util.*,com.neomandi.prototype.OrderStatusResult, com.neomandi.prototype.DispatchBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%
EmployeeLoginBean elbn = null;
HttpSession elog = request.getSession();

elog.getAttribute("pwd");
try{
if(((String)elog.getAttribute("name")).equals("e1"))
{}
}
catch(Exception e)
{
	out.println("<script type=\"text/javascript\">");
 	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
 	 out.println("location='EmployeeLogin.jsp';");
	 out.println("</script>");
}
%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1><%=((String)elog.getAttribute("name"))%>, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="Elogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="productentry.html">Product Entry</a></li>
    <li><a href="revenue.html">Revenue</a></li>
    <li class="active"><a href="dispatch.html">Dispatch</a></li>
  </ul>
</div>
</div>
</div> 

<div class="container-fluid dispatch pad">
<div class="row">
  <div class="col-lg-offset-1 col-lg-6 col-sm-12 col-xs-12">
     <div class="row wback">
         <div class="col-lg-11 col-sm-8 col-xs-offset-0 col-xs-12 table-responsive">
				<table class="table">
				<tbody align="center">
				<tr>
				<%  LinkedList<String> ls=new LinkedList<String>();
					HttpSession dispatch=request.getSession();
					OrderStatusResult osrb=(OrderStatusResult)dispatch.getAttribute("al");
					HashMap<String, Integer> a=osrb.getA();
					List al=osrb.getAl();
					System.out.println(al);
				 	for(Object o:al)
				    {
				 	   DispatchBean dp=(DispatchBean)o;
				       int size= a.get(dp.getLotnum());
				       System.out.println("size is"+size);
				       System.out.println("ls.contains(dp.getLotnum())"+ls.contains(dp.getLotnum()));
				       System.out.println(ls);%>
					    <%
				       if(ls.contains(dp.getLotnum()))
				       {
			   %>
				<td class=" cback clsnowrap" rowspan="<%=size%>">
				Lot Number
				</td>
				<td  class="cback" rowspan="<%=size%>">
					<h4><%=dp.getLotnum()%></h4>
				</td>
				<td>
			</td>
				<td colspan="3">
			</td>
				<td class="clsnowrap">
				<% for(int i=1;i<size;i++)
		       {
		    	  System.out.println(i);%>
				<h4><%=dp.getName() %></h4>
				</td>
				<td>
				<h4><%=dp.getQuantityassigned() %></h4>
				</td><%} %>
				</tr>
				 <%}
				    else
				    {   
				    	System.out.println("insde else "+dp.getLotnum());
					    ls.add(dp.getLotnum());
					    System.out.println("inside ls"+ls);
				%>
			<tr><% for(int i=0;i<1;i++)
		           {
		    	    System.out.println(i);%>
			<td colspan="2">
			</td>
			<td class="clsnowrap">
				<h4 ><%=dp.getName() %></h4>
				</td>
				<td>
			<h4><%=dp.getQuantityassigned() %></h4>
				</td><%} %>				
				</tr><%}} %>				
			</tbody>
				</table>
		</div>		
     </div>	 
   </div>
</div>
</div>

<div class="container-fluid dispatch pad dispatchgreen">
<div class="row">
  <div class="col-lg-offset-1 col-lg-6 col-sm-12 col-xs-12">
     <div class="row wback">
         <div class="col-lg-11 col-sm-8 col-xs-offset-0 col-xs-12 table-responsive">
				<table class="table">
				<tbody align="center">
				<tr><td class=" cback clsnowrap" rowspan="5">Lot Number</td><td  class=" cback"rowspan="5"><h4>CBPCARA0173</h4></td><td>
			</td>
				<td colspan="2">
			</td>
				<td class="clsnowrap">
				<h4>Trader 1</h4>
				</td>
				<td>
				<h4>1500</h4>
				</td>
				</tr>
			<tr>
			<td colspan="3">
			</td>
			<td class="clsnowrap">
				<h4>Trader 2</h4>
				</td>
				<td>
			<h4>2000</h4>
				</td>
				
				</tr>
				<tr>
					<td colspan="3">
			</td>
				<td>
				<h4>Trader 3</h4>
				</td>
				<td>
		<h4>1800</h4>
				</td>
				</tr>
				<tr>
					<td colspan="3">
			</td>
				<td class="clsnowrap">
				<h4>Trader 4</h4>
				</td>
				<td>
			<h4>3000</h4>
				</td>
				</tr>
				<tr>
					<td colspan="3">
			</td>
				<td class="clsnowrap">
				<h4>Trader 5</h4>
				</td>
				<td>
				<h4>1200</h4>
				</td>
				</tr>
			</tbody>
				</table>
		</div>
		
     </div>
   </div>
</div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>