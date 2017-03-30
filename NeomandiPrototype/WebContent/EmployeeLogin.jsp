<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="Images1/Neomandi1.png">
    <title>NeoMandi</title>
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
<script>
function validateELForm()
{
	var name = document.EmployeeLoginform.ename;
	var pwd = document.EmployeeLoginform.epwd;
	
	//Name validation
	if(name.value=="")
	{
		swal("Please provide username.");
		name.focus();
		return false;
	}
	
	//Pwd validation
	if(pwd.value=="")
	{
		swal("Please provide password.");
		pwd.focus();
		return false;
	}		
	return true;
}
</script>
</head>

<body class="" onkeypress="myFunction(event)">
    <!---menu bar------>

    <nav class="navbar navbar-inverse menu">
        <div class="container-fluid">
            <div class="col-lg-1 col-md-2 col-sm-2 col-xs-10 navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="HomePage.html"><img src="images/trad_logo.png" class="img-responsive"></a>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 navbar-collapse collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="HomePage.html">About Us</a></li>
			        <li><a href="Vision.html">Vision</a></li>
			        <li><a href="Mission.html">Mission</a></li>
					<li><a href="Howitworks.html">How it works</a></li>
			        <li><a href="News.html">News</a></li>
					<li><a href="ContactUs.html">Contact Us</a></li>
					<li class="dropdown">
			          <a class="dropdown-toggle" href="Register.html">Register</a>
			          
			        </li>
			        <li  class="active"><a href="Login.html">Login</a></li>
                </ul>

            </div>
        </div>
    </nav>
    <!-----menu bar end------>
	
    <div class="container-fluid emplog pad">
        <div class="row">
            <div class="col-lg-2 col-md-3 hidden-sm hidden-xs pad loginlogo"><img src="images/trad_logo.png" class="img-responsive" alt="Cinque Terre" style="height:100%"></div>
            <div class="col-lg-offset-8 col-lg-2 col-md-offset-5 col-md-3 col-sm-offset-4 col-sm-4 col-xs-offset-1 col-xs-6">
            	<div>
                <table class="table login">
                    <tbody>
                        <tr>
                            <td>
                                <h2 class="text-center">Employee Login</h2></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" class="form-control" id="ename" placeholder="User name" name="ename">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" class="form-control" id="epwd" placeholder="Password" name="epwd">
                            </td>
                        </tr>
                        <tr align="center">
                            <!-- <tr align="center"><td><a href="javascript: submitform()" class="log">Login</a></td></tr><br> -->
							<td><button class="btn btn-primary" onclick="submitform();" style="width: 244px; border-radius:0px; background-color:#149DDA">Login</button></td><br/>

                        </tr>
                        <tr align="center">
                            <td><a href="" class="frgt">Forgot password?</a></td>
                        </tr>
                    </tbody>
                </table>
			</div>
            </div>
        </div>
    </div>
 
    
    
    <% String msg = (String)request.getAttribute("errmsg");  %>
	<p align = "center" style="margin-top: 40px;"><b><% if(msg != null)
								out.print(msg);
										%></b></p>
	<script>
// 	function submitform(){
// 		var bool = validateELForm();
// 		if(bool==true)
// 		{
// 			document.EmployeeLoginform.submit();
// 		}
// 	}
	function submitform(){
	var msg="";
	//console.log(document.getElementById("ename").value);
	//console.log(document.getElementById("epwd").value);
	if(document.getElementById("ename").value==null|| document.getElementById("ename").value === undefined || document.getElementById("ename").value === "")
    {
    	console.log(document.getElementById("ename").value);
    	//window.blurt("ENTER USERNAME");
    	msg="USER NAME ";
    }	
	if(document.getElementById("epwd").value==null|| document.getElementById("epwd").value === undefined || document.getElementById("epwd").value === "")
    {
    	console.log(document.getElementById("epwd").value);
    	//window.blurt("ENTER USERNAME");
    	msg=msg+"PASSWORD";
    }	
	console.log(msg.length);
	if(msg.length!=0){
		msg = "PLEASE ENTER "+msg;
		swal( msg);}
	
	else{
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		if(this.readyState==4 && this.status==200)
		{
			 var string=xmlhttp.responseText;
			 console.log("string is "+string);
		    	if(string.includes("SUCCESS"))
		    	{
		    		window.location="ProductEntry.jsp";
		    	}
		    	else 
		    	{
		    		swal(string);		
		    	}
		}		
	};
	xmlhttp.open("POST", "EmployeeLogin.do", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("ename="+document.getElementById("ename").value+"&epwd="+document.getElementById("epwd").value);
  }
}
	
	
	function myFunction(event) {
	    var x = event.which || event.keyCode;
	    if(x == 13){
	    	submitform();
	    }
	}
	
	</script>
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>

</body>

</html>