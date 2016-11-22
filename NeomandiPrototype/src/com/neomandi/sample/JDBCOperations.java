package com.neomandi.sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCOperations 
{
	public static boolean dataInsertFarmer(JavaBeanFarmer bn)
	{
        block7 : {
            Connection con = null;
            PreparedStatement stmt = null;
            try 
            {
                con = JDBCHelper.getConnection();
                if (con == null) 
                {
                    System.out.println("Connection not established. Please check!!");
                    break block7;
                }
               
                stmt = con.prepareStatement("insert into freg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
               
                stmt.setString(1, bn.getName());
                stmt.setString(2, bn.getMobile());
                stmt.setString(3, bn.getAadharnum());
                stmt.setString(4, bn.getEmail());
                stmt.setString(5, bn.getState());
                stmt.setString(6, bn.getDistrict());
                stmt.setString(7, bn.getTaluk());
                stmt.setString(8, bn.getHobli());
                stmt.setString(9, bn.getVillage());
                stmt.setString(10, bn.getBankname());
                stmt.setString(11, bn.getAccountnum());
                stmt.setString(12, bn.getBranch());
                stmt.setString(13, bn.getIfsc());
                stmt.setString(14, bn.getPassword());
                stmt.setBlob(15, bn.getPhoto());
                
                System.out.println(stmt);
                
                if (!stmt.execute()) 
                {
                    return true;
                }
                
                return false;
            }
            catch (Exception e) 
            {
                e.printStackTrace();
            }
            finally 
            {
                JDBCHelper.Close(con);
                JDBCHelper.Close(stmt);
                System.out.println("this is test cmt");
            }
        }
        return false;
    }
	
	public static boolean dataInsertTrader(JavaBeanTrader bn)
	{
        block7 : {
            Connection con = null;
            PreparedStatement stmt = null;
            try 
            {
                con = JDBCHelper.getConnection();
                if (con == null) 
                {
                    System.out.println("Connection not established. Please check!!");
                    break block7;
                }
               
                stmt = con.prepareStatement("insert into treg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
               
                stmt.setString(1, bn.getName());
                stmt.setString(2, bn.getMobile());
                stmt.setString(3, bn.getAadharnum());
                stmt.setString(4, bn.getEmail());
                stmt.setString(5, bn.getState());
                stmt.setString(6, bn.getDistrict());
                stmt.setString(7, bn.getTaluk());
                stmt.setString(8, bn.getHobli());
                stmt.setString(9, bn.getVillage());
                stmt.setString(10, bn.getBankname());
                stmt.setString(11, bn.getAccountnum());
                stmt.setString(12, bn.getBranch());
                stmt.setString(13, bn.getIfsc());
                stmt.setString(14, bn.getTuid());
                stmt.setString(15, bn.getLicense());
                stmt.setString(16, bn.getPassword());
                stmt.setBlob(17, bn.getPhoto());
               
                
                if (!stmt.execute()) 
                {
                    return true;
                }
                
                return false;
            }
            catch (Exception e) 
            {
                e.printStackTrace();
            }
            finally 
            {
                JDBCHelper.Close(con);
                JDBCHelper.Close(stmt);
            }
        }
        return false;
    }
	
	public static boolean dataInsertEmoloyee(JavaBeanEmployee bn)
	{
        block7 : {
            Connection con = null;
            PreparedStatement stmt = null;
            try 
            {
                con = JDBCHelper.getConnection();
                if (con == null) 
                {
                    System.out.println("Connection not established. Please check!!");
                    break block7;
                }
               
                stmt = con.prepareStatement("insert into ereg values(?,?,?,?,?,?,?,?)");
               
                stmt.setString(1, bn.getName());
                stmt.setString(2, bn.getMobile());
                stmt.setString(3, bn.getAadharnum());
                stmt.setString(4, bn.getEmail());
                stmt.setString(5, bn.getState());
                stmt.setString(6, bn.getDistrict());
                stmt.setString(7, bn.getUid());
                stmt.setString(8, bn.getPassword());
                
                if (!stmt.execute()) 
                {
                    return true;
                }
                
                return false;
            }
            catch (Exception e) 
            {
                e.printStackTrace();
            }
            finally 
            {
                JDBCHelper.Close(con);
                JDBCHelper.Close(stmt);
            }
        }
        return false;
    }
	
    @SuppressWarnings("unused")
	public static JavaFarmerRetrieveBean dataRetrieveFarmer(String aadhar) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        JavaFarmerRetrieveBean bean = null;
        
        String name;
        String mobile;
        String aadharnum;
        String email;
        String state;
        String district;
        String taluk;
        String hobli;
        String village;
        
        try
        {
        	con = JDBCHelper.getConnection();
        	
        	if(con == null)
        	{
        		System.out.println("Database connection not established. Please check");
        	}
        	else
        	{
        		pstmt = con.prepareStatement("select * from freg where name = ?");
        		pstmt.setString(1, aadhar);
        		rset = pstmt.executeQuery();
        		
        		while(rset.next())
        		{
        			name = rset.getString("name");
        			mobile = rset.getString("mobile");
        			aadhar = rset.getString("aadharnum");
        			email = rset.getString("email");
        			state = rset.getString("state");
        			district = rset.getString("district");
        			taluk = rset.getString("taluk");
        			hobli = rset.getString("hobli");
        			village = rset.getString("village");
        			
        			//System.out.println("The name: "+name+" The mobile: "+mobile);
        			bean = new JavaFarmerRetrieveBean(name, mobile, aadhar, email, state, district, taluk, hobli, village);
        		}
        		return bean;
        	}
        }
        catch(SQLException e)
        {
        	e.printStackTrace();
        }
        finally
        {
        	JDBCHelper.Close(con);
        	JDBCHelper.Close(rset);
        	JDBCHelper.Close(pstmt);
        }
        return null;
    }
    
    public static JavaTraderRetrieveBean dataRetrieveTrader(String userid) 
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        JavaTraderRetrieveBean bean = null;
        
        String name;
        String mobile;
        String aadharnumber;
        String email;
        String state;
        String district;
        String taluk;
        String hobli;
        String village;
        
        try
        {
        	con = JDBCHelper.getConnection();
        	
        	if(con == null)
        	{
        		System.out.println("Database connection not established. Please check");
        	}
        	else
        	{
        		pstmt = con.prepareStatement("select * from treg where name = ?");
        		pstmt.setString(1, userid);
        		rset = pstmt.executeQuery();
        		
        		while(rset.next())
        		{
        			name = rset.getString("name");
        			mobile = rset.getString("mobile");
        			aadharnumber = rset.getString("aadharnumber");
        			email = rset.getString("email");
        			state = rset.getString("state");
        			district = rset.getString("district");
        			taluk = rset.getString("taluk");
        			hobli = rset.getString("hobli");
        			village = rset.getString("village");
        			
        			//System.out.println("The name: "+name+" The mobile: "+mobile);
        			bean = new JavaTraderRetrieveBean(name, mobile, aadharnumber, email, state, district, taluk, hobli, village);
        		}
        		return bean;
        	}
        }
        catch(SQLException e)
        {
        	e.printStackTrace();
        }
        finally
        {
        	JDBCHelper.Close(con);
        	JDBCHelper.Close(rset);
        	JDBCHelper.Close(pstmt);
        }
        return null;
    }
}
