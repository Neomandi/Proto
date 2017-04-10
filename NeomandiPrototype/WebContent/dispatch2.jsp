<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage = "Error.jsp" pageEncoding="ISO-8859-1" import="com.neomandi.prototype.EmployeeLoginBean,java.util.*,com.neomandi.prototype.OrderStatusResult, com.neomandi.prototype.DispatchBean"%>
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
    <link href="css/sweetalert.css" rel="stylesheet" type="text/css">
	<script src="js/sweetalert.min.js" type="text/javascript"></script>
<style>
table:nth-child(even) {
    classname: container-fluid dispatch pad;
}
.img-responsive
{
	height:60px;
	width: 65px;
}
.tradtab a{
    background-color:#0082B2;
    }
 
.table > tbody + tbody { 
border-top:0px;
}
 body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"  ></div>
<div class="container-fluid headertop">
<div class="">
<%  
	System.out.println(request.getAttribute("msg"));
	if(((String)request.getAttribute("msg"))!=null )
	{
		 System.out.println("inside if");
		 out.println("<script type=\"text/javascript\">");
	 	 //out.println("alert('Auction yet to happen, hence, no dispatch summary available.');");
	 	 out.println("location='dispatch.jsp';");
		 out.println("</script>");
%>
	 <input type="hidden" value="<%=(String)request.getAttribute("msg")%>" id="msg">
	 <script>
	 var msg=document.getElementById("msg");
	 console.log(msg);
	 if(msg.includes("fail"))
		// alert('Auction yet to happen, hence, no dispatch summary available.');
	 location='dispatch.jsp';
	 </script>
	 <% 
}
else{
EmployeeLoginBean elbn = null;
HttpSession elog = request.getSession();
elog.getAttribute("epwd");
try{
if(((String)elog.getAttribute("ename")).equals("e1"))
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
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=((String)elog.getAttribute("ename"))%>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" data-toggle="tooltip" title="Logout" href="ELogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="ProductEntry.jsp">Product Entry</a></li>
    <li><a href="Revenue.jsp">Revenue</a></li>
    <li class="active"><a href="Dispatch.do">Dispatch</a></li>
  </ul>
</div>
</div>
</div> 
<%  				LinkedList<String> ls=new LinkedList<String>();
					HttpSession dispatch=request.getSession();
					OrderStatusResult osrb=(OrderStatusResult)dispatch.getAttribute("al");
					HashMap<String, Integer> a=osrb.getA();
					List al=osrb.getAl();
					int z=1;
					int k=0;
				/* 	for(Object o:al)
				    {
				 	   DispatchBean dp=(DispatchBean)o;
				       int size= a.get(dp.getLotnum());
				       System.out.println("size is"+size);
				       //System.out.println("ls.contains(dp.getLotnum())"+ls.contains(dp.getLotnum()));
				       System.out.println(ls);*/%> 				      				
				<%
				for(Object o:al)
			    {
						 System.out.println("neyxt loop");			    
				 	   DispatchBean dp=(DispatchBean)o;
				       int size= a.get(dp.getLotnum());
				       System.out.println("size is"+size+" lotnum is "+dp.getLotnum());
				       //System.out.println("ls.contains(dp.getLotnum())"+ls.contains(dp.getLotnum()));
				       System.out.println(ls);
				       if(!ls.contains(dp.getLotnum()))
				       {			    	 
%>
					   <input type="hidden" id="num" value="<%out.println(z);%>">
				       <script>
				       console.log(document.getElementById("num").value);
				       if((document.getElementById("num").value)%2==0)
				    	{
				    	   document.getElementById("text").className = 'container-fluid dispatch pad dispatchgreen';
				   		}
				       </script>  
<div class="container-fluid dispatch pad" id="text">
<div class="row">
  <div class="col-lg-offset-1 col-lg-6 col-sm-12 col-xs-12">
     <div class="row wback">
         <div class="col-lg-11 col-sm-8 col-xs-offset-0 col-xs-12 table-responsive">
			   <table class="table">
			   <tr>
			   		
			   		<th   ></th>
			   		<th   ></th>
					<th  rowspan="<%=size%>" style="text-align:center;">Lot Number</th>
					<th ></th>
					<th colspan="2"></th>
					<th  style="text-align:center;">Trader Name</th>
					<th  colspan="2" style="text-align:center;">Quantity(kg)</th>
					<th   ></th>
			   		<th   ></th>
				</tr>
				<tbody align="center">				
				<tr>
				<td rowspan="<%=size%>">
				</td>
				<td  rowspan="<%=size%>">
				</td>
				<td   rowspan="<%=size%>">
					<h4><%=dp.getLotnum()%></h4>
				</td>
				<td>
			</td>
				<td colspan="2">
			</td>
				<td class="clsnowrap">
				<% for(int i=0;i<1;i++)
		      	   {
					z=z+1;		      	   
					ls.add(dp.getLotnum());
		    	  //System.out.println(i);%>
				<h4><%out.println(dp.getName());System.out.println(dp.getName()); %></h4>
				</td>
				<td>
				<h4><%=dp.getQuantityassigned() %></h4>
				</td><%} %>
				</tr>
				 <%}
				    else
				    {   
				    	k=k+1;
				    	System.out.println("insde else "+dp.getLotnum());					    
					   // System.out.println("inside ls"+ls);
				%><tr>
			<td colspan="3">
			</td>
			<td class="clsnowrap">
				<h4 ><%out.println(dp.getName());System.out.println(dp.getName()); %></h4>
				</td>
				<td>
			<h4><%=dp.getQuantityassigned() %></h4>
				</td><%%>				
				</tr><%} System.out.println("k"+k+"size"+size); if(size!=(k+1)){ continue;} else if(size==(k+1)){System.out.println("*****************"); k=0;%>				
			</tbody>
		  </table>
		</div>		
     </div>	 
   </div>
</div>
</div><%}}}%><!-- 
<div class="container-fluid dispatch pad dispatchgreen" id="text">
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
</div>-->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>