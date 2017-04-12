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
	 com.neomandi.prototype.FarmerHistoryBean,
	 java.util.*"
%>  <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NeoMandi</title>
        <script type="text/javascript" src="js/jquery-3.2.0.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
        <link rel="stylesheet" href="libs/pure-min.css">
		<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pure/0.6.0/grids-responsive-min.css">-->
		<link rel="stylesheet" href="libs/grids-responsive-min.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
       <link href="css/sweetalert.css" rel="stylesheet" type="text/css">
		<script src="js/sweetalert.min.js" type="text/javascript"></script>
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
    .sum2 .table thead th{
   
  
    background:#000080;
    }
    .glyphicon{
    
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    
    }
  
#div{
    		padding:30px;
			margin:200px;
			width:40%;
			background-color:#F2F2F2;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
			position: absolute; 
			top: 10px; left: 170px; float:left;
			 font-weight:bold;
    }
    #div1{
    		padding:30px;
			margin:200px;
			width:40%;
			background-color:#F2F2F2;
			text-align:center;
			color:darkblue;	 
			font-size:18px;
			position: absolute; 
			top: 10px; left: 170px; float:left;
			 font-weight:bold;
    }
 
.from .pad .get::before {
content: "";
    border-top: 16px solid #d81e5d !important;
    
    position: absolute !important;
    left: -16px !important;
    top: 0
}
.auct .table thead td h4, .lots .table thead td h4, .sum1 .table thead td h4, .sum2 .table thead td h4 {
   color: #fff;
font-size: 13px;
margin: 3px auto;
padding:5px; 
}
body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
		}
.datepicker{
background-color:white;
}
        </style>
        <script>
        	function historyForm(){
        		console.log("inside the history form()");
        		
        		var frmdate=document.historyForm.from;
        		var todate=document.historyForm.to;
        		
        		if(frmdate.value==""){
        			swal("Please enter from date");
            		frmdate.focus();
            		return false;
        		}
        		if(todate.value==""){
        			swal("Please enter to date");
            		todate.focus();
            		return false;
        		}
        		return true;
        		 
        	}
        
        </script>
    </head>

    <body class="">
        <div class="logo_relative">
            <div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
            <div class="container-fluid headertop">
                <div class="">
					<%HttpSession hs=request.getSession(false); 
					if((String)hs.getAttribute("name")==null){
						out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='http://neomandi.in/Login.html';});</script>");
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
                        <li ><a class="classbeauty" id="ts" href="#">Summary</a></li>
                        <li><a href="FarmerProfile.jsp">My Profile</a></li>
                        <li class="active"><a href="FarmerSummaryInt.jsp">History</a></li>
                    </ul>
                </div>
            </div>
        </div>
  <div class="container-fluid  history">
            <div class="container">
                <h2 style="font-weight:bold; color:black;">History</h2></div>
        </div>
        <div class="container from">
            <form action="FarmerHistory.do" method="post" name="historyForm" >
                <div class="datetable" align="center">

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10">
                        FROM<div class='input-group date' id='from'  >

                            <input type='text' class="form-control" name="from" id='from' value="${param. from}" data-placement="bottom" data-toggle="tooltip" title="dd/mm/yyyy"/>
								<script>
								
								</script>

                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 clsmr10">
                       TO<div class='input-group date' id='to'>

                            <input type='text' class="form-control" name="to" value="${param. to}" data-placement="bottom" data-toggle="tooltip" title="dd/mm/yyyy"/>

                            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    </div>
                   <br/>
                    
                
            

<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 " style="padding-right:0px;"><button id="button" style="border-color:#BDD102 ;background-color:#BDD102; color:black; font-weight:bold;"  onclick="javascript:history()" class="btn btn-primary" >Get History</button></div>

<div class="col-lg-2 col-md-2 col-sm-3 col-xs-6 " style="padding-left:0px;"><button   id="download-btn"  style="border-color:#3C4DA0;background-color:#3C4DA0; " class="btn btn-primary">Export as PDF</button></div></form>



</div>



       
	

        <%
        if(request.getAttribute("farmerhistory")==null){
        	%><div id="div1" >Please choose the dates above to get your trade history</div>
        	<% 
        }
        if(request.getAttribute("farmerhistory")!=null)


		{
			if(request.getAttribute("farmerhistory").equals("no"))
				{
				 out.println("<div id='div' style='position: absolute; top: 100px; left: 170px;'><p ><b>There are no trades recorded for this period.</b></p></div>");

  	%>


            

            <%

  		} else if(request.getAttribute("farmerhistory").equals("success"))
  {%>
<br/>
                <!---table2-->
                <div class="container-fluid sum2 pad">
                    <div class="tabin">
                        <div class="sum2tab table-responsive">
                            <table id="basic-table" class="table sum2table last">

                                <thead >
                                    <tr>
                                        <th></th>
                                   		
                                        
                                        <th style="text-align:center; color:white;">
                                            <h4 style="font-size:13px;margin: 22px;">Date/Time<br/></h4></th>
                                       <th style="text-align:center; color:white;margin: 5px auto;">
                                            <h4 style="font-size:13px;margin: 22px;">Farmer Name<br/></h4></th> 
                                         <!--  <th style="text-align:center; color:white;">
                                            <h4 style="font-size:15px;">Farmer ID</h4></th>-->
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;margin: 22px;">Lot Number<br/></h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Lot Size<br/>(kg)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Quantity<br/>(kg)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Avg. Price<br/>(Rs)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Gross Earnings<br/>(Rs)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">TLC<sup>*</sup><br/>(Rs)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Market Cess<br/>(Rs)</h4></th>
                                        <th style="text-align:center; color:white">

                                            <h4 style="font-size:13px;">EPC<sup>#</sup><br/>(Rs)</h4></th>

                                        <th style="text-align:center; color:white">

                                            <h4 style="font-size:13px;">PMVA<sup>^</sup><br/>(Rs)</h4></th>

                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">Deductions<br/>(Rs)</h4></th>
                                        <th style="text-align:center; color:white">
                                            <h4 style="font-size:13px;">My Net Earnings<br/>(Rs)</h4></th>
                                        <th></th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="gradeX">
                 <% 

		HttpSession farmerhistory=request.getSession(false);
		List al=(List)farmerhistory.getAttribute("farmerhistory");
		//request.setAttribute("theList", al);
		if(al.size()==0){
			%> <%
		}else{
		for(Object o:al)
		{
			FarmerHistoryBean fhb=(FarmerHistoryBean)o;

            String finalprice=fhb.getFinalprice();

			double fprice1=Double.parseDouble(finalprice);
			fprice1=fprice1*100;
			fprice1=(int)fprice1;
			fprice1=fprice1/100;
			double MUCharge1=1*fprice1/100;
			MUCharge1=MUCharge1*100;
			MUCharge1=(int)MUCharge1;
			MUCharge1=MUCharge1/100;
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
                                                
                                                <td class="clspad0" width="15%">
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fhb.getCrdate() %></b></h4></td>
                                              <td class="clspad0">
                                                    
                                                   <h4  style="color:#000080;text-align:center;"><b><%=(String)hs.getAttribute("name")%></b></h4></td>
                                                      <!--  <td class="clspad0">
                                                    
                                                   <h4  style="color:#000080"><b><%=fhb.getFarmerid()%></b></h4></td>--> 
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fhb.getLotnumber()  %></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fhb.getQuantity() %></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fhb.getQuantitybidfor()%></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fhb.getAverageprice()%></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=fprice1%></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b>500</b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=MUCharge1 %></b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b>100</b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b>100</b></h4></td>
                                                <td>
                                                    <h4  style="color:#000080;text-align:center;"><b><%=deduction1 %></b></h4></td>
                                                <td class="clspadr0">
                                                    <h4  style="color:#000080;text-align:center;"><b><%= myEarn1 %></b></h4></td>
                                                <td></td>
                                    </tr>
                                    <%}} %>
                                </tbody>
                            </table>



                        </div>
                    </div>
                </div>
                <!---table2 end-->
                <%}} %>
               
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
                    
                    <script>
                        function history() {
                        	
                          console.log("inside the history function");
                            var bool =historyForm();
                        	console.log("Bool: "+bool);
                        	console.log()
                        	
                        	
                        		document.historyForm.submit();
                        	
                        	
                        	
                        }
                    </script>
					<script src="libs/jspdf.min.js"></script>
					
					<script src="libs/jspdf.plugin.autotable.src.js"></script>
					
					<script src="js/examples.js"></script>
					
					<script>
					    window.onhashchange = function () {
					        update();
					    };
					    document.getElementById('download-btn').onclick = function () {
					        update(true);
					    };
					    function update(shouldDownload) {
					        var funcStr = window.location.hash.replace(/#/g, '') || 'auto';
					        var doc = examples['html']();
					        /*doc.setProperties({
					            title: 'Example: ' + funcStr,
					            subject: 'A jspdf-autotable example pdf (' + funcStr + ')'
					        });*/
					        if (shouldDownload) {
					            doc.save('<%=name %> Summary.pdf');
					        } else {
					            document.getElementById("output").src = doc.output('datauristring');
					        }
					    }
					    update();
					</script>
					
					<%
	 HttpSession hs1=request.getSession(false);  
     String pass=(String)hs1.getAttribute("pass");  
     String starttime=(String)hs.getAttribute("starttime"); 
	  System.out.println(" in farmermaster starttime="+starttime);
	 String endtime=(String)hs.getAttribute("endtime"); 
	  System.out.println(" in farmermaster endtime="+endtime);
	  ServletContext context = request.getSession().getServletContext();
		starttime=(String)context.getAttribute("starttime");
		endtime=(String)context.getAttribute("endtime");
   	// String time=(String)hs.getAttribute("time");
  	SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
  	 String time=df1.format(new Date());
	 Connection con = null;
     Statement statement = null;
     ResultSet resultSet = null;    
     con = JDBCHelper.getConnection();
     
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
     String imgsrc="";
     String date="";
     String slot="";
 	String s1="";
 	try{	

 			statement = con.createStatement();
 			String sql5 = "select * from productentry where farmerid='"+s+"'";
 			System.out.println(sql5);		
 			resultSet = statement.executeQuery(sql5);
 			List<String> l=new ArrayList<String>();
 			while(resultSet.next()){
 				String lotnumber=resultSet.getString("lotnumber");
 				date+=resultSet.getString("Date");
 				slot+=resultSet.getString("slotnumber");
 				l.add(slot);
 				System.out.println(" in lotdetails date="+date);
 				System.out.println("slot="+slot);
 				for(String obj:l)  {
 					 s1=obj;
 					}
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
<div id="msg" style="visibility:hidden;" ></div>
<div id="timer" style="visibility:hidden;" ></div>
<div id="auction" style="visibility:hidden;"></div>
<div id="auction1" style="visibility:hidden;"></div>
<form>
	
<input type="hidden" value="<%=time%>" id="time" />
	<input type="hidden" value="<%=starttime%>" id="stime" />
	<input type="hidden" value="<%=endtime%>" id="etime" />
	<input type="hidden" value="<%=s1%>" id="slot" />
	<input type="hidden" value="<%=date%>" id="date" />
	
</form>
<script>
	

var Etime=document.getElementById("time").value;
var stime=document.getElementById("stime").value;
var etime=document.getElementById("etime").value;
			var slot=document.getElementById("slot").value;
			var date=document.getElementById("date").value;
			var s1="slot1";
			var s2="slot2";
			var s3="slot3";
			var s4="slot4";
			var timedif;
			var Btime1;
			var diff;
			//-----------------------for slot1-----------------------------------------------------------------------------
			if(slot==s1){
				var Etime=document.getElementById("time").value;
				var Btime=stime;
				var Btime1=etime;
			
				start = Etime.split(":");
				end =Btime.split(":");
				var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
				var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
				 diff = endDate.getTime() - startDate.getTime();
				console.log("end time is "+Btime);
				console.log("current time is "+Etime);
				console.log("difference in milliseconds is "+diff);
				var hours = Math.floor(diff / 1000 / 60 / 60);
				//diff -= hours* 60 * 60;
				var seconds= Math.floor(diff /1000);
				var minutes = Math.floor(diff / 1000 / 60);
				var res3=0;
				console.log("differences in minutes before calc "+minutes);		
				console.log("differences in seconds before calc "+seconds);		
				if(seconds>60)
				{
						res1=seconds%60;
						res2=Math.floor(seconds/60);
								
						seconds=res1;
						minutes=res2;
				}
				if(minutes>60)
				{
						res1=minutes%60;
						res3=Math.floor(minutes/60);
								
						hours=res3;
						minutes=res1;
				}
				console.log("differences in minutes is "+minutes);
				console.log("differences in seconds is "+seconds);
				console.log("differences in hours is "+hours);

				var timedifference=+hours+":"+minutes+":"+seconds;
				console.log("differences in time is "+timedifference);
				
				countdown(minutes,seconds,hours);
				
				
			}
		//--------------------------for slot2------------------------------------------------------------------------
		else if(slot==s2){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
		    diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0; 
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);
			//time progress-------------------------
    		var start = new Date();
			var maxTime = diff;
			var timeoutVal = Math.floor(maxTime/100);
			animateUpdate();

			function updateProgress(percentage) {
			    $('#pbar_innerdiv').css("width", percentage + "%");
			    $('#pbar_innertext').text(percentage + "%");
			}

			function animateUpdate() {
			    var now = new Date();
			    var timeDiff = now.getTime() - start.getTime();
			    var perc = Math.round((timeDiff/maxTime)*100);
			    console.log(perc);
			      if (perc <= 100) {
			       updateProgress(perc);
			       setTimeout(animateUpdate, timeoutVal);
			      }
			}
			//----------------------------------

			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
	}
	//-------------------------------for slot3-----------------------------------------------------------------
		else if(slot==s3){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
			 diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0;
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);

			

			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
			
	}
	//----------------------------------for slot4---------------------------------------------------------------	
		else if (slot==s4){
			var Etime=document.getElementById("time").value;
			var Btime=stime;
			var Btime1=etime;
			start = Etime.split(":");
			end =Btime.split(":");
			var startDate = new Date(0, 0, 0, start[0], start[1], start[2]);
			var endDate = new Date(0, 0, 0, end[0], end[1], end[2]);
			 diff = endDate.getTime() - startDate.getTime();
			console.log("end time is "+Btime);
			console.log("current time is "+Etime);
			console.log("difference in milliseconds is "+diff);
			var hours = Math.floor(diff / 1000 / 60 / 60);
			//diff -= hours* 60 * 60;
			var seconds= Math.floor(diff /1000);
			var minutes = Math.floor(diff / 1000 / 60);
			var res3=0;
			console.log("differences in minutes before calc "+minutes);		
			console.log("differences in seconds before calc "+seconds);		
			if(seconds>60)
			{
					res1=seconds%60;
					res2=Math.floor(seconds/60);
							
					seconds=res1;
					minutes=res2;
			}
			if(minutes>60)
			{
					res1=minutes%60;
					res3=Math.floor(minutes/60);
							
					hours=res3;
					minutes=res1;
			}
			console.log("differences in minutes is "+minutes);
			console.log("differences in seconds is "+seconds);
			console.log("differences in hours is "+hours);

			var timedifference=+hours+":"+minutes+":"+seconds;
			console.log("differences in time is "+timedifference);
			var idiff = parseInt("timedifference") + "<br>";
			countdown(minutes,seconds,hours);
			
			var five=300000;
			timedif=diff+five;
			console.log("count"+timedif);
			
		}
		//---------------------for count down timer----------------------------------	
			
function countdown(minutes,seconds,hours) 
{
	document.getElementById('ts').onclick = function() {
		  
		  location="http://neomandi.in/FarmerSummary.jsp";
	  }
	document.getElementById('ts').disabled='true';
	 	var seconds =seconds;
	    var mins = minutes
	    var hour=hours;
	    var res1=0;
	    var res2=0;
	    var timedifference=+hours+":"+minutes+":"+seconds;
	   		    
		function tick() 
		{
	        var counter = document.getElementById("timer");
	        var current_minutes = mins
    		seconds--;
	        var hour=hours;
	        counter.innerHTML =hour.toString()+":"+current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
	        if( seconds > 0 )
	        {
	            setTimeout(tick,1000);
	            document.getElementById('ts').onclick = function() {
		            	console.log("inside the count function");
		            	//swal("Auction under progress");
		            	   location="http://neomandi.in/BeforeAuction.do";
		            	}
	        } 
	        else 
     		{
				if(mins > 0)
				{
					setTimeout(function (){	countdown(mins - 1,60,hour); },1000);
				}			 				
				else
				{
					if(hour>1)
					{
	 					setTimeout(function (){	countdown(59,60,hour-1); },1000);
	 				}	
					else
					{
						
		            	var str="<h4><div id='a1'>Auction has begun. Auction will ends in</div>&nbsp;&nbsp;<div id='hms' > 5:00</div></h4>";
		            	
		            	//str+="<h4><div id='hms'style='display:inline;' >5:00</div></h4>";
		            	var strCmd = "document.getElementById('auction').style.cssText ='display:none'";
		            	var waitseconds = seconds;
		            	var timeOutPeriod = waitseconds * 1000;
		            	var hideTimer = setTimeout(strCmd, timeOutPeriod);
		            	
		            	var strCmd1 = "document.getElementById('msg').style.cssText ='display:none'";
		            	var waitseconds = seconds;
		            	var timeOutPeriod = waitseconds * 1000;
		            	var hideTimer = setTimeout(strCmd1, timeOutPeriod);
		            	
		            	document.getElementById("timer").innerHTML=str;
		            	function count(minutes1,seconds1) 
		            	{
		            		console.log("minutes is"+minutes);
		            		console.log("seconds is"+seconds1);
		        		    var seconds =seconds1;
		        		    var mins = minutes1;
		        		    var timedifference=+hours+":"+minutes1+":"+seconds1;
		        		    function tick() 
		        		    {
		        		        var counter = document.getElementById("hms");
		        		        var current_minutes = mins
		        		       	seconds--;
		        		        counter.innerHTML =current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        		        if( seconds > 0 ) {
		        		            setTimeout(tick,1000);
		        		            document.getElementById('ts').onclick = function() {
		        		            	console.log("inside the count function");
		        		            	//swal("Auction under progress");
		        		            	   location="http://neomandi.in/DuringAuction.do";
		        		            	}
		        		        } 
		        		        else 
		        		        {
			        		       if(mins > 0)
			        		       {
			        		 		setTimeout(function () { count(mins - 1,60); },1000);
			        			   }
			        		       else
			        		       {
			        		           	var str1="<center><h4>Your Auction has ended</h4><center>";
			        		           	var strCmd2 = "document.getElementById('hms').style.cssText ='display:none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd2, timeOutPeriod);
						            	
						            	var strCmd3 = "document.getElementById('a1').style.cssText ='display:none'";
						            	var waitseconds = seconds;
						            	var timeOutPeriod = waitseconds * 1000;
						            	var hideTimer = setTimeout(strCmd3, timeOutPeriod);
						            	
						            	document.getElementById('ts').onclick = function() {
			        		            console.log("inside the count function");
			        		            location="http://neomandi.in/GetSummary.do";
			        		            }
						            	if(document.getElementById("auction1")!=null){
						            		document.getElementById("accept").disabled=false;
											 document.getElementById("reject").disabled=false;
						            	}
						            	document.getElementById("auction1").innerHTML=str1;
			        		       }
		        		    	}
	        		     	}
	        		   	 	tick();
	        			}		
		            	var Etime1=document.getElementById("time").value;
		            	start1 = Etime1.split(":");
		            	end1 =Btime1.split(":");
		            	var startDate1 = new Date(0, 0, 0, start1[0], start1[1], start1[2]);
		            	var endDate1 = new Date(0, 0, 0, end1[0], end1[1], end1[2]);
		            	var td = endDate1.getTime() - startDate1.getTime();					            	
		            	var hours1 = Math.floor(td / 1000 / 60 / 60);
		            	var seconds1= Math.floor(td /1000);
		            	var minutes1 = Math.floor(td / 1000 / 60);
		            	var res1;
		            	var res2;
		            	if(seconds1>60)
		            	{
		            			res1=seconds1%60;
		            			res2=Math.floor(seconds1/60);
		            					
		            			seconds1=res1;
		            			minutes1=res2;
		            	}
		            	console.log("auction ends at "+Btime1);
		            	console.log("time is  "+Etime1);
		            	console.log("differences in time remainins is "+minutes1+":"+seconds1);
	        			count(minutes1,seconds1);
	        			
					}
				}
			}		       
 		}
 tick();
}
countdown(minutes,seconds,hours);			   
			
//console.log("time="+timedif);
 /*var t=setTimeout(auction,timedif);
 function auction(){
	 document.getElementById("accept").disabled=false;
	 document.getElementById("reject").disabled=false;
 }*/
 function accept(){
	 window.location="http://neomandi.in/AcceptSummary.do";
 }
 function reject(){
   	 window.location="http://neomandi.in/RejectSummary.do";
    }
 
 </script>
    </body>
    </html>