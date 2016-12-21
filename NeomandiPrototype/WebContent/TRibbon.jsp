<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
*{margin:0px;padding:0px;}

html {
	  	width:100%;
		height:100%;
  		text-align: center;
	}
	
#ribbon {
		padding: .34em 1em;
		margin: 0;
		margin-top: 1%;
		position: absolute;
		left: 0px;
		top: -14px;
		width: 1900px;
		height: 30px;
		color: blue;
		font: 32px 'Patua One', sans-serif;
		text-align: left;
		letter-spacing:0.1em;
		text-shadow: 0px -1px 0px rgba(0,0,0,0.3);
		box-shadow: inset 0px 1px 0px rgba(255,255,255,.3),
					inset 0px 0px 20px rgba(0,0,0,0.1),
					0px 1px 1px rgba(0,0,0,0.4);
		background: -webkit-linear-gradient(top,#1eb2df, #17a7d2);
        display: inline-block;
	}

#content:before, #content:after {
		position: "left";
		content:"";
		bottom:-.5em;
		position:absolute;
		display:block;
		border-style:solid;
		border-color: Fuchsia transparent transparent transparent;
		z-index:-1;
		background: -webkit-linear-gradient(top,#1eb2df, #17a7d2);
	}
	
#content:before {
	    position: "left";
		left: 0;
		border-width: .10em 0 0 .10em;
		background: -webkit-linear-gradient(top,#1eb2df, #17a7d2);
		}
	
#content:after {
	  right: 0;
	  border-width: .10em .10em 0 0;
	  background: -webkit-linear-gradient(top,#1eb2df, #17a7d2);
	}
#one
{
	position: absolute;
	right: 0px;
	color: red;
	text-decoration: none;
}

.logout
{	
    text-align: center;
    border: 1px solid black;
    border-radius: 21px 21px 21px 21px;
    background-color: red;   
	display: inline;
	display: block;
    color: white;
	width: 130px;
	height: 29px;
	text-decoration: none;
	padding: 10px 20px;
	position: absolute;
	top: 4px;
	right: 10px;
	font-size: 32px;
}
</style>
</head>
<body>
<div id="ribbon">
		<span id="content">
		<font size="4"  face="Comic Sans MS" color="white"> Welcome 
		<% 
			HttpSession tlog=request.getSession(false);
			if((String)tlog.getAttribute("name")==null)
			{    out.println("<script type=\"text/javascript\">");
			  	 out.println("alert('YOU HAVE NOT LOGGED IN PLEASE LOGIN ');");
			  	 out.println("location='TraderLogin.jsp';");
			 	 out.println("</script>");
			}	
			else
				out.println((String)tlog.getAttribute("name")); 
				%>  &nbsp &nbsp &nbsp  &nbsp &nbsp  &nbsp  &nbsp &nbsp &nbsp  &nbsp  &nbsp  &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp You logged in on
 				<%out.println(tlog.getAttribute("date"));%> &nbsp &nbsp  at  <% out.println((String)tlog.getAttribute("time"));%>
         		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
		</font>
		</span>
	</div>
	<br/><a class = 'logout' href = "logout.do">LOGOUT</a>
</body>
</html>