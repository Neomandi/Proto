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
    <li class="active"><a class="classbeauty" id="ts" href="#">Summary</a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>
<div class="container-fluid today">
<div class="container"><h2>Today's Summary</h2></div>
</div>
<% 
		/*if(request.getAttribute("error").equals("error"))
		{ 
			out.println("<script type=\"text/javascript\">");
  			out.println("alert('YOU HAVE NOT TAKEN PART IN AUCTION TO DISPLAY SUMMARY');");
		    out.println("location='FarmerProfile.jsp';");
		    out.println("</script>");
		}*/
		
		HttpSession hs=request.getSession(false);  
     	String pass=(String)hs.getAttribute("pass");  
    	System.out.println(" in reject summary password="+pass);
	    HttpSession hsr=request.getSession(false); 
	    String lotnumber=(String)hsr.getAttribute("lotnumber");
	    hsr.setAttribute("lotnumber", lotnumber);
	    System.out.println(" in reject summary lotnumber="+lotnumber);
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
	    System.out.println("in reject summary lotsize="+lotsize);
	    double lot=Integer.parseInt(lotsize);
		    String status="";
		    if(lot==qsold)
	    		status+="Fully executed .You have Rejected the bid";
	    			else
	    		status+="Partially executed.You have Rejected the bid";
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
<div class="container-fluid sum1 pad">
<div class="tabin">
<div class="sum1tab table-responsive">
	  <table class="table sum1table last">
<thead><tr>
       <td></td>
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
	<td><h4>status</h4></td>
	<td></td>
	  </tr></thead>
	  <tbody>
	  <tr class="gradeX">
	  	<td></td>
	  	<td class="clspad0"><h4><%=lotnumber %></h4></td>
	  	<td><h4><%=lotsize%></h4></td>
	  	<td><h4><%=quantitysold %></h4></td>
	  	<td><h4><%= aprice%></h4></td>
	  	<td><h4><%=fprice %></h4></td>
	  	<td><h4>--</h4></td>
	  	<td><h4>--</h4></td>
	  	<td><h4>--</h4></td>
	  	<td><h4>--</h4></td>
	  	<td><h4>--</h4></td>
	  	<td  class="clspadr0"><h4>--</h4></td>
	  	<td width="25%"><h4><%=status %></h4></td>
	  	<td></td></tr>
	  
	  </tbody>
	  </table>
</div>
	  </div>
	  </div>
<div class="container-fluid  history"><div class="container"><h2>History</h2></div></div>
<div class="container from">
<div class="datetable" align="center">


   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='from'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div></div>
   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10"><div class='input-group date' id='to'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div></div>
<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><div><a href="#" class="get">Get Summary</a></div></div>
<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 pad"><a href="#" class="export">Export as PDF</a></div>

</div>
</div>

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
	  <tr class="gradeX"><td></td><td class="clspad0"><h4>10/01/2017</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td class="clspadr0"><h4>19,100</h4></td><td></td></tr>
	  <tr class="gradeX"><td></td><td class="clspad0"><h4>10/01/2017</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td class="clspadr0"><h4>19,100</h4></td><td></td></tr>
	  <tr class="gradeX"><td></td><td class="clspad0"><h4>10/01/2017</h4></td><td><h4>CBPCARA0173</h4></td><td><h4>1000</h4></td><td><h4>1000</h4></td><td><h4>20</h4></td><td><h4>20,000</h4></td><td><h4>500</h4></td><td><h4>200</h4></td><td><h4>100</h4></td><td><h4>100</h4></td><td><h4>900</h4></td><td class="clspadr0"><h4>19,100</h4></td><td></td></tr>
	  </tbody>
	  </table>
</div>
	  </div>
	  </div><!---table2 end-->
	  <div id="grad1"></div>
	  <div class="container charge">
	  <table class="table"><tr><td><h4>*Transportation / Loading Charges</h4></td><td><h4> #E-Platform Charges</h4></td><td><h4>$ Pre-Market Value Addition Charges</h4></td></tr></table>

    </div>
	<div class="bottom"></div>
    
 



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
</body>
</html>
