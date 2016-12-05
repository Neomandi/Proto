package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.collections4.CollectionUtils;

public class AggregatingData {

	public static void aggregate(){
		
		Connection con = null;
		Statement stmt1 = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Trader> li = new ArrayList<Trader>();
		List<String> a = new ArrayList<String>();
		List<String> b = new ArrayList<String>();
		int maxvol = ControllerServlet.getVal();
		double avg = 0;
		int price1 = 0;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established");
			}
			
			con.setAutoCommit(false);
			
			
			String sql1 = "SELECT * FROM biddingdata ORDER BY Price desc, Volume desc, Timer";
			stmt1 = con.createStatement();
			rs = stmt1.executeQuery(sql1);
			//System.out.println(rs);
			
			String sql2 = "UPDATE biddingdata SET AssignedVolume = ?, BestBid = ? WHERE Trader = ?";
			pstmt = con.prepareStatement(sql2);
			
			while(rs.next())
			{
				Trader td = new Trader();
				String id = rs.getString("Trader");
				System.out.println(id);
				td.setTid(id);
				int vol = rs.getInt("Volume");
				System.out.println(vol);
				td.setVol(vol);
				int price = rs.getInt("Price");
				System.out.println(price);
				System.out.println("Time "+rs.getString("Timer"));
				System.out.println("----------------------");
				td.setPrice(price);
				
				li.add(td);
			}
			//System.out.println(li);
			System.out.println();
			System.out.println();
			
			for(int i=0;i<li.size();i++)
			{
				if(maxvol >= 0)
				{
					if(li.get(i).getVol() == maxvol)//Step 4.1
					{
						System.out.println(li.get(i).getVol()+" assigned for "+li.get(i).getTid());
						maxvol = maxvol - li.get(i).getVol();
						avg = avg + (li.get(i).getVol() * li.get(i).getPrice());
						a.add(li.get(i).getTid());
						price1 = li.get(i).getPrice();
						
						pstmt.setInt(1, li.get(i).getVol());
						System.out.println("Volume: "+li.get(i).getVol());
						pstmt.setInt(2, li.get(i).getPrice());
						System.out.println("Price: "+li.get(i).getPrice());
						pstmt.setString(3, li.get(i).getTid());
						System.out.println("Tid: "+li.get(i).getTid());
						pstmt.executeUpdate();
						System.out.println();
						
						//BestBid.bestbidcal(li.get(0).getPrice());
						
						break;
					}
					else if(li.get(i).getVol() > maxvol)
					{
							int vmv1;
							vmv1 = maxvol - li.get(i).getVol();
							if(vmv1 > 0)
							{
								System.out.println(li.get(i).getVol()+" assigned for "+li.get(i).getTid());
								avg = avg + (li.get(i).getVol() * li.get(i).getPrice());
								a.add(li.get(i).getTid());
								
								pstmt.setInt(1, li.get(i).getVol());
								System.out.println("Volume: "+li.get(i).getVol());
								pstmt.setInt(2, li.get(i).getPrice());
								System.out.println("Price: "+li.get(i).getPrice());
								pstmt.setString(3, li.get(i).getTid());
								System.out.println("Tid: "+li.get(i).getTid());
								pstmt.executeUpdate();
								System.out.println();
							}
							else if(vmv1 < 0)
							{
								System.out.println(li.get(i).getTid()+" only "+maxvol+" is available "+Math.abs(vmv1)+" is pending.");
								avg = avg + (maxvol * li.get(i).getPrice());
								int vol = maxvol;
								maxvol = maxvol * 0;
								a.add(li.get(i).getTid());
								price1 = li.get(i).getPrice();
								
								pstmt.setInt(1, vol);
								System.out.println("Volume: "+vol);
								pstmt.setInt(2, li.get(i).getPrice());
								System.out.println("Price: "+li.get(i).getPrice());
								pstmt.setString(3, li.get(i).getTid());
								System.out.println("Tid: "+li.get(i).getTid());
								System.out.println(pstmt.executeUpdate());
								System.out.println();
								
								//BestBid.bestbidcal(li.get(0).getPrice());
								
								break;
							}
						
					}
					else if(li.get(i).getVol() < maxvol)//Step 4.3
					{
						maxvol = maxvol - li.get(i).getVol();
						System.out.println(li.get(i).getVol()+" assigned for "+li.get(i).getTid());
						avg = avg + (li.get(i).getVol() * li.get(i).getPrice());
						a.add(li.get(i).getTid());
						
						pstmt.setInt(1, li.get(i).getVol());
						System.out.println("Volume: "+li.get(i).getVol());
						pstmt.setInt(2, li.get(i).getPrice());
						System.out.println("Price: "+li.get(i).getPrice());
						pstmt.setString(3, li.get(i).getTid());
						System.out.println("Tid: "+li.get(i).getTid());
						pstmt.executeUpdate();
						System.out.println();
					}
				}	
			}
			for(int i=0;i<li.size();i++)
			{
				b.add(li.get(i).getTid());
			}
			
			System.out.println("----------------------");
			System.out.println("Max vol remaining: "+maxvol);
			System.out.println("The Average price: "+avg/10000);
			System.out.println();
			/*System.out.println(a);
			System.out.println(b);*/
			Collection<String> result = CollectionUtils.subtract(b, a);
			List<String> resultl = (List<String>) result;
			System.out.println("Remaining List "+resultl);
			System.out.println();
			//System.out.println(result);
			
			for(int i=0;i<resultl.size();i++)
			{
				pstmt.setInt(1, 0);
				//System.out.println("Volume: "+0);
				pstmt.setInt(2, price1);
				//System.out.println("Price: "+price1);
				pstmt.setString(3, resultl.get(i));
				//System.out.println("Tid: "+resultl.get(i));
				//System.out.println("SQL: "+pstmt);
				pstmt.executeUpdate();
			}
			
			/*String tr = "";
			Iterator<String> itr = result.iterator();
			while(itr.hasNext())
			{
				tr = (String) itr.next();
				tr = tr + ", ";
			}*/
			System.out.println("Please revise your bids to "+price1+"rs, or more than that to claim the lot.");
			
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
			JDBCHelper.Close(con);
			JDBCHelper.Close(stmt1);
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(rs);
		}
	}

}
