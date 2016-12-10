<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" com.neomandi.prototype.JDBCHelper, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet,java.sql.Statement,
   	javax.servlet.ServletException,
	javax.servlet.http.HttpServlet,
 	javax.servlet.http.HttpServletRequest,
	javax.servlet.http.HttpServletResponse,java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	String pass=request.getParameter("fpwd");  
	HttpSession session2=request.getSession(false);  
  	String time2=(String)session2.getAttribute("time");
  	String slot2=(String)session2.getAttribute("slot");
  	String date2=(String)session2.getAttribute("date");
	System.out.println("in countdown time="+time2);
	System.out.println("in countdown time slot="+slot2);
	System.out.println("in countdown time date="+date2);
%>
<form>
	<input type="hidden" value="<%=time2 %>" id="time" />
	<input type="hidden" value="<%=slot2 %>" id="slot" />
	<input type="hidden" value="<%=date2 %>" id="date" />
</form>
<font color="blue" ><h1>Your Auction will begins in</h1></font>
<font color="green"><h1><div id="timer">minutes</div></h1></font>

<script>

	var Etime=document.getElementById("time").value;
	var Slot=document.getElementById("slot").value;
	var date=document.getElementById("date").value;
	var s1="Slot1";
	var s2="Slot2";
	var s3="Slot3";
	var s4="Slot4";
	if(Slot==s1){
		var Etime=document.getElementById("time").value;
		var Btime="10:30:00:00";
		start = Etime.split(":");
	    end =Btime.split(":");
	    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
	    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
	    var diff = endDate.getTime() - startDate.getTime();
	    var hours = Math.floor(diff / 1000 / 60 / 60);
	    diff -= hours* 60 * 60;
	    var seconds= Math.floor(diff /1000);
	    var minutes = Math.floor(diff / 1000 / 60);
		var timedifference=+hours+":"+minutes+":"+seconds;
		var idiff = parseInt("timedifference") + "<br>";
		document.write("time="+hours+":"+minutes+":"+seconds);
		function countdown(minutes) {
		    var seconds = 60;
		    var mins = minutes
		    function tick() {
		        var counter = document.getElementById("timer");
		        var current_minutes = mins-1
		        seconds--;
		        counter.innerHTML =
				current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        if( seconds > 0 ) {
		            setTimeout(tick, 1000);
		        } else {
		 
		            if(mins > 1){
		 					setTimeout(function () { countdown(mins - 1); }, 1000);
						}
		        }
		    }
		    tick();
		}
		 
		countdown(minutes);
	
		
	}
	else if(Slot==s2){
		var Etime=document.getElementById("time").value;
		var Btime="10:40:00:00";
		start = Etime.split(":");
		end =Btime.split(":");
		var startDate = new Date(0, 0, 0, start[0], start[1], 0);
		var endDate = new Date(0, 0, 0, end[0], end[1], 0);
		var diff = endDate.getTime() - startDate.getTime();
		var hours = Math.floor(diff / 1000 / 60 / 60);
		diff -= hours* 60 * 60;
		var seconds= Math.floor(diff /1000);
		var minutes = Math.floor(diff / 1000 / 60);
		var timedifference=+hours+":"+minutes+":"+seconds;
		var idiff = parseInt("timedifference") + "<br>";
		document.write("time="+hours+":"+minutes+":"+seconds);
		function countdown(minutes) {
		    var seconds = 60;
		    var mins = minutes
		    function tick() {
		        var counter = document.getElementById("timer");
		        var current_minutes = mins-1
		        seconds--;
		        counter.innerHTML =
				current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        if( seconds > 0 ) {
		            setTimeout(tick, 1000);
		        } else {
		 
		            if(mins > 1){
		 					setTimeout(function () { countdown(mins - 1); }, 1000);
						}
		        }
		    }
		    tick();
		}
		 
		countdown(minutes);
		
			
	}
	else if(Slot==s3){
		var Etime=document.getElementById("time").value;
		var Btime="10:50:00:00";
		start = Etime.split(":");
	    end =Btime.split(":");
	    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
	    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
	    var diff = endDate.getTime() - startDate.getTime();
	    var hours = Math.floor(diff / 1000 / 60 / 60);
	    diff -= hours* 60 * 60;
	    var seconds= Math.floor(diff /1000);
	    var minutes = Math.floor(diff / 1000 / 60);
	    var timedifference=+hours+":"+minutes+":"+seconds;
		var idiff = parseInt("timedifference") + "<br>";
		
		document.write("time="+hours+":"+minutes+":"+seconds);
		function countdown(minutes) {
		    var seconds = 60;
		    var mins = minutes
		    function tick() {
		        var counter = document.getElementById("timer");
		        var current_minutes = mins-1
		        seconds--;
		        counter.innerHTML =
				current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        if( seconds > 0 ) {
		            setTimeout(tick, 1000);
		        } else {
		 
		            if(mins > 1){
		 
		               // countdown(mins-1);   never reach “00″ issue solved:Contributed by Victor Streithorst
		               setTimeout(function () { countdown(mins - 1); }, 1000);
		 
		            }
		        }
		    }
		    tick();
		}
		 
		countdown(minutes);
	}
		
	else if (Slot==s4){
		var Etime=document.getElementById("time").value;
		var Btime="11:00:00:00";
		start = Etime.split(":");
	    end =Btime.split(":");
	    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
	    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
	    var diff = endDate.getTime() - startDate.getTime();
	    var hours = Math.floor(diff / 1000 / 60 / 60);
	    diff -= hours* 60 * 60;
	    var seconds= Math.floor(diff /1000);
	    var minutes = Math.floor(diff / 1000 / 60);
		var timedifference=+hours+":"+minutes+":"+seconds;
		var idiff = parseInt("timedifference") + "<br>";
		document.write("time="+hours+":"+minutes+":"+seconds);
		function countdown(minutes) {
		    var seconds = 60;
		    var mins = minutes
		    function tick() {
		        var counter = document.getElementById("timer");
		        var current_minutes = mins-1
		        seconds--;
		        counter.innerHTML =
				current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
		        if( seconds > 0 ) {
		            setTimeout(tick, 1000);
		        } else {
		 
		            if(mins > 1){
		 
		               // countdown(mins-1);   never reach “00″ issue solved:Contributed by Victor Streithorst
		               setTimeout(function () { countdown(mins - 1); }, 1000);
		 
		            }
		        }
		    }
		    tick();
		}
		 
		countdown(minutes);
	}
	if(minutes==0){
		document.write("Your Auction has begun");
	}
</script>
</head>
<body>
	
	<font color="blue" ><h1>Your Auction will ends in</h1></font>
<font color="green"><h1><div id="timer1">5:00</div></h1></font>
<script type="text/javascript">

function countdown(minutes) {
    var seconds = 60;
    var mins = minutes
    function tick() {
        var counter = document.getElementById("timer1");
        var current_minutes = mins-1
        seconds--;
        counter.innerHTML =
current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
        if( seconds > 0 ) {
            setTimeout(tick, 1000);
        } else {
 
            if(mins > 1){
 
               // countdown(mins-1);   never reach “00″ issue solved:Contributed by Victor Streithorst
               setTimeout(function () { countdown(mins - 1); }, 1000);
 
            }
        }
    }
    tick();
}
 
countdown(5);
 
</script>

</body>
</html>