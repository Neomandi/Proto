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

/**
 * Servlet implementation class ProductSearchServlet
 */
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        System.out.println("Inside ProductSearchServlet Constr().....");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ProductSearchServlet doGet().......");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside ProductSearchServlet doPost().......");
		
		PrintWriter pw = response.getWriter();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established. Please check.");
			}
			
			String kproduce = request.getParameter("kproduce");
			String produce = request.getParameter("produce");
			String quality = request.getParameter("quality");
			
			//System.out.println("The kinofpro: "+kproduce+" The produce: "+produce+" The quality: "+quality);
			
			pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE kindofpro = ? and produce = ? and qualitygrade = ?");
			pstmt.setString(1, kproduce);
			pstmt.setString(2, produce);
			pstmt.setString(3, quality);
			
			//System.out.println(pstmt);
			
			rs = pstmt.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				pw.println("<html><head><title>Search Result</title></head><style>table{ border-collapse: collapse;}</style>"
						+ "<body><center><form action = 'tlist' method = 'post'><table border>"
						+ "<tr>"
						+ "<th>Lot Number</th>"
						+ "<th>Market Code</th>"
						+ "<th>Produce</th>"
						+ "<th>Quality Grade</th>"
						+ "<th>Quantity</th>"
						+ "<th></th>"
						+ "</tr>");
				
				while(rs.next())
				{
					String lotnumber = rs.getString("lotnumber");
					String marketcode = rs.getString("marketcode");
					String produce1 = rs.getString("produce");
					String qualgrade = rs.getString("qualitygrade");
					String quant = rs.getString("quantity");
					
					pw.write("<tr>"
							+ "<td><input type = 'text' name = 'lotnumber' value = '"+lotnumber+"' readonly/></td>"
							+ "<td><input type = 'text' name = 'marketcode' value = '"+marketcode+"' readonly/></td>"
							+ "<td><input type = 'text' name = 'produce1' value = '"+produce1+"' readonly/></td>"
							+ "<td><input type = 'text' name = 'qualgrade' value = '"+qualgrade+"' readonly/></td>"
							+ "<td><input type = 'text' name = 'quant' value = '"+quant+"' readonly/></td>"
							+ "<td><input type = 'submit' value = 'Add to Trade List'/></td>"
							+ "</tr>");
				}
				
				pw.write("</table></form></center></body></html>");
				
			}
			else
			{
				pw.write("<html><body><h1>No Data to Display</h1></body></html>");
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

}
