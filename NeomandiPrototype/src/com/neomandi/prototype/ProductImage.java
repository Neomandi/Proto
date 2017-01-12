package com.neomandi.prototype;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProductImage
 */
public class ProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in doGet productImage");
		 String s="";
		 String name="";
	     Blob image = null;
	      Connection con = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      ServletOutputStream out = response.getOutputStream();
	      HttpSession hs=request.getSession(false);
	      String pass=(String) request.getAttribute("pass");
	      try
	     	{	
	     	if(con == null)
	     	{
	     		System.out.println("Connection establish failed");
	     	}
	     	stmt = con.createStatement();
	     	String sql = "select aadharnum,name from freg where pass='"+pass+"' ";
	     	//System.out.println(sql);
	     	rs = stmt.executeQuery(sql);
	    	while(rs.next()){
	    		 s+=rs.getString("aadharnum");
	 		    name+=rs.getString("name");
	 				}
	 			}
	      catch(SQLException e)
			{
				e.printStackTrace();	
			}
	      try
	     	{	
	     	if(con == null)
	     	{
	     		System.out.println("Connection establish failed");
	     	}
	     	stmt = con.createStatement();
	     	String sql = "select photo from productentry where farmerid='"+s+"' ";
	     	//System.out.println(sql);
	     	rs = stmt.executeQuery(sql);
	    	if(rs.next()){
	    		image = rs.getBlob("photo");
	    		 response.setContentType("text/html");

	    	      out.println("<font color='red'>image not found for given id</font>");

	    	      return;	
	    	}
	    	 response.setContentType("image/gif");
	    	 InputStream in = image.getBinaryStream();
	    	  int length = (int) image.length();
	    	  int bufferSize = 1024;
	    	  byte[] buffer = new byte[bufferSize];
	    	  while ((length = in.read(buffer)) != -1) {
	    	  out.write(buffer, 0, length);
	 	      }
	   }
	      catch(SQLException e)
			{
				e.printStackTrace();	
			}
	    	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in dopost productImage");
	}

}
