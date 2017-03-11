<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp" import=" com.neomandi.prototype.JDBCHelper, 
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
	 java.text.DateFormat,
	 com.neomandi.prototype.FarmerHistoryBean,
	 java.util.Date,
	 java.sql.*"
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
.img-responsive{
    	height: 60px;
    	width: 65px;
    }
    .tradtab a{
    background-color:#0082B2;
    }
     .today {
    background: #149DDA;
    margin-top: 10px;
}
.sum1 .table thead {
    background: #000080;
}
#div{
    		padding:30px;
			margin:200px;
			width:40%;
			background-color:#BFBFBF;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
    }
</style>
</head>

<body class="" >
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<%HttpSession hs=request.getSession(false); 
if((String)hs.getAttribute("name")==null){
	out.println("<script>window.alert('YOU HAVE NOT LOGGED IN,PLEASE LOGIN'); window.location='Login.html';</script>");
}
 String name=(String)hs.getAttribute("name"); %>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far">
<p style="font-size:16px; color:white;"><%=name %>, welcome to e-auction at NeoMandi.</p></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="FLogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>

<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li ><a href="FarmerMaster.jsp">Auction</a></li>
    <li ><a  href="Lotdetails.jsp" >My Lots</a></li>
    <li class="active"><a class="classbeauty" id="ts" href="#">Summary</a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
    <li ><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>
</div>
</div>
</div>
<div class="container-fluid today">
<div class="container"><h2>Today's Summary</h2></div>
</div>
  <%	
  		String pass=(String)hs.getAttribute("pass");  
    	System.out.println(" in accept summary password="+pass);
    	 Connection con = null;
	     Statement statement = null;
	     ResultSet resultSet = null;    
	       
	     con = JDBCHelper.getConnection();
		//display aadhar number 
	     String s="";
	     DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	     Date d = new Date();
	     String date=dateFormat.format(d);
	     System.out.println(dateFormat.format(d)); 
	     try
	     	{	
	     
	     	statement = con.createStatement();
	     	String sql = "select aadharnum,name from freg where pass='"+pass+"' ";
	     	//System.out.println(sql);
	     	resultSet = statement.executeQuery(sql);
	    	while(resultSet.next()){
	    		s+=resultSet.getString("aadharnum");
			    name+=resultSet.getString("name");
					}
			}
			catch(SQLException e)
			{
				e.printStackTrace();	
			}
	    	

		
    	 %>		
		  
     
<div class="container-fluid sum1 pad">
<div class="tabin">
<div class="sum1tab table-responsive">
	  <table class="table sum1table last">
<thead><tr>
       <td></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Lot Size</h4></td>
	  <td><h4>Quantity sold</h4></td>
	  <td><h4>Avg Price</h4></td>
	  <td><h4>Gross Earnings</h4></td>
	  <td><h4>TLC<sup>*</sup></h4></td>
	<td><h4>Market Cess</h4></td>
	<td><h4>EPC<sup>#</sup></h4></td>
	<td><h4>PMVA<sup>^</sup></h4></td>
	<td><h4>Deductions</h4></td>
	<td><h4>My Net Earnings</h4></td>
	
	<td></td>
	  </tr></thead>
	  <tbody>
	   
	 <%
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	String imgsrc="";
   
	String lotnumber="";
	try
	{
	con = JDBCHelper.getConnection();
	
	if(con == null)
	{
		System.out.println("Connection not established.");
	}
	else
	{
		String sql = "select * from  history where farmerid='"+s+"'  and created_at>= CURDATE() AND created_at < CURDATE() + INTERVAL 1 DAY ORDER BY created_at";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println(sql);
		System.out.println(rs);
		//System.out.println(rs.getRow());
		//System.out.println(rs.first());
		String lotnumber1=null;
		if(rs.next())
		{
			lotnumber1 = rs.getString("lotnumber");
			System.out.println("lotnumber="+lotnumber1);
		}
		
	
		if(lotnumber1!=null)
		{
			System.out.println("Inside if....");
			
				String sql2 = "select * from  history where farmerid='"+s+"'  and created_at>= CURDATE() AND created_at < CURDATE() + INTERVAL 1 DAY ORDER BY created_at";
				pstmt1 = con.prepareStatement(sql2);
				rs1 = pstmt1.executeQuery();
				
					while(rs1.next())
					{

						String quantity=rs1.getString("quantitybidfor");
				  	    String average=rs1.getString("averageprice");
				  	  	double aprice=Double.parseDouble(average);
					    aprice=aprice*100;
					    aprice=(int)aprice;
					    aprice=aprice/100;
					    double qsold=Double.parseDouble(quantity);
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
			%>
		 	  
	  <tr class="gradeX">
	  	<td></td>
	  	
	  	
	  	<td class="clspad0"><h4 style="color:#000080"><b><%=rs1.getString("lotnumber") %></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=rs1.getString("quantity") %></b></h4></td>
	  	<td><h4  style="color:#000080 ;font-wieght:bold;"><b><%=rs1.getString("quantitybidfor")%></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=rs1.getString("averageprice") %></b></h4></td>
	  	  
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=fprice %></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=Transport %></b></h4></td>
	  	<td><h4  style="color:#000080;font-wieght:bold;"><b><%=MUCharge%></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=EPUCharge%></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=PACharge%><b></b></h4></td>
	  	<td><h4  style="color:#000080; font-wieght:bold;"><b><%=deduction%></b></h4></td>
	  	<td  class="clspadr0"><h4 style="color:#000080"><b><%=myEarn %></b></h4></td>
	  	
	  	<td></td></tr>
	  


		
		                        <%
					}
		
		}
		else
		{
			 System.out.println("Inside else....");
			 out.println("<div id='div' style='position: absolute; top: 100px; left: 170px;'><p ><b>There are no trades recorded for the day.</b></p></div>");
		}
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>
	  
	  
	  
	  </tbody>
	  </table>
</div>
	  </div>
	  </div>
	 
        <footer>
	  <div id="grad1"></div>
	 
	  <div class="container charge">
	  <table class="table"><tr><td><h4>*Transportation / Loading Charges</h4></td><td><h4> #E-Platform Charges</h4></td><td><h4>^ Pre-Market Value Addition Charges</h4></td></tr></table>

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
       
</body>
</html>
