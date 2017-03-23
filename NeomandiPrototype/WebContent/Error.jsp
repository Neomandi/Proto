<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
    <link rel="icon" type="image1/png" href="Images/Neomandi1.png">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
	<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-9 col-md-offset-1 col-md-10 col-xs-offset-1 col-xs-9" style="position: absolute; top: 30%; left: 0%;">
		<h1 align="center" style="color: red;">Error!!!</h1>
		<h3 align="center">Please contact admin</h3>
		<%exception.printStackTrace(new java.io.PrintWriter(out));%>
	</div>
</div>
</body>
</html>