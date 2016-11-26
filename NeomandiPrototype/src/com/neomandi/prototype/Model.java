package com.neomandi.prototype;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.JdbcRowSet;

public class Model {

	@SuppressWarnings("resource")
	public String employeeRegister(EmployeeRegisterBean erb) {
		// TODO Auto-generated method stub
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established";
			}
			else
			{
				
				ps = con.prepareStatement("select aadharnum from ereg where mobile = ? ");
				ps.setLong(1, erb.getEmployeemob());
				ps.execute();
				rs = ps.getResultSet();
				if(!rs.next())
				{
					con.setAutoCommit(false);
					
					ps = con.prepareStatement("insert into ereg values(?,?,?,?,?,?,?,?)");
					ps.setString(1, erb.getEmployeename());
					ps.setLong(2, erb.getEmployeemob());
					ps.setLong(3, erb.getEmployeeaadharnum());
					ps.setString(4, erb.getEmployeeemail());
					ps.setString(5, erb.getEmployeestate());
					ps.setString(6, erb.getEmployeedistrict());
					ps.setString(7, erb.getEmployeeuid());
					ps.setString(8, erb.getEmployeepwd());
					
					ps.execute();
					
					msg = "SUCCESS";
					
					con.commit();
				}
				else
					msg = msg + "Already Registered. Please try to login.";
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}

	public String farmerRegister(FarmerRegisterBean frb) {
		// TODO Auto-generated method stub
		
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established";
			}
			else
			{
				con.setAutoCommit(false);
				
				ps = con.prepareStatement("insert into freg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, frb.getFarmerName());
				ps.setLong(2, frb.getFarmerMobile());
				ps.setLong(3, frb.getFarmerAadharnum());
				ps.setString(4,frb.getFarmerEmail());
				ps.setString(5,frb.getFarmerState());
				ps.setString(6, frb.getFarmerDistrict());
				ps.setString(7, frb.getFarmerTaluk());
				ps.setString(8, frb.getFarmerHobli());
				ps.setString(9, frb.getFarmerVillage());
				ps.setString(10, frb.getFarmerBankName());
				ps.setLong(11, frb.getFarmerAccountNum());
				ps.setString(12, frb.getFarmerBranch());
				ps.setString(13, frb.getFarmerIfscCode());
				ps.setString(14, null);
				ps.setString(15, null);
				ps.execute();
				
				msg = "SUCCESS";
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}
	
	public String employeeLogin(EmployeeLoginBean elbn)
	{
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		//System.out.println(elbn.getEname());
		//System.out.println(elbn.getEpwd());
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established.";
			}
			else
			{
				con.setAutoCommit(false);
				
				ps = con.prepareStatement("select pass from ereg where userid = ?");
				ps.setString(1, elbn.getEname());
				
				ps.executeQuery();
				
				rs = ps.getResultSet();
				
				if(rs.next())
				{
					String npwd = rs.getString("pass");
					if(npwd.equals(elbn.getEpwd()))
						msg = msg + "SUCCESS";
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
					msg = msg + "Register first and then login.";
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}

	public String traderRegister(TraderRegisterBean trb) {
		
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established";
			}
			else
			{
				con.setAutoCommit(false);
				
				ps = con.prepareStatement("insert into treg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, trb.getTradername());
				ps.setLong(2, trb.getTradermob());
				ps.setLong(3, trb.getTraderaadharnum());
				ps.setString(4, trb.getTraderemail());
				ps.setString(5, trb.getTraderstate());
				ps.setString(6, trb.getTraderdistrict());
				ps.setString(7, trb.getTradertaluk());
				ps.setString(8, trb.getTraderhobli());
				ps.setString(9, trb.getTradervillage());
				ps.setString(10, trb.getTraderbankname());
				ps.setLong(11, trb.getTraderaccountnum());
				ps.setString(12, trb.getTraderbranch());
				ps.setString(13, trb.getTraderifsc());
				ps.setString(14, trb.getTraderuid());
				ps.setString(15, trb.getTraderlicensenum());
				ps.setString(16, trb.getTraderpwd());
				ps.setString(17, null);
				ps.execute();
				
				msg = "SUCCESS";
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}
	
	//Trader Login
	public String traderLogin(TraderLoginBean tlbn)
	{
		System.out.println("inside model->traderLogin()");
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		System.out.println("trader name is "+tlbn.getTname());
		System.out.println("trader password is "+tlbn.getTpwd());
		String name=tlbn.getTname();
		String pwd=tlbn.getTpwd();
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established.";
			}
			else
			{
				System.out.println("connection succssfull");
				con.setAutoCommit(false);
				System.out.println("verifying whether the trader has registered ");
				ps = con.prepareStatement("select pass from treg where name = ?");
				ps.setString(1, name);				
				ps.executeQuery();				
				rs = ps.getResultSet();				
				if(rs.next())
				{
					System.out.println(" trader has registered ");
					String npwd = rs.getString("pass");
					if(npwd.equals(pwd))
						msg = msg + "SUCCESS";
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
				{
					System.out.println(" trader has not registered ");				
					msg = msg + "Register first and then login.";
				}
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		System.out.println("returning message to cs...");
		return msg;
	}
	
	//Farmer Login
	public String farmerLogin(FarmerLoginBean flbn) {
		
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		System.out.println(flbn.getFname());
		System.out.println(flbn.getFpwd());
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established.";
			}
			else
			{
				con.setAutoCommit(false);
				
				ps = con.prepareStatement("select pass from freg where name = ?");
				ps.setString(1, flbn.getFname());
				
				ps.executeQuery();
				
				rs = ps.getResultSet();
				
				if(rs.next())
				{
					String npwd = rs.getString("pass");
					if(npwd.equals(flbn.getFpwd()))
						msg = msg + "SUCCESS";
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
					msg = msg + "Register first and then login.";
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
		
	}

	public List<ProductSearchResultBean> productSearch(ProductSearchBean psb) 
	{
		List<ProductSearchResultBean> l = new ArrayList<ProductSearchResultBean>();
		System.out.println("Inside ProductSearchServlet doPost().......");
	
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
			
			String kproduce = psb.getKproduce();
			String produce = psb.getProduce();
			String quality = psb.getQuality();
			System.out.println("inside model()-> kproduce is "+kproduce+"produce is "+produce+" quality is "+quality);
			//System.out.println("The kinofpro: "+kproduce+" The produce: "+produce+" The quality: "+quality);
			
			pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE kindofpro = ? and produce = ? and qualitygrade = ?");
			pstmt.setString(1, kproduce);
			pstmt.setString(2, produce);
			pstmt.setString(3, quality);
			
			//System.out.println(pstmt);
			
			rs = pstmt.executeQuery();
			ProductSearchResultBean psrb = null;
			while(rs.next())
			{
				psrb = new ProductSearchResultBean();
				psrb.setLotnumber(rs.getString("lotnumber"));
				psrb.setMarketcode(rs.getString("marketcode"));
				psrb.setProduce(rs.getString("produce"));
				psrb.setQualitygrade(rs.getString("qualitygrade"));
				psrb.setQuantity(rs.getString("quantity"));
				l.add(psrb);
	
			}
			return l;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			
		}
		return null;
	}

	public String productEntry(ProductEntryBean peb) {
		
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		//InputStream inputStream = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established";
			}
			else
			{
				con.setAutoCommit(false);
				
				ps = con.prepareStatement("insert into productentry values(?,?,?,?,?,?,?,?)");
				ps.setString(1, peb.getFarmerid());
				ps.setString(2, peb.getLotnum());
				ps.setString(3, peb.getMarketcode());
				ps.setString(4, peb.getKproduce());
				ps.setString(5, peb.getProduce());
				ps.setString(6, peb.getQuality());
				ps.setString(7, peb.getQuantity());
				ps.setString(8, null);
				ps.execute();
				
				msg = "SUCCESS";
				
				System.out.println("Product entry msg "+msg);
				
				con.commit();
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}

	@SuppressWarnings("resource")
	public String addTrade(String lotnumber) {
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String produce="";
		//InputStream inputStream = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				return msg + "Connection not established";
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select * from productentry where lotnumber = ?");
				ps.setString(1, lotnumber);
				ps.execute();
				
				rs = ps.getResultSet();
				
				String lotnum = "";
				String marketcode = "";
				produce = "";
				String qualitygrade = "";
				long quantity = 0;
				
				while(rs.next())
				{
					lotnum = rs.getString("lotnumber");
					marketcode = rs.getString("marketcode");
					produce = rs.getString("produce");
					qualitygrade = rs.getString("qualitygrade");
					quantity = rs.getLong("quantity");
				}
				
				ps = con.prepareStatement("insert into tradelist values(?,?,?,?,?)");
				
				ps.setString(1, lotnum);
				ps.setString(2, marketcode);
				ps.setString(3, produce);
				ps.setString(4, qualitygrade);
				ps.setLong(5, quantity);
				ps.execute();
				
				con.commit();
				
				
			}
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return "SUCCESS"+produce;
	}
}
