package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;

import com.neomandi.prototype.JDBCHelper;
import com.neomandi.prototype.AggregateDataBean;

public class AggregateAuctionAlogrithm {
	
	public static void aggre()
	{
		Connection con = null;
		Statement stmt1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		List<AggregateDataBean> li = new ArrayList<AggregateDataBean>();
		List<Long> a = new ArrayList<Long>();
		List<Long> b = new ArrayList<Long>();
		double avg = 0;
		String lotnum = "";
		int maxvol = 0;
		
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established");
			}
			
			con.setAutoCommit(false);
			
			
			String sql1 = "SELECT tl.lotnum, tb.aadharnumber, tb.bidprice, tl.quantityneeded, tb.bestbid FROM traders_bid_price tb, tradelist tl WHERE tb.lotnum = tl.lotnum and tb.aadharnumber = tl.aadharnumber ORDER BY tb.bidprice desc, tl.quantityneeded desc, tb.bid_time";
			stmt1 = con.createStatement();
			rs = stmt1.executeQuery(sql1);
			//System.out.println(rs);
			
			String sql2 = "UPDATE traders_bid_price SET bestbid = ?, quantityassigned = ? WHERE aadharnumber = ?";
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
				if(bidprice != 0)
				{
					ab.setQuantityneeded(quantityneeded);
				}
				else
				{
					ab.setQuantityneeded(0);
				}
				System.out.println("QuantityNeeded: "+quantityneeded);
				System.out.println("--------------------------------");
				
				lotnum = rs.getString("lotnum");
				
				li.add(ab);
			}
			System.out.println(li);
			System.out.println();
			System.out.println();
			//System.out.println("The lotnumber is: "+lotnum);
			
			String sql3 = "SELECT quantity FROM productentry WHERE lotnumber = ?";
			pstmt1 = con.prepareStatement(sql3);
			pstmt1.setString(1, lotnum);
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next())
			{
				maxvol = rs1.getInt("quantity");
			}
			
			int maxavg = 0;
			//System.out.println("The maxvol of "+lotnum+" is: "+maxvol);
			//System.out.println("The maxavg: "+maxavg);
			
			for(int i=0;i<li.size();i++)
			{
				if(maxvol >= 0)
				{
					if(li.get(i).getQuantityneeded() == maxvol)//Step 4.1
					{
						System.out.println(li.get(i).getQuantityneeded()+" assigned for "+li.get(i).getAadharnumber());
						maxvol = maxvol - li.get(i).getQuantityneeded();
						avg = avg + (li.get(i).getQuantityneeded() * li.get(i).getBidprice());
						maxavg = maxavg + li.get(i).getQuantityneeded();
						a.add(li.get(i).getAadharnumber());
						
						pstmt.setInt(1, li.get(0).getBidprice());
						System.out.println("Best bid: "+li.get(0).getBidprice());
						if(li.get(0).getBidprice() != 0)
						{
							pstmt.setInt(2, li.get(i).getQuantityneeded());
						}
						else
						{
							pstmt.setInt(2, 0);
						}
						System.out.println("Quantity assigned: "+li.get(i).getQuantityneeded());
						pstmt.setLong(3, li.get(i).getAadharnumber());
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
								maxavg = maxavg + li.get(i).getQuantityneeded();
								a.add(li.get(i).getAadharnumber());
								
								pstmt.setInt(1, li.get(0).getBidprice());
								System.out.println("Best bid: "+li.get(0).getBidprice());
								if(li.get(0).getBidprice() != 0)
								{
									pstmt.setInt(2, li.get(i).getQuantityneeded());
								}
								else
								{
									pstmt.setInt(2, 0);
								}
								System.out.println("Quantity assigned: "+li.get(i).getQuantityneeded());
								pstmt.setLong(3, li.get(i).getAadharnumber());
								System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
								pstmt.executeUpdate();
								System.out.println();
								
							}
							else if(vmv1 < 0)
							{
								System.out.println(li.get(i).getAadharnumber()+" only "+maxvol+" is available "+Math.abs(vmv1)+" is pending.");
								avg = avg + (maxvol * li.get(i).getBidprice());
								maxavg = maxavg + maxvol;
								int vol = maxvol;
								maxvol = maxvol * 0;
								a.add(li.get(i).getAadharnumber());
								
								pstmt.setInt(1, li.get(0).getBidprice());
								System.out.println("Best bid: "+li.get(0).getBidprice());
								if(li.get(0).getBidprice() != 0)
								{
									pstmt.setInt(2, vol);
								}
								else
								{
									pstmt.setInt(2, 0);
								}
								System.out.println("Quantity assigned: "+vol);
								pstmt.setLong(3, li.get(i).getAadharnumber());
								System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
								pstmt.executeUpdate();
								//System.out.println(pstmt);
								
								break;
							}
						
					}
					else if(li.get(i).getQuantityneeded() < maxvol)//Step 4.3
					{
						maxvol = maxvol - li.get(i).getQuantityneeded();
						System.out.println(li.get(i).getQuantityneeded()+" assigned for "+li.get(i).getAadharnumber());
						avg = avg + (li.get(i).getQuantityneeded() * li.get(i).getBidprice());
						maxavg = maxavg + li.get(i).getQuantityneeded();
						a.add(li.get(i).getAadharnumber());
						
						pstmt.setInt(1, li.get(0).getBidprice());
						System.out.println("Best bid: "+li.get(0).getBidprice());
						if(li.get(0).getBidprice() != 0)
						{
							pstmt.setInt(2, li.get(i).getQuantityneeded());
						}
						else
						{
							pstmt.setInt(2, 0);
						}
						System.out.println("Quantity assigned: "+li.get(i).getQuantityneeded());
						pstmt.setLong(3, li.get(i).getAadharnumber());
						System.out.println("Aadhar number: "+li.get(i).getAadharnumber());
						pstmt.executeUpdate();
						//System.out.println(pstmt);
					}
				}	
			}
			
			System.out.println("Maxvol end: "+maxvol);
			System.out.println("Maxavg end: "+maxavg);
			
			//--------------------------------------------------------------------------------------------------
			avg = avg/maxavg;
			DecimalFormat twoDForm = new DecimalFormat("#.##");
		     
			 avg=Double.valueOf(twoDForm.format(avg));
			 //=================================================================================================
			for(int i=0;i<li.size();i++)
			{
				b.add(li.get(i).getAadharnumber());
			}
			
			System.out.println("----------------------");
			System.out.println("Max vol remaining: "+maxvol);
			System.out.println("The Average price: "+avg);
			System.out.println("Best bid is: "+li.get(0).getBidprice());
			System.out.println();
			System.out.println("List A: "+a);
			System.out.println("List B: "+b);
			Collection<Long> result = CollectionUtils.subtract(b, a);
			List<Long> resultl =  (List<Long>) result;
			System.out.println("Remaining List "+resultl);
			System.out.println();
			System.out.println(result);
			
			for(int i=0;i<resultl.size();i++)
			{
				pstmt.setInt(1, li.get(0).getBidprice());
				//System.out.println("Price: "+li.get(0).getBidprice());
				pstmt.setInt(2, 0);
				//System.out.println("Volume: "+0);
				pstmt.setLong(3, resultl.get(i));
				pstmt.executeUpdate();
			}
			
			/*System.out.println("MAX-Vol "+maxvol);
			System.out.println("MAX-Avg "+maxavg);*/
			
			String sql4 = "UPDATE productentry SET averageprice = ?, quantitybidfor = ? WHERE lotnumber = ?";
			pstmt3 = con.prepareStatement(sql4);
			pstmt3.setDouble(1, avg);
			pstmt3.setInt(2, (maxavg+maxvol)-maxvol);
			pstmt3.setString(3, lotnum);
			System.out.println(pstmt3);
			pstmt3.executeUpdate();
			//System.out.println();
			
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
		JDBCHelper.Close(rs);
		JDBCHelper.Close(stmt1);
		JDBCHelper.Close(pstmt);
		JDBCHelper.Close(pstmt1);
		JDBCHelper.Close(pstmt3);
		JDBCHelper.Close(con);
	}
	}
}
