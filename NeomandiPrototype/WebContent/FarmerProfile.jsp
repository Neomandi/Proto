<%@page import="java.sql.SQLException"%>
<%@page import="com.neomandi.prototype.JDBCHelper,java.sql.Connection,java.sql.ResultSet,
     java.sql.PreparedStatement,
     java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
	<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NeoMandi</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="">
    <div class="logo_relative">
        <div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
        <div class="container-fluid headertop">
            <div class="">

                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far">
                    <h1>Farmer1, welcome to e-Auction at NeoMandi.</h1></div>
                <div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="Login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
            </div>
        </div>

        <div class="container-fluid tradtab">
            <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
                <ul class="nav nav-tabs">
                    <li><a href="FarmerMaster.jsp">Auction</a></li>
                    <li><a href="Lotdetails.jsp">My Lots</a></li>
                    <li><a href="FarmerTradeSummary.jsp">Summary</a></li>
                    <li class="active"><a href="FarmerProfile.jsp">My Profile</a></li>
                     <li><a href="FarmerSummaryInt.jsp">History</a></li>
                </ul>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 det">
                <h4>My Details</h4>
                <div class="detail">
                
<%	 	
		 
	 		HttpSession hs=request.getSession(false);  
	     	String pass=(String)hs.getAttribute("pass");  
	     	// String time=(String)hs.getAttribute("time");
	    	
		 	System.out.println("password="+pass);
			
			HttpSession hs1=request.getSession(false);  
	   	     hs1.setAttribute("pass",pass); 
		     Connection con = null;
		Statement statement = null;
		     ResultSet rs = null;    
		       
		     con = JDBCHelper.getConnection();
			//display aadhar number 
		    
		     try
		     	{	
		     
		     	statement = con.createStatement();
		     	String sql = "select * from freg where pass='"+pass+"' ";
		     	//System.out.println(sql);
		     	rs = statement.executeQuery(sql);
		    	while(rs.next()){
		    		String adhar=rs.getString("aadharnum");
				    String name=rs.getString("name");
				    Long mobile=rs.getLong("mobile");
				    String email=  rs.getString("email");
				    String state= rs.getString("state");
				    String district= rs.getString("district"); 
				    String taluk= rs.getString("taluk"); 
				    String bankname= rs.getString("bankname");
				    String accountnumber= rs.getString("accountnum");
				    String ifsc= rs.getString("ifsccode");
				    String branch= rs.getString("branch"); 
				%>
                    <form>
                        <table class="table">
                            <tr>
                                <td>
                                    <label for="name">Name</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=name%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="aadhar">Aadhar Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=adhar %>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="mobno">Mobile Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=mobile%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email">Email:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="email" class="form-control" id="email" value="<%=email%>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="address">Address</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">State</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=state%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">District</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=district%>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">Taluk</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=taluk%>" readonly />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pin">Pin</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="pin" readonly>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-offset-1 col-xs-10 aut">
                <h4>My Account Details</h4>
                <div class="bankacc">
                    <form>
                        <table class="table">

                            <tr>
                                <td>
                                    <label for="aadhar">Bank Name</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=bankname%>" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="name">Account Number</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=accountnumber%>" readonly />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="address">IFSC</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=ifsc %>" readonly />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="mobno">Bank Branch</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="<%=branch%>" readonly/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%
						}
					}
					catch(SQLException e)
					{
						e.printStackTrace();
					}
					finally
					{
						JDBCHelper.Close(rs);
						JDBCHelper.Close(statement);
						JDBCHelper.Close(con);
					}
					%>
                </div>
                <br>
                <br>
                <table align="center">
                    <tr>
                        <td><a href="#" class="reg">Export as PDF</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
