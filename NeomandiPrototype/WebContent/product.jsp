<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" import="java.util.*,
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
 java.io.ByteArrayInputStream,
 java.io.ByteArrayOutputStream,
 java.io.File,
 java.io.IOException,
 java.io.InputStream,
 javax.imageio.ImageIO" errorPage="Error.jsp"%>
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
        </style>
        <script>
        function populate(s1, s2)
        {
        	var s1 = document.getElementById(s1);
        	var s2 = document.getElementById(s2);
        	console.log(s1.value);
        	console.log(s2.value);
        	s2.innerHTML = "";
        	if(s1.value == "Vegetables")
        	{
        		var optionArray = ["produce|Produce", "CARROT|Carrot", "ONION|Onion", "BEANS|Beans", "TOMATO|Tomato", "RADDISH|Raddish"];	
        	}
        	else if(s1.value == "Fruits")
        	{
        		var optionArray = ["produce|Produce", "APPLE|Apple", "ORANGE|Orange", "GRAPES|Grapes", "BANANNA|Bananna", "MANGO|Mango"];
        	}
        	else if(s1.value == "Grains")
        	{
        		var optionArray = ["produce|Produce", "WHEAT|Wheat", "CORN|Corn", "MILLET|Millet", "BARLEY|Barley", "RICE|Rice"];
        	}
        	else if(s1.value == "Pulses")
        	{
        		var optionArray = ["produce|Produce", "CHICKPEA|Chickpea", "HORSEGRAM|Horsegram", "PEAS|Peas"];
        	}
        	else if(s1.value == "Category")
        	{
        		var optionArray = ["produce|Produce"];
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
    <body class="">
        <div class="logo_relative">
            <div class="hidden-xs logo "><img src="images/trad_logo.jpg" class="img-responsive"></div>
            <div class="container-fluid headertop">
                <div class="">
                <%
					String lotnum="null";
					String quantity="null";
					String msg1=(String)request.getAttribute("notlogged");
					String msg2=(String)request.getAttribute("productsearchresult");
					String msg3=(String)request.getAttribute("errmsg");
					String msg4=(String)request.getAttribute("quantity");
						
					HttpSession psr=request.getSession(false);
					List<ProductSearchResultBean> l=(List<ProductSearchResultBean>)psr.getAttribute("beans");
					HttpSession tlog=request.getSession(false);
					if((String)tlog.getAttribute("Tname")==null)
					{    out.println("<script type=\"text/javascript\">");
					  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
					  	 out.println("location='TraderLogin.jsp';");
					 	 out.println("</script>");
					}
			    %>
                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far"><h1><%=(String)tlog.getAttribute("name")%>, Welcome to e-Auction at NeoMandi.</h1></div>
                <div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" href="login.html"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
                </div>
            </div>
            <div class="container-fluid tradtab">
                <div class="container">
                    <ul class="nav nav-tabs" style="border-bottom: 1px solid #ddd;">
                        <li class="active"><a href="product.jsp">Product Search</a></li>
                        <li><a href="TraderBlock.do">Hold Funds</a></li>
                        <li><a href="TradeorAuction.do">Trade</a></li>
                        <li><a href="OrderStatus.do">Status</a></li>
                        <li><a href="TradeSummary.jsp">Summary</a></li>
                        <li><a href="TraderProfile.jsp">My Profile</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="home" class="tab-pane fade in active">
            <div class="container-fluid psearch" style="border-top: 1px solid white;">
                <div class="container release">
                    <table class="table">
                        <tr>
                            <td>
                            <form id="myForm" action="ProductSearchInt.jsp" method = "post">
                                <select class="form-control" id="category" name="category" style="border-top: -4px solid #ddd;" onchange = "populate('category','produce')">
                                    <option value="Category">Select Category</option>
                                    <option value="Vegetables">Vegetables</option>
                                    <option value="Fruits">Fruits</option>
                                    <option value="Grains">Grains</option>
                                    <option value="Pulses">Pulses</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-control" id="produce" name="produce">
                                    <option value="Produce">Select Produce</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-control" id="grade" name="grade">
                                    <option selected value="base">Choose Grade</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                </select>
                            </td>
                            <td>
                                <select class="form-control" id="slot" name="slot">
                                    <option selected value="base">Auction Slot</option>
                                    <option value="slot1">Slot 1 (10:30-10:35)</option>
                                    <option value="slot2">Slot 2 (10:40-10:45)</option>
                                    <option value="slot3">Slot 3 (10:50-10:55)</option>
                                </select>
                            </td>
                            <td><a href="#" onclick="fun()" onclick="fun()" class="reg">Search</a></td>
                            <script>
							function fun()
							{
								console.log("category="+document.getElementById("category").value+" slot="+document.getElementById("slot").value+" grade="+document.getElementById("grade").value)
								if(document.getElementById("category").value=="Category"&&document.getElementById("slot").value=="base")
									alert("You need to choose atleast Slot number or kind of produce")
								else
								{
									document.getElementById("myForm").submit();//window.location.href='http://localhost:8080/NeomandiPrototype/TraderLogin.jsp';
								}
							}							
						</script></form>
                        </tr>
                    </table>
                </div>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
            </div>
            <%  if(msg2!=null||msg3!=null)
  {
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String image = null;  
byte[] imgData = null;
OutputStream os=null;
	%>
                <div class="container tabin">
                    <div class="pstable">
                        <table class="table pstab">
                            <thead>
                                <tr align="center">
                                    <td>
                                        <h4>Lot Number</h4></td>
                                    <td>
                                        <h4>Market Code</h4></td>
                                    <td>
                                        <h4>Produce</h4></td>
                                    <td>
                                        <h4>Grade</h4></td>
                                    <td>
                                        <h4>Quantity Available</h4></td>
                                    <td>
                                        <h4></h4></td>
                                    <td>
                                        <h4></h4></td>
                                </tr>
                            </thead>
                            <tbody>
                            <% 
	                            for(Object o:l)
								{						
									ProductSearchResultBean psr1=(ProductSearchResultBean)o;
									lotnum=psr1.getLotnumber();		
									quantity=psr1.getQuantity();
									System.out.println("in for loop"+psr1.getPhoto());
							%>
							<input type="hidden" id="quantity<%= psr1.getLotnumber()%>" value="<%= psr1.getQuantity()%>">
							<input type="hidden" id="product<%= psr1.getLotnumber()%>" value="<%= psr1.getLotnumber()%>">	
                          <!--      <td></td>
						<td></td>
						<td><% out.println(psr1.getQualitygrade()); %></td>
						<td><% out.println(psr1.getQuantity());%></td>
						<input type="hidden" id="quantity<%= psr1.getLotnumber()%>" value="<%= psr1.getQuantity()%>">
						<input type="hidden" id="product<%= psr1.getLotnumber()%>" value="<%= psr1.getLotnumber()%>">						
						<td><input type="number" name="quantityneeded" id="quantityneeded<%=psr1.getLotnumber() %>" placeholder="enter quantity" required step="100" min="100"/></td>
					    <!-- <td><a href="AddTrade.do?s1=<%=psr1.getLotnumber() %>" onclick="fun()">ADD TO TRADE LIST</a></td> 
						<td><input type="button" onclick="fun<%=psr1.getLotnumber() %>()" value="ADD TO TRADE LIST"/>	
						<script> 
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
							if(neededs>totals)
							{
								alert("YOU CANT BID FOR MORE QUANTITY THAN AVAILABLE");
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
							}
							else if(isNaN(neededs))
							{
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
								alert("YOU SHOULD ENTER THE QUANTITY YOU WILL BID FOR BEFORE SELECTING THE LOT ");									
							}
							else 
							{
								alert("SUCCESSFULLY ADDED THE LOT "+product+" WITH QUANTITY "+neededs+"  Kgs");
								document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
								window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs
							}													
						}
						</script></td>--> 
                               
                                 
                                <tr class="gradeX">
                                    <td>
                                        <button onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border-radius: 9px; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal"><% out.println(psr1.getLotnumber()); %></button>
                                    </td>
                                    <td>
                                        <h4><% out.println(psr1.getMarketcode()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getProduce()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getQualitygrade()); %></h4></td>
                                    <td>
                                        <h4><% out.println(psr1.getQuantity()); %></h4></td>
                                    <td>
                                        <input type="number" min='1' class="form-control" id="quantityneeded<%=psr1.getLotnumber() %>" placeholder="Enter Required quantity">
                                    </td>
                                    <td class="tdfit"><a href="#" onclick="fun<%=psr1.getLotnumber() %>()" class="reg">Add to Trade List</a></td>
                                </tr>
                                <script> 
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
									if(neededs>totals)
									{
										alert("YOU CANT BID FOR MORE QUANTITY THAN AVAILABLE");
										document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
									}
									else if(isNaN(neededs))
									{
										document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
										alert("YOU SHOULD ENTER THE QUANTITY YOU WILL BID FOR BEFORE SELECTING THE LOT ");									
									}
									else 
									{
										alert("SUCCESSFULLY ADDED THE LOT "+product+" WITH QUANTITY "+neededs+"  Kgs");
										document.getElementById("quantityneeded<%=psr1.getLotnumber() %>").value="";
										window.location="http://localhost:8080/NeomandiPrototype/AddTrade.do?s1="+product+"&&quantity="+neededs
									}													
								}
						</script>
                                
                                 <!---------modal image------------->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <img src="images1/<%=psr1.getLotnumber() %>.png" class="img-responsive trad">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--------modal image end------------> <%}} %> 
                             <!--    <tr class="gradeX">
                                    <td>
                                        <button onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button>
                                    </td>
                                    <td>
                                        <h4>CBPCARA0173</h4></td>
                                    <td>
                                        <h4>Carrot</h4></td>
                                    <td>
                                        <h4>A</h4></td>
                                    <td>
                                        <h4>2500</h4></td>
                                    <td>
                                        <input type="number" class="form-control" min='0' id="pwd" placeholder="Enter Required quantity">
                                    </td>
                                    <td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td>
                                </tr>
                                <tr class="gradeX">
                                    <td>
                                        <button onMouseOver="this.style.color='black'" onMouseOut="this.style.color='white'" type="button" style="color: white; border: 3px solid #808080;" class="btn" data-toggle="modal" data-target="#myModal">CBPCARA0173</button>
                                    </td>
                                    <td>
                                        <h4>CBPCARA0173</h4></td>
                                    <td>
                                        <h4>Carrot</h4></td>
                                    <td>
                                        <h4>A</h4></td>
                                    <td>
                                        <h4>2500</h4></td>
                                    <td>
                                        <input type="text" class="form-control" id="pwd" placeholder="Enter Required quantity">
                                    </td>
                                    <td class="tdfit"><a href="#" class="reg">Add to Trade List</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>-->
                
        </div>
        <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
    </html>