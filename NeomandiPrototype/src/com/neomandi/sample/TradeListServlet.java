package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TradeListServlet
 */
public class TradeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradeListServlet() {
        System.out.println("Inside TradeListServlet Constr()......");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TradeListServlet doGet().......");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TradeListServlet doPost()......");
		
		PrintWriter pw = response.getWriter();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection failed to establish.");
			}
			
			String lotnum = request.getParameter("lotnumber");
			String marketcode = request.getParameter("marketcode");
			String produce1 = request.getParameter("produce1");
			String qualgrade = request.getParameter("qualgrade");
			String quant = request.getParameter("quant");
			
			System.out.println("The lotnum: "+lotnum+" The marketCode: "+marketcode+" The Kind of produce: "+produce1+" The qualgrade: "+qualgrade+" The quantity: "+quant);
			
			pstmt = con.prepareStatement("INSERT INTO tradelist VALUES(?,?,?,?,?)");
			pstmt.setString(1, lotnum);
			pstmt.setString(2, marketcode);
			pstmt.setString(3, produce1);
			pstmt.setString(4, qualgrade);
			pstmt.setString(5, quant);
			
			if(!pstmt.execute())
			{
				response.sendRedirect("Retreive.jsp");
			}
			else
			{
				pw.write("<html><body><h2>Insertion unsuccessfull</h2></body></html>");
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			JDBCHelper.Close(con);
			JDBCHelper.Close(pstmt);
		}
	}

}
