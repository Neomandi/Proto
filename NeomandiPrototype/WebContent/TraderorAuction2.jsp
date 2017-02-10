<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,java.io.Reader,java.io.OutputStream, 
    com.neomandi.prototype.ProductSearchResultBean,java.io.BufferedInputStream,
    java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,
	  java.io.IOException,
	 java.io.InputStream,
	 java.sql.Blob,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*,
	 java.sql.Connection,
	 java.sql.ResultSet,
	 java.util.Date,
	 java.sql.SQLException,
	 java.sql.Statement,
	 java.awt.image.BufferedImage,
 java.io.ByteArrayInputStream,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.text.SimpleDateFormat,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO" errorPage="Error.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
$( "p" ).click(function() {
  $( this ).toggleClass( "highlight" );
});
</script>
<style>
.maindiv{
overflow:auto;
}
</style>
<script>
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
  	  panel.style.maxHeight = null;
    } else {
  	  panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}
</script>
<style>
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

button.accordion:after {
    content: '\002B';
    color: #777;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

button.accordion.active:after {
    content: "\2212";
}

div.panel {
    padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>
<style>

.whiteclsbc{
background-color:#ffffff;
width:5%;
border-top:1px solid #fff !important;
}
tbody:before {
    display: block;
    line-height:10px;
    color: transparent;
}
.from table{
margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td, .table tbody tr td, .sum2tab .table tbody tr td {
border-top:0px solid #fff !important;}
</style>
</head>
<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Trade1, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li><a href="product.jsp">Product Search</a></li>
    <li><a href="holdfunds.html">Hold Funds</a></li>
    <li class="active"><a href="TradeorAuction.do">Trade</a></li>
    <li><a href="orderstatus.html">Status</a></li>
	<li><a href="tradesummary.html">Summary</a></li>
    <li><a href="traderprofile.html">My Profile</a></li>
  </ul>
</div>
</div>
</div>
    		<div class="maindiv">
<div class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord"><span>Auction Slot-1</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<!--<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#accord">Simple collapsible</button>-->
  <div id="accord"> 
        <!----row1--->
	<div class="one">
	<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
	<div class="table-responsive"> 
<%
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
    String msg=(String)request.getAttribute("msg");
    System.out.println("msg"+msg);
    if(msg!=null)
    {
		  out.println("<script type=\"text/javascript\">");
	  	  out.println("alert('your final cost has increased blocked amount!!! we are taking you to block funds page...block more money for more profit ');");
	  	  out.println("window.location='TraderBlock.do';");
	 	  out.println("</script>");
	}
	else
	{	
        System.out.println("inside else()");
		String msg2=(String)request.getAttribute("assigned");
		if(msg2!=null)
		{
			out.println("<script type=\"text/javascript\">");
		  	out.println("alert('You need to enter the number of bid to be increased before');");
		  	out.println("location='TradeorAuction.do';");
		 	out.println("</script>");
		}
		else
		{
			int i=0;
			int finalcostlist=0;
			int tradelist=0;
			if(request.getAttribute("remove")==null)//not removed any row
			{
				HttpSession traderlistbean=request.getSession(false);
				List<TradeListBean> al=(List<TradeListBean>)traderlistbean.getAttribute("tlb");
				System.out.println("inside traderlist bean"+al);
				for(Object o:al)
				{
					TradeListBean tlb=(TradeListBean)o;
					System.out.println("produce is "+tlb.getProduce()+" slotnumber of that produce is "+tlb.getSlotnumber());
					if(tlb.getSlotnumber()!=null && (tlb.getSlotnumber().equals("slot1")||tlb.getSlotnumber().equals("Slot1")))
					{				
						HttpSession MyFinalCost=request.getSession(false);
						List l=(List)MyFinalCost.getAttribute("MyFinalCost"); 
						System.out.println("list l is "+l);
						for(Object m:l)
						{	
							System.out.println("myfinalcostbean list size"+l.size()+l);
							MyFinalCostBean mfcb=(MyFinalCostBean)m;
							if(mfcb.getLotnum().equals(tlb.getLotnum()))
							{
								System.out.println("lot number is "+mfcb.getLotnum()+" cost->"+mfcb.getLotcost()+" quantityassigned->"+mfcb.getQuantityassigned());
%>  <table>
	<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">1</td>
	<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
	<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="demo1<%=tlb.getLotnum()%>" type="text" value="<%= tlb.getLotnum() %>" readonly></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlb.getProduce() %>" readonly></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text" value="<%=tlb.getQualitygrade() %>" readonly></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text" value="<%= tlb.getQuantity()%>" readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="demo2<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getLotcost() %>" readonly></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="demo3<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getCommission() %>" readonly></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="demo4<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getMarketcess()%>" readonly></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text" value="3000" readonly></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="demo8<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getMyfinalcost() %>"readonly></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10" value="<%=tlb.getQuantityneeded()%>" readonly></td>
	<td class="clspadt5"><input class="form-control clsheight" id="demo7<%=tlb.getLotnum() %>" type="text" value="<%=mfcb.getQuantityassigned()%>" readonly></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="demo5<%=tlb.getLotnum()%>" type="text" value="<%=mfcb.getBestbid()%>" readonly></td><td class="inp clspad10"><input class="form-control" id="demo6<%=tlb.getLotnum()%>" type="text" value="<%= mfcb.getPrice()%>"></td></tr>
	</tbody>
	</table>
	</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
	<tr><td><br><a href="#" onclick="fun<%out.print(tlb.getLotnum());%>();" class="sub">Submit</a></td></tr></tbody></table>
	</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
	</td></tr>
	<%
SimpleDateFormat sdf=new SimpleDateFormat("hh:mm:ss"); 
%>
<input type="hidden" id="time" value="<%=sdf.format(new Date())%>"/>
	
	<script>
	function fun<%=tlb.getLotnum()%>(){
	var Etime=document.getElementById("time").value;
	var Btime="10:30:00";
	var Btime1="10:35:00";

	start = Etime.split(":");
	end =Btime.split(":");
	var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
	var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
	 diff = endDate.getTime() - startDate.getTime();
	console.log("end time inside submit function is "+Btime);
	console.log("current time inside submit function is"+Etime);
	var hours = Math.floor(diff / 1000 / 60 / 60);
	//diff -= hours* 60 * 60;
	var seconds= Math.floor(diff /1000);
	var minutes = Math.floor(diff / 1000 / 60);
	var res3=0;	
	if(seconds>60)
	{
			res1=seconds%60;
			res2=Math.floor(seconds/60);
					
			seconds=res1;
			minutes=res2;
	}
	if(minutes>60)
	{
			res1=minutes%60;
			res3=Math.floor(minutes/60);
					
			hours=res3;
			minutes=res1;
	}

	var timedifference=+hours+":"+minutes+":"+seconds;
	console.log("time difference isss "+timedifference);	
	if(timedifference.includes("-"))
	{
	      var i= document.getElementById("number<%out.print(tlb.getLotnum());%>").value;
		  var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
		  if(i==""||document.getElementById("number<%out.print(tlb.getLotnum());%>").value==null)
		  { 
			  alert('YOU SHOULD ENTER YOUR NEW BID BEFORE SUBMITING');
		  }
	      else
		  {
			var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
			var assigned=new  Number(assigneds);
			var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
			var needed=new  Number(neededs);
			if(assigned-needed==0)
			{
				console.log("assigned=needed");
			}
			else
			{
			  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
			  var currentbid=document.getElementById("demo6<%= tlb.getLotnum() %>").value;
			  var currentbids=new Number(currentbid);
			  var newbid=document.getElementById("number<%out.print(tlb.getLotnum());%>").value;
			  var newbids=new Number(newbid);
			  if(currentbids>=newbids)
			  {	  
				  alert('YOU CAN ONLY INCREASE YOUR BID NOT DECREASE');
				  document.getElementById('number<%out.print(tlb.getLotnum());%>').value="";
			  }
			  else
			  {
					  xmlhttp = new XMLHttpRequest();
					  xmlhttp.onreadystatechange = function() {
					    if (this.readyState == 4 && this.status == 200) 
					    {					     
					    	 var string=xmlhttp.responseText;			  
					    	if(string.includes("block"))
					    		{
					    		   alert('your final cost has increased blocked amount!!! we are taking you to block funds page...block more money for more profit ');
					  	  	       window.location='TraderBlock.do';
					    		}
					    	else
					    	{	
					         var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
					         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
					         startlotnum=startlotnum+9;
					         
					         var startlotcost=xmlhttp.responseText.indexOf('lotcost');
					         var endlotcost=xmlhttp.responseText.lastIndexOf('lotcost');
					         startlotcost=startlotcost+7;
					         
					         var startcommission=xmlhttp.responseText.indexOf('commission');
					         var endcommission=xmlhttp.responseText.lastIndexOf('commission');
					         startcommission=startcommission+10;
					         
					         var startmarket=xmlhttp.responseText.indexOf('market');
					         var endmarket=xmlhttp.responseText.lastIndexOf('market');
					         startmarket=startmarket+6;
					         
					         var startbestbid=xmlhttp.responseText.indexOf('bestbid');
					         var endbestbid=xmlhttp.responseText.lastIndexOf('bestbid');
					         startbestbid=startbestbid+7;
					         
					         var startmybid=xmlhttp.responseText.indexOf('mybid');
					         var endmybid=xmlhttp.responseText.lastIndexOf('mybid');
					         startmybid=startmybid+5;
					         
					         var startassigned=xmlhttp.responseText.indexOf('assigned');
					         var endassigned=xmlhttp.responseText.lastIndexOf('assigned');
					         startassigned=startassigned+8;
					         
					         var startfinal=xmlhttp.responseText.indexOf('final');
					         var endfinal=xmlhttp.responseText.lastIndexOf('final');
					         startfinal=startfinal+5;
					         
					         document.getElementById("demo1<%= tlb.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
					         var assigned=string.substring(startassigned,endassigned);
					         if(assigned=="0")
					         {
					        	 console.log("assigned =0");
					        	 var symbol="-";
					        	 document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = 0;
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = 0;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = 0;
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = 0;
						         document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =string.substring(startbestbid,endbestbid);
						         console.log(string.substring(startbestbid,endbestbid));
						         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = string.substring(startmybid,endmybid);
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = string.substring(startassigned,endassigned);
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML = 0;
						         var input = document.getElementById("number<%out.print(tlb.getLotnum());%>");
						         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         input.setAttribute("min",bid);
						     }
					         else
					         {
						         document.getElementById("demo2<%= tlb.getLotnum() %>").innerHTML = string.substring(startlotcost,endlotcost);
						         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = string.substring(startcommission,endcommission);
						         document.getElementById("transportation<%= tlb.getLotnum() %>").innerHTML = 3000;
						         document.getElementById("demo4<%= tlb.getLotnum() %>").innerHTML = string.substring(startmarket,endmarket);
						         document.getElementById("demo5<%= tlb.getLotnum() %>").innerHTML =string.substring(startbestbid,endbestbid);
						         console.log(string.substring(startbestbid,endbestbid));
						         document.getElementById("demo6<%= tlb.getLotnum() %>").innerHTML = string.substring(startmybid,endmybid);
						         document.getElementById("demo7<%= tlb.getLotnum() %>").innerHTML = string.substring(startassigned,endassigned);
						         document.getElementById("demo8<%= tlb.getLotnum() %>").innerHTML = string.substring(startfinal,endfinal);
						         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
						         var bid=new  Number(string.substring(startmybid,endmybid));
						         bid=bid+1;
						         input.setAttribute("min",bid);
					         }}}};
			  document.getElementById('number<%out.print(tlb.getLotnum());%>').value="";
			  xmlhttp.open("POST", "ajaxIncrement.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("number=" + i+"&lotnumber="+j);
	  }}}}
	else
		{	console.log(!timedifference.includes("-"));
			alert('YOU CANT BID BEFORE AUCTION STARTS');
		}}
	</script>
	</tbody></table></div>
	</div>
	</div>
    </div></div>
    <%}}}}}}}}%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	<!---row 1 end--->
	<!----row2--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center" >
	<table>
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 2 end--->
	<!----row3--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">3</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 3 end--->
	<!----row 4--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">4</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 4 end--->
 </div>




<div class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord1"><span>Auction Slot-2</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<!--<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#accord">Simple collapsible</button>-->
  <div id="accord1" class="collapse">
    
 
        <!----row1--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">1</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 1 end--->
	<!----row2--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center" >
	<table>
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 2 end--->
	<!----row3--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">3</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 3 end--->
	<!----row 4--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">4</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 4 end--->
 </div>



<div class="container-fluid slot"><h5 class="text-center"  data-toggle="collapse" data-target="#accord3"><span>Auction Slot-3</span> <span class="pull-right"><i  class="fa fa-chevron-down" aria-hidden="true"></i></span></h5></div>
<!--<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#accord">Simple collapsible</button>-->
  <div id="accord3" class="collapse">
    
 
        <!----row1--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">1</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;font-weight:bold">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table >
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"  size="10"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 1 end--->
	<!----row2--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
 <table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">2</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center" >
	<table>
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 2 end--->
	<!----row3--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">3</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 3 end--->
	<!----row 4--->
	<div class="one">
<div class="container-fluid status">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fir">
<div class="table-responsive"> 
<table>
<tbody><tr><td class="col-lg-1 col-md-1 col-sm-2 col-xs-1" style="background: #bfbfbf;text-align:center;font-weight:bold">4</td>
<td class="col-lg-3 col-md-3 col-sm-5 col-xs-5">
<table align="center">
	<tbody>
	<tr><td><h4>Lot Number</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Produce</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Quality Grade</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Available Lot Size</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>
</td><td class="col-lg-3 col-md-3 col-sm-5 col-xs-5" style="background: #bfbfbf; padding:5px;white-space:nowrap;">
	<table align="center">
	<tbody>
	<tr><td><h4>Lost Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Commission Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Market Cess</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>Transportation Charges</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	<tr><td><h4>My Final Cost</h4></td><td><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-3 col-md-2 col-sm-6 col-xs-6 bid" align="center">
	<table align="center">
	<tbody>
	<tr><td><h4>Required Lot Size</h4></td><td><h4>Assigned Lot Size</h4></td></tr>
	<tr><td class="clspad10"><input class="form-control clsheight" id="usr" type="text"></td><td class="clspadt5"><input class="form-control clsheight" id="usr" type="text"></td></tr>
	<tr><td><h4>Best Bid</h4></td><td><h4>My Bid</h4></td></tr>
	<tr><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td><td class="inp clspad10"><input class="form-control" id="usr" type="text"></td></tr>
	</tbody>
	</table>

</td><td class="col-lg-1 col-md-2 col-sm-3 col-xs-3 release">
	<table align="center"><tbody><tr><td><a href="#" class="reg" style="white-space:nowrap">Increment by 1</a></td></tr>
				 <tr><td><br><a href="#" class="sub">Submit</a></td></tr></tbody></table>

</td><td class="col-lg-1 col-md-1 col-sm-3 col-xs-3" style="background:#bfbfbf;">
	<table align="center"><tbody><tr><td><button type="button" class="btn btn-danger lotbtn">Remove<br>lot</button> </td></tr></tbody></table>
</td></tr>
</tbody></table></div>
</div>
</div>
    </div></div>
	<!---row 4 end--->
 </div>
</div>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
 
<script>
var tt = $( window ).height();

$(".maindiv").height(parseInt(tt)-60);
</script>
</body>
</html>
