package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FarmerLogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        System.out.println("Inside LogoutServlet Constr().......");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside LogoutServlet doGet().....");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		
		if(session != null)
		{
			
			if(session.getAttribute("user").toString().contains("Farmer"))
			{
				session.removeAttribute("user");
				session.invalidate();
				pw.write("<html><body><h1>Logut Successfull!!</h1></body></html>");
				response.sendRedirect("FarmerLogin.html");
			}
			else
			{
				session.removeAttribute("user");
				session.invalidate();
				pw.write("<html><body><h1>Logut Successfull!!</h1></body></html>");
				response.sendRedirect("TraderLogin.html");
			}
		}
		else
		{
			pw.write("<html><body><h1>You've not logged in. Please Login first and then try to Logout.</h1></body></html>");
			response.sendRedirect("Login.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside LogoutServlet doPost().....");
	}

}
