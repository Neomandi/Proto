package com.neomandi.sample;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
/**
 * Servlet implementation class ProductDetailsServlet
 */
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailsServlet() {
        System.out.println("Inside ProductDetailsServlet Constr().....");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ProductDetailsServlet doGet().....");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ProductDetailsServlet doPost().....");
		
		PrintWriter pw = response.getWriter();
		
		String farmerid = request.getParameter("farmerid");
		String lotnum = request.getParameter("lotnum");
		String marketcode = request.getParameter("marketcode");
		String kproduce = request.getParameter("kproduce");
		String produce = request.getParameter("produce");
		String quality = request.getParameter("quality");
		String qunatity = request.getParameter("quantity");
		
		InputStream inputStream = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("browse");
        System.out.println(filePart);
        
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
		
        block7 : {
            Connection con = null;
            PreparedStatement stmt = null;
            try 
            {
                con = JDBCHelper.getConnection();
                if (con == null) 
                {
                    System.out.println("Connection not established. Please check!!");
                    break block7;
                }
               
                stmt = con.prepareStatement("insert into productentry values(?,?,?,?,?,?,?,?)");
                
                stmt.setString(1, farmerid);
                stmt.setString(2, lotnum);
                stmt.setString(3, marketcode);
                stmt.setString(4, kproduce);
                stmt.setString(5, produce);
                stmt.setString(6, quality);
                stmt.setString(7, qunatity);
                //stmt.setBlob(8, inputStream);
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    stmt.setBlob(8, inputStream);
                }
                
                if (stmt.execute()) 
                {
                	pw.write("<html><body><h1>Inserstion failed!!<h1></body></html>");
                }
                else
                {	
                	pw.write("<html><body><h1>Inserstion successfull!!<h1></body></html>");
                }
                
            }
                catch (Exception e) 
                {
                    e.printStackTrace();
                }
                finally 
                {
                    JDBCHelper.Close(con);
                    JDBCHelper.Close(stmt);
                }
        }
	}
}
