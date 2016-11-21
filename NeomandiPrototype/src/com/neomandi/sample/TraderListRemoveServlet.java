package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TraderListRemoveServlet
 */
public class TraderListRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraderListRemoveServlet() {
       System.out.println("Inside TraderListRemoveServlet Constr()....... ");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TraderListRemoveServlet doGet().......");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TraderListRemoveServlet doPost()......");
		
		PrintWriter pw = response.getWriter();
		Connection con = null;
		Statement pstmt = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Database connection failed.");
			}
			
			String lotnum = request.getParameter("lotnumber");
			//System.out.println(lotnum);
			
			String sql = "DELETE FROM tradelist WHERE lotnum = '"+lotnum+"'";
			//System.out.println(sql);
			
			pstmt = con.createStatement();
			
			pstmt.execute(sql);
			
			response.sendRedirect("Retreive.jsp");
			
			/*if(!pstmt.execute(sql))
			{
				pw.write("<html><body><h2>Product removed from trade list successfully</body></html>");
			}
			else
			{
				pw.write("<html><body><h2>Operation failed</h2></body></html>");
			}*/
			
		}
		catch(SQLException e)
		{
			
		}
		finally
		{
			
		}
	}

}
