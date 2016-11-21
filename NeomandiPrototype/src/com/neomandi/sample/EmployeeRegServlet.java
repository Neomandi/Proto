package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeRegServlet
 */
public class EmployeeRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeRegServlet() {
        System.out.println("Inside EmployeeRegServlet Constr()......");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside EEmployeeRegServlet doGet().....");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside EEmployeeRegServlet doPost().....");
		
		JavaBeanEmployee bn = null;
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("e_name");
		String mobile = request.getParameter("e_mob");
		String aadharnum = request.getParameter("e_aadharnum");
		String email = request.getParameter("e_email");
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String uid = request.getParameter("e_uid");
		String password = request.getParameter("e_pwd");
		
		//System.out.println("The fname: "+name+" The mobile: "+mobile+" The Aadhar number: "+aadharnum+" The Email: "+email+" The state: "+state+" The district: "+district+" The taluk: "+taluk+" The hobli: "+hobli+" The village: "+village+" The bankname: "+bankname+" The accountnum: "+accountnum+" The branchname: "+branch+" The IFSC code: "+ifsc+" The Userid: "+uid+" The License: "+license+" The Password: "+password);
		
		bn = new JavaBeanEmployee(name, mobile, aadharnum, email, state, district, uid, password);
		
		if(JDBCOperations.dataInsertEmoloyee(bn))
		{
			pw.println("<html><body><h1 style= "+"text-align: center;"+">Registration successfull</h1><br/>"
					+ "<a href = EmployeeLogin.html>Click here to login.</a></body></html>");
			//SendEmail.mail(email);
		}
		else
		{
			pw.println("<html><body><h1>Data insertion failed</h1></body></html>");
		}
	}

}
