package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostAuctionOperations {
	
	public static void postAO(){
		
		System.out.println("Post Auction");
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		List<TraderPostAuctionBean> ls = new ArrayList<TraderPostAuctionBean>();
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established.");
			}
			else
			{
				con.setAutoCommit(false);
				
				String sql = "SELECT * FROM traders_bid_price";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next())
				{
					if(!rs.getString("quantityassigned").equals("0"))
					{
						TraderPostAuctionBean tb = new TraderPostAuctionBean();
						String aadharnumber = rs.getString("aadharnumber");
						tb.setAadharnumber(aadharnumber);
						String lotnum = rs.getString("lotnum");
						tb.setLotnum(lotnum);
						String quantityassigned = rs.getString("quantityassigned");
						tb.setQuantityassigned(quantityassigned);
						
						ls.add(tb);
					}
				}
				
				System.out.println("The List: "+ls.toString());
				
				for (int i = 0; i < ls.size(); i++) { 		      
			          String sql2 = "INSERT INTO auction_result(lotnumber,quantityassigned,aadharnumber) VALUES(?,?,?)";	
			          pstmt2 = con.prepareStatement(sql2);
			          pstmt2.setString(1, ls.get(i).getLotnum());
			          pstmt2.setString(2, ls.get(i).getQuantityassigned());
			          pstmt2.setString(3, ls.get(i).getAadharnumber());
			          System.out.println("Insert into auction result: "+pstmt2.executeUpdate());
			      }  
				
				con.commit();
			}
			
		}
		catch(SQLException e)
		{
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally
		{
			JDBCHelper.Close(rs);
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(pstmt2);
			JDBCHelper.Close(con);
		}
	}

}
