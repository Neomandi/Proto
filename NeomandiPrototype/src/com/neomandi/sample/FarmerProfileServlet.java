package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FarmerProfileServlet
 */
public class FarmerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerProfileServlet() {
    	System.out.println("Inside FarmerProfileServlet constr().....");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerProfileServlet doGet().....");
		
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		
		//System.out.println("Session value: "+session);
		String userid = "";
		
		if(session != null)
		{
			userid = (String) session.getAttribute("user");
		}
		else
		{
			pw.println("<html><body><h1>You've not logged in. Please login.</h1></body></html>");
		}
		
		//System.out.println(userid);
		//System.out.println(session);
		
		JavaFarmerRetrieveBean bn = JDBCOperations.dataRetrieveFarmer(userid);
		
		if(userid != null)
		{
			/*pw.println("<html><head><title>Profile</title></head>");
			//pw.println("<script src='js/jquery-1.9.1.min.js' type='text/javascript'></script>");
			pw.println("<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>");
			pw.println("<script type='text/javascript' src='tableExport.js'></script>");
			pw.println("<script type='text/javascript' src='jquery.base64.js'></script>");
			pw.println("<script type='text/javascript' src='jspdf/libs/sprintf.js'></script>");
			pw.println("<script type='text/javascript' src='jspdf/jspdf.js'></script>");
			pw.println("<script type='text/javascript' src='jspdf/libs/base64.js'></script>");
			pw.println("<script type='text/javascript'>");
			pw.println("$(document).ready(function(e){");
			pw.println("$('#pdf').click(function(e){");
			pw.println("$('#mytable').tableExport({");
			pw.println("type: 'pdf',");
			pw.println("escape: 'false'");
			pw.println("});");
			pw.println("});");
			pw.println("});");
			pw.println("</script>");
			pw.println("<body>");
			pw.println("<center><table id = 'mytable' border = '1'>");
			pw.println("<tr><th>Name</th><td>"+bn.getName()+"</td></tr>");
			pw.println("<tr><th>Mobile Number</th><td>"+bn.getMobile()+"</td></tr>");
			pw.println("<tr><th>Aadhar Number</th><td>"+bn.getAadharnum()+"</td></tr>");
			pw.println("<tr><th>Email</th><td>"+bn.getEmail()+"</td></tr>");
			pw.println("<tr><th>State</th><td>"+bn.getState()+"</td></tr>");
			pw.println("<tr><th>District</th><td>"+bn.getDistrict()+"</td></tr>");
			pw.println("<tr><th>Taluk</th><td>"+bn.getTaluk()+"</td></tr>");
			pw.println("<tr><th>Hobli</th><td>"+bn.getHobli()+"</td></tr>");
			pw.println("<tr><th>Village</th><td>"+bn.getVillage()+"</td></tr>");
			pw.println("</table></center><br/>");
			pw.println("<center><button id = 'pdf'>Download profile info as PDF</button></center>");
			pw.println("</body></html>");*/
			
			response.sendRedirect("Profile.html?Name="+bn.getName()+"&Mobile="+bn.getMobile()+"&Aadhar="+bn.getAadharnum()+"&Email="+bn.getEmail()+"&State="+bn.getState()+"&District="+bn.getDistrict()+"&Taluk="+bn.getTaluk()+"&Hobli="+bn.getHobli()+"&Village="+bn.getVillage());
		}
		else
		{
			pw.println("<html><body><h1>Please login first and then use</h1></body></html>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerProfileServlet doPost().....");
	}

}
