<%@page import="java.sql.SQLException"%>
<%@page import="com.neomandi.prototype.JDBCHelper,java.sql.Connection,java.sql.ResultSet,
     java.sql.PreparedStatement,java.util.*,
    java.io.InputStream,java.io.InputStreamReader,java.io.Reader,java.io.OutputStream, 
    com.neomandi.prototype.ProductSearchResultBean,java.io.BufferedInputStream,
    java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,
	  java.io.IOException,
	 java.io.InputStream,
	 java.sql.Blob,
	 java.sql.Connection,
	 java.sql.ResultSet,
	 java.sql.SQLException,
	 java.sql.Statement,
	 java.awt.image.BufferedImage,
 java.io.ByteArrayInputStream,com.neomandi.prototype.TraderLoginBean,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image1/png" href="Images/Neomandi1.png">
<title>NeoMandi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
.whiteclsbc{
background-color:#ffffff;
width:5%;
border-top:1px solid #fff !important;
}
tbody:before {
    content: "-";
    display: block;
    line-height:10px;
    color: transparent;
}
.from table{
margin-top:0px;
} 
.autable .table tbody tr td, .lottable .table tbody tr td,  .sum2tab .table tbody tr td {
border-top:2px solid #fff !important;
}
.img-responsive {
	height: 60px;
	width: 65px;
}
</style>
</head>
<body class="" >
<%HttpSession tlog=request.getSession(false);
TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
try{
if((String)tlbn.getTname()==null||((String)tlbn.getTname()).equals("hi"))
{    out.println("<script type=\"text/javascript\">");
  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
  	 out.println("location='TraderLogin.jsp';");
 	 out.println("</script>");
} }
catch(Exception e)
{
	e.printStackTrace();
}
%>
<div class="logo_relative">
<div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
<div class="container-fluid headertop">
<div class="">
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1>Trade1, welcome to e-aution at Neomandi.</h1></div>
<div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
</div>
</div>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li ><a href="product.jsp">Product Search</a></li>
                        <li><a href="TraderBlock.do">Hold Funds</a></li>
                        <li><a href="TradeorAuction.do">Trade</a></li>
                        <li><a href="OrderStatus.do">Status</a></li>
                        <li><a href="Summary1.do">Summary</a></li>
                        <li class="active"><a href="TraderProfile.jsp">My Profile</a></li>
  </ul>
</div>
</div>
</div>
      <div class="container">
	  <br><br>
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<h4>My Details</h4>
<div class="detail">
<%
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try
					{
						con = JDBCHelper.getConnection();
						if(con == null)
						{
							out.println("Connection not established!");
						}
						String sql = "SELECT * FROM treg WHERE name = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1,(String)tlbn.getTname());
						rs = pstmt.executeQuery();
						if(rs.next())
						{
				%>
<form id="myprofile">
    <table class="table">
      <tr><td><label for="name">Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value=<%= rs.getString("name") %> readonly></td></tr>
      <tr><td><label for="aadhar">Aadhar Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"value=<%= rs.getLong("aadharnumber") %> readonly></td></tr>
      <tr><td><label for="mobno">Mobile Number</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr"value=<%= rs.getLong("mobile") %> readonly></td></tr>	  
      <tr><td><label for="email">Email:</label></td></tr>
      <tr><td><input type="email" class="form-control" id="email" placeholder="Enter email"value="<%= rs.getString("email") %>" readonly></td></tr>
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr>
                                <td>
                                    <label for="state">State</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="state" value=<%= rs.getString("state") %> readonly>
                                </td>
                            </tr>
	 		<tr>
                                <td>
                                    <label for="district">District</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="district" value=<%= rs.getString("district") %> readonly>
                                </td>
                            </tr>
							<tr>
                                <td>
                                    <label for="taluk">Taluk</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="taluk" value=<%= rs.getString("taluk") %> readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pin">Pin</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="usr" value="Pin" readonly>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bank">
<h4>My License Details</h4>
<div class="password">
<form>
    <table class="table">
      <tr><td><label for="name">Trade License Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value="<%= rs.getString("license") %>" readonly></td></tr>
      <tr><td><label for="aadhar">Date of Registration</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
      <tr><td><label for="mobno">Place of Registration</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>	  
      <tr><td><label for="address">Address</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr"></td></tr>
       <tr><td><input type="text" class="form-control" id="usr"></td></tr><tr>
                                <td>
                                    <label for="state">State</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="state" value="<%= rs.getString("lstate") %>" readonly>
                                </td>
                            </tr>
							<tr>
                                <td>
                                    <label for="district">District</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="district" value=<%= rs.getString("ldistrict") %> readonly>
                                </td>
                            </tr>
							<tr>
                                <td>
                                    <label for="taluk">Taluk</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="taluk" value=<%= rs.getString("ltaluk") %> readonly>
                                </td>
                            </tr>
	  <tr><td><label for="pin">Pin</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value=<%= rs.getString("lpin") %> readonly></td></tr>
    </table>
  </form>
  </div><br>
 <table align="center"><tr><td><a href="#" class="reg">Export as PDF</a></td></tr></table>
</div>

<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 pass">
<h4>My Account Details</h4>
<div class="detail">
<form>
    <table class="table"> 
  <tr><td><label for="name">Bank Name</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value=<%= rs.getString("bankname") %> readonly></td></tr>
      <tr><td><label for="aadhar">Account Number</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value=<%= rs.getString("accountnum") %> readonly></td></tr>
      <tr><td><label for="mobno">IFSC</label></td></tr>
<tr><td><input type="text" class="form-control" id="usr" value=<%= rs.getString("ifsccode") %> readonly></td></tr>	  

      <tr><td><label for="address">Bank Branch</label></td></tr>
	  <tr><td><input type="text" class="form-control" id="usr" value="<%= rs.getString("branch") %>" readonly></td></tr>
    </table>
  </form>    <%
							}
						}
						catch(SQLException e)
						{
							e.printStackTrace();
						}
						finally
						{
							JDBCHelper.Close(rs);
							JDBCHelper.Close(pstmt);
							JDBCHelper.Close(con);
						}
					%>
  </div>
</div>
</div>
</div>
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</body>
</html>
