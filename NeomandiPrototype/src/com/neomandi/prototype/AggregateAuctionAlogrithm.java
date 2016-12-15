package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


import com.neomandi.prototype.JDBCHelper;
import com.neomandi.prototype.AggregateDataBean;

public class AggregateAuctionAlogrithm {
	
	public static void aggre()
	{
		Connection con = null;
		Statement stmt1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		List<AggregateDataBean> li = new ArrayList<AggregateDataBean>();
		//List<String> a = new ArrayList<String>();
		//List<String> b = new ArrayList<String>();
		int maxvol = 505;
		double avg = 0;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established");
			}
			
			con.setAutoCommit(false);
			
			
			String sql1 = "SELECT tb.aadharnumber, tb.bidprice, tl.quantityneeded, tb.bestbid FROM traders_bid_price tb, tradelist tl WHERE tb.lotnum = tl.lotnum and tb.aadharnumber = tl.aadharnumber ORDER BY tb.bidprice desc, tl.quantityneeded desc";
			stmt1 = con.createStatement();
			rs = stmt1.executeQuery(sql1);
			//System.out.println(rs);
			
			String sql2 = "UPDATE traders_bid_price SET bestbid = ? WHERE aadharnumber = ?";
			pstmt = con.prepareStatement(sql2);
			
			while(rs.next())
			{
				AggregateDataBean ab = new AggregateDataBean();
				long aadhar = rs.getLong("aadharnumber");
				ab.setAadharnumber(aadhar);
				System.out.println("Aadhar: "+aadhar);
				int bidprice = rs.getInt("bidprice");
				ab.setBidprice(bidprice);
				System.out.println("BidPrice: "+bidprice);
				int quantityneeded = rs.getInt("quantityneeded");
				ab.setQuantityneeded(quantityneeded);
				System.out.println("QuantityNeeded: "+quantityneeded);
				System.out.println("--------------------------------");
				
				li.add(ab);
			}
			System.out.println(li);
			System.out.println();
			System.out.println();
			
			for(int i=0;i<li.size();i++)
			{
				if(maxvol >= 0)
				{
					if(li.get(i).getQuantityneeded() == maxvol)//Step 4.1
					{
						System.out.println(li.get(i).getQuantityneeded()+" assigned for "+li.get(i).getAadharnumber());
						maxvol = maxvol - li.get(i).getQuantityneeded();
						avg = avg + (li.get(i).getQuantityneeded() * li.get(i).getBidprice());
						//a.add(li.get(i).getAadharnumber());
						
						pstmt.setInt(1, li.get(0).getBidprice());
						System.out.println("Best bid: "+li.get(0).getBidprice());
						pstmt.setLong(2, li.get(i).getAadharnumber());
						System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
						pstmt.executeUpdate();
						System.out.println();
						
						break;
					}
					else if(li.get(i).getQuantityneeded() > maxvol)
					{
							int vmv1;
							vmv1 = maxvol - li.get(i).getQuantityneeded();
							if(vmv1 > 0)
							{
								System.out.println(li.get(i).getQuantityneeded()+" assigned for "+li.get(i).getAadharnumber());
								avg = avg + (li.get(i).getQuantityneeded() * li.get(i).getBidprice());
								//a.add(li.get(i).getAadharnumber());
								
								pstmt.setInt(1, li.get(0).getBidprice());
								System.out.println("Best bid: "+li.get(0).getBidprice());
								pstmt.setLong(2, li.get(i).getAadharnumber());
								System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
								pstmt.executeUpdate();
								System.out.println();
							}
							else if(vmv1 < 0)
							{
								System.out.println(li.get(i).getAadharnumber()+" only "+maxvol+" is available "+Math.abs(vmv1)+" is pending.");
								avg = avg + (maxvol * li.get(i).getBidprice());
								int vol = maxvol;
								maxvol = maxvol * 0;
								//a.add(li.get(i).getAadharnumber());
								
								pstmt.setInt(1, li.get(0).getBidprice());
								System.out.println("Best bid: "+li.get(0).getBidprice());
								pstmt.setLong(2, li.get(i).getAadharnumber());
								System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
								pstmt.executeUpdate();
								System.out.println();
								
								break;
							}
						
					}
					else if(li.get(i).getQuantityneeded() < maxvol)//Step 4.3
					{
						maxvol = maxvol - li.get(i).getQuantityneeded();
						System.out.println(li.get(i).getQuantityneeded()+" assigned for "+li.get(i).getAadharnumber());
						avg = avg + (li.get(i).getQuantityneeded() * li.get(i).getBidprice());
						//a.add(li.get(i).getAadharnumber());
						
						pstmt.setInt(1, li.get(0).getBidprice());
						System.out.println("Best bid: "+li.get(0).getBidprice());
						pstmt.setLong(2, li.get(i).getAadharnumber());
						System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
						pstmt.executeUpdate();
						System.out.println();
					}
				}	
			}
			
			System.out.println("----------------------");
			System.out.println("Max vol remaining: "+maxvol);
			System.out.println("The Average price: "+avg/10000);
			System.out.println("Best bid is: "+li.get(0).getBidprice());
			System.out.println();
			/*System.out.println(a);
			System.out.println(b);*/
			//Collection<String> result = CollectionUtils.subtract(b, a);
			//List<String> resultl = (List<String>) result;
			//System.out.println("Remaining List "+resultl);
			System.out.println();
			//System.out.println(result);
			
			/*for(int i=0;i<resultl.size();i++)
			{
				pstmt.setInt(1, 0);
				//System.out.println("Volume: "+0);
				pstmt.setInt(2, price1);
				//System.out.println("Price: "+price1);
				pstmt.setString(3, resultl.get(i));
				//System.out.println("Tid: "+resultl.get(i));
				//System.out.println("SQL: "+pstmt);
				pstmt.executeUpdate();
			}*/
		con.commit();
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		
		try {
			con.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	finally
	{
		JDBCHelper.Close(con);
		JDBCHelper.Close(stmt1);
		JDBCHelper.Close(pstmt);
		JDBCHelper.Close(rs);
	}
	}
}
