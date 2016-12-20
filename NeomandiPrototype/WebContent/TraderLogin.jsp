<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="Images/Neomandi1.png">
<title>Trader Login</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
</head>
<style>
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(http://themes.googleusercontent.com/static/fonts/lato/v7/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
}

body {
	background: #448ed3 ;
	font-family: "Lato" ;
}
.wrap {
	width:250px;
	height: auto;
	margin: auto;
	margin-top: 10%;
}
.avatar {
	width: 100%;
	margin: auto;
	width: 65px;
	border-radius: 100px;
	height: 65px;
	background: #448ed3 ;
	position: relative;
	bottom: -15px;
}
.avatar img {
	width: 55px;
	height: 55px;
	border-radius: 100px;
	margin: auto;
	border:3px solid #fff;
	display: block;
}
.wrap input {
	border: none;
	background: #fff;
  font-family:Lato ;
  font-weight:700 ;
	display: block;
	height: 40px;
	outline: none;
	width: calc(100% - 24px) ;
	margin: auto;
	padding: 6px 12px 6px 12px;
}
.bar {
	width: 100%;
	height: 1px;
	background: #fff ;
}
.bar i {
	width: 95%;
	margin: auto;
	height: 1px ;
	display: block;
	background: #d1d1d1;
}
.wrap input[type="text"] {
	border-radius: 7px 7px 0px 0px ;
}
.wrap input[type="password"] {
	border-radius: 0px 0px 7px 7px ;
}
.wrap input[type="submit"] {
	border-radius: 0px 0px 7px 7px ;
	background-color: rgb(100, 237, 29);
}
.forgot_link {
	color: #83afdf ;
	color: #83afdf;
	text-decoration: none;
	font-size: 11px;
	position: relative;
	left: 193px;
	top: -36px;
}
.wrap button {
	width: 100%;
	border-radius: 7px;
	background: #b6ee65;
	text-decoration: center;
	border: none;
	color: #51771a;
  margin-top:-5px;
	padding-top: 14px;
	padding-bottom: 14px;
	outline: none;
	font-size: 13px;	
	border-bottom: 3px solid #307d63;
	cursor: pointer;
}
h1
{
	position: absolute;
	left: 595px;
	top: 40px;
}
#three
{
	display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
</style>
<body>
<div id = "one">
<h1>Trader Login</h1>
<form action="TraderLoginInt.jsp" method = "post"  name = "TraderLoginform">
	<div class="wrap">
		<div class="avatar">
      <img src="Images/Neomandi.png">
		</div>
		<input type="text" placeholder="username" name = "tname" required>
		<div class="bar">
			<i></i>
		</div>
		<input type="password" placeholder="password" name = "tpwd" required>
		<!-- <a href="" class="forgot_link">forgot ?</a>  --><br/>
		<input type = "submit" value = "Login"/>
		<a id = "three" href = "HomePage.html">Home</a>
	</div>

  <script src="js/index.js"></script>
</form>
</div>
<% String msg = (String)request.getAttribute("errmsg");  %>
<p align = "center"><b><% if(msg != null)
							out.print(msg);
									%></b></p>
</body>
</html>