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
                overflow: hidden;
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
.auct .table thead td h4, .lots .table thead td h4, .sum1 .table thead td h4, .sum2 .table thead td h4 {
   color: #fff;
font-size: 13px;
margin: 5px auto; 
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
        </style>
    </head>

    <body class="">
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
                        <li><a href="FarmerMaster.jsp">Auction</a></li>
                        <li><a href="Lotdetails.jsp">My Lots</a></li>
                        <li class="active"><a class="classbeauty" id="ts" href="#">Summary</a></li>
                        <li><a href="FarmerProfile.jsp">My Profile</a></li>
                        <li><a href="FarmerSummaryInt.jsp">History</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid today">
            <div class="container">
                <h2>Today's Summary</h2></div>
        </div>
        <% 
		/*if(request.getAttribute("error").equals("error"))
		{ 
			out.println("<script type=\"text/javascript\">");
  			out.println("alert('YOU HAVE NOT TAKEN PART IN AUCTION TO DISPLAY SUMMARY');");
		    out.println("location='FarmerProfile.jsp';");
		    out.println("</script>");
		}*/

		  
     	String pass=(String)hs.getAttribute("pass");  
    	System.out.println(" in get summary password="+pass);
	    HttpSession hsr=request.getSession(false); 
	    String lotnumber=(String)hsr.getAttribute("lotnumber");
	    hsr.setAttribute("lotnumber", lotnumber);
	    System.out.println(" in get summary lotnumber="+lotnumber);
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
	    		status+="Fully executed .Waiting for your approval";
	    			else
	    		status+="Partially executed.Waiting for your approval";
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
                            <thead>
                                <tr>
                                    <td></td>
                                    <td>
                                        <h4>Lot Number</h4></td>
                                    <td>
                                        <h4>Lot Size<br/>(kg)</h4></td>
                                    <td>
                                        <h4>Quantity sold<br/>(kg)</h4></td>
                                    <td>
                                        <h4>Avg Price<br/>(Rs)</h4></td>
                                    <td>
                                        <h4>Gross Earnings<br/>(Rs)</h4></td>
                                    <td>
                                        <h4>TLC<sup>*</sup><br/>(Rs)</h4></td>
                                    <td>
                                        <h4>Market Cess<br/>(Rs)</h4></td>
                                    <td>
                                        <h4>EPC<sup>#</sup><br/>(Rs.)</h4></td>
                                    <td>
                                        <h4>PMVA<sup>^</sup><br/>(Rs)</h4></td>
                                    <td>
                                        <h4>Deductions<br/>(Rs)</h4></td>
                                    <td>
                                        <h4>My Net Earnings<br/>(Rs)</h4></td>
                                    <td>
                                        <h4>Status</h4></td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="gradeX">
                                    <td></td>
                                    <td class="clspad0">
                                        <h4 style="color:#000080"><b><%=lotnumber %></b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b><%=lotsize%></b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b><%=quantitysold %></b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b><%= aprice%></b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b><%=fprice %></b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td>
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td class="clspadr0">
                                        <h4 style="color:#000080"><b>--</b></h4></td>
                                    <td width="25%">
                                        <h4 style="color:#000080"><b><%=status%></h4></td>
                                    <td></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <footer>
                <div id="grad1"></div>

                <div class="container charge">
                    <table class="table">
                        <tr>
                            <td>
                                <h4>*Transportation / Loading Charges</h4></td>
                            <td>
                                <h4> #E-Platform Charges</h4></td>
                            <td>
                                <h4>^ Pre-Market Value Addition Charges</h4></td>
                        </tr>
                    </table>

                </div>

                <div class="bottom"></div>
            </footer>
            <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
            <script src="js/bootstrap.js" type="text/javascript"></script>
            <script src="js/moment.js" type="text/javascript"></script>
            <script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

            <script type="text/javascript">
                $(function() {
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