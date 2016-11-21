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
 * Servlet implementation class TradePageServlet
 */
public class TradePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradePageServlet() {
        System.out.println("Inside TradePageServlet Constr().......");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TradePageServlet doGet().......");
		
		
		PrintWriter pw = response.getWriter();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Database connection failed.");
			}
			
			pstmt = con.prepareStatement("SELECT * FROM tradelist");
			
			rs = pstmt.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				pw.println("<html><head><title>Search Result</title></head>");
				pw.println("<style>th{align: 'left';}table{border-collapse: collapse; width: 80%;}input[type = text]{width: 80%; border: none;}</style>");
				pw.println("<body><center><form action = 'tremove' method = 'post' ><table border align = 'left'>");
				pw.println("<tr bgcolor = '#A52A2A'>");
				pw.println("<th>Lot Number</th>");
				pw.println("<th>Lot Cost</th>");
				pw.println("<th>Transportation Charges</th>");
				pw.println("<th>Commission Charges</th>");
				pw.println("<th>Market Cess</th>");
				pw.println("<th>Market Code</th>");
				pw.println("<th>Produce</th>");
				pw.println("<th>Grade</th>");
				pw.println("<th>Best Bid(Rs/kg)</th>");
				pw.println("<th>Quantity</th>");
				pw.println("<th>My Final Cost</th>");
				pw.println("<th></th>");
				pw.println("</tr>");
				
				while(rs.next())
				{
					String lotnumber = rs.getString("lotnum");
					String marketcode = rs.getString("marketcode");
					String produce1 = rs.getString("produce");
					String qualgrade = rs.getString("qualitygrade");
					String quant = rs.getString("quantity");
					
					pw.println("<tr bgcolor = '#DEB887'>");
					pw.println("<td><input type = 'text' name = 'lotnumber' value = '"+lotnumber+"' readonly/></td>");     //Lotnum
					pw.println("<td><output name = 'lotcost' id = 'lotcost' readonly></output></td>");                              //Lotcost
					pw.println("<td>3000</td>");                     //Transportation charges
					pw.println("<td><output name = 'commission' id = 'commission' readonly></output></td>");                       //Commission Charges
					pw.println("<td><output name = 'marketcess' id = 'marketcess' readonly></output></td>");                       //MarketCess
					pw.println("<td><input type = 'text' name = 'marketcode' value = '"+marketcode+"' readonly/></td>");   //MarketCode
					pw.println("<td><input type = 'text' name = 'produce1' value = '"+produce1+"' readonly/></td>");       //Produce
					pw.println("<td><input type = 'text' name = 'qualgrade' value = '"+qualgrade+"' readonly/></td>");     //QualityGrade
					pw.println("<td><input type = 'number' id = 'price' name = 'price' placeholder = 'Enter your best price'/></td>");                          //BestBid
				    pw.println("<td><input type = 'text' name = 'quant' value = '"+quant+"' readonly/></td>" );            //FinalCost
				    pw.println("<td><output name = 'finalcost' id = 'finalcost' readonly></output></td>");
				    pw.println("<td><button type = 'submit' formaction = 'tremove'>Remove</button></td>");
				    pw.println("</tr><br/");
				}
				pw.println("</table></form></center></body></html>");
			}
			else
			{
				pw.println("<html><body><h2>No Product Selected</h2></body></html>");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside TradePageServlet doPost().......");
		
		/*PrintWriter pw = response.getWriter();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Database connection failed.");
			}
			
			pstmt = con.prepareStatement("SELECT * FROM tradelist");
			
			rs = pstmt.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				pw.println("<html><head><title>Search Result</title></head>"
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
					String lotnumber = rs.getString("lotnum");
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
							+ "</tr>"
							+ "</table></form></center></body></html>");
				}
			}
			else
			{
				pw.write("<html><body><h2>No Product Selected</h2></body></html>");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}*/
		
	}

}
