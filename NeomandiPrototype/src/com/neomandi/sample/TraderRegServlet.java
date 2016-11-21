package com.neomandi.sample;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
@MultipartConfig(maxFileSize = 16177215)
/**
 * Servlet implementation class TraderRegServlet
 */
public class TraderRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraderRegServlet() {
    	System.out.println("Inside TraderRegServlet constructor().......");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TraderRegServlet doGet()......");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TraderRegServlet doGet()......");
		
		JavaBeanTrader bn = null;
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("t_name");
		String mobile = request.getParameter("t_mob");
		String aadharnum = request.getParameter("t_aadharnum");
		String email = request.getParameter("t_email");
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String taluk = request.getParameter("t_taluk");
		String hobli = request.getParameter("t_hobli");
		String village = request.getParameter("t_village");
		String bankname = request.getParameter("t_bankname");
		String accountnum = request.getParameter("t_accountnum");
		String branch = request.getParameter("t_branch");
		String ifsc = request.getParameter("t_ifsc");
		String uid = request.getParameter("t_uid");
		String license = request.getParameter("t_licensenum");
		String password = request.getParameter("t_pwd");
		
		
		
		//System.out.println("The fname: "+name+" The mobile: "+mobile+" The Aadhar number: "+aadharnum+" The Email: "+email+" The state: "+state+" The district: "+district+" The taluk: "+taluk+" The hobli: "+hobli+" The village: "+village+" The bankname: "+bankname+" The accountnum: "+accountnum+" The branchname: "+branch+" The IFSC code: "+ifsc+" The Userid: "+uid+" The License: "+license+" The Password: "+password);
		
		InputStream photo = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
        Part filePart = request.getPart("browse");
        
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            photo = filePart.getInputStream();
        }
        
		System.out.println(filePart);
		System.out.println(photo);
		
		bn = new JavaBeanTrader(name, mobile, aadharnum, email, state, district, taluk, hobli, village, bankname, accountnum, branch, ifsc, uid, license, password, photo);
		
		if(JDBCOperations.dataInsertTrader(bn))
		{
			pw.println("<html><body><h1 style= "+"text-align: center;"+">Registration successfull</h1><br/>"
					+ "<a href = TraderLogin.html>Click here to login.</a></body></html>");
			//SendEmail.mail(email);
		}
		else
		{
			pw.println("<html><body><h1>Data insertion failed</h1></body></html>");
		}
		
	}

}
