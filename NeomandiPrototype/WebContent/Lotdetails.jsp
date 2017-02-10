<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"
    import=" com.neomandi.prototype.JDBCHelper, 
    java.io.PrintWriter, java.sql.Connection, 
    java.sql.ResultSet,java.sql.Statement,
    javax.servlet.ServletException,
	javax.servlet.http.HttpServlet,
 	javax.servlet.http.HttpServletRequest,
	javax.servlet.http.HttpServletResponse,
	java.sql.SQLException,java.text.SimpleDateFormat,
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
<%
	
	 HttpSession hs1=request.getSession(false);  
     String pass=(String)hs1.getAttribute("pass");  
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     con = JDBCHelper.getConnection();
%>
<div class="container-fluid tradtab">
<div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
  <ul class="nav nav-tabs">
    <li ><a href="FarmerMaster.jsp">Auction</a></li>
    <li class="active"><a  href="Lotdetails.jsp" >My Lots</a></li>
    <li><a class="classbeauty" id="ts" href="#">Summary</a></li>
    <li><a href="FarmerProfile.jsp">My Profile</a></li>
     <li ><a href="FarmerSummaryInt.jsp">History</a></li>
  </ul>
  <%
	 
     String s="";
     try{	
     	if(con == null)
     	{
     		System.out.println("Connection establish failed");
     	}
     	statement = con.createStatement();
     	String sql = "select aadharnum from freg where pass='"+pass+"' ";
     	System.out.println(sql);
     	resultSet = statement.executeQuery(sql);
    	while(resultSet.next()){
  			s+=resultSet.getString("aadharnum");
		    System.out.println("aadhar number="+s);
		
		}
	}
	catch(SQLException e)
	{
		e.printStackTrace();	
	}
%>
</div>
</div>
</div>

<div class="container-fluid lots pad">
<div class="tabin">
<div class="lottable">
<table class="table ltable">
<thead><tr>
          <td></td>
	  <td><h4>Lot Number</h4></td>
	  <td><h4>Produce</h4></td>
	  <td><h4>Product</h4></td>
	  <td><h4>Grade</h4></td>
	  <td><h4>Quantity</h4></td>
	  <td></td><td></td>
	  </tr></thead>
	  <%
//fetching lotdetails
	String imgsrc="";
	try{	
		
			statement = con.createStatement();
			String sql5 = "select lotnumber,produce,kindofpro,qualitygrade,quantity from productentry where farmerid='"+s+"'";
			System.out.println(sql5);		
			resultSet = statement.executeQuery(sql5);
			while(resultSet.next()){
				String lotnumber=resultSet.getString("lotnumber");
				  imgsrc="ProductImages/"+lotnumber+".jpg";
%>
	  <tbody>
	  <tr class="gradeX">
	  <td></td>
	  <td><button type="button" class="btn popup" data-toggle="modal" data-target="#myModal1"><%=lotnumber %></button></td>
	  <td><h4><%= resultSet.getString("produce")%></h4></td>
	  <td><h4><%= resultSet.getString("kindofpro")%></h4></td>
	  <td><h4><%=resultSet.getString("qualitygrade")%></h4></td>
	  <td><h4><%= resultSet.getString("quantity")%></h4></td>
	  <td></td>
	  </tr>			
<% 	
			}
		} catch (Exception e) {
		e.printStackTrace();
	}
	  finally{
		  resultSet.close();
			statement.close();
			con.close();
	  }
%>
	  </tbody>
	  </table>
</div>
	  </div>
	  </div>
    
  
  <!---------modal image--------------->
<div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Product Image</h4>
        </div>
        <div class="modal-body">
          <img src="<%=imgsrc%>" class="img-responsive trad">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!--------modal image end------------>   
  



<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>


     

</body>
</html>
