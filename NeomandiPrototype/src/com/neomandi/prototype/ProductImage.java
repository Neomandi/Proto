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

public class ProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	
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
	     	String sql = "select photo from productentry where farmerid='200000000001' ";
	     	//System.out.println(sql);
	     	rs = stmt.executeQuery(sql);
	     	String imgLen = "";
            while (rs.next()) {
                imgLen = rs.getString(1);
                System.out.println(imgLen.length());
                int len = imgLen.length();
                byte[] rb = new byte[len];
                InputStream readImg = rs.getBinaryStream(1);
                int index = readImg.read(rb, 0, len);
                System.out.println("Index.........." + index);

                response.reset();
                response.setContentType("image/jpg");
                response.getOutputStream().write(rb, 0, len);
                response.getOutputStream().flush();
            }
            stmt.close();
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
