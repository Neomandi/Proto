<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import=" java.text.SimpleDateFormat,java.util.Date,com.neomandi.prototype.*,com.neomandi.prototype.MyFinalCostBean, com.neomandi.prototype.MyFinalCostBean,java.util.*, com.neomandi.prototype.TradeListBean, java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  <meta http-equiv="refresh"  content="3; URL=http://192.173.6.16:8080/NeomandiPrototype/TradeorAuction.do"> 
 <meta http-equiv="refresh"  content="3; URL=http://localhost:8080/NeomandiPrototype/TradeorAuction.do">--></head><body>
<table id = "t1" border = "border">
	<tr bgcolor="#7cfc00">
		<th>Lot Number</th>
		<th>Lot_Cost</th>
		<th>Transportation Charges</th>
		<th>Commission Charges</th>
		<th>Market Cess</th>
		<th>Market Code</th>
		<th>Produce</th>
		<th>Quality Grade</th>
		<th>Best_Bid(Rs/kg)</th>
		<th>My Current Bid(Rs/kg)</th>
		<th>My New Bid(Rs/kg)</th>
		<th>Submit Increment</th>
		<th>Increase Bid</th>
		<th>Volume Available(kg)</th>
		<th>Volume_Bidding_for(kg)</th>
		<th>Volume_Assigned(kg)</th>
		<th>My_Final_Cost</th>
		<th>Remove Lot</th>
	</tr>
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
	    if(msg!=null)
	    {
		  out.println("<script type=\"text/javascript\">");
	  	  out.println("alert('your final coast has increased blocked amount!!! we are taking you to block funds page...block more money for more profit ');");
	  	  out.println("location='TraderBlock.do';");
	 	  out.println("</script>");
		}
		else
		{	
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
						
						for(Object m:l)
						{	
							System.out.println("myfinalcostbean list size"+l.size()+l);
							MyFinalCostBean mfcb=(MyFinalCostBean)m;
							if(mfcb.getLotnum().equals(tlb.getLotnum()))
							{
								System.out.println("lot number is "+mfcb.getLotnum()+" cost->"+mfcb.getLotcost()+" quantityassigned->"+mfcb.getQuantityassigned());
%>
<tr>
<td><output id="demo1<%= tlb.getLotnum() %>"><%= tlb.getLotnum() %></output></td>
<td><output id="demo2<%= tlb.getLotnum() %>"><%= mfcb.getLotcost() %></output></td>
<td><output id="transportation<%= tlb.getLotnum() %>">3000</output></td>
<td><output id="demo3<%= tlb.getLotnum() %>"><%= mfcb.getCommission() %></output></td>
<td><output id="demo4<%= tlb.getLotnum() %>"><%= mfcb.getMarketcess() %></output></td>
<td><%= tlb.getMarketcode() %></td>
<td><%= tlb.getProduce() %></td>
<td><%= tlb.getQualitygrade() %></td>
<td><output id="demo5<%= tlb.getLotnum() %>"><%= mfcb.getBestbid()%></output></td>
<td><output id="demo6<%= tlb.getLotnum() %>"><%= mfcb.getPrice() %></output></td>
<input type="hidden" name="lotnum" id="mybid<%out.print(tlb.getLotnum());%>" value="<%out.print(mfcb.getPrice());%>"/>
<input type="hidden" name="lotnum" id="lotnumber<%out.print(tlb.getLotnum());%>" value="<%out.print(tlb.getLotnum());%>"/>
<td><input type="number" min="" name="increment" id="number<%out.print(tlb.getLotnum());%>" ></td>
<script>
var input = document.getElementById("number<%out.print(tlb.getLotnum());%>");
var bid=new  Number(document.getElementById("demo6<%= tlb.getLotnum() %>").value);
console.log("while setting min value current bid 2 is"+bid);
bid=bid+1;
input.setAttribute("min",bid);
</script> 
<td><input type="submit" id="submit<%out.print(tlb.getLotnum());%>" onclick="fun<%out.print(tlb.getLotnum());%>();" class="more1" value="SUBMIT"/></td>
<script>
function fun<%out.print(tlb.getLotnum());%>()
{
	      var i= document.getElementById("number<%out.print(tlb.getLotnum());%>").value;
		  var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
		  if(i==""||document.getElementById("number<%out.print(tlb.getLotnum());%>").value==null)
		  { 
			  alert('You need to enter the number of bid to be increased before');
		  }
	      else
		  {
			var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
			var assigned=new  Number(assigneds);
			var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
			var needed=new  Number(neededs);
			console.log("volume assigned is "+assigned+"");
			console.log("volume needed is "+needed+"");
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
			  console.log("current bid "+currentbids+" new bid "+newbids)
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
					         }}};
			  document.getElementById('number<%out.print(tlb.getLotnum());%>').value="";
			  xmlhttp.open("POST", "ajaxIncrement.do", true);
			  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			  xmlhttp.send("number=" + i+"&lotnumber="+j);
	  }}}}
</script>
<% 
String quantityneededs=tlb.getQuantityneeded();
int quantityneeded=Integer.parseInt(quantityneededs);
String quantityassigneds=mfcb.getQuantityassigned();
int quantityassigned=Integer.parseInt(quantityassigneds);%>
<input type="hidden" name="quantityassigned" value="<%=quantityassigned %>" id="<%=tlb.getLotnum()%>"/>
<input type="hidden" name="quantityneeded" value="<%=quantityneeded %>" id="quantityneeded<%=tlb.getLotnum()%>"/>
<script>
function funct<%=tlb.getLotnum()%>()
{
	var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
	var assigned=new  Number(assigneds);
	var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
	var needed=new  Number(neededs);
	console.log("volume assigned is "+assigned+"");
	console.log("volume needed is "+needed+"");
	if(assigned-needed==0)
	{
		console.log("assigned=needed");
		document.getElementById('submit1<%=tlb.getLotnum()%>').removeAttribute("href");
	}
	else
	{
		document.getElementById('form<%=tlb.getLotnum()%>').submit();
		console.log("assigned!=needed");
		var lotnum=$("#lotnum<%=tlb.getLotnum()%>").val();
		var valu=document.getElementById("number<%out.println(tlb.getLotnum());%>").value;
		window.location.href = 'http://localhost:8080/NeomandiPrototype/increment.do?increment=' + valu+' &&lotnum='+lotnum;
	}
}
</script>
<td><a href="#" onclick="submitbutton<%out.print(tlb.getLotnum());%>();" class="moree">BY 1 RUPEE</a></td>
<script>
function submitbutton<%out.print(tlb.getLotnum());%>()
{
    var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
    var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
    var currentbid=document.getElementById("mybid<%=tlb.getLotnum()%>").value;
	var currentbids=new Number(currentbid);
	//console.log("current bid is"+currentbids);
	var result=currentbids+1;
	//console.log("new bid is"+result);
    var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
	var assigned=new  Number(assigneds);
	var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
	var needed=new  Number(neededs);
	console.log("volume assigned is "+assigned+"");
	console.log("volume needed is "+needed+"");
	if(assigned-needed==0)
	{
		console.log("assigned=needed");
		document.getElementById('submit1<%=tlb.getLotnum()%>').removeAttribute("href");
	}
	else
	{
		console.log("assigned!=needed");
		 xmlhttp = new XMLHttpRequest();
		  xmlhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		     // myObj = JSON.parse( );
		      //document.getElementById("demo").innerHTML = xmlhttp.responseText;
		      //values to be printed: lotnumber lotcost commission market bestbid mybid assigned final
		    	 var string=xmlhttp.responseText;
		  
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
			         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
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
		         }
		         
		   }
		  };
		  document.getElementById('number<%out.print(tlb.getLotnum());%>').value="";
		  var bid1=new  Number(document.getElementById("demo6<%= tlb.getLotnum() %>").value);
		  console.log("current bid is "+bid1);
		  bid1=bid1+1;
		  xmlhttp.open("POST", "ajaxIncrement.do", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("number="+bid1+"&lotnumber="+j);
	}
}
</script>
<td><%= tlb.getQuantity()%> </td>
<td><%= tlb.getQuantityneeded()%> </td>	
<td><%if(quantityassigned==quantityneeded){%><a class="one" id="demo7<%= tlb.getLotnum() %>"><%=quantityassigned %></a><%}
else if(quantityassigned!=0){%><a class="two" id="demo7<%= tlb.getLotnum() %>"><%=quantityassigned %></a>	
<%}else if(quantityassigned==0){%><a class="three" id="demo7<%= tlb.getLotnum() %>"><%out.println(quantityassigned);}%></a></td>
<td><output id="demo8<%= tlb.getLotnum() %>"><%= mfcb.getMyfinalcost()%> </output></td>
<td><a href="removelotnumber.do?lotnum=<%=tlb.getLotnum() %>" id="a<%=tlb.getLotnum() %>"class="more"> REMOVE</a></td>
<script>
function remove<%=tlb.getLotnum()%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber<%out.print(tlb.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );    
   //   document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1<%= tlb.getLotnum() %>").innerHTML = string;
         document.getElementById("demo3<%= tlb.getLotnum() %>").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber=" +j);
}
</script>
<input type="hidden" value="<%=quantityassigned %>" id="<%=tlb.getLotnum()%>"/>
<input type="hidden" value="<%=quantityneeded %>" id="quantityneeded<%=tlb.getLotnum()%>"/>
<script>
var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
var needed=new  Number(neededs);
if(assigned-needed==0)
{
	document.getElementById('submit<%=tlb.getLotnum()%>').removeAttribute("onclick");
	document.getElementById('submit1<%=tlb.getLotnum()%>').removeAttribute("href");
}
else
console.log(assigned*1==1);
if(assigned*1!=0)
{
	$(document).ready(function(){
    $("#a<%=tlb.getLotnum() %>").attr("disabled","disabled");
	    });
	document.getElementById('a<%=tlb.getLotnum()%>').removeAttribute("href");
}
</script>
<script>
var assigneds=document.getElementById("<%=tlb.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlb.getLotnum()%>").value;
var needed=new  Number(neededs);
console.log("volume needed is "+needed);
if(assigned==needed)
	{
	}
</script>
</tr><%				 }}}}}
			else//removed row
	{	
			int j=0;
			HttpSession remove=request.getSession(false);
			List<TradeListBean> l=(List<TradeListBean>)remove.getAttribute("list");
		  	for(Object m:l)		
		   	{
		   		TradeListBean tlbr=(TradeListBean)m;
		   		System.out.println("inside tlbr->"+tlbr);
		   		if(tlbr.getSlotnumber()!=null && (tlbr.getSlotnumber().equals("slot1")||tlbr.getSlotnumber().equals("Slot1")))
				{
		   			System.out.println("lotnum which belongs to slot1 "+tlbr.getLotnum());
			   		if(request.getAttribute("smsg")!=null)// incremented
					{				
			   			HttpSession MyFinalCost=request.getSession(false);
						List ll=(List)MyFinalCost.getAttribute("MyFinalCost"); 
			   			for(Object mm:ll)
						{
							MyFinalCostBean mfcb=(MyFinalCostBean)mm;						
							System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());%>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{ out.println(mfcb.getLotcost());}} else out.println("");%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{ out.println("3000");}} else out.println("");%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())) {if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{ out.println(mfcb.getCommission());}}%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())) {if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{ out.println(mfcb.getMarketcess());}}%></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td align="center"><% if(mfcb.getBestbid()==null)out.println("-");  else  out.println(mfcb.getBestbid());  %></td>		
<td align="center"><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){ out.println(mfcb.getPrice());}%> </td>
<input type="hidden" id="lotnum<%=tlbr.getLotnum()%>" values="<%out.println(tlbr.getLotnum());%>">
<form id="form<%=tlbr.getLotnum()%>" action="increment.do">
<input type="hidden" name="lotnum" id="lotnum<%=tlbr.getLotnum()%>" value="<%out.print(tlbr.getLotnum());%>"></input>
<td><input type="number" min="0" name="increment" id="number<%out.println(tlbr.getLotnum());%>"></td>
<td><input type="submit" onclick="fun<%out.print(tlbr.getLotnum());%>();" class="more1" value="SUBMIT"/></td>
<script>
function fun<%out.print(tlbr.getLotnum());%>()
{
	var i= document.getElementById("number<%out.print(tlbr.getLotnum());%>").value;
	  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
	  if(i==""||document.getElementById("number<%out.print(tlbr.getLotnum());%>").value==null)
	  { 
		  alert('You need to enter the number of bid to be increased before');
	  }
    else
	  {
		var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
		var assigned=new  Number(assigneds);
		var neededs=document.getElementById("quantityneeded<%=tlbr.getLotnum()%>").value;
		var needed=new  Number(neededs);
		console.log("volume assigned is "+assigned+"");
		console.log("volume needed is "+needed+"");
		if(assigned-needed==0)
		{
			console.log("assigned=needed");
		}
		else
		{
		  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
		  var currentbid=document.getElementById("demo6<%= tlbr.getLotnum() %>").value;
		  var currentbids=new Number(currentbid);
		  var newbid=document.getElementById("number<%out.print(tlbr.getLotnum());%>").value;
		  var newbids=new Number(newbid);
		  console.log("current bid "+currentbids+" new bid "+newbids)
		  if(currentbids>=newbids)
		  {	  
			  alert('YOU CAN ONLY INCREASE YOUR BID NOT DECREASE');
			  document.getElementById('number<%out.print(tlbr.getLotnum());%>').value="";
		  }
		  else
		  {
				  xmlhttp = new XMLHttpRequest();
				  xmlhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) 
				    {					     
				    	 var string=xmlhttp.responseText;			  
				      
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
				         
				         document.getElementById("demo1<%= tlbr.getLotnum() %>").innerHTML = string.substring(startlotnum,endlotnum);
				         var assigned=string.substring(startassigned,endassigned);
				         if(assigned=="0")
				         {
				        	 console.log("assigned =0");
				        	 var symbol="-";
				        	 document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = 0;
					         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = 0;
					         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = 0;
					         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = 0;
					         document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =string.substring(startbestbid,endbestbid);
					         console.log(string.substring(startbestbid,endbestbid));
					         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = string.substring(startmybid,endmybid);
					         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = string.substring(startassigned,endassigned);
					         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML = 0;
					         var input = document.getElementById("number<%out.print(tlbr.getLotnum());%>");
					         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
					         var bid=new  Number(string.substring(startmybid,endmybid));
					         bid=bid+1;
					         input.setAttribute("min",bid);
					     }
				         else
				         {
					         document.getElementById("demo2<%= tlbr.getLotnum() %>").innerHTML = string.substring(startlotcost,endlotcost);
					         document.getElementById("demo3<%= tlbr.getLotnum() %>").innerHTML = string.substring(startcommission,endcommission);
					         document.getElementById("transportation<%= tlbr.getLotnum() %>").innerHTML = 3000;
					         document.getElementById("demo4<%= tlbr.getLotnum() %>").innerHTML = string.substring(startmarket,endmarket);
					         document.getElementById("demo5<%= tlbr.getLotnum() %>").innerHTML =string.substring(startbestbid,endbestbid);
					         console.log(string.substring(startbestbid,endbestbid));
					         document.getElementById("demo6<%= tlbr.getLotnum() %>").innerHTML = string.substring(startmybid,endmybid);
					         document.getElementById("demo7<%= tlbr.getLotnum() %>").innerHTML = string.substring(startassigned,endassigned);
					         document.getElementById("demo8<%= tlbr.getLotnum() %>").innerHTML = string.substring(startfinal,endfinal);
					         console.log("input is "+input+"symbol is"+symbol+" best bid is"+string.substring(startbestbid,endbestbid));
					         var bid=new  Number(string.substring(startmybid,endmybid));
					         bid=bid+1;
					         input.setAttribute("min",bid);
				         }}};
		  document.getElementById('number<%out.print(tlbr.getLotnum());%>').value="";
		  xmlhttp.open("POST", "ajaxIncrement.do", true);
		  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xmlhttp.send("number=" + i+"&lotnumber="+j);
}}}}
	function funct<%=tlbr.getLotnum()%>()
	{
			var lotnum=$("#lotnum<%=tlbr.getLotnum()%>").val()
			var valu=document.getElementById("number<%out.println(tlbr.getLotnum());%>").value
			if(valu==null)
			{
				 out.println("alert('you need to enter the increment in the bid before submitting ');");
				 out.println("location='TradeorAuction.do';");
			}
	        $( "form" ).on( "submit", function() {
			event.preventDefault();
			location.href='http://localhost:8080/NeomandiPrototype/increment.do?increment=' + value+'&&lotnum='+lotnum
			console.log("value is " + value+"&&lotnum="+lotnum)
	});	
	}
</script>
<form method="increment.do"><td><input type="number" min="0" ><td><input type="submit">
</form>
<td><a onclick="submitbutton<%out.print(tlbr.getLotnum());%>();" class="moree">BY 1 RUPEE</a></td>
<script>
function submitbutton<%out.print(tlbr.getLotnum());%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );    
   //   document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber=" +j+"&number=1");
}

function fun<%=tlbr.getLotnum() %>()
{
   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
   valu = isNaN(valu) ? 1 : valu;
   valu++;
   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>
<td><%= tlbr.getQuantity()%> </td>	
<td><%=tlbr.getQuantityneeded() %></td>	
<td><%String quantityneededs=tlbr.getQuantityneeded();
int quantityneeded=Integer.parseInt(quantityneededs);
String quantityassigneds=mfcb.getQuantityassigned();
int quantityassigned=Integer.parseInt(quantityassigneds);
if(quantityassigned==quantityneeded){%><a class="one"><%=quantityassigned %></a>	
<%}
else if(quantityassigned!=0){%><a class="two"><%=quantityassigned %></a>	
<%}else if(quantityassigned==0){%><a class="three"><%out.println(quantityassigned);} %></a></td>		
<td><%if(request.getAttribute("smsg")==null) out.println(""); else{if(tlbr.getLotnum().equals(mfcb.getLotnum())){if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getMyfinalcost());}}}%></td>
</form>
<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
<script>
function remove<%=tlbr.getLotnum()%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );    
   //   document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber=" +j);
}
</script>
<input type="hidden" value="<%=quantityassigned %>" id="<%=tlbr.getLotnum()%>"/>
<input type="hidden" value="<%=quantityneeded %>" id="quantityneeded<%=tlbr.getLotnum()%>"/>
<script>
var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlbr.getLotnum()%>").value;
var needed=new  Number(neededs);
//console.log("volume assigned is "+assigned+"");
//console.log("volume needed is "+needed+"");
if(assigned-needed==0)
{
	//console.log("assigned=needed");
	document.getElementById('submit<%=tlbr.getLotnum()%>').removeAttribute("onclick");
	document.getElementById('submit1<%=tlbr.getLotnum()%>').removeAttribute("href");
}
else
	//console.log("assigned!=needed");
console.log(assigned*1==1);
if(assigned*1!=0)
{
	//console.log("inside block");
	$(document).ready(function(){
    $("#a<%=tlbr.getLotnum() %>").attr("disabled","disabled");
});
	document.getElementById('a<%=tlbr.getLotnum()%>').removeAttribute("href");
}
</script>
<script>
var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlbr.getLotnum()%>").value;
var needed=new  Number(neededs);
console.log("volume needed is "+needed);
if(assigned==needed)
	{
	}
</script>
<script>
var volume=document.getElementById("<%=tlbr.getLotnum()%>").value;
var block=new  Number(volume);
console.log("volume assigned is "+block+"");
console.log(block*1==1);
if(block*1!=0)
{
	console.log("inside block");
	$(document).ready(function(){
    $("#a<%=tlbr.getLotnum() %>").attr("disabled","disabled"); });
	document.getElementById('a<%=tlbr.getLotnum()%>').removeAttribute("href");
}
if(assigned==needed)
{
	$(document).ready(function(){
    $("#submit<%=tlbr.getLotnum()%>").attr("disabled","disabled");});
	document.getElementById('submit<%=tlbr.getLotnum()%>').removeAttribute("href");
	$(document).ready(function(){
	document.getElementById("#submit1<%=tlbr.getLotnum() %>").attr("disabled","disabled");});
	document.getElementById('submit1<%=tlbr.getLotnum() %>').removeAttribute("href");
	document.getElementById('number<%out.println(tlbr.getLotnum());%>').readOnly = true;
}
</script>
</tr>
<% 
			}	
		}	
		else//not incremnted
		{
			HttpSession MyFinalCost=request.getSession(false);
			List ll=(List)MyFinalCost.getAttribute("MyFinalCost"); 
   			for(Object mm:ll)
			{
				MyFinalCostBean mfcb=(MyFinalCostBean)mm;						
				System.out.println("MyFinalCostBeanlotnumber->"+mfcb.getLotnum());	
				if(mfcb.getLotnum().equals(tlbr.getLotnum()))
				{
%>
<tr>
<td><%out.println(tlbr.getLotnum());%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())) {if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getLotcost());}} else out.println("");%></td>
<td>3000</td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())) {if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getCommission());}}%></td>
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())) {if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getMarketcess());}}%></td>
<td><%= tlbr.getMarketcode() %></td>
<td><%= tlbr.getProduce() %></td>
<td><%= tlbr.getQualitygrade() %></td>
<td align="center"><% if(mfcb.getBestbid()==null)out.println("-"); else  out.println(mfcb.getBestbid());  %></td>		
<td align="center"><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getPrice());}}%> </td>			
<input type="hidden" id="lotnum<%=tlbr.getLotnum()%>" values="<%out.println(tlbr.getLotnum());%>">
<input type="hidden" name="lotnum" id="lotnum<%=tlbr.getLotnum()%>" value="<%out.print(tlbr.getLotnum());%>"></input>
<td><input type="number" min="0" name="increment" id="number<%out.println(tlbr.getLotnum());%>" ></td>
<td><input type="submit" onclick="fun<%out.print(tlbr.getLotnum());%>();" class="more1" value="SUBMIT"/></td>
<script>
function fun<%out.print(tlbr.getLotnum());%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var i= document.getElementById("number<%out.print(tlbr.getLotnum());%>").value;
  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );
      //document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo2").innerHTML = start;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("number=" + i+"&lotnumber="+j);
}
</script>
<script>
function funct<%=tlbr.getLotnum()%>()
{
					var lotnum=$("#lotnum<%=tlbr.getLotnum()%>").val()
					var valu=document.getElementById("number<%out.println(tlbr.getLotnum());%>").value
					if(valu==null)
					{
						 out.println("alert('you need to enter the increment in the bid before submitting ');");
						 out.println("location='TradeorAuction.do';");
					}
				  $( "form" ).on( "submit", function() {
				   event.preventDefault();
				   location.href='http://localhost:8080/NeomandiPrototype/increment.do?increment=' + value+'&&lotnum='+lotnum
				   console.log("value is " + value+"&&lotnum="+lotnum)
				   });	
				}
</script>
<td><a onclick="submitbutton<%out.print(tlbr.getLotnum());%>();" class="moree">BY 1 RUPEE</a></td>
<script>
function submitbutton<%out.print(tlbr.getLotnum());%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );    
   //   document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber=" +j+"&number=1");
}
function fun<%=tlbr.getLotnum() %>()
{
	   var valu = parseInt(document.getElementById('<%= tlbr.getLotnum()%>').value, 10);
	   valu = isNaN(valu) ? 1 : valu;
	   if(valu==1){}
	   else	   
	   valu++;
	   document.getElementById('<%= tlbr.getLotnum() %>').value =valu;
}
</script>

<td><%=tlbr.getQuantity()%> </td>	
<td><%=tlbr.getQuantityneeded() %></td>		
<td><%String quantityneededs=tlbr.getQuantityneeded();
int quantityneeded=Integer.parseInt(quantityneededs);
String quantityassigneds=mfcb.getQuantityassigned();
int quantityassigned=Integer.parseInt(quantityassigneds);
if(quantityassigned==quantityneeded){%><a class="one"><%=quantityassigned %></a>	
<%}else if(quantityassigned!=0){%><a class="two"><%=quantityassigned %></a>	
<%}else if(quantityassigned==0){%><a class="three"><%out.println(quantityassigned);} %></a></td>	
<td><%if(tlbr.getLotnum().equals(mfcb.getLotnum())){if(mfcb.getQuantityassigned().equals("0")) {out.println("0");} else{out.println(mfcb.getMyfinalcost());}}%></td>

<td><a href="removelotnumber.do?lotnum=<%=tlbr.getLotnum() %>" class="more"> REMOVE</a></td>
<script>
function remove<%=tlbr.getLotnum()%>()
{
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var j= document.getElementById("lotnumber<%out.print(tlbr.getLotnum());%>").value;
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
     // myObj = JSON.parse( );    
   //   document.getElementById("demo").innerHTML = xmlhttp.responseText;
    	 var string=xmlhttp.responseText;
         var start=xmlhttp.responseText.indexOf('lotnumber');
         var end=xmlhttp.responseText.lastIndexOf('lotnumber');
//         int end=xmlhttp.responseText.lastindexOf("lotnumber",1);
         document.getElementById("demo1").innerHTML = string;
         document.getElementById("demo3").innerHTML = string.substring(9,20);
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("lotnumber=" +j);
}
</script>
<input type="hidden" value="<%=quantityassigned %>" id="<%=tlbr.getLotnum()%>"/>
<input type="hidden" value="<%=quantityneeded %>" id="quantityneeded<%=tlbr.getLotnum()%>"/>
<script>
var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlbr.getLotnum()%>").value;
var needed=new  Number(neededs);
if(assigned-needed==0)
{
	document.getElementById('submit<%=tlbr.getLotnum()%>').removeAttribute("onclick");
	document.getElementById('submit1<%=tlbr.getLotnum()%>').removeAttribute("href");
}
else
console.log(assigned*1==1);
if(assigned*1!=0)
{
	//console.log("inside block");
	$(document).ready(function(){
    $("#a<%=tlbr.getLotnum() %>").attr("disabled","disabled");
	    });
	document.getElementById('a<%=tlbr.getLotnum()%>').removeAttribute("href");
}
</script>
<script>
var assigneds=document.getElementById("<%=tlbr.getLotnum()%>").value;
var assigned=new  Number(assigneds);
var neededs=document.getElementById("quantityneeded<%=tlbr.getLotnum()%>").value;
var needed=new  Number(neededs);
console.log("volume needed is "+needed);
if(assigned==needed)
	{
	}
</script>
<script>
var volume=document.getElementById("<%=tlbr.getLotnum()%>").value;
var block=new  Number(volume);
console.log("volume assigned is "+block+"");
console.log(block*1==1);
if(block*1==1)
{
	console.log("inside block");
	$(document).ready(function(){
    $("#a<%=tlbr.getLotnum() %>").attr("disabled","disabled");
	    });
	document.getElementById('a<%=tlbr.getLotnum()%>').removeAttribute("href");
}
</script>
</tr>
<% }}}}}}}}}%>
<tr>
<th></th>
</table>
<br/>
<br/>
<script>
setTimeout(function(){
	   $( "#t1" ).load( "TradeorAuction.do" );
	}, 2000);</script></body></html>