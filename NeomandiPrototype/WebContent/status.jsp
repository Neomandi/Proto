<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp" pageEncoding="ISO-8859-1" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<style>
.text-center{
font-size:24px !important;
line-height:36px;
}
#div
{   		
	padding:22px;
	margin:10px;
	width:90%;
	background-color:#BFBFBF;
	text-align:center;
	color:darkblue;	 
	font-size:18px;
}
.whiteclsbc
{
	background-color:#ffffff;
	width:5%;
	border-top:1px solid #fff !important;
}
tbody:before 
{
    display: block;
    line-height:10px;
    color: transparent;
}
.from table
{
	margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td, .table tbody tr td, .sum2tab .table tbody tr td 
{
	border-top:2px solid #fff !important;
}

.maindiv
{
	overflow:auto;
}
.img-responsive 
{
    height: 60px;
    width: 65px;
}
.tradtab a
{
    background-color:#0082B2;
}
body 
{
    background-image: url("images/nm-white-background-pattern.png");
    background-repeat:no-repeat;
    background-size:cover;
}
</style>
</head>
<body>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("HH");
	SimpleDateFormat sdf1=new SimpleDateFormat("mm");
	String hours=sdf.format(new Date());
	String minutes=sdf1.format(new Date());
	int hour=Integer.parseInt(hours);
	int minute=Integer.parseInt(minutes);	
%>
<input type="hidden" value="<%=hour%>" id="hour">
<input type="hidden" value="<%=minute%>" id="minute">

<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
if((String)tlbn.getTname()==null)
{    %> 
<script type="text/javascript\">
	 swal({title:'YOU HAVE NOT LOGGED IN PLEASE LOGIN '});  	
	 location='TraderLogin.jsp';
 </script>						 	 
<%
} %>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=tlbn.getTname()%>, <%=session.getValue("trader.product.ribbon")%>.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right"  data-placement="bottom" data-toggle="tooltip" title="Logout" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    					
                         <li ><a href="product.jsp"><%=session.getValue("trader.product.productsearch") %></a></li>
                        <li ><a href="TraderBlock.do"><%=session.getValue("trader.product.holdfunds") %></a></li>
                        <li><a href="TradeorAuction.do"><%=session.getValue("trader.product.auction") %></a></li>
                        <li  class="active"><a href="OrderStatus.do"><%=session.getValue("trader.product.status") %></a></li>
                        <li><a href="Summary1.do"><%=session.getValue("trader.product.summary") %></a></li>
                        <li><a href="TraderProfile.jsp"><%=session.getValue("trader.product.profile") %></a></li>
  </ul>
</div>
</div>
</div>
    		<div class="maindiv">
<%
  int i=1;
  RequestDispatcher rd=null;
  int check=0;
  Myclass2 mc=(Myclass2)request.getAttribute("errmsg");
  List al=mc.getAl();
  if(al.size()==0)
  {
  	%><br><br><br><center><div id='div' style='background-color: #F2F2F2; top: 100px; left: 140px;'><p ><b><%=session.getValue("summary.Emessage") %></b></p></div></center><%
  }
  else
  {
  	for(Object o:al)
  	{
		OrderStatusBean osbn=(OrderStatusBean)o;
		if(osbn.getSlotnumber()!=null && (osbn.getSlotnumber().equals("slot1")||osbn.getSlotnumber().equals("Slot1")))
		{		
%>
<script>
    //**********************************************************THIS IS FOR AUTOREFRESH**************************************************************************************
	setInterval(function()
	{
					funny();
	},1000);
    function funny()
    {
    		xmlhttp = new XMLHttpRequest();
		  	xmlhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    	/* var start=document.getElementById("start").value;
		    	var stop=document.getElementById("stop").value;
		    	var Btime=start;
		    	var Btime1=stop;
		    	var d = new Date(); // for now
		    	d.getHours(); // => 9
		    	d.getMinutes(); // =>  30
		    	d.getSeconds();
		    	var Etime1=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		    	start1 = Etime1.split(":");
		    	end1 =Btime1.split(":");

		    	var startDate1 = new Date(0, 0, 0, start1[0], start1[1], start1[2]);
		    	var endDate1 = new Date(0, 0, 0, end1[0], end1[1], end1[2]);
		    	var td = endDate1.getTime() - startDate1.getTime();			
		    	console.log("difference in time is "+ td);
		    	if(td>0)
		    		{
		    			//	alert("Auction is stll under progress or has not yet started, please visit this page after auction");
		    				document.getElementById("msg").textContent='Auction is still under progress';
		    				document.getElementById('sts').value='';
		    		}
		    	else*/
		    	{
		    		//document.getElementById("msg").textContent='Auction Complete.';
			     	var string=xmlhttp.responseText;		    	 
			    	var status=xmlhttp.responseText;
			    	console.log("status is "+xmlhttp.responseText);
			    	var lotcost=document.getElementById("lotcost<%= osbn.getLotnum()%>").value;		
			    	console.log(status===null);
			    	if(status===null||status.length==0||status.includes('null'))
				    {
				    		document.getElementById("one<%= osbn.getLotnum()%>").className = 'one';
				    		//document.getElementById("sts").value="Waiting for farmer's acceptance";
				    		console.log("inside pending");
				    		
				    		
				    		<%
				    		
				    		if(!session.getValue("alert.msg").equals("kn"))
				    		{%>
				    		document.getElementById("sts").value="Waiting for farmer's acceptance";
				    		<%}%>
				    			
				    			<%
				    			if(session.getValue("alert.msg").equals("kn")){%>
				    			document.getElementById("sts").value='\u0CB0\u0CC6\u0CD6\u0CA4\u0CB0 \u0C92\u0CAA\u0CCD\u0CAA\u0CBF\u0C97\u0CC6\u0C97\u0CBE\u0C97\u0CBF \u0CA8\u0CBF\u0CB0\u0CBF\u0CD5\u0C95\u0CCD\u0CB7\u0CBF\u0CB8\u0CB2\u0CBE\u0C97\u0CC1\u0CA4\u0CCD\u0CA4\u0CBF\u0CA6\u0CC6';
				    			<%}%>
				    			
				    }
			    	else if(status!=null &&(status.includes("rejected")||status.toUpperCase() ==="REJECTED"))
			    	{
			    		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
			    		console.log("inside rej");
			    	//	document.getElementById("sts").value="Farmer has rejected your bid";
			    		
			    		<%
			    		if(!session.getValue("alert.msg").equals("kn"))
			    		{%>
			    		document.getElementById("sts").value="Farmer has rejected your bid";
			    		<%}%>
			    			
			    			<%
			    			if(session.getValue("alert.msg").equals("kn")){%>
			    			document.getElementById("sts").value='\u0CB0\u0CC6\u0CD6\u0CA4\u0CB0\u0CC1 \u0CA8\u0CBF\u0CAE\u0CCD\u0CAE \u0CAC\u0CBF\u0CA1\u0CCD\u0CA1\u0CA8\u0CCD\u0CA8\u0CC1 \u0CA4\u0CBF\u0CB0\u0CB8\u0CCD\u0C95\u0CB0\u0CBF\u0CB8\u0CBF\u0CA6\u0CCD\u0CA6\u0CBE\u0CB0\u0CC6';
			    			<%}%>
			    		
			    		
			    		
			    	}
			    	else if(status!=null&&(status.includes("accepted")||status.includes("ACCEPTED")||status.toUpperCase() === "ACCEPTED"))
			    	{
			        	document.getElementById("one<%= osbn.getLotnum()%>").className = 'two';
			    		console.log("inside acp");
			    	//	document.getElementById("sts").value="Farmer has accepted your bid";
			    		
			    		<%
			    		if(!session.getValue("alert.msg").equals("kn"))
			    		{%>
				    		document.getElementById("sts").value="Farmer has accepted your bid";
			    		<%}%>
			    			
			    			<%
			    			if(session.getValue("alert.msg").equals("kn")){%>
			    			document.getElementById("sts").value='\u0CB0\u0CC6\u0CD6\u0CA4\u0CB0\u0CC1 \u0CA8\u0CBF\u0CAE\u0CCD\u0CAE \u0CAC\u0CBF\u0CA1\u0CCD\u0CA1\u0CA8\u0CCD\u0CA8\u0CC1 \u0C92\u0CAA\u0CCD\u0CAA\u0CBF\u0C95\u0CC6\u0CC2\u0C82\u0CA1\u0CBF\u0CA6\u0CCD\u0CA6\u0CBE\u0CB0\u0CC6';
						<%}%>
			    			
			    			
						
			    		
			    	}
			    	else if(lotcost==0 &&status!=null)
			    	{
			    		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
			    		console.log("inside rej");
			    		//document.getElementById("sts").value="Lot Has Not been Assigned to you";			    		
			    		
			    		<%
			    		if(!session.getValue("alert.msg").equals("kn"))
			    		{%>
				    		document.getElementById("sts").value="Lot Has Not been Assigned to you";
			    		<%}%>
			    			
			    			<%
			    			if(session.getValue("alert.msg").equals("kn")){%>
			    			document.getElementById("sts").value='\u0CA8\u0CBF\u0CAE\u0C97\u0CC6 \u0CAF\u0CBE\u0CB5\u0CC1\u0CA6\u0CC6 \u0CAA\u0CCD\u0CB0\u0CAE\u0CA3\u0CA6 \u0CB0\u0CBE\u0CB6\u0CBF\u0CAF\u0CC2 \u0CA8\u0CBF\u0CAF\u0CC6\u0CC2\u0CD5\u0C9C\u0CA8\u0CC6\u0CAF\u0CBE\u0C97\u0CBF\u0CB2\u0CCD\u0CB2';
						<%}%>
			    		
			    		
			    	}	    
			    	else if(status.includes("not"))
			    	{
			    		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
			    		console.log("inside rej");
			    		//document.getElementById("sts").value="Lot Has Not been Assigned to you";
			    		
			    		<%
			    		if(!session.getValue("alert.msg").equals("kn"))
			    		{%>
				    		document.getElementById("sts").value="Lot Has Not been Assigned to you";
			    		<%}%>
			    			
			    			<%
			    			if(session.getValue("alert.msg").equals("kn")){%>
			    			document.getElementById("sts").value='\u0CA8\u0CBF\u0CAE\u0C97\u0CC6 \u0CAF\u0CBE\u0CB5\u0CC1\u0CA6\u0CC6 \u0CAA\u0CCD\u0CB0\u0CAE\u0CA3\u0CA6 \u0CB0\u0CBE\u0CB6\u0CBF\u0CAF\u0CC2 \u0CA8\u0CBF\u0CAF\u0CC6\u0CC2\u0CD5\u0C9C\u0CA8\u0CC6\u0CAF\u0CBE\u0C97\u0CBF\u0CB2\u0CCD\u0CB2';
						<%}%>
			    	}
			    	
		    	}
		      }
		    };
		    xmlhttp.open("POST", "Status2.do", true);
  			xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xmlhttp.send("number=1");			
    }    
    </script><div class="one" id="one<%= osbn.getLotnum()%>">
    <%
	if(Integer.parseInt(osbn.getLotcost())==0 && osbn.getBestbid()!=null) 
		//out.println("Lot Has Not been Assigned to you");
   { %>
    <script>
    		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';	
    </script>
    <%}
	else if(Integer.parseInt(osbn.getLotcost())!=0) 
	{
		if(((String)osbn.getFarmeraccept()!=null)&&((String)osbn.getFarmeraccept().toUpperCase()).contains("PENDING")) 		 
		{%>
			<script>
					document.getElementById("one<%= osbn.getLotnum()%>").className = 'one';
			</script>
		<%}
		else if(((String)osbn.getFarmeraccept()!=null) &&(((String)osbn.getFarmeraccept().toUpperCase()).contains("ACCEPT"))) 
		{%>
		<script>
				document.getElementById("one<%= osbn.getLotnum()%>").className = 'two';
		</script>
		<%}
		else if(((String)osbn.getFarmeraccept().toUpperCase()).contains("REJECT")) 
		{
		%>
		<script>
				document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
		</script>
		<%}
	}
    %>	
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
	<table>
	<tbody><tr><td  style="background: #bfbfbf;text-align:center; padding:10px;"><%out.println(i); i++; %></td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center">
	<tbody>
	<tr><td><h4><%=session.getValue("trader.trade.lotnumber") %></h4></td><td><input class="form-control" id="usr" type="text" value="<%out.println(osbn.getLotnum());%>" style="text-align: center;" readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.product.produce") %></h4></td><td><input class="form-control" id="usr" type="text" value="<%out.println(osbn.getProduce());%>"style="text-align: center;" readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.trade.qualitygrade") %></h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getQualitygrade()%>" style="text-align: center;"readonly></td></tr>
	<tr><td style="white-space:nowrap !important"><h4><%=session.getValue("trader.trade.availablelotsize") %></h4></td><td><input class="form-control" id="usr" type="text" value="<%=osbn.getQuantityavailable() %>" style="text-align: center;"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;">
	<table align="center">
	<tbody>
	<tr><td><h4><%=session.getValue("trader.trade.lotcost") %>  (<%=session.getValue("trader.trade.rs")%>)</h4></td><td><input class="form-control" id="lotcost<%= osbn.getLotnum()%>" type="text" value="<%= osbn.getLotcost()%>" style="text-align: right;" readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.trade.commission") %>  (<%=session.getValue("trader.trade.rs")%>)</h4></td><td><input class="form-control" id="usr" type="text" value="<%if(osbn.getCommission()==null) out.println("0"); else out.println(osbn.getCommission());  %>" style="text-align: right;" readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.trade.marketcess") %>  (<%=session.getValue("trader.trade.rs")%>)</h4></td><td><input class="form-control" id="usr" type="text" value="<%if(osbn.getMarketcess()==null) out.println("0"); else out.println(osbn.getMarketcess());  %>" style="text-align: right;" readonly></td></tr>
	<tr><td style="white-space:nowrap !important"><h4><%=session.getValue("trader.trade.transportation") %> (<%=session.getValue("trader.trade.rs")%>)</h4></td><td><input class="form-control" id="usr" type="text" style="text-align: right;"  value="<% if(osbn.getVolumesold().equals("0")) out.println("0"); else out.println("3000");%>"readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.trade.myfinalcost") %> (<%=session.getValue("trader.trade.rs")%>)</h4></td><td><input class="form-control" id="usr" type="text" style="text-align: right;" value="<%=osbn.getMyfinalcost()%>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4><%=session.getValue("trader.trade.requiredlotsize") %> (<%=session.getValue("trader.trade.kg")%>)</h4></td><td><h4><%=session.getValue("trader.trade.assignedlotsize") %> (<%=session.getValue("trader.trade.kg")%>)</h4></td></tr>
	<tr><td class="clspad10"><input style="text-align: center;" class="form-control clsheight" id="usr" type="text"  size="10" value="<%=osbn.getQuantityneeded()%>"readonly></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text" style="text-align: center;" value="<%if(osbn.getVolumesold()==null) out.println("0"); else out.println(osbn.getVolumesold());  %>"readonly></td></tr>
	<tr><td><h4><%=session.getValue("trader.trade.bestbid") %> (<%=session.getValue("trader.trade.rs")%>/<%=session.getValue("trader.trade.kg")%>)</h4></td><td><h4><%=session.getValue("trader.trade.mybid") %>(<%=session.getValue("trader.trade.rs")%>/<%=session.getValue("trader.trade.kg")%>)</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"  style="text-align: center;" value="<%if(osbn.getBestbid()==null) out.println("-"); else out.println(osbn.getBestbid());%>"readonly></td><td class="inp clspad10"><input class="form-control" id="usr" type="text" value="<%= osbn.getBidprice()%>"  style="text-align: center;"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-3 col-xs-3 second" id="border">	
	<table align="center"><tbody><tr><td><header><h4 class="text-center"><div id="msg"></div><output id="status<%= osbn.getLotnum()%>"><!-- i have changed id from  statuslotcost<%= osbn.getLotnum()%>--></output></h4>
	<center><output id="sts"><%
		if(Integer.parseInt(osbn.getLotcost())==0 && osbn.getBestbid()!=null) 
			out.println("Lot Has Not been Assigned to you");
		else if(Integer.parseInt(osbn.getLotcost())!=0) 
		{
			if(((String)osbn.getFarmeraccept()!=null)&&((String)osbn.getFarmeraccept().toUpperCase()).contains("PENDING")) 
			{
				out.println("Waiting for farmer's acceptance");
						
				
	    		if(!session.getValue("alert.msg").equals("kn"))
	    		{%>
	    		document.getElementById("sts").value="Waiting for farmer's acceptance";
	    		<%}%>
	    			
	    			<%
	    			if(session.getValue("alert.msg").equals("kn")){%>
	    			document.getElementById("sts").value='\u0CB0\u0CC6\u0CD6\u0CA4\u0CB0 \u0C92\u0CAA\u0CCD\u0CAA\u0CBF\u0C97\u0CC6\u0C97\u0CBE\u0C97\u0CBF \u0CA8\u0CBF\u0CB0\u0CBF\u0CD5\u0C95\u0CCD\u0CB7\u0CBF\u0CB8\u0CB2\u0CBE\u0C97\u0CC1\u0CA4\u0CCD\u0CA4\u0CBF\u0CA6\u0CC6';
	    			<%}%>
				<%
			} 
			else if(((String)osbn.getFarmeraccept()!=null) &&(((String)osbn.getFarmeraccept().toUpperCase()).contains("ACCEPT"))) 
				out.println("Farmer has accepted your bid"); 
			else if(((String)osbn.getFarmeraccept().toUpperCase()).contains("REJECT")) 
				out.println("Farmer has rejected your bid");  
		}%>
		</header></output></center>
	<script> 
	
	<%
	String pattern = "HH:mm:ss";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);	
	String start1 = simpleDateFormat.format(new Date());//current time	
	
	ServletContext context = request.getSession().getServletContext();
	String stop1=(String)context.getAttribute("endtime");// end time of auction						            	
	if(stop1==null)
	{
		simpleDateFormat = new SimpleDateFormat(pattern);	
		stop1 = simpleDateFormat.format(new Date());//current time	
	}
	Date d1 = new SimpleDateFormat(pattern).parse(start1);
	Date d2 = new SimpleDateFormat(pattern).parse(stop1);
	long diffMs = d1.getTime() - d2.getTime();
	long diffSec = diffMs / 1000;
	long min = diffSec / 60;
	long sec = diffSec % 60;
	System.out.println("differnece is "+diffMs);
	if(diffMs<0)
	{
		System.out.println("inside if");
	%>
		document.getElementById('sts').value='';<%
		if(!session.getValue("alert.msg").equals("kn"))
		{
			%>
			document.getElementById("msg").textContent="Auction under Progress";
		<%}%>
		<%
		if(session.getValue("alert.msg").equals("kn")){%>
		document.getElementById("msg").textContent='\u0CB9\u0CB0\u0CBE\u0C9C\u0CC1 \u0CAA\u0CCD\u0CB0\u0C97\u0CA4\u0CBF\u0CAF\u0CB2\u0CCD\u0CB2\u0CBF\u0CA6\u0CC6';
		<%}%>
		<%
	}
	else
	{
		System.out.println("inside else");
		if(!session.getValue("alert.msg").equals("kn"))
		{%>
			document.getElementById("msg").textContent="Auction completed";
		<%}%>
			
			<%
			if(session.getValue("alert.msg").equals("kn")){%>
			document.getElementById("msg").textContent='\u0CB9\u0CB0\u0CBE\u0C9C\u0CC1 \u0CAA\u0CC2\u0CB0\u0CCD\u0CA3\u0C97\u0CC6\u0CC2\u0C82\u0CA1\u0CBF\u0CA6\u0CC6';
			<%}%>
		
	<%}%>
	
	var lotcost=document.getElementById("lotcost<%= osbn.getLotnum()%>").value;
	console.log(lotcost);
	var status=document.getElementById("status<%= osbn.getLotnum()%>").value;
	var clas=document.getElementById("border");
	status=status.toUpperCase();
	if(status.includes("pending")||status.toUpperCase() ==="PENDING")
	{
	//	$("#status").css("border-left: 60px solid yellow;");
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'one';
		console.log("inside pending");
	}
	if(status.includes("rejected")||status.toUpperCase() ==="REJECTED")
	{
	//	$("#status").css("border-left: 60px solid red;");
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
		console.log("inside rej");
	}
	if(status.includes("accepted")||status.includes("ACCEPTED")||status.toUpperCase() === "ACCEPTED")
	{
    	//clas.style.borderLeft= "54px solid green";
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'two';
		console.log("inside acp");
	}
	if(lotcost==0)
	{
	//	$("#status").css("border-left: 60px solid red;");
		document.getElementById("one<%= osbn.getLotnum()%>").className = 'three';
		console.log("inside rej");
	}
	</script></td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
    <script>
   
</script>
    <%}}}%>
 </div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script>
var tt = $( window ).height();
$(".maindiv").height(parseInt(tt)-60);
</script>
</body>
</html>