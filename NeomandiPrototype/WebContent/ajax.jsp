<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="number" id="number"/>
<input type="hidden" value="200Cara2013" id="lot"/>
<input type="submit" onclick="fun()">
<p id="demo"></p>
<p id="remo"></p>
<script>
function fun() {
  var obj, dbParam, xmlhttp, myObj, x, txt = "", dbParam1;
  var i= document.getElementById("number").value;
  var j= document.getElementById("lot").value;
  //obj={"increment":i};
  //var h={"lotnumber":j};
  //dbParam = JSON.stringify(obj);
  //dbParam1 = JSON.stringify(h);
  xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     // myObj = JSON.parse( );
     /* txt += "<table border='1'>"
      for (x in myObj) {
        txt += "<tr><td>" + myObj[x].name + "</td></tr>";
      }
      txt += "</table>"*/        
      document.getElementById("demo").innerHTML = xmlhttp.responseText;
   }
  };
  xmlhttp.open("POST", "ajax.do", true);
  xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xmlhttp.send("x=" + i+"&y="+j);
}
</script>
</body>
</html>