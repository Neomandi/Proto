<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import=" com.neomandi.prototype.JDBCHelper, 
     java.io.PrintWriter,
     java.sql.Connection,
     java.sql.ResultSet,
     java.sql.Statement,
     javax.servlet.ServletException,
	 javax.servlet.http.HttpServlet,
	 javax.servlet.http.HttpServletRequest,
	 javax.servlet.http.HttpServletResponse,
	 java.sql.SQLException,
	 java.text.SimpleDateFormat,
	 java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trade Summary</title>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
<script type='text/javascript' src='tableExport.js'></script>
<script type='text/javascript' src='jquery.base64.js'></script>
<script type='text/javascript' src='jspdf/libs/sprintf.js'></script>
<script type='text/javascript' src='jspdf/jspdf.js'></script>
<script type='text/javascript' src='jspdf/libs/base64.js'></script>
<script>
$(document).ready(function(e){
	$('#pdf').click(function(e){
		$('#mytable').tableExport({
			type: 'pdf',
			escape: 'false'
		});
	});
	
	$('#excel').click(function(e){
		$('#mytable').tableExport({
			type: 'excel',
			escape: 'false'
		});
	});
	
	$('#word').click(function(e){
		$('#mytable').tableExport({
			type: 'doc',
			escape: 'false'
		});
	});
});
function tableToJson(table) {
    var data = [];

    // first row needs to be headers
    var headers = [];
    for (var i=0; i<table.rows[0].cells.length; i++) {
        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
    }
    data.push(headers);
    // go through cells
    for (var i=1; i<table.rows.length; i++) {

        var tableRow = table.rows[i];
        var rowData = {};

        for (var j=0; j<tableRow.cells.length; j++) {

            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

        }

        data.push(rowData);
    }       

    return data;
}

</script>
</head>
<style>
table
{
	border-collapse: collapse;
}
#ext
{
	position: absolute;
	left: 625px;
}
#export
{
	position: absolute;
	left: 690px;
}



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
	width: 100px;
	text-decoration: none;
	padding: 10px 20px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: white;
    border-radius: 9px 9px 0 0;    
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
    background-color: blue;   
	display: inline;
	display: block;
    color: white;
	width: 150px;
	text-decoration: none;
	padding: 10px 20px;
}

#navigation_container {
   margin: 0 auto;
   width: 960px;
}

.rectangle {
	width: 1200px;
   color: white;
   text-align:center;
   background: #e5592e;
   height: 62px;
   position: relative;
   -moz-box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
   box-shadow: 0px 0px 4px rgba(0,0,0,0.55);
   -webkit-border-radius: 34px;
   -moz-border-radius: 3px;
   border-radius: 3px;
   z-index: 200; /* the stack order: foreground */
   margin: 3em 0;
   top: 0px;
}
</style>
<style>

 #mytable table, td, th {
    border: 1px solid black;
    text-align:center;
}

table {
    border-collapse: collapse;
    width: 50%;
}

th {
    text-align:center;
}
}

</style>

<body>
<%!int count=0; %>
	<%@ include file="Fribbon.jsp" %><br><br>
 	<ul>
	 	<li><a href="FarmerMaster.jsp">Auction</a></li>
		<li><a href="Lotdetails.jsp">My Lots</a></li>
		<li><a class="active" href="GetSummary.do"> Summary</a></li>
		<li><a href="FarmerProfile.jsp">My Profile</a>
		<li><a href="FarmerSummaryInt.jsp">History</a></li>
		
	</ul>
	<br/><br/>
 	<center>
 		<font color="#C71585"><h1></h1></font>
	</center>
	<center>
		<!--<form action = "" method = "get">
			From:  <input type = "date" id = "from" name="from"/><br/><br/>
 			To:    <input type = "date" id = "to" name="to"/><br/><br/>
			<input type = "submit" value = "Get Summary"/> <br/><br/>
		</form>-->
		
		<% 
		
		RequestDispatcher rd=null;
		String m="";
		HttpSession farmerstatus=request.getSession(false);
		
		 m=(String)farmerstatus.getAttribute("msg");
		 System.out.println("msg="+m);
		 if(m.equals("Accept")){
			 count++;
			 if(count>1){
		 rd=request.getRequestDispatcher("FarmerMaster1.jsp");
			 
		 try 
			{
				rd.forward(request, response);			
			}			
			catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 
		 }
		HttpSession hs=request.getSession(false);  
     	String pass=(String)hs.getAttribute("pass");  
    	System.out.println(" in accept summary password="+pass);
	    HttpSession hsr=request.getSession(false); 
	    String lotnumber=(String)hsr.getAttribute("lotnumber");
	    hsr.setAttribute("lotnumber", lotnumber);
	    System.out.println(" in accept summary lotnumber="+lotnumber);
	    String lotsize=(String)hsr.getAttribute("lotsize");
	    String quantitysold=(String)hsr.getAttribute("quantitysold");
	    String averageprice=(String)hsr.getAttribute("averageprice");
	    double aprice=Double.parseDouble(averageprice);
	    aprice=aprice*100;
	    aprice=(int)aprice;
	    aprice=aprice/100;
	    double qsold=Double.parseDouble(quantitysold);
	    qsold=qsold*100;
	    qsold=(int)qsold;
	    qsold=qsold/100;
	    double fprice=aprice*qsold;
	    fprice=fprice*100;
	    fprice=(int)fprice;
	    fprice=fprice/100;
		double MUCharge=1*fprice/100;
		double PACharge=100;
		double EPUCharge=100;
		double Transport=500;
		double TCharge=MUCharge+PACharge+EPUCharge+Transport;
	    double myEarn=fprice-TCharge;
	    myEarn=myEarn*100;
	    myEarn=(int)myEarn;
	    myEarn=myEarn/100;
	    double deduction=TCharge;
	    deduction=deduction*100;
	    deduction=(int)deduction;
	    deduction=deduction/100;
	    System.out.println("in accept summary lotsize="+lotsize);
	    double lot=Integer.parseInt(lotsize);
		    String status="";
		    if(lot==qsold)
	    		status+="Fully executed .You have accepted the bid";
	    			else
	    		status+="Partially executed.You have accepted the bid";
	    	 	String lotsize1=String.valueOf(lot);
	    	 	double lsize=Double.parseDouble(lotsize1);
	    	 	lsize=lsize*100;
	    	 	lsize=(int)lsize;
	    	 	lsize=lsize/100;
			 	String quantitysold1=String.valueOf(qsold);
			 	double qs=Double.parseDouble(quantitysold1);
			 	qs=qs*100;
			 	qs=(int)qs;
			 	qs=qs/100;
	    %>
		<center>
			<form>
		 	<table  id = 'mytable' border>
			
			<tr>
				<th  bgcolor = '#00FF00' height="5%">Lot number</th>
				<td  ><%=lotnumber %></td>
			</tr>
			<tr>
				<th bgcolor = '#00FF00' height="5%">Lot size</th>
				<td  height="5%"><%=lsize %></td>
			</tr>
			<tr>
		   		<th   bgcolor = '#00FF00' height="5%">Quantity Sold </th>
		   		<td  height="5%"><%=qs%></td>
		   	</tr>
		   	<tr>
		    	<th   bgcolor = '#00FF00' height="5%">Average price</th>
		    	<td  height="5%"><%=aprice%></td>
		    </tr>
		    <tr>
		    	<th  bgcolor = '#00FF00' height="5%">Gross Earnings</th>
		    	<td  height="5%"><%= fprice%></td>
		    </tr>
		    <tr>
		    	<th  bgcolor = '#00FF00' height="5%">Market Usage Charge</th>
		    	<td  height="5%"><%=MUCharge%></td>
		    </tr>
		     <tr>
		    	<th  bgcolor = '#00FF00' height="5%">PVA Charge</th>
		    	<td  height="5%"><%=PACharge%></td>
		    </tr>
		    <tr>
		    	<th  bgcolor = '#00FF00' height="5%">e-PU Charge</th>
		    	<td  height="5%"><%=EPUCharge%></td>
		    </tr>
		     <tr>
		    	<th  bgcolor = '#00FF00' height="5%">Transportation Charge</th>
		    	<td  height="5%"><%=Transport%></td>
		    </tr>
		    <tr>
		    	<th  bgcolor = '#00FF00' height="5%">Deduction</th>
		    	<td  height="5%"><%=deduction%></td>
		    </tr>
		    <tr>
		     	<th bgcolor = '#00FF00'>Status</th>
		     	<font color="blue"><td  ><%= status %></td></font>
			</tr>
			<tr>
		     	<th   bgcolor = '#00FF00' height="5%">My Net Earnings</th>
		     	<td  height="5%"><%=myEarn %></td>
		   </tr>
			
		</table><br/>
	</form>
</center>
<br/>
<br/>		
 <p align= "center"><b>Export Summary</b></p><br/>
	<center><input type="button" value="Export to PDF" onclick="callme()" /></center><br/>
	<script>
		function callme(){
			var table = tableToJson($('#mytable').get(0));
			var doc = new jsPDF('l','pt','letter',true);
			$.each(table, function(i, row){
				$.each(row, function(j,cell){
			//	if(j=="Lot Number"){
				 doc.cell(1,10,340,20,cell,i);	
				//}
				//else{
					//doc.cell(1,10,90,20,cell,i);
				//}
				
				});
			});
			doc.save('GetSummary.pdf');
			}
		</script>
	<center><button id = "excel">Export to XLS</button></center><br/>
	<center><button id = "word">Export to DOC</button></center>
		

</body>
</html>






