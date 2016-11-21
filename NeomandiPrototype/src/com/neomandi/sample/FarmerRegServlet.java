package com.neomandi.sample;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215)
/**
 * Servlet implementation class FarmerRegServlet
 */
public class FarmerRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerRegServlet() {
        System.out.println("Inside FarmerRegServlet constructor().......");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerRegServlet doGet()......");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerRegServlet doPost()......");
		
		JavaBeanFarmer bn = null;
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("f_name");
		String mobile = request.getParameter("f_mob");
		String aadharnum = request.getParameter("f_aadharnum");
		String email = request.getParameter("f_email");
		String state = request.getParameter("state");
		String district = request.getParameter("district");
		String taluk = request.getParameter("f_taluk");
		String hobli = request.getParameter("f_hobli");
		String village = request.getParameter("f_village");
		String bankname = request.getParameter("f_bankname");
		String accountnum = request.getParameter("f_accountnum");
		String branch = request.getParameter("f_branch");
		String ifsc = request.getParameter("f_ifsc");
		
		//System.out.println("The fname: "+name+" The mobile: "+mobile+" The Aadhar number: "+aadharnum+" The Email: "+email+" The state: "+state+" The district: "+district+" The taluk: "+taluk+" The hobli: "+hobli+" The village: "+village+" The bankname: "+bankname+" The accountnum: "+accountnum+" The branchname: "+branch+" The IFSC code: "+ifsc+" The Userid: "+uid+" The password: "+pwd);
		
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
        
		//System.out.println(filePart);
		//System.out.println(photo);
        
		String password = passwordGen();
		
		bn = new JavaBeanFarmer(name, mobile, aadharnum, email, state, district, taluk, hobli, village, bankname, accountnum, branch, ifsc, password, photo);
		//System.out.println(bn);
	
		if(JDBCOperations.dataInsertFarmer(bn))
		{
			pw.println("<html><body><h1>Registration successfull. Please check your email for login id and password.</h1></body></html>");
			//SendEmail.mail(email,aadharnum,password);
		}
		else
		{
			pw.println("<html><body><h1>Registration failed</h1></body></html>");
		}
	}
	
	public static String passwordGen()
	{
		int noOfCAPSAlpha = 1;
        int noOfDigits = 1;
        int noOfSplChars = 1;
        int minLen = 6;
        int maxLen = 6;
        
        char[] pswd = RandomPasswordGenerator.generatePswd(minLen, maxLen,
                noOfCAPSAlpha, noOfDigits, noOfSplChars);
        System.out.println("Len = " + pswd.length + ", " + new String(pswd));
        
        return new String(pswd);
	}

}
