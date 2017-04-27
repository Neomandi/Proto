<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" import="java.util.*,
    java.io.InputStream,java.io.InputStreamReader,java.io.Reader,java.io.OutputStream,com.neomandi.prototype.ProductSearchResultBean,
    java.io.BufferedInputStream,java.io.FileInputStream,java.awt.Image,javax.imageio.ImageIO,java.io.IOException,
    java.io.InputStream,java.sql.Blob,java.sql.Connection, java.sql.ResultSet,java.sql.SQLException, java.sql.Statement,
    java.awt.image.BufferedImage,java.io.ByteArrayInputStream,com.neomandi.prototype.TraderLoginBean,java.io.ByteArrayOutputStream,
    java.io.File,java.io.IOException,java.io.InputStream,javax.imageio.ImageIO,java.text.DateFormat,java.util.Date" errorPage="Error.jsp"%>
    <html>
    <head>
    <script src="js/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
    <style>
    a
    {
    	cursor:pointer;
    }
    .psearch
    {
    height:34px;
    }
    .table{
    	position: relative;
    	right: 8px
    }
    </style>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
        <title>NeoMandi</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
        <style>
            .whiteclsbc {
                background-color: #ffffff;
                width: 5%;
                border-top: 1px solid #fff !important;
            }
            
            tbody:before {
                display: block;
                line-height: 10px;
                color: transparent;
            }
            
            .from table {
                margin-top: 0px;
            }
            .autable .table tbody tr td,
            .lottable .table tbody tr td,
            .pstable .table tbody tr td,
            .sum2tab .table tbody tr td {
                border-top: 2px solid #fff !important;
            }
            .img-responsive 
            {
		    	height: 60px;
		    	width: 65px;
			}
			.tradtab a
			{
    			background-color:#0082B2;
    		}
			#img
			{
				width: 300px;
				height: 300px;
			}
			#div
			{
	    		padding:30px;
				margin:200px;
				width:50%;
				background-color:#F2F2F2;
				text-align:center;
				color:darkblue;	 
				font-size:18px;
    		}
    		.psearch select
    		{
				background-image: url(images/icon2.png);
    			background-repeat: no-repeat;
    			background-size: 10px 13px;
    			/*background-position:98% 5%;*/
    			background-position:98% 50%;
    		}
    		#tb h4{
    			color: darkblue;
    		}
     		body { 
 		    background-image: url("images/nm-white-background-pattern.png");
		    background-size: contain;
 		} 
 		/*This will work for firefox*/
		@-moz-document url-prefix() {
		    body{
		        background-size: cover;
		    }
		}		
        @import url(http://fonts.googleapis.com/earlyaccess/notosanskannada.css);
        </style>       
        <script>
        var w = window.innerWidth;
        var h = window.innerHeight;
        
        console.log(w+" and "+h);
        
        function populate(s1, s2)
        {
        	var s1 = document.getElementById(s1);
        	var s2 = document.getElementById(s2);
        	console.log(s1.value);
        	console.log(s2.value);
        	s2.innerHTML = "";
        	if(s1.value == "Vegetables")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>", "CARROT|<%=session.getValue("trader.product.carrot")%>", "ONION|<%=session.getValue("trader.product.onion")%>", "BEANS|<%=session.getValue("trader.product.beans")%>", "TOMATO|<%=session.getValue("trader.product.tomato")%>", "POTATO|<%=session.getValue("trader.product.potato")%>", "CUCUMBER|<%=session.getValue("trader.product.cucumber")%>", "RADISH|<%=session.getValue("trader.product.raddish")%>", "GARLIC|<%=session.getValue("trader.product.garlic")%>", "CAPSICUM|<%=session.getValue("trader.product.capsicum")%>", "CABBAGE|<%=session.getValue("trader.product.cabbage")%>", "GREEN CHILLI|<%=session.getValue("trader.product.greenchilli")%>"];	
        	}
        	else if(s1.value == "Fruits")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>", "APPLE|<%=session.getValue("trader.product.apple")%>", "ORANGE|<%=session.getValue("trader.product.orange")%>", "GRAPES|<%=session.getValue("trader.product.grapes")%>", "BANANA|<%=session.getValue("trader.product.banana")%>", "MANGO|<%=session.getValue("trader.product.mango")%>"];
        	}
        	else if(s1.value == "Grains")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>", "WHEAT|<%=session.getValue("trader.product.wheat")%>", "CORN|<%=session.getValue("trader.product.corn")%>", "RAGI|<%=session.getValue("trader.product.ragi")%>", "BARLEY|<%=session.getValue("trader.product.barley")%>", "RICE|<%=session.getValue("trader.product.rice")%>"];
        	}
        	else if(s1.value == "Pulses")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>", "CHICKPEA|<%=session.getValue("trader.product.chickpea")%>", "HORSEGRAM|<%=session.getValue("trader.product.horsegram")%>", "PEAS|<%=session.getValue("trader.product.peas")%>"];
        	}
        	else if(s1.value == "Horticultural")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>","ARECA NUT|<%=session.getValue("trader.product.arecanut")%>"];
        	}
        	else if(s1.value == "Category")
        	{
        		var optionArray = ["produce|<%=session.getValue("trader.product.produce")%>"];
        	}
        	for(var option in optionArray)
        	{
        		var pair = optionArray[option].split("|");
        		var newOption = document.createElement("option");
        		newOption.value = pair[0];
        		newOption.innerHTML = pair[1];
        		s2.options.add(newOption);
        	}
        }
        </script>
    </head>
    <body class="" id="bg">
        <div class="logo_relative">
            <div class="col-lg-1 col-md-1  hidden-sm hidden-xs logo"><img src="images/trad_logo.png" class="img-responsive"></div>
            <div class="container-fluid headertop">
                <div class="">
                <input type="hidden" name="addtrade" id="addtrade">
                <%
	                response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	        		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	        		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	        		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
					String lotnum="null";
					String quantity="null";
					String msg1=(String)request.getAttribute("notlogged");
					String msg2=(String)request.getAttribute("productsearchresult");
					String msg3=request.getParameter("addtrade");
					String msg4=(String)request.getAttribute("quantity");
				
					HttpSession tlog=request.getSession(false);
					TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
					String name=null;
					try
					{
						if((String)tlbn.getTname()==null||tlbn.getTname().equals("null"))
						{  System.out.println("inside"); %> 
							<script type="text/javascript\">
						  	 	swal(YOU HAVE NOT LOGGED IN PLEASE LOGIN );  	
						  		location='TraderLogin.jsp';
						 	 </script>						 	 
						<%}
						System.out.println("(String)tlbn.getTname()==null"+(String)tlbn.getTname()==null);
						System.out.println((String)tlbn.getTpwd()==null);
						name=tlbn.getTname();
						((String)tlbn.getTname()).split(":");
					}
					catch(Exception e)
					{
						%> 
						 <script type="text/javascript\">
					  	 	swal(YOU HAVE NOT LOGGED IN PLEASE LOGIN );  	
					  	 	location='TraderLogin.jsp';
					 	 </script>						 	 
					<%}%>
                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><p style="font-size:16px; color:white;"><%=name %>, <%=session.getValue("trader.product.ribbon")%></p></div>
                <div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" data-placement="bottom" data-toggle="tooltip" title="Logout" href="logout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
                </div>
            </div>
            <div class="container-fluid tradtab">
                <div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
               <!--      <ul class="nav nav-tabs" style="border-bottom: 1px solid #ddd;"> -->
               <ul class="nav nav-tabs">
                        <li class="active"><a href="product.jsp"><%=session.getValue("trader.product.productsearch") %></a></li>
                        <li><a href="TraderBlock.do"><%=session.getValue("trader.product.holdfunds") %></a></li>
                        <li><a href="TradeorAuction.do"><%=session.getValue("trader.product.auction") %></a></li>
                        <li><a href="OrderStatus.do"><%=session.getValue("trader.product.status") %></a></li>
                        <li><a href="Summary1.do"><%=session.getValue("trader.product.summary") %></a></li>
                        <li><a href="TraderProfile.jsp"><%=session.getValue("trader.product.profile") %></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="home" class="tab-pane fade in active">
           <!-- <div class="container-fluid psearch" style="border-top: 1px solid white;"> -->
            <div class="container-fluid psearch" >
                <div class="container release">
                    <table class="table">
                        <tr>
                            <td>
                            	 <form id="myForm" action="ProductSearchInt.jsp" method = "post">
                                <select class="form-control" id="category" name="category" style="border-top: -4px solid #ddd; " onchange = "populate('category','produce')" >
                                    <option value="Category"><%=session.getValue("trader.product.select.category") %></option>
                                    <option value="Vegetables" ${param.category == 'Vegetables' ? 'selected' :''}><%=session.getValue("trader.product.vegetables") %></option>
                                    <option value="Fruits" ${param.category == 'Fruits' ? 'selected' :''}><%=session.getValue("trader.product.fruits") %></option>
                                    <option value="Grains" ${param.category == 'Grains' ? 'selected' :''}><%=session.getValue("trader.product.grains") %></option>
                                    <option value="Pulses" ${param.category == 'Pulses' ? 'selected' :''}><%=session.getValue("trader.product.pulses") %></option>
                                     <option value="Horticultural" ${param.category == 'Horticultural' ? 'selected' :''}><%=session.getValue("trader.product.horticulture") %></option>
                                </select>
                            </td>
                            <td>
                                <select class="form-control" id="produce" name="produce">
                                    <option value="Produce"><%=session.getValue("trader.product.select.produce") %></option>
                                </select>
                            </td>
                            <td>
                                <select class="form-control" id="grade" name="grade">
                                    <option selected value="base"><%=session.getValue("trader.product.select.grade") %></option>
                                    <option value="A" ${param.grade == 'A' ? 'selected' :''}><%=session.getValue("trader.product.gradea") %></option>
                                    <option value="B" ${param.grade == 'B' ? 'selected' :''}><%=session.getValue("trader.product.gradeb") %></option>
                                    <option value="C" ${param.grade == 'C' ? 'selected' :''}><%=session.getValue("trader.product.gradec") %></option>
                                </select>
                            </td>                            
							<%
							 	
							/* Date now=new Date();
							DateFormat.getTimeInstance(DateFormat.MEDIUM).format(now);
							System.out.println(DateFormat.getTimeInstance(DateFormat.MEDIUM).format(now));
							 */%>							
                            <td>
                            <%
                            ServletContext context = request.getSession().getServletContext();		
                            try
                            {
                            	System.out.println("starttime is "+(String)context.getAttribute("starttime"));
                            	if((String)context.getAttribute("starttime")!=null)
                            	{
	                        		String start=(((String)context.getAttribute("starttime")).split(":"))[0]+":"+(((String)context.getAttribute("starttime")).split(":"))[1];
	                        		String stop=(((String)context.getAttribute("endtime")).split(":"))[0]+":"+(((String)context.getAttribute("endtime")).split(":"))[1];
	                        		
                        		%>                        		
                                <select class="form-control" id="slot" name="slot">
                                    <option selected value="base"><%=session.getValue("trader.product.select.slot") %></option>                                  
                                    <option value="slot1" ${param.slot == 'slot1' ? 'selected' :''}><%=session.getValue("trader.product.slot1") %> (<%=start %>-<%=stop %>)  </option>                                                                                                                                                                                                          
                                    <option value="slot2" ${param.slot == 'slot2' ? 'selected' :''}><%=session.getValue("trader.product.slot2") %> (10:40-10:45)</option>
                                    <option value="slot3" ${param.slot == 'slot3' ? 'selected' :''}><%=session.getValue("trader.product.slot3") %> (10:50-10:55)</option>
                                </select>
                            </td>
                           <%--  <script>
									var sd1 = new Date('04/13/2017 <%=(String)context.getAttribute("starttime")%> PM UTC+05:30');
									var ed = new Date('04/13/2017 <%=(String)context.getAttribute("endtime")%> PM UTC+05:30');
									console.log(sd1.toString());
									var sd=sd1.toString();
									var start=sd.split(":");
									console.log(start[0]);
									var s=start[0].split(" ");
									console.log(s[4])
									console.log(start[1]);
									console.log(start[2]);
									var st=s[4]+":"+start[1]+":"+start[2];
									
									document.getElementById("sd").textContent=st;
									document.getElementById("ed").textContent=ed.toString();
							</script> --%>
                            <%}
                            	else{
                            		%>
                                    <select class="form-control" id="slot" name="slot">
                                        <option selected value="base"><%=session.getValue("trader.product.select.slot") %></option>                                  
                                        <option value="slot1" ${param.slot == 'slot1' ? 'selected' :''}><%=session.getValue("trader.product.slot1") %> (10:30 - 10:40)</option>                                                                      
                                    <option value="slot2" ${param.slot == 'slot2' ? 'selected' :''}><%=session.getValue("trader.product.slot2") %> (10:40-10:45)</option>
                                    <option value="slot3" ${param.slot == 'slot3' ? 'selected' :''}><%=session.getValue("trader.product.slot3") %> (10:50-10:55)</option>
                                    </select>
                                </td>
                                <%
                            	}
                            	}
                            	catch(Exception e)
                            	{
                            		e.printStackTrace();
                            		%>
                            		 <select class="form-control" id="slot" name="slot">
                                    <option selected value="base">Auction Slot</option>                                  
                                    <option value="slot1" ${param.slot == 'slot1' ? 'selected' :''}><%=session.getValue("trader.product.slot1") %> (10:30 - 10:40)</option>                                                                      
                                    <option value="slot2" ${param.slot == 'slot2' ? 'selected' :''}><%=session.getValue("trader.product.slot2") %> (10:40-10:45)</option>
                                    <option value="slot3" ${param.slot == 'slot3' ? 'selected' :''}><%=session.getValue("trader.product.slot3") %> (10:50-10:55)</option>
                               		</select>                            		
                            		<% 
                            	}%>
                            <td><a onmouseover="title();" onclick="func()" id="search" class="reg"><%=session.getValue("trader.product.search") %></a></td>                           
						</form>
                        </tr>
                    </table>
                </div>
                <script>
                //var category=document.getElementById('category').value;
                document.getElementById("search").onmouseover = function() {var e = document.getElementById("category");
                var category = e.options[e.selectedIndex].value;
                
                var e = document.getElementById("produce");
                var produce = e.options[e.selectedIndex].value;
                
                var e = document.getElementById("grade");
                var grade = e.options[e.selectedIndex].value;
                
                var e = document.getElementById("slot");
                var slot = e.options[e.selectedIndex].value;
                console.log(slot);               
                //document.getElementById('search').setAttribute('title', 'Search the lot that belongs to '+category+' category, '+produce +' produce, of '+grade+' grade, in '+slot);
     };
               
                </script>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
                <script type="text/javascript">
                            function func()
                            {								
                            	console.log("inside func");
								if(document.getElementById("category").value=="Category")
									swal({title:"ERROR",text:"You should choose the Category"})
								else if(document.getElementById("produce").value=="produce")
									swal({title:"ERROR",text:"You should choose the Produce"})
								else if(document.getElementById("grade").value=="base")
									swal({title:"ERROR",text:"You should choose the Grade"})
								else if(document.getElementById("slot").value=="base")
									swal({title:"ERROR",text:"You should choose the Slot"})							
								else
								{			
									console.log("inside else");
									document.getElementById("myForm").submit();//window.location.href='http://localhost:8080/NeomandiPrototype/TraderLogin.jsp';
								}
							}							
				</script>
            </div>
            <%  
            HttpSession psr=request.getSession(false);  
            System.out.println(msg2);
            System.out.println(psr.getAttribute("msg")==null);
            if((String)request.getAttribute("productsearchresult")==null)
            {%>
            	<div id='div' style='position: absolute; top: -30px; left: 140px;'><p><b><%=session.getValue("trader.product.searchfromdropdown")%>
            	</b></p></div>
            <%}
            if(psr.getAttribute("msg")!=null &&psr.getAttribute("msg").equals("nill"))
            {
            	out.println("<script type=\"text/javascript\">");
               	out.println("swal('There are no lots that belong to the category of "+psr.getAttribute("category")+" and "+psr.getAttribute("produce")+" produce with "+psr.getAttribute("grade")+" grade in "+psr.getAttribute("slot")+"');");
       	  	    out.println("</script>");
	       	  	psr.setAttribute("msg",null);
            }
            if(msg2!=null||msg3!=null)
			{
				Connection con = null;
				List<ProductSearchResultBean> l=(List<ProductSearchResultBean>)psr.getAttribute("beans");
		        Statement stmt = null;
				ResultSet rs = null;
				String image = null;  
				byte[] imgData = null;
				OutputStream os=null;
			%>
                <div class="container tabin">
                    <div class="pstable">
                        <table class="table pstab" id="tb">
                            <thead>
                                <tr align="center">
                                    <td>
                                        <h4><%=session.getValue("trader.trade.lotnumber") %></h4></td>
                                    <td>
                                        <h4><%=session.getValue("trader.product.marketcode") %></h4></td>
                                    <td>
                                        <h4><%=session.getValue("trader.product.produce") %></h4></td>
                                    <td>
                                        <h4><%=session.getValue("trader.product.grade") %></h4></td>
                                    <td>
                                        <h4><%=session.getValue("trader.product.quantityavailable") %> (<%=session.getValue("trader.trade.kg")%>)</h4></td>
                                    <td>
                                        <h4><%=session.getValue("trader.product.slot") %></h4></td>
                                    <td>
                                        <h4></h4></td>
                                </tr>
                            </thead>
                            <tbody>
                            <% int i=0;
	                            for(Object o:l)
								{						
									ProductSearchResultBean psr1=(ProductSearchResultBean)o;
									lotnum=psr1.getLotnumber();		
									quantity=psr1.getQuantity();
									
							%>
							<input type="hidden" id="quantity<%= psr1.getLotnumber()%>" value="<%= psr1.getQuantity()%>">
							<input type="hidden" id="product<%= psr1.getLotnumber()%>" value="<%= psr1.getLotnumber()%>">	
                                                      
                                <tr class="gradeX" id="<%= psr1.getLotnumber()%>">
                                    <td>
                                        <button onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border-radius: 9px; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal<% out.println(psr1.getLotnumber()); %>"><% out.println(psr1.getLotnumber()); %></button>
                                    </td><input type="hidden" id="color" value="<%out.println(i);%>"/>
                                    <td>
                                        <h4><% out.println(psr1.getMarketcode()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getProduce()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getQualitygrade()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getQuantity()); %></h4></td>
                                    <td>
                                    	<h4><% if(psr1.getSlotnumber()==null) out.println("Slot1"); else if(psr1.getSlotnumber().equals("slot1"))out.println("Slot1"); else if(psr1.getSlotnumber().equals("slot2"))out.println("Slot2"); else if(psr1.getSlotnumber().equals("slot3"))out.println("Slot3"); else out.println(psr1.getSlotnumber());%></h4>
                                    <td>
                                        <input type="number" step='50' min='0' class="form-control" id="quantityneeded<%=psr1.getLotnumber() %>" placeholder="<%=session.getValue("trader.product.enterrequiredquantity") %>(<%=session.getValue("trader.trade.kg")%>)">
                                    </td>
                                  <td class="tdfit"><a onclick="fun<%=psr1.getLotnumber() %>()" class="reg"><%=session.getValue("trader.product.addtotradelist") %></a></td>
                                  <td></td>
                                </tr>                                
                                <script> 
                                var i=<%=i%>;
                                if(i%2==0)
                    	        {
                                	//console.log("inside if");
                                	document.getElementById("<%= psr1.getLotnumber()%>").style.background=" #feb858";
                                }
                                else
                                {	
                                	document.getElementById("<%= psr1.getLotnumber()%>").style.background=" #d99694";}                                
	                                document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").addEventListener("keyup", function(event1){
	                                event1.preventDefault();
	                                if(event1.which == 13 || event1.keyCode == 13) 
	                                {
	                                	fun<%=psr1.getLotnumber() %>();
	                                }
	                                });
									function fun<%=psr1.getLotnumber() %>()
									{							
										var total=document.getElementById("quantity<%= psr1.getLotnumber()%>").value;
										var totals=parseInt(total);
										var needed=document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value;
										var neededs=parseInt(needed);
										console.log("QUANTITY needed IS needed="+needed);
										console.log("total is "+totals)
										var product=document.getElementById("product<%= psr1.getLotnumber()%>").value;
										console.log(product);
										var quantity=document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value;
										neededs=Math.ceil(neededs);																		
										if(neededs>totals)
										{
											swal("Please enter a quantity same as or less than the Quantity Available");
											document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
										}
										else if(isNaN(neededs))
										{
											document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
											swal("Please enter your required quantity of produce for trade. During auction, this quantity is allowed only to be increased.");									
										}
										else if(neededs<=0)
										{
												document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
												swal("Please enter your required quantity of produce for trade. During auction, this quantity is allowed only to be increased.");								
										}
										else if(neededs%50!=0 && neededs!=total)
										{
												swal("Please enter the lot size in multiples of 50kg or enter the complete lot size");
										}
										else 
										{
											swal({
										        		  title:"",
											        	  text: "Do you want your order to be a rigid order? By being a rigid order you will be assigned with full lot you have subscribed or no lot will be assigned.",
											        	 /*  text: "You will not be able to recover this imaginary file!",
											        	  */ type: "warning",
											        	  showCancelButton: true,
											        	  confirmButtonColor: "green",
											        	  confirmButtonText: "Yes",
											        	  cancelButtonText: "No",
											        	  closeOnConfirm: false,
											        	  closeOnCancel: false
										        	},
										        	function(isConfirm)
										        	{
										        		  if(isConfirm)
										        		  {
										        			  document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
																//window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs;
																xmlhttp = new XMLHttpRequest();
																xmlhttp.onreadystatechange = function() {
																if(this.readyState == 4 && this.status == 200) 
																{
																   	 var string=xmlhttp.responseText;
																   	 console.log("string is"+string);	
																   	 if(string.includes("lotnumber"))
																   	 {
																   	  	 var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
																         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
																         startlotnum=startlotnum+9;
																         
																         var ms=string.substring(startlotnum,endlotnum);
																         var newsize=new Number(ms);
																         
																         /* if (confirm('This lot is already present in your trade list with '+ms+' kg. Do you want to increase it to '+neededs+' kg? ')) 
																         {			
																        	 	swal("This lot has been added for auction with new quantity of "+neededs+" Kgs");
																        	 	xmlhttp.open("POST", "AddTrade.do", true);
																				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
																				xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
																         }
																         else
																         {
																        	 swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
																         }	 */
																         swal(
																        	{
																        		  title:"",
																	        	  text: "This lot is already present in your trade list with "+ms+" kg. Do you want to increase it to "+neededs+" kg?",
																	        	 /*  text: "You will not be able to recover this imaginary file!",
																	        	  */ type: "warning",
																	        	  showCancelButton: true,
																	        	  confirmButtonColor: "green",
																	        	  confirmButtonText: "Yes",
																	        	  cancelButtonText: "No",
																	        	  closeOnConfirm: false,
																	        	  closeOnCancel: false
																        	},
																        	function(isConfirm)
																        	{
																        		  if(isConfirm)
																        		  {
																        			swal({text:"",title:"This lot has been added for auction with new quantity of "+neededs+" Kgs"});
																        	 		xmlhttp.open("POST", "AddTrade.do", true);
																					xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
																					xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
																				  }
																        		  else 
																        		  { 
																        			  swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
																        		  }
																            });												     
																   	}
																   	else if(string.includes("fail"))
																   	{
																   		 var startlotnum=xmlhttp.responseText.indexOf('fail');
																         var endlotnum=xmlhttp.responseText.lastIndexOf('fail');
																         startlotnum=startlotnum+4;										         
																         var ms=string.substring(startlotnum,endlotnum);
																	   	 swal("During auction, the required lot size is allowed only to be increased. Please enter a lot size more than "+ms+" Kg");
															   		}
																   	else if(string.includes("msg"))
																   	{
																	 	 swal("The lot "+product+" for "+neededs+" kgs has been added to your trade list. During auction, this quantity is allowed only to be increased. ");
																   	}											
																	document.getElementById("addtrade").innerHTML = string;
																	document.getElementById("addtrade").value = string;
																}
															};
															xmlhttp.open("POST", "AddTrade.do", true);
															xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
															xmlhttp.send("s1="+product+"&quantity="+neededs+"&rigid=y");
														  }
										        		  else 
										        		  { 
										        			  document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
																//window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs;
																xmlhttp = new XMLHttpRequest();
																xmlhttp.onreadystatechange = function() {
																if(this.readyState == 4 && this.status == 200) 
																{
																   	 var string=xmlhttp.responseText;
																   	 console.log("string is"+string);	
																   	 if(string.includes("lotnumber"))
																   	 {
																   	  	 var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
																         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
																         startlotnum=startlotnum+9;
																         
																         var ms=string.substring(startlotnum,endlotnum);
																         var newsize=new Number(ms);
																         
																         /* if (confirm('This lot is already present in your trade list with '+ms+' kg. Do you want to increase it to '+neededs+' kg? ')) 
																         {			
																        	 	swal("This lot has been added for auction with new quantity of "+neededs+" Kgs");
																        	 	xmlhttp.open("POST", "AddTrade.do", true);
																				xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
																				xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
																         }
																         else
																         {
																        	 swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
																         }	 */
																         swal(
																        	{
																        		  title:"",
																	        	  text: "This lot is already present in your trade list with "+ms+" kg. Do you want to increase it to "+neededs+" kg?",
																	        	 /*  text: "You will not be able to recover this imaginary file!",
																	        	  */ type: "warning",
																	        	  showCancelButton: true,
																	        	  confirmButtonColor: "green",
																	        	  confirmButtonText: "Yes",
																	        	  cancelButtonText: "No",
																	        	  closeOnConfirm: false,
																	        	  closeOnCancel: false
																        	},
																        	function(isConfirm)
																        	{
																        		  if(isConfirm)
																        		  {
																        			swal({text:"",title:"This lot has been added for auction with new quantity of "+neededs+" Kgs"});
																        	 		xmlhttp.open("POST", "AddTrade.do", true);
																					xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
																					xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
																				  }
																        		  else 
																        		  { 
																        			  swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
																        		  }
																            });												     
																   	}
																   	else if(string.includes("fail"))
																   	{
																   		 var startlotnum=xmlhttp.responseText.indexOf('fail');
																         var endlotnum=xmlhttp.responseText.lastIndexOf('fail');
																         startlotnum=startlotnum+4;										         
																         var ms=string.substring(startlotnum,endlotnum);
																	   	 swal("During auction, the required lot size is allowed only to be increased. Please enter a lot size more than "+ms+" Kg");
															   		}
																   	else if(string.includes("msg"))
																   	{
																	 	 swal("The lot "+product+" for "+neededs+" kgs has been added to your trade list. During auction, this quantity is allowed only to be increased. ");
																   	}											
																	document.getElementById("addtrade").innerHTML = string;
																	document.getElementById("addtrade").value = string;
																}
															};
															xmlhttp.open("POST", "AddTrade.do", true);
															xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
															xmlhttp.send("s1="+product+"&quantity="+neededs+"&rigid=n");
														  }
										            });	<%-- 
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
											//window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs;
											xmlhttp = new XMLHttpRequest();
											xmlhttp.onreadystatechange = function() {
											if(this.readyState == 4 && this.status == 200) 
											{
											   	 var string=xmlhttp.responseText;
											   	 console.log("string is"+string);	
											   	 if(string.includes("lotnumber"))
											   	 {
											   	  	 var startlotnum=xmlhttp.responseText.indexOf('lotnumber');
											         var endlotnum=xmlhttp.responseText.lastIndexOf('lotnumber');
											         startlotnum=startlotnum+9;
											         
											         var ms=string.substring(startlotnum,endlotnum);
											         var newsize=new Number(ms);
											         
											         /* if (confirm('This lot is already present in your trade list with '+ms+' kg. Do you want to increase it to '+neededs+' kg? ')) 
											         {			
											        	 	swal("This lot has been added for auction with new quantity of "+neededs+" Kgs");
											        	 	xmlhttp.open("POST", "AddTrade.do", true);
															xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
															xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
											         }
											         else
											         {
											        	 swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
											         }	 */
											         swal(
											        	{
											        		  title:"",
												        	  text: "This lot is already present in your trade list with "+ms+" kg. Do you want to increase it to "+neededs+" kg?",
												        	 /*  text: "You will not be able to recover this imaginary file!",
												        	  */ type: "warning",
												        	  showCancelButton: true,
												        	  confirmButtonColor: "green",
												        	  confirmButtonText: "Yes",
												        	  cancelButtonText: "No",
												        	  closeOnConfirm: false,
												        	  closeOnCancel: false
											        	},
											        	function(isConfirm)
											        	{
											        		  if(isConfirm)
											        		  {
											        			swal({text:"",title:"This lot has been added for auction with new quantity of "+neededs+" Kgs"});
											        	 		xmlhttp.open("POST", "AddTrade.do", true);
																xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
																xmlhttp.send("s1="+product+"&quantity="+needed+"&again=yes");
															  }
											        		  else 
											        		  { 
											        			  swal("You will be auctioning for this lot with previous mentioned quantity of "+ms+" Kg");
											        		  }
											            });												     
											   	}
											   	else if(string.includes("fail"))
											   	{
											   		 var startlotnum=xmlhttp.responseText.indexOf('fail');
											         var endlotnum=xmlhttp.responseText.lastIndexOf('fail');
											         startlotnum=startlotnum+4;										         
											         var ms=string.substring(startlotnum,endlotnum);
												   	 swal("During auction, the required lot size is allowed only to be increased. Please enter a lot size more than "+ms+" Kg");
										   		}
											   	else if(string.includes("msg"))
											   	{
												 	 swal("The lot "+product+" for "+neededs+" kgs has been added to your trade list. During auction, this quantity is allowed only to be increased. ");
											   	}											
												document.getElementById("addtrade").innerHTML = string;
												document.getElementById("addtrade").value = string;
											}
										};
										xmlhttp.open("POST", "AddTrade.do", true);
										xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
										xmlhttp.send("s1="+product+"&quantity="+neededs); --%>
								}													
							}
						</script>    						                       
	              <div class="modal fade" id="myModal<%=psr1.getLotnumber()%>" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Product Image</h4>
                            </div>
                            <div class="modal-body">
                            <%if(psr1.getSlotnumber().toUpperCase().equals("SLOT1")){ %>
                              <img src="ProductImages/<%=psr1.getLotnumber()%>.jpg" alt="ProductImages/<%=psr1.getLotnumber()%>.jpg" class="img-responsive trad"  id="img">
                          <%}else{ %>
                                <img src="ProductImages/<%=psr1.getProduce()+"-"+psr1.getQualitygrade()%>.jpg" alt="ProductImages/<%=psr1.getLotnumber()%>.jpg" class="img-responsive trad"  id="img">
                           <%} %> </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--------modal image end------------> <%++i;}}%>                 
        </div>
        <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
    </html>