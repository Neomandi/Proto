<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.SQLException,com.neomandi.prototype.JDBCHelper,java.sql.DriverManager, java.sql.*"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeoMandi</title>
    <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
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
.img-responsive 
{
    height: 60px;
    width: 65px;
}
.tradtab a{
    background-color:#0082B2;
    }
</style>
<body class="">
	<% 
		HttpSession elog = request.getSession(false);
	    if((String)elog.getAttribute("name")==null && (String)elog.getAttribute("pwd")==null)
	    {
	    	//System.out.println("Session invalid."+elog);
	    	out.println("<script>alert('Youve not logged in. Please login'); window.location='http://neomandi.in/Login.html';</script>");
	    }
	%>
    <div class="logo_relative">
        <div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
        <div class="container-fluid headertop">
            <div class="">

                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-9 far">
                   <p style="font-size:16px; color:white;"><%=((String)elog.getAttribute("name"))%>, welcome to e-aution at Neomandi.</p></div>
                <div class="col-lg-1 col-sm-1 col-md-1 col-xs-2 power"><a class="pull-right" href="Login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
            </div>
        </div>

        <div class="container-fluid tradtab">
            <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-9 pad">
                <ul class="nav nav-tabs">
                    <li><a href="ProductEntry.jsp">Product Entry</a></li>
                    <li class="active"><a href="Revenue.jsp">Revenue</a></li>
                    <li><a href="Dispatch.do">Dispatch</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid lots">
        <div class="container tabin">
            <div class="revtab">
                <table class="table rtable">
                    <thead>
                        <tr>
                            <td>
                                <h4>Lot Number</h4></td>
                            <td>
                                <h4>Lot Cost</h4></td>
                            <td>
                                <h4>TLC<sup>*</sup></h4></td>
                            <td>
                                <h4>Commision</h4></td>
                            <td>
                                <h4>Market Cess</h4></td>
                            <td>
                                <h4>EPC<sup>#</sup></h4></td>
                            <td>
                                <h4>TLC<sup>*</sup></h4></td>
                            <td>
                                <h4>Market Cess</h4></td>
                            <td>
                                <h4>EPC<sup>#</sup></h4></td>
                            <td>
                                <h4>PMVA<sup>$</sup></h4></td>
                            <td>
                                <h4>NeoMandi Revenue</h4></td>
                        </tr>
                    </thead>
                    <tbody>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	try
	{
	con = JDBCHelper.getConnection();
	
	if(con == null)
	{
		System.out.println("Connection not established.");
	}
	else
	{
		String sql = "select ar.lotnumber, sum(ar.quantityassigned), ar.aadharnumber, tb.bidprice, tb.bestbid, hs.averageprice, hs.quantitybidfor from traders_bid_price tb, auction_result ar, history hs where (tb.lotnum = ar.lotnumber) and (tb.aadharnumber = ar.aadharnumber) and (hs.lotnumber = tb.lotnum)";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
			/*if(rs.getString("COUNT(*)").equals("0"))
			{
				 out.println("<script type=\"text/javascript\">");
			  	 out.println("alert('No Revenues');");
			 	 out.println("</script>");
			}
			else*/
			{
				String sql2 = "select ar.lotnumber, sum(ar.quantityassigned), ar.aadharnumber, tb.bidprice, tb.bestbid, hs.averageprice, hs.quantitybidfor from traders_bid_price tb, auction_result ar, history hs where (tb.lotnum = ar.lotnumber) and (tb.aadharnumber = ar.aadharnumber) and (hs.lotnumber = tb.lotnum)";
				pstmt1 = con.prepareStatement(sql2);
				rs1 = pstmt1.executeQuery();
				//System.out.println(rs);
				System.out.println("is resultset not empty "+!rs1.isBeforeFirst());
		// 		if(!rs.isBeforeFirst())
		// 		{
					while(rs1.next())
					{
						String lotnumber = rs1.getString("lotnumber");
						int quantityassigned = Integer.parseInt(rs1.getString("sum(ar.quantityassigned)"));
						String aadharnumber = rs1.getString("bidprice");
						int bestbid = Integer.parseInt(rs1.getString("bestbid"));
						double averageprice = Double.parseDouble(rs1.getString("averageprice"));
						int lotcost = (int)(quantityassigned*averageprice);
						int commission = (int)(lotcost*0.05);
						int marketcess = (int)(lotcost*0.01);
						double quantitybidfor = Double.parseDouble(rs1.getString("quantitybidfor"));
						int fmarketcess = (int)((averageprice * quantitybidfor) * 0.01);
						int nmr = commission + marketcess + 100 + 100 + fmarketcess;
		%>
		                        <tr class="gradeX">
		                            <td>
		                                <h4><%= lotnumber %></h4></td>
		                            <td>
		                                <h4><%= lotcost %></h4></td>
		                            <td>
		                                <h4>3000</h4></td>
		                            <td>
		                                <h4><%= commission %></h4></td>
		                            <td>
		                                <h4><%= marketcess %></h4></td>
		                            <td>
		                                <h4>100</h4></td>
		                            <td>
		                                <h4>3000</h4></td>
		                            <td>
		                                <h4><%= fmarketcess %></h4></td>
		                            <td>
		                                <h4>100</h4></td>
		                            <td>
		                                <h4>100</h4></td>
		                            <td>
		                                <h4><%= nmr %></h4></td>
		                        </tr>
		                        <%
					}
		// 		}
		// 		else
		// 		{
		// 			System.out.println("No revenues.");
		// 		}
			}
		}
		else
		{
			 out.println("<script type=\"text/javascript\">");
		  	 out.println("alert('No Revenues');");
		 	 out.println("</script>");
		}
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(rs);
		JDBCHelper.Close(rs1);
		JDBCHelper.Close(pstmt);
		JDBCHelper.Close(pstmt1);
		JDBCHelper.Close(con);
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
            <table class="table">
                <tr>
                    <td>
                        <h4>*Transportation / Loading Charges</h4></td>
                    <td>
                        <h4> #E-Platform Charges</h4></td>
                    <td>
                        <h4>$ Pre-Market Value Addition Charges</h4></td>
                </tr>
            </table>

        </div>
        <div class="bottom"></div>
    </footer>
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>