<%@ page import="java.util.*" %>
<%
   String lang = request.getParameter("lang");
	System.out.println(lang);
   if (lang == null) {
%>
<html>
<head>
<title>
</title>
</head>
<body onload="document.form1.submit()">
<!-- <center> -->
<!-- <font face="Times New Roman,Times" size=+3> -->
<!-- Welcome To NeoMandi -->
<!-- </font></center> -->
<!-- <hr> -->
<!-- <p align="center"> -->
<!-- Please select a language:</p> -->
<form action="openLang.do?lang=English" method="post" align="center" name="form1">
<!-- English <input type="radio" name="lang" value="English" checked> -->
<!-- &#3221;&#3240;&#3277;&#3240;&#3233; <input type="radio" name="lang" value="Kannada"> -->
<!-- <input type="submit" value="Continue"> -->
</form>
</body>
</html>
<%
   } else {
     Locale locale=null;
     if(lang.equals("Kannada")){
    	 System.out.println("if kannada");
    	locale=new Locale("kn","IN");
     } else if (lang.equals("French")) {
         locale=Locale.FRANCE;
     } else if (lang.equals("Swedish")) {
       locale=new Locale("sv","SE");
     } else {
         locale=Locale.US;
     }
     session.putValue("myLocale",locale);
     ResourceBundle bundle = ResourceBundle.getBundle("com.neomandi.prototype.Message",locale);
     for (Enumeration e = bundle.getKeys();e.hasMoreElements();) {
         String key = (String)e.nextElement();
         String s = bundle.getString(key);
         session.putValue(key,s);
         //System.out.println(session.getValue("myLocale"));
     }
%>
<jsp:forward page="HomePage.jsp" />
<%}%>