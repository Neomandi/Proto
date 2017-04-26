<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image1/png" href="Images/Neomandi1.png">
    <title>NeoMandi</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
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
        .fileUpload {
            position: relative;
            overflow: hidden;
            margin: 10px;
        }
        
        .fileUpload input.upload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }
        
        .clsupload {
            background: #fff;
            padding-top: 100px;
            padding-bottom: 100px;
        }
         .tradtab a{
    background-color:#0082B2;
    }
        body {
		    background-image: url("images/nm-white-background-pattern.png");
		    background-repeat:no-repeat;
		    background-size:cover;
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
    function validateProductEntry(){
    	
    	var farmerid=document.ProductEntryForm.farmerid;
    	var quantity=document.ProductEntryForm.quantity;
    	var marketcode=document.ProductEntryForm.marketcode;
    	var category=document.ProductEntryForm.category;
    	var produce=document.ProductEntryForm.produce;
    	var grade=document.ProductEntryForm.quality;
    	var empnumber=document.ProductEntryForm.empnumber;
    	var epwd=document.ProductEntryForm.epwd;
    	var lotnumber=document.ProductEntryForm.lotnumber;
    	var fileID=document.ProductEntryForm.fileID;
    	
    	//farmerid validation
    	if(farmerid.value == ""){
    		swal("Please enter farmerid");
    		farmerid.focus();
    		return false;
    	}
		if(!/^[0-9]+$/.test(farmerid.value)){
			swal("Please enter only numbers");
			farmerid.focus();
			return false;
		}
    	if(isNaN(farmerid.value)){
    		swal("Enter a valid Farmer ID ");
    		farmerid.focus();
    		return false;
    	}
    	if(farmerid.value.length !=12){
    		
    		swal(" Your Farmerid must contain 12 digits");
    		farmerid.focus();
    		return false;
    	}
    	
    	//marketcode validation
    	var letters = /^[0-9a-zA-Z]+$/;
    	if(marketcode.value == ""){
    		swal("Please enter Marketcode");
    		marketcode.focus();
    		return false;
    	}

		//Category Validation
		//console.log(category.value);
		if(category.value == "Category")
		{
			swal("Please select proper Category");
			return false;
		}
		
		//Produce Validation
// 		console.log(produce.value);
// 		console.log(produce.value == "Produce");
		if(produce.value == "produce")
		{
			swal("Please select proper Produce");
			return false;
		}
		
		//Grade Validation
		//console.log(grade.value);
		if(grade.value == "Grade")
		{
			swal("Please select proper Grade");
			return false;
		}
    	
    	//quantity validation
    	if(quantity.value == ""){
    		swal("Please enter quantity");
    		quantity.focus();
    		return false;
    	}
    	if(isNaN(quantity.value)){
    		swal("Enter a valid quantity value. Only number from 0-9");
    		quantity.focus();
    		return false;
    	}
    	if(!/^[0-9]+$/.test(quantity.value)){
    		swal("Please enter only numbers");
    		quantity.focus();
    		return false;
    	}
    	if(quantity.value==0){
    		swal("Please enter atleast minimum 1 kg");
    		quantity.focus();
    		return false;
    	}
    	
    	//Lotnumber Validation
    	if(lotnumber.value == "")
    	{
    		swal("Lotnumber is empty. Please press 'Genereate Lot Number button' to generate lotnumber");
    		return false;
    	}
    	
    	//EmployeeNumber Validation
    	if(empnumber.value == "")
    	{
    		swal("Please enter Employee Number");
    		return false;
    	}
    	
    	//EmployeePassword Validation
    	if(epwd.value == "")
    	{
    		swal("Please enter Employee Password");
    		return false;
    	}
    	return true;
    }
    
    
    $(function() {
        var availableTags = [
          "ABC563101",
          "BAC578455",
          "CAC578455",
          "DAC578455",
          "EAC578455",
          "FAC578455",
          "GAC578455",
          "HAC578455",
          "IAC578455",
          "JJC578455",
          "KAC578455",
          "LAC578455",
          "MAC578455",
          "NAC578455",
          "OAC578455",
          "PAC578455",
          "QAC578455",
          "RAC578455",
          "SAC578455",
          "TAC578455",
          "UAC578455",
          "VAC578455"
        ];
        $("#marketcode").autocomplete({
          source: availableTags
        });
      } );
    </script>
    <style>
    	.img-responsive {
		    height: 60px;
		    width: 65px;
		}
		.detail select{
				background-image: url(images/icon2.png);
    			background-repeat: no-repeat;
    			background-size: 10px 13px;
    			/*background-position:98% 5%;*/
    			background-position:98% 50%;	
		}
    </style>
</head>
<body class="">
    <% 
	    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	    
		HttpSession elog = request.getSession(false);
	    if((String)elog.getAttribute("ename")==null || (String)elog.getAttribute("epwd")==null)
	    {
	    	//System.out.println("Session invalid."+elog);
	    	out.println("<script>swal({title: 'You have not logged in. Please login',text: 'You will be redirected to login page.',timer: 2000,showConfirmButton: false},function(){window.location='Login.html';});</script>");
	    }
	%>
    <div class="logo_relative">
        <div class="hidden-xs logo "><img src="images/trad_logo.png" class="img-responsive"></div>
        <div class="container-fluid headertop">
            <div class="">
                <div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 far">
                    <p style="font-size:16px; color:white;"><%=((String)elog.getAttribute("ename"))%>, <%=session.getValue("employee.ribbon") %></p></div>
                <div class="col-lg-1 col-sm-2 col-md-2 col-xs-2 power"><a class="pull-right" data-toggle="tooltip" title="Logout" href="ELogout.do"><i class="fa fa-power-off" aria-hidden="true"></i></a></div>
            </div>
        </div>
        <div class="container-fluid tradtab">
            <div class="col-lg-offset-1 col-lg-9 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-xs-offset-2 col-xs-8 pad">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="ProductEntry.jsp"><%=session.getValue("product.entry") %></a></li>
                    <li><a href="Revenue.jsp"><%=session.getValue("revenue") %></a></li>
                    <li><a href="Dispatch.do"><%=session.getValue("dispatch") %></a></li>

                </ul>

            </div>
        </div>
    </div>


    <div id="home" class="tab-pane fade in active">
        <div class="container">
            <div class="row">
            <input type = "hidden" id = "nm" value = ""/>
            <form name = "ProductEntryForm" action = "ProductEntry.do" method = "post" enctype="multipart/form-data" onsubmit = "return ProductEntry();">
                <br>
                <br>
                <div class="col-lg-offset-0 col-lg-4 col-md-offset-0 col-md-4 col-sm-offset-0 col-sm-5 col-xs-offset-1 col-xs-10 det">
                    <h4 style="background: #bdd102;color:black;"><%=session.getValue("product.h41") %></h4>
                    <div class="detail">
                            <table class="table">
                                <tr>
                                    <td>
                                        <label for="name"><%=session.getValue("product.label.farmerid") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="farmerid" name="farmerid" value="${param. farmerid}">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="aadhar"><%=session.getValue("product.label.marketcode") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="marketcode" name="marketcode" value="${param. marketcode}">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="category" name="category" onchange = "populate('category','produce')">
                                            <option value="Category"><%=session.getValue("product.label.category") %></option>
                                            <option value="Vegetables" ${param.category == 'Vegetables' ? 'selected' :''}><%=session.getValue("trader.product.vegetables") %></option>
                                            <option value="Fruits" ${param.category == 'Fruits' ? 'selected' :''}><%=session.getValue("trader.product.fruits") %></option>
                                            <option value="Grains" ${param.category == 'Grains' ? 'selected' :''}><%=session.getValue("trader.product.grains") %></option>
                                            <option value="Pulses" ${param.category == 'Pulses' ? 'selected' :''}><%=session.getValue("trader.product.pulses") %></option>
                                            <option value="Horticultural" ${param.category == 'Horticultural' ? 'selected' :''}><%=session.getValue("trader.product.horticulture") %></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="produce" name="produce">
                                            <option value="Produce"><%=session.getValue("product.label.produce") %></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" id="quality" name="quality">
                                            <option value="Grade"><%=session.getValue("product.label.grade") %></option>
											<option value="A" ${param.grade == 'A' ? 'selected' :''}><%=session.getValue("trader.product.gradea") %></option>
                                    		<option value="B" ${param.grade == 'B' ? 'selected' :''}><%=session.getValue("trader.product.gradeb") %></option>
                                    		<option value="C" ${param.grade == 'C' ? 'selected' :''}><%=session.getValue("trader.product.gradec") %></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="pin"><%=session.getValue("product.label.quantity") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="quantity" name="quantity" value="${param. quantity}">
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
                <div class="col-lg-offset-0 col-lg-3 col-md-offset-0 col-md-3 col-sm-offset-0 col-sm-5 col-xs-offset-1 col-xs-10 gen">
                    <h4 style="background: #bdd102;color:black;"><%=session.getValue("product.h42") %></h4>
                    <div class="bankacc">
                        <div class="bankacc1" onclick="showimageupload();">
                            <div id="showtext" style="line-height:30px; padding-top:30%;"><%=session.getValue("product.image.upload") %></div>

                            <img id="blah" src="#" style="display:none">
                            <input type="file" id="fileID" name="fileID" style="display: none;" onchange="readURL(this);" required/>
                        </div>

                        <br>
                    </div>
                </div>
                <div class="col-lg-offset-0 col-lg-2 col-md-offset-0 col-md-2 col-sm-offset-0 col-sm-2 col-xs-10 gen">
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <table align="center">
                        <tr>
                            <td><a onclick = "return lotnumber();" class="reg" style="cursor: pointer;">Generate<br> Lot<br> Number</a></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                </div>
                <div class="col-lg-offset-0 col-lg-3 col-md-offset-0 col-md-3 col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10 release">
                    <h4 style="background:#149DDA;"><%=session.getValue("farmer.register.h44") %></h4>
                    <div class="password">
                            <table class="table">

                                <tr>
                                    <td>
                                        <label for="lot"><%=session.getValue("product.label.lotnumber") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="lotnumber" name="lotnumber" value="${param. lotnumber}" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="emp"><%=session.getValue("product.label.employeename") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="pwd" name="empnumber"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="pwd"><%=session.getValue("farmer.register.label.enterpassword") %></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" class="form-control" id="pwd" name="epwd" autocomplete="new-password"/>
                                    </td>
                                </tr>

                            </table>
                        
                    </div>
                    <br>
                    <table align="center">
                        <tr>
                            <td><a href="javascript: submitform()"  style="font-weight:bold; color:black; "><%=session.getValue("product.submit") %></a></td>
                        </tr>
                    </table>
                </div>
                </form>
            </div>
        </div>
	<% String msg = (String)request.getAttribute("errmsg");  %>
	<br/><br/><br/><p align = "center"><b><% if(msg != null && msg.equals("SUCCESS"))
							{
								out.println("Product Entry Successful");
							}
							else if(msg != null)
							{
								out.print(msg);
							}
									%></b></p>
    </div>
    <script>
        function readURL(input) {
            $('#blah').show();
            $('#showtext').hide();
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        .width(200)
                        .height(220);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function showimageupload() {
            document.getElementById('fileID').click();
        }
        
        function submitform(){
        	var bool = validateProductEntry();
        	//console.log("Bool: "+bool);
        	if(bool == true)
        	{
        		document.ProductEntryForm.submit();
        	}
        }
        
        var num = Math.floor(Math.random() * 9999) + 1000;
        console.log("num: "+num);
        document.getElementById('nm').value = num;
        
        function lotnumber(){
        	var farmerid = document.getElementById("farmerid").value;
        	var produce = document.getElementById("produce").value;
        	var quality = document.getElementById("quality").value;
        	var num = document.getElementById("nm").value;
        	//console.log(farmerid+" "+produce+" "+quality+" "+num);
        	
        	if(farmerid == "" || produce == "Produce" || quality == "Grade")
        	{
        		swal("Please give proper Farmerid, Produce and Quality Grade to generate Lotnumber");
        		return false;
        	}
        	else
        	{
        		var lotnumber = farmerid.substring(0,3) + produce.substring(0,3) + quality + num;
            	//console.log(lotnumber);	
        		document.getElementById("lotnumber").value = lotnumber;
        	}
        }
    </script>
</body>
</html>