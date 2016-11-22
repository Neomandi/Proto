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
 * Servlet implementation class EmployeeLoginServlet
 */
public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLoginServlet() {
        System.out.println("Inside EmployeeLoginServlet Constr()....");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Inside EmployeeLoginServlet doGet()....");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("Inside EmployeeLoginServlet doPost()....");
		 
		    PrintWriter pw = response.getWriter();
			String uid = request.getParameter("uid");
			String pwd = request.getParameter("pwd");
			String password = "";
			
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
				
				stmt = con.prepareStatement("SELECT * FROM ereg WHERE userid = ?");
				//System.out.println("SELECT * FROM TREG WHERE USERID = ?");
				stmt.setString(1, uid);
				rs = stmt.executeQuery();
				while(rs.next())
				{
					password = rs.getString("pass");
				}
				if(password.equals(pwd) && password != "")
				{
					//HttpSession session = request.getSession(true);
					//session.setAttribute("user", uid);
					
					pw.write("<html><style>h2{position: absolute; top: 0px; left: 1100px;}</style><body><h1>Login Successfull!!</h1><h2>Welcome "+uid+"</h2>"
							+ "<a href = "+"ProductEntryScreen.html"+">Click here add the product.</a></bod></html>");
				}
				else
				{
					pw.write("<html><body><h1>Login Failed!!</h1></body></html>");
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
