package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FarmerLoginServlet
 */
public class FarmerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerLoginServlet() {
       System.out.println("Inside FarmerLoginServlet Constr()......");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerLoginServlet doGet()......");
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside FarmerLoginServlet doPost().....");
		
		PrintWriter pw = response.getWriter();
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String password = "";
		String name = "";
		String name1 = "";
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established.");
				
			}
			
			stmt = con.prepareStatement("SELECT * FROM freg WHERE name = ?");
			//System.out.println("SELECT * FROM TREG WHERE USERID = ?");
			stmt.setString(1, uid);
			rs = stmt.executeQuery();
			while(rs.next())
			{
				password = rs.getString("pass");
				name = rs.getString("name");
				name1 = rs.getString("name");
			}
			
			if(name.equals(uid) && name != "")
			{
				if(password.equals(pwd) && password != "")
				{
					HttpSession session = request.getSession(true);
					session.setAttribute("user", name);
					pw.write("<html><body><h1>Login Successfull!! Welcome "+name1+"</h1><br/><br/></bod></html>");
					pw.write("<html><body><h1><a href = 'fprofile'>Click here to view your profile.</a></h1></body></html>");
					pw.write("<html><body><a href = 'logout'>Click here to logout!!</a><br/><br/></bod></html>");
				} 
				else
					pw.write("<html><body><h1>Login Failed!!</h1></body></html>");
			}
			else
			{
				pw.write("<html><body><h1>Username does not exist. Please register.</h1><br/><br/></bod></html>");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			JDBCHelper.Close(con);
			JDBCHelper.Close(rs);
			JDBCHelper.Close(stmt);
		}
	}

}
