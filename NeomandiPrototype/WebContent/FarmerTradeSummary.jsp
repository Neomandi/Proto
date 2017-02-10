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
	 com.neomandi.prototype.FarmerHistoryBean,
	 java.util.*"
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
html {
    position: relative;
    min-height: 100%;
}
body {
    margin: 0 0 100px;
    /* bottom = footer height */
    padding: 0px;
}
footer {
    position: absolute;
    left: 0;
    bottom: 0;
    height: 76px;
    width: 100%;
    overflow:hidden;
}
</style>
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

<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">

<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Farmer1, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li ><a href="FarmerMaster.jsp">Auction</a></li>
    <li ><a  href="Lotdetails.jsp" >My Lots</a></li>
    <li ><a class="classbeauty" id="ts" href="#">Summary</a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
     <li class="active"><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>
</div>
</div>
</div>

</div>

		<!-- if(request.getAttribute("error").equals("error"))
		{ 
			out.println("<script type=\"text/javascript\">");
  			out.println("alert('YOU HAVE NOT TAKEN PART IN AUCTION TO DISPLAY SUMMARY');");
		    out.println("location='FarmerProfile.jsp';");
		    out.println("</script>");
		}
		 -->
		
	  
<div class="container-fluid  history"><div class="container"><h2>History</h2></div></div>
<div class="container from">
<form action ="FarmerHistory.do" method="get" name="historyForm">
<div class="datetable" align="center">


   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='from' name='from' >
                    <input type='text' class="form-control" name="from" id='from'/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div></div>
   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='to' >
                    <input type='text' class="form-control" name="to" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div></div>
<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><div><a href="javascript:history()" class="get">Get Summary</a></div></div>
</div>
</form>

<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><a href="javascript:callme()" class="export">Export as PDF</a>

</div>
<script>
		function callme(){
			var table = tableToJson($('#mytable').get(0));
			var doc = new jsPDF('l','pt','letter',true);
			$.each(table, function(i, row){
				$.each(row, function(j,cell){
			//	if(j=="Lot Number"){
				 doc.cell(1,10,180,20,cell,i);	
				//}
				//else{
					//doc.cell(1,10,90,20,cell,i);
				//}
				
				});
			});
			doc.save('FarmerHistory.pdf');
			}
		
		</script>
</div>


<%if(request.getAttribute("farmerhistory")!=null)
		{
			if(request.getAttribute("farmerhistory").equals("no"))
				{
  	%>
  	<b>YOU HAVE NOT MADE ANY TRADE OPERATIONS BETWEEN THESE DATE</b>
  	
  <%
  		} else if(request.getAttribute("farmerhistory").equals("success"))
  {%>
<!---table2-->
<div class="container-fluid sum2 pad">
<div class="tabin">
<div class="sum2tab table-responsive">
<table class="table sum2table last">


<thead><tr>
<td></td>
<td><h4>Date</h4></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Lot Size</h4></td>
	  <td><h4>Quantity</h4></td>
	  <td><h4>Avg Price</h4></td>
	  <td><h4>Gross Earnings</h4></td>
	  <td><h4>TLC*</h4></td>
<td><h4>Market Cess</h4></td>
<td><h4>EPC</h4></td>
<td><h4>PMVA</h4></td>
<td><h4>Deductions</h4></td>
<td><h4>My Net Earnings</h4></td>
<td></td>
	  </tr></thead>
	  <tbody>
	  <tr class="gradeX">
	  <% 
		HttpSession farmerhistory=request.getSession(false);
		List al=(List)farmerhistory.getAttribute("farmerhistory");
		//request.setAttribute("theList", al);
		for(Object o:al)
		{
			FarmerHistoryBean fhb=(FarmerHistoryBean)o;%>
			<%String finalprice=fhb.getFinalprice();
			double fprice1=Double.parseDouble(finalprice);
			double MUCharge1=1*fprice1/100;
			double PACharge1=100;
			double EPUCharge1=100;
			double TCharge1=MUCharge1+PACharge1+EPUCharge1;
		    double myEarn1=fprice1-TCharge1;
		    myEarn1=myEarn1*100;
		    myEarn1=(int)myEarn1;
		    myEarn1=myEarn1/100;
		    double deduction1=TCharge1+500;
		    deduction1=deduction1*100;
		    deduction1=(int)deduction1;
		    deduction1=deduction1/100;
		    int transport=500;
			 %>
	  	<td></td>
	  	<td class="clspad0" width="15%"><h4><%=fhb.getCrdate() %></h4></td>
	  	<td><h4><%=fhb.getLotnumber()  %></h4></td>
	  	<td><h4><%=fhb.getQuantity() %></h4></td><td>
	  	<h4><%=fhb.getAverageprice()%></h4></td>
	  	<td><h4><%=fhb.getAverageprice()%></h4></td>
	  	<td><h4><%=fhb.getFinalprice() %></h4></td>
	  	<td><h4><%=transport %></h4></td>
	  	<td><h4><%=MUCharge1 %></h4></td>
	  	<td><h4><%=EPUCharge1 %></h4></td>
	  	<td><h4><%=PACharge1 %></h4></td>
	  	<td><h4><%=deduction1 %></h4></td>
	  	<td class="clspadr0"><h4><%= myEarn1 %></h4></td>
	  	<td></td>
	  </tr>
	  <%} %>
	  </tbody>
	  </table>
	  
</div>
	  </div>
	  </div><!---table2 end-->
	   <%}} %>
	    <footer>
	  <div id="grad1"></div>
	 
	  <div class="container charge">
	  <table class="table"><tr><td><h4>*Transportation / Loading Charges</h4></td><td><h4> #E-Platform Charges</h4></td><td><h4>$ Pre-Market Value Addition Charges</h4></td></tr></table>

    </div>
    
	<div class="bottom"></div>
	</footer>
    
 



<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/moment.js" type="text/javascript"></script>
<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

<script type="text/javascript">
            $(function () {
$('#from').datetimepicker({
                 format: 'DD/MM/YYYY'
           });
$('#to').datetimepicker({
                 format: 'DD/MM/YYYY'
           });
});
        </script>
       <script>
function history(){
	document.historyForm.submit();
}

</script>
</body>
</html>
