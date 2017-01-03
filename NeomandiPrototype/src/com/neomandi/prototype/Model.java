package com.neomandi.prototype;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class Model {
int count=0;
String tradername=null;
String traderpwd=null;
String farmeracceptresult=null;
String lotnum=null;

public String getLotnum() {
	return lotnum;
}

public void setLotnum(String lotnum) {
	this.lotnum = lotnum;
}

public String getFarmeracceptresult() {
	return farmeracceptresult;
}

public void setFarmeracceptresult(String farmeracceptresult) {
	this.farmeracceptresult = farmeracceptresult;
}

public String getTradername() {
	return tradername;
}

public void setTradername(String tradername) {
	this.tradername = tradername;
}

public String getTraderpwd() {
	return traderpwd;
}

public void setTraderpwd(String traderpwd) {
	this.traderpwd = traderpwd;
}

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
				ps.setBlob(15, frb.getFarmerPhoto());
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
				ps.setString(1, trb.getTraderName());
				ps.setLong(2, trb.getTraderMobile());
				ps.setLong(3, trb.getTraderAadharnum());
				ps.setString(4, trb.getTraderEmail());
				ps.setString(5, trb.getTraderState());
				ps.setString(6, trb.getTraderDistrict());
				ps.setString(7, trb.getTraderTaluk());
				ps.setString(8, trb.getTraderHobli());
				ps.setString(9, trb.getTraderVillage());
				ps.setString(10, trb.getTraderBankName());
				ps.setLong(11, trb.getTraderAccountNum());
				ps.setString(12, trb.getTraderBranch());
				ps.setString(13, trb.getTraderIfscCode());
				ps.setString(14, trb.getTraderUid());
				ps.setString(15, trb.getTraderLicenseNum());
				ps.setString(16, trb.getTraderPwd());
				ps.setBlob(17, trb.getTraderPhoto());
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
		//System.out.println("returning message to cs...");
		return msg;
	}
	
	//Farmer Login
	public String farmerLogin(FarmerLoginBean flbn) {
		
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		//System.out.println(flbn.getFname());
		//System.out.println(flbn.getFpwd());
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
	//farmer trade summary
	
	@SuppressWarnings("resource")
	public SummaryBean getSummary(String name, String pass,SummaryBean sb){
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		
		String aadhar="";
		String account="";
		String finalprice="";
		String myearnings="";
		String status="";
		String averageprice="";
		String quantitysold="";
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				
			}
			
			else
			{
				con.setAutoCommit(false);
				//aadharnum
				ps =con.prepareStatement("select aadharnum,accountnum from freg where name = ?  and pass=?");
				ps.setString(1, name);
				ps.setString(2, pass);
				
				ps.execute();
				rs = ps.getResultSet();
				
				while(rs.next())
				{
					aadhar=rs.getString("aadharnum");
					account=rs.getString("accountnum");
					System.out.println("in model account num="+account);
					System.out.println("aadharnumber of "+name+" is "+aadhar);
				}	
				
				//lotnumber
				String farmerid=aadhar;
				System.out.println("in cs farmerid="+farmerid);
				
				//getsummary details
				ps = con.prepareStatement("select * from productentry  where  farmerid=?" );
				ps.setString(1,farmerid);
				System.out.println(ps);
				System.out.println("Execute"+ps.executeQuery());
				rs=ps.getResultSet();
				System.out.println(rs+" "+ps.getResultSet());
				while(rs!=null&&rs.next())
				{
					System.out.println("inside while()->rs is "+rs);
					sb=new SummaryBean();
					 sb.setLotnumber(rs.getString("lotnumber"));
					 sb.setLotsize(rs.getString("quantity"));
					 sb.setQuantitysold(rs.getString("quantitybidfor"));
					 sb.setAverageprice(rs.getString("averageprice"));
					 sb.setAccountnum(account);
					 sb.setMyearning("myearning");
					 System.out.println("lotnumber="+sb.getLotnumber()+",lotsize="+sb.getLotsize()+",quantitysold="+sb.getQuantitysold()+",finalprice="+sb.getFinalprice());
				}
				sb.setAccountnum(account);
				System.out.println("in model bean="+sb);
				averageprice=sb.getAverageprice();
				quantitysold=sb.getQuantitysold();
				double aprice=Double.parseDouble(averageprice);
			    aprice=aprice*100;
			    aprice=(int)aprice;
			    aprice=aprice/100;
			    double qsold=Double.parseDouble(quantitysold);
			    qsold=qsold*100;
			    qsold=(int)qsold;
			    qsold=qsold/100;
			    double fprice=aprice*qsold;
			    fprice=fprice*100;
			    fprice=(int)fprice;
			    fprice=fprice/100;
				double MUCharge=1*fprice/100;
				double PACharge=100;
				double EPUCharge=100;
				double TCharge=MUCharge+PACharge+EPUCharge;
			    double myEarn=fprice-TCharge;
			    myEarn=myEarn*100;
			    myEarn=(int)myEarn;
			    myEarn=myEarn/100;
			    ps = con.prepareStatement("UPDATE  productentry  SET averageprice=?,quantitybidfor=?,finalprice=?,myearnings=? where  farmerid=?" );
			    ps.setDouble(1,aprice);
			    ps.setDouble(2,qsold);
			    ps.setDouble(3, fprice);
				ps.setDouble(4,myEarn);
			    ps.setString(5,farmerid);
			    System.out.println(ps);
				System.out.println("Execute"+ps.executeUpdate());
				rs=ps.getResultSet();
				System.out.println(rs+" "+ps.getResultSet());
				
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
			
			JDBCHelper.Close(con);
			JDBCHelper.Close(ps);
		}
		return sb;
	}
	
	public List<ProductSearchResultBean> productSearch(ProductSearchBean psb) 
	{
		List<ProductSearchResultBean> l = new ArrayList<ProductSearchResultBean>();
		System.out.println("Inside ProductSearch.......");
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
			else
			{
				String kproduce = psb.getKproduce();
				kproduce=kproduce.trim();
				String produce = psb.getProduce();
				String quality = psb.getQuality();
				String slot=psb.getSlot();
				System.out.println("kproduce= "+kproduce+" produce "+produce+" slot "+slot);
				if(kproduce.equals("base"))
				{			
					System.out.println("inside if()->slot is "+slot);
					if(slot.equals("slot3"))
						slot=null;
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE slotnumber=?");
					pstmt.setString(1,slot);				
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
						System.out.println("inside ProductSearchResultBean"+psrb);
					}
					return l;
				}
				else if(slot.equals("Please Select")&&quality.equals("Please Select"))
				{
					System.out.println("inside else if()->");
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE kindofpro = ? and produce = ?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, produce);					
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
				else if(slot.equals("Please Select")&&!quality.equals("Please Select"))
				{
					System.out.println("inside else if()->");
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE kindofpro = ? and qualitygrade=? and produce = ?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, quality);
					pstmt.setString(3, produce);					
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
				else
				{
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity FROM productentry WHERE kindofpro = ? and qualitygrade=? and produce = ? and slotnumber=?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, quality);
					pstmt.setString(3, produce);	
					pstmt.setString(4, slot);	
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
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
		}
		return l;
	}

	//Product Entry
	public String productEntry(ProductEntryBean peb){
		
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		String slot = "";
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
				
				ps = con.prepareStatement("insert into productentry values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, peb.getFarmerid());
				ps.setString(2, peb.getLotnum());
				ps.setString(3, peb.getMarketcode());
				ps.setString(4, peb.getKproduce());
				ps.setString(5, peb.getProduce());
				ps.setString(6, peb.getQuality());
				ps.setString(7, peb.getQuantity());
				ps.setBlob(8, peb.getPhoto());
				
				SimpleDateFormat df=new SimpleDateFormat("MM/dd/yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss.SSS");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				
				try {
					slot = TimeSlots.time(date+" "+date2);
					System.out.println(slot);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				ps.setString(9, date);
				ps.setString(10, date2);
				ps.setString(11, slot);
				ps.setString(12, null);
				ps.setString(13, null);
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
	public String addTrade(String lotnumber,TraderLoginBean tlbn,String quantityneeded) 
	{
		System.out.println("inside Model-> inside AddTrade()->quantityneeded is "+quantityneeded);
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String produce="";
		String aadharnumber="";
		
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
				setTradername(tlbn.getTname());
				setTraderpwd(tlbn.getTpwd());
				System.out.println("traders name and password has been saved in setters in model as "+tlbn.getTname()+" and "+tlbn.getTpwd());
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, tlbn.getTname());
				ps.setString(2, tlbn.getTpwd());
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					 aadharnumber=rs.getString("aadharnumber");
				}				
				ps =con.prepareStatement("select * from productentry where lotnumber = ?");
				ps.setString(1, lotnumber);
				ps.execute();
				rs = ps.getResultSet();
				String lotnum = "";
				String marketcode = "";
				produce = "";
				String qualitygrade = "";
				String quantity ="";
				String slotnumber=null;
				while(rs.next())
				{
					lotnum = rs.getString("lotnumber");
					marketcode = rs.getString("marketcode");
					produce = rs.getString("produce");
					qualitygrade = rs.getString("qualitygrade");
					quantity = rs.getString("quantity");
					slotnumber=rs.getString("slotnumber");
					System.out.println("slotnumber before checking whether its null is "+slotnumber);
				}			
				String lot[]=new String[100];
				int i=0;
				ps = con.prepareStatement("select lotnum from tradelist where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();
				System.out.println("lotnum trader "+tlbn.getTname()+" ss bidding for is ");
				while(rs.next())
				{
					lot[i]=rs.getString("lotnum");
					System.out.println(lot[i]);
					i++;
				}
				if(Arrays.asList(lot).contains(lotnum))
				{
					ps = con.prepareStatement("select * from tradelist");
					ps.execute();
					rs = ps.getResultSet();
					while(rs.next())
					{
						lot[i]=rs.getString("lotnum");
						i++;
					}
				}
				else
				{
					SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy"); 
					System.out.println("inserting into tradelist values are "+lotnum+" "+marketcode+" "+produce+" "+slotnumber+" "+quantityneeded);
					ps = con.prepareStatement("insert into tradelist(lotnum,marketcode,produce,qualitygrade,quantity,aadharnumber,price,slotnumber,quantityneeded) values(?,?,?,?,?,?,?,?,?)");
					ps.setString(1, lotnum);
					ps.setString(2, marketcode);
					ps.setString(3, produce);
					ps.setString(4, qualitygrade);
					ps.setString(5, quantity);
					ps.setString(6, aadharnumber);
					ps.setInt(7, 0);
					ps.setString(8, slotnumber);
					ps.setString(9, quantityneeded);
					ps.execute();				
					//con.commit();	
					System.out.println("values inserted into traders_bid_price is lotnum"+lotnum+" aadharnumber "+aadharnumber+"bidprice,lotcost,commission,marketcess,myfinalcost as 0	0	0	0	0 "+sdf.format(new Date()));
					ps=con.prepareStatement("insert into traders_bid_price(aadharnumber,lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,quantityassigned) values(?,?,?,?,?,?,?,?)");
					ps.setString(1, aadharnumber);
					ps.setString(2, lotnum);
					ps.setInt(3, 0);
					ps.setString(4,"0");
					ps.setString(5,"0");
					ps.setString(6,"0");
					ps.setString(7,"0");
					ps.setString(8,"0");
					ps.execute();				
					con.commit();
					
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			try {
				con.rollback();
			} catch (SQLException e1) 
			{
				e1.printStackTrace();
			}
		}
		finally
		{
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return "SUCCESS "+produce;
	}

	@SuppressWarnings("resource")
	public TraderBlockBean traderBlockBank(String name,String pwd) 
	{
		System.out.println("inside model-> traderBlockBank()->..trader name is "+name+" pwd is "+pwd);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String dbbankname="";
		String aadharnumber="";
		TraderBlockBean tbb=new TraderBlockBean();
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				tbb.setMsg("Connection not established");
				return tbb;
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
			
				rs = ps.getResultSet();				
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
				}
				ps =con.prepareStatement("select bankname,ifsc,balance,accountnumber from tbankaccount where aadharnumber = ?");
				ps.setString(1, aadharnumber);
				ps.execute();
				
				rs = ps.getResultSet();
				
				while(rs.next())
				{
					tbb= new TraderBlockBean();
					dbbankname=rs.getString("bankname");
					tbb.setDbbankname(dbbankname);
					tbb.setAccountnumber(rs.getString("accountnumber"));
					tbb.setIfsc(rs.getString("ifsc"));
					tbb.setBalance(rs.getInt("balance"));					
					tbb.setMsg("SUCCESS");
					System.out.println("total balance amount is "+rs.getInt("balance"));		
			    }	
				int blockamount[]=new int[1000];
				ps =con.prepareStatement("select blockamount from traders_blocked_amount where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();		
				int i=0;
				while(rs.next())
				{
					blockamount[i]=rs.getInt("blockamount");
					i++;
				}
				
				for(i=1;i<blockamount.length;i++)
					blockamount[0]=blockamount[0]+blockamount[i];
				 System.out.println("total blocked amount is "+blockamount[0]);
				 tbb.setBlock(blockamount[0]);
					return tbb;			
			}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			
				try {
						con.rollback();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
			}
			finally
			{
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
			}
			return tbb;
		}


	@SuppressWarnings("resource")
	public String[] traderblockamount(String name, String pwd, String amount, String bankname, String accno)
	{
		System.out.println("inside model-> traderBlockamount()->..bankname is"+bankname+" trader name is "+name+" pwd is "+pwd);
		PreparedStatement ps = null;	
		Connection con = null;		
		ResultSet rs = null;	
		String aadharnumber="";	
		String[] msg=new String[2];	
		int balance=0;		
		try		
		{		
			con = JDBCHelper.getConnection();
			if(con == null)		
			{
			}			
			else		
			{
				con.setAutoCommit(false);	
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");				
				ps.setString(1, name);		
				ps.setString(2, pwd);
				ps.execute();		
				rs = ps.getResultSet();				
				while(rs.next())
				{					
					aadharnumber=rs.getString("aadharnumber");	
				}		
				Integer block=Integer.parseInt(amount);		
				ps =con.prepareStatement("select ifsc,balance from tbankaccount where aadharnumber = ? and bankname=?");
				ps.setString(1, aadharnumber);								
				ps.setString(2, bankname);								
				ps.execute();								
				rs = ps.getResultSet();				
				while(rs.next())				
				{					
					balance=rs.getInt("balance");				
				}				
				System.out.println("old balance is "+balance);								
				balance=balance-block;								
				if(balance<0)								
				{									
					balance=balance+block;									
					msg[0]="you dont have sufficient amount to block money..you can block max "+balance+" please enter valid amount";									
					msg[1]=null;								
				}								
				else								
				{										
					ps =con.prepareStatement("update tbankaccount set balance =? where  accountnumber= ?");									
					ps.setInt(1, balance);										
					ps.setString(2, accno);
					ps.execute();
					msg[0]=String.valueOf(balance);
							
						
/*ps =con.prepareStatement("select balance from tbankaccount  where  accountnumber= ?");
						
ps.setString(1, accno);
						
ps.execute();
						
rs = ps.getResultSet();			
						
while(rs.next())
							
balance=rs.getInt("balance");
						
System.out.println("new balance according to DB "+balance);
						
System.out.println("inserting these into traders_blocked_amount  "+name+" "+aadharnumber+" "+msg+" "+amount);*/
			ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where tradername=?");
			ps.setString(1, name);									
			ps.execute();									
			rs = ps.getResultSet();									
			int blockamount=0;									
			while(rs.next())										
			blockamount=rs.getInt("blockamount");									
			blockamount=blockamount+block;									
			String blockamounts=String.valueOf(blockamount);
			System.out.println("amount to be blocked now is  "+block);
			System.out.println("total blocked amount is "+blockamount);		
			msg[1]=blockamounts;
												
			ps =con.prepareStatement("update traders_blocked_amount set blockamount=? where aadharnumber=?");
									
			ps.setString(1, blockamounts);
									
			ps.setString(2, aadharnumber);
									
			ps.execute();
									
			ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where tradername=?");
									
			ps.setString(1, name);
									
			ps.execute();
									
			rs = ps.getResultSet();			
									
									
			while(rs.next())
										
			blockamount=rs.getInt("blockamount");	
									
			System.out.println("after updating traders account, total blocked amount is "+blockamount);
							
			}						
						
			con.commit();			
						
			}
					
			}
					
			catch(SQLException e)
					
			{
						
			e.printStackTrace();
						
			try {
							
			con.rollback();
						
			}
						
			catch (SQLException e1)
						
			{
							
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

@SuppressWarnings({ "resource" })
	public Mynewclass tradeOrAuction(String name, String pwd) 
	{
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		TradeListBean tlb=null;
		MyFinalCostBean mfcb=null;
		List<TradeListBean> al=new ArrayList<TradeListBean>();
		List<MyFinalCostBean> bl=new ArrayList<MyFinalCostBean>();
		Mynewclass mc=new Mynewclass();
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
					System.out.println("aadharnumber of "+name+" is "+aadharnumber);
				}			
				ps =con.prepareStatement("SELECT lotnum, marketcode, produce,qualitygrade, quantity, slotnumber,quantityneeded FROM tradelist where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					tlb=new TradeListBean();
					tlb.setLotnum(rs.getString("lotnum"));
					tlb.setMarketcode(rs.getString("marketcode"));
					tlb.setProduce(rs.getString("produce"));
					tlb.setQualitygrade(rs.getString("qualitygrade"));
					tlb.setQuantity(rs.getInt("quantity"));		
					tlb.setSlotnumber(rs.getString("slotnumber"));
					tlb.setQuantityneeded(rs.getString("quantityneeded"));
					al.add(tlb);
					System.out.println("produce that trader "+name+" is bidding for "+rs.getString("lotnum")+" "+rs.getString("produce")+" for quanityt"+rs.getString("quantityneeded"));
				}
				mc.setAl(al);
				
				ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					mfcb=new MyFinalCostBean();
					mfcb.setCommission(rs.getString("commission"));
					mfcb.setLotcost(rs.getString("lotcost"));
					mfcb.setMarketcess(rs.getString("marketcess"));
					mfcb.setMyfinalcost(rs.getString("myfinalcost"));
					int price=rs.getInt("bidprice");
					String prices=String.valueOf(price);
					mfcb.setPrice(prices);
					mfcb.setLotnum(rs.getString("lotnum"));
					mfcb.setBestbid(rs.getString("bestbid"));
					mfcb.setQuantityassigned(rs.getString("quantityassigned"));
					System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
					bl.add(mfcb);
				}
				mc.setBl(bl);
			}						
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return mc;
	}

	@SuppressWarnings("resource")
	public List<TradeListBean> removeLotNumber(String lotnumber, String name, String pwd) 
	{
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		TradeListBean tlb=null;
		List<TradeListBean> al=new ArrayList<TradeListBean>();		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
					System.out.println("aadharnumber of "+name+" is "+aadharnumber);
				}		
				
				ps=con.prepareStatement("delete from tradelist where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.execute();
				System.out.println("lotnumber  deleted from traderlist is "+lotnumber);
				System.out.println("lotnumber  deleted from traders_bid_price "+lotnumber);
				ps=con.prepareStatement("delete from traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.execute();
				
				ps =con.prepareStatement("SELECT lotnum, marketcode, produce,qualitygrade, slotnumber, quantity,quantityneeded FROM tradelist where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					tlb=new TradeListBean();
					tlb.setLotnum(rs.getString("lotnum"));
					tlb.setMarketcode(rs.getString("marketcode"));
					tlb.setProduce(rs.getString("produce"));
					tlb.setQualitygrade(rs.getString("qualitygrade"));
					tlb.setQuantity(rs.getInt("quantity"));		
					tlb.setSlotnumber(rs.getString("slotnumber"));
					tlb.setQuantityneeded(rs.getString("quantityneeded"));
					al.add(tlb);
					System.out.println("produce that trader "+name+" is bidding for "+rs.getString("lotnum")+" "+rs.getString("produce"));
				}				
			}						
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return al;
	}

	public String actionTrail(ActionTrailBean atbean) {
		
		Connection con = null;
		PreparedStatement ps = null;
		Statement stmt = null;
		String msg = "";

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
				
				String sql = "TRUNCATE biddingdata";
				stmt = con.createStatement();
				System.out.println("Truncate: "+stmt.executeUpdate(sql));
				
				ps = con.prepareStatement("insert into biddingdata values(?,?,?,?,?,?)");
				
				ps.setString(1, "T1");
				ps.setInt(2, atbean.getV1());
				ps.setInt(3, atbean.getB1());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv1());
				ps.setInt(6, atbean.getBb1());
				ps.addBatch();
				
				ps.setString(1, "T2");
				ps.setInt(2, atbean.getV2());
				ps.setInt(3, atbean.getB2());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv2());
				ps.setInt(6, atbean.getBb2());
				ps.addBatch();
				
				ps.setString(1, "T3");
				ps.setInt(2, atbean.getV3());
				ps.setInt(3, atbean.getB3());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv3());
				ps.setInt(6, atbean.getBb3());
				ps.addBatch();
				
				ps.setString(1, "T4");
				ps.setInt(2, atbean.getV4());
				ps.setInt(3, atbean.getB4());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv4());
				ps.setInt(6, atbean.getBb4());
				ps.addBatch();
				
				ps.setString(1, "T5");
				ps.setInt(2, atbean.getV5());
				ps.setInt(3, atbean.getB5());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv5());
				ps.setInt(6, atbean.getBb5());
				ps.addBatch();
				
				ps.setString(1, "T6");
				ps.setInt(2, atbean.getV6());
				ps.setInt(3, atbean.getB6());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv6());
				ps.setInt(6, atbean.getBb6());
				ps.addBatch();
				
				ps.setString(1, "T7");
				ps.setInt(2, atbean.getV7());
				ps.setInt(3, atbean.getB7());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv7());
				ps.setInt(6, atbean.getBb7());
				ps.addBatch();
				
				ps.setString(1, "T8");
				ps.setInt(2, atbean.getV8());
				ps.setInt(3, atbean.getB8());
				ps.setString(4, null);
				ps.setInt(5, atbean.getAv8());
				ps.setInt(6, atbean.getBb8());
				ps.addBatch();
				
				System.out.println(ps.executeBatch());
				
				con.commit();
			}
			return "SUCCESS";
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return msg;
	}

	@SuppressWarnings("resource")
	public Myclass submitIncrementOne(String name, String pwd, String lotnumber,String bankname) 
	{
		System.out.println("inside Model()->.....submtIncrementOne lotnumber is  "+lotnumber);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		String quantitys=null;
		int quantity=0;
		String lotcosts="";
		int lotcost;
		String commissions="";
		int commission;
		String marketcesss="";
		int marketcess;
		String msg="";
		MyFinalCostBean mfcb=new MyFinalCostBean();
		int finalcost;
		List<MyFinalCostBean> al=new ArrayList<MyFinalCostBean>();		
		Myclass mc=new Myclass();
		try
		{
			con = JDBCHelper.getConnection();			
			if(con == null)
			{
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
					System.out.println("aadharnumber of "+name+" is "+aadharnumber);
				}				
				ps =con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					quantitys=rs.getString("quantityneeded");					
					System.out.println("quantity bidding for lot "+lotnumber+" is "+quantitys);
				}		
				ps =con.prepareStatement("SELECT quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnumber);
				ps.execute();
				rs = ps.getResultSet();	
				String quantityassigned=null;
				while(rs.next())
				{
					 quantityassigned = rs.getString("quantityassigned");					
					System.out.println("quantity assigned is "+quantityassigned);
				}		
				int[] blockamount=new int[200];
				int result=0;
				ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					result=rs.getInt("blockamount");				
				}			
				System.out.println("total amount blocked by trader "+name+" in "+ bankname+" is "+result);
				int bidprice = 0;
				String bidprices="";		
				String finalcosts="";
				
				ps =con.prepareStatement("select bidprice from traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.execute();
				rs = ps.getResultSet();				
				if(rs.next())
				{
					bidprice=rs.getInt("bidprice");	
					System.out.println("biddng price the trader was ready to pay is "+bidprice);
					int res =bidprice+1;	
					int quantityassignedint = Integer.parseInt(quantityassigned);
					lotcost = res * quantityassignedint;
					commission = (int) (lotcost*0.05);
					marketcess = 1*10;
					System.out.println("commisiion is "+commission);
					System.out.println(" marketcess is "+marketcess);
					System.out.println(" quantityassigned  is "+quantityassignedint);
					System.out.println(" lotcost = "+res+" * "+quantity+"");
					finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("lot cost the trader has to pay is "+lotcost);
					System.out.println("traders final cost for lotnumber "+lotnumber+" is "+finalcost);
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					bidprices=String.valueOf(res);
					finalcosts=String.valueOf(finalcost);
					SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss.SSS");
					String date=sdf.format(new Date());
					System.out.println("updating traders_bid_price by values=bidprices "+bidprices+" commissions "+commissions+" marketcesss "+marketcesss+" finalcosts "+finalcosts+" lotcosts "+lotcosts);
					ps =con.prepareStatement("update traders_bid_price set lotcost=?, bidprice=? , commission=? , marketcess=?, myfinalcost=?, bid_time=? where aadharnumber=? and lotnum=? ");
					ps.setString(1,lotcosts);
					ps.setInt(2,res);
					ps.setString(3,commissions);
					ps.setString(4,marketcesss);
					ps.setString(5,finalcosts);
					ps.setString(6,date);
					ps.setString(7,aadharnumber);
					ps.setString(8,lotnumber);
					System.out.println("current time is "+date);
					ps.execute();
					System.out.println("biddng price the trader is ready to pay at "+date+" is "+res);
								
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid,quantityassigned from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						System.out.println("bid price is "+bidprice);
						bidprices=String.valueOf(bidprice);
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						mfcb.setQuantityassigned(rs.getString("quantityassigned"));
						System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
						al.add(mfcb);
					}	
					mc.setAl(al);
					System.out.println("1al.size()"+al.size());
					System.out.println("insd3 model() al()-> "+al);
				}		
				else
				{
					System.out.println("lotnumber "+lotnumber+" is not there in traders_bid_price");
					lotcost=1*quantity;
					System.out.println("lotcost=1*quantity->"+lotcost);
					commission = (int) (lotcost*0.05);
					System.out.println("commission="+commission);
					marketcess = 1*10;
					System.out.println("marketcess="+marketcess);
					finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("creating traders_bid_price by values="+commissions+" "+marketcesss+" finalcosts "+finalcosts);
					
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					finalcosts=String.valueOf(finalcost);
					
					SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss.SSS");
					String date=sdf.format(new Date());
					
					ps =con.prepareStatement("insert into traders_bid_price values(?,?,?,?,?,?,?,?,?,?)");
					ps.setString(1, aadharnumber);
					ps.setString(2,lotnumber);
					ps.setInt(3,1);
					ps.setString(4,lotcosts);
					ps.setString(5,commissions);
					ps.setString(6,marketcesss);
					ps.setString(7,finalcosts);
					ps.setString(8,"0");
					ps.setString(9,"0");
					ps.setString(10,date);
					ps.execute();
					System.out.println("current time is "+date);
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid,quantityassigned from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
				//	ps.setString(2,lotnumber );
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{						
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						bidprices=String.valueOf(bidprice);
						
						
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						mfcb.setQuantityassigned(rs.getString("quantityassigned"));
						al.add(mfcb);
					}					
					System.out.println("inside model()-> al->"+al);
					System.out.println("insd3 model() mfcb-> "+mfcb);
				}				
				
				int res=0;
				ps =con.prepareStatement("select myfinalcost from traders_bid_price where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					finalcosts=rs.getString("myfinalcost");
					int resu=Integer.parseInt(finalcosts);					
					res=res+resu;		
				}				
				finalcost=res;				
				System.out.println("finalcost= "+finalcost);
				System.out.println("total blocked amount= "+result);
				int diff=finalcost-result;
				System.out.println("finalcost-result"+diff);
				if(finalcost>result)
				{
					 diff=finalcost-result;
					System.out.println("difference between final cost and blocked amount is "+diff);					
					msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
					mc.setMsg(msg);
				}
				else
				{
					msg="success";
					mc.setMsg(msg);
				}									
			}						
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return mc;		
	}

	/*@SuppressWarnings("resource")
	public Myclass submitIncrementTwo(String name, String pwd, String lotnumber, String bank) {
		System.out.println("inside Model()->.....submtIncrementOne");
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		int quantity=0;
		String lotcosts="";
		int lotcost;
		String commissions="";
		int commission;
		String marketcesss="";
		int marketcess;
		String msg="";
		MyFinalCostBean mfcb=new MyFinalCostBean();
		int finalcost;
		List<MyFinalCostBean> al=new ArrayList<MyFinalCostBean>();		
		Myclass mc=new Myclass();
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
					System.out.println("aadharnumber of "+name+" is "+aadharnumber);
				}				
				ps =con.prepareStatement("SELECT quantity FROM tradelist where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					quantity=rs.getInt("quantity");					
					System.out.println("quantity available for lot "+lotnumber+" is "+quantity);
				}				
				int[] blockamount=new int[200];
				ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				int i=0;
				while(rs.next())
				{
					blockamount[i]=rs.getInt("blockamount");		
					System.out.println("amount blocked by trader is "+blockamount[i]);
					i++;
				}				
				int result=0;
				for(int j=0;j<blockamount.length;j++)
				{
					result=result+blockamount[j];
				}
				System.out.println("-------------------------------------------------------");
				System.out.println("total amount blocked by trader "+name+" in "+ name+" is "+result);
				int bidprice = 0;
				String bidprices="";		
				String finalcosts="";
				ps =con.prepareStatement("select bidprice from traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.execute();
				rs = ps.getResultSet();				
				if(rs.next())
				{
					bidprice=rs.getInt("bidprice");	
					System.out.println("biddng price the trader was ready to pay is "+bidprice);
					int res =bidprice+2;		
					lotcost = bidprice * quantity;
					commission = (int) (lotcost*0.05);
					marketcess = 1*10;
					System.out.println("commisiion is "+commission);
					System.out.println(" marketcess is "+marketcess);
					finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("lot cost the trader has to pay is "+lotcost);
					System.out.println("traders final cost for lotnumber "+lotnumber+" is "+finalcost);
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					bidprices=String.valueOf(res);
					finalcosts=String.valueOf(finalcost);
					System.out.println("updating traders_bid_price by values=bidprices"+bidprices+" commissions "+commissions+" marketcesss "+marketcesss+" finalcosts "+finalcosts+" lotcosts "+lotcosts);
					ps =con.prepareStatement("update traders_bid_price set lotcost=?, bidprice=? , commission=? , marketcess=?, myfinalcost=? where aadharnumber=? and lotnum=?");
					ps.setString(1,lotcosts);
					ps.setInt(2,res);
					ps.setString(3,commissions);
					ps.setString(4,marketcesss);
					ps.setString(5,finalcosts);
					ps.setString(6,aadharnumber);
					ps.setString(7,lotnumber);
					ps.execute();
					System.out.println("biddng price the trader is ready to pay now is "+res);
					
					ps =con.prepareStatement("select bidprice, lotnum, aadharnumber from traders_bid_price");
					ps.execute();
					rs = ps.getResultSet();				
					while(rs.next())
					{
						System.out.println("bidprice after updating in traders_bid_price "+rs.getInt("bidprice")+" lotnum is "+rs.getString("lotnum")+" aadharnumber "+rs.getString("aadharnumber"));
					}					
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						bidprices=String.valueOf(bidprice);
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						System.out.println("commission "+mfcb.getCommission()+" lotcost"+mfcb.getLotcost()+" marktecess"+mfcb.getMarketcess()+"final price"+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
						al.add(mfcb);
					}	
					mc.setAl(al);
					System.out.println("1al.size()"+al.size());
					//System.out.println("insd3 model() mfcb()-> "+mfcb);
				}		
				else
				{
					lotcost=2*quantity;
					System.out.println("lotcost=1*quantity->"+lotcost);
					commission = (int) (lotcost*0.05);
					System.out.println("commission="+commission);
					marketcess = 1*10;
					System.out.println("marketcess="+marketcess);
					finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("creating traders_bid_price by values="+commissions+" "+marketcesss+" finalcosts "+finalcosts);
					
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					finalcosts=String.valueOf(finalcost);
					
					ps =con.prepareStatement("insert into traders_bid_price values(?,?,?,?,?,?,?,?)");
					ps.setString(1, aadharnumber);
					ps.setString(2,lotnumber);
					ps.setInt(3,2);
					ps.setString(4,lotcosts);
					ps.setString(5,commissions);
					ps.setString(6,marketcesss);
					ps.setString(7,finalcosts);
					ps.setString(8,"0");
					ps.execute();
					
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{						
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						bidprices=String.valueOf(bidprice);
						

						System.out.println("mfcb.getbidprice->"+mfcb.getPrice());
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						al.add(mfcb);
					}					
					System.out.println("inside model()-> al->"+al);
					System.out.println("insd3 model() mfcb-> "+mfcb);
				}				
				
				ps =con.prepareStatement("select myfinalcost from traders_bid_price where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					finalcosts=rs.getString("myfinalcost");
					finalcost=Integer.parseInt(finalcosts);
					System.out.println("final cost of all lot for trader "+name+" is "+finalcost);
				}
				if(finalcost>result)
				{
					int diff=finalcost-result;
					System.out.println("difference between final cost and blocked amount is "+diff);					
					msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
					//mfcb.setMsg(msg);
					mc.setMsg(msg);
				}
				else
				{
					msg="success";
					//mfcb.setMsg(msg);
					mc.setMsg(msg);
				}									
			}						
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
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return mc;		
}*/
	
@SuppressWarnings("resource")
public Myclass1 submitIncrement1(String name, String pwd, String lotnumber,String bankname)
{

	System.out.println("inside Model()->.....submtIncrement1");
	PreparedStatement ps = null;
	Connection con = null;
	ResultSet rs = null;
	String aadharnumber="";
	String quantitys=null;
	int quantity=0;
	String lotcosts="";
	int lotcost;
	String commissions="";
	int commission;
	String marketcesss="";
	int marketcess;
	int finalcost;
	Myclass1 mc=new Myclass1();
	try
	{
		con = JDBCHelper.getConnection();
		
		if(con == null)
		{
		}
		else
		{
			con.setAutoCommit(false);
			ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
			ps.setString(1, name);
			ps.setString(2, pwd);
			ps.execute();
			rs = ps.getResultSet();
			while(rs.next())
			{
				aadharnumber=rs.getString("aadharnumber");
				System.out.println("aadharnumber of "+name+" is "+aadharnumber);
			}				
			ps =con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
			ps.setString(1, aadharnumber);
			ps.setString(2, lotnumber);
			ps.execute();
			rs = ps.getResultSet();				
			while(rs.next())
			{
				quantitys=rs.getString("quantityneeded");					
				System.out.println("quantity bidding for lot "+lotnumber+" is "+quantitys);
			}				
			int result=0;
			ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
			ps.setString(1, aadharnumber);
			ps.execute();
			rs = ps.getResultSet();	
			while(rs.next())
			{
				result=rs.getInt("blockamount");	
			}				
			System.out.println("total amount blocked by trader "+name+" in "+ bankname+" is "+result);
			int bidprice = 0;
			String bidprices="";		
			String finalcosts="";
			ps =con.prepareStatement("select bidprice from traders_bid_price where aadharnumber=? and lotnum=?");
			ps.setString(1, aadharnumber);
			ps.setString(2,lotnumber);
			ps.execute();
			rs = ps.getResultSet();				
			if(rs.next())
			{
				bidprice=rs.getInt("bidprice");	
				System.out.println("biddng price the trader was ready to pay is "+bidprice);
				int res =bidprice+1;	
				quantity=Integer.parseInt(quantitys);
				lotcost = res * quantity;
				commission = (int) (lotcost*0.05);
				marketcess = 1*10;
				System.out.println("commisiion is "+commission);
				System.out.println(" marketcess is "+marketcess);
				System.out.println(" quantity needed is  is "+quantity);
				System.out.println(" lotcost = "+res+" * "+quantity+"");
				finalcost = lotcost +commission +marketcess + 3000;
				System.out.println("lot cost the trader has to pay is "+lotcost);
				System.out.println("traders final cost for lotnumber "+lotnumber+" is "+finalcost);
				commissions=String.valueOf(commission);
				lotcosts=String.valueOf(lotcost);
				marketcesss=String.valueOf(marketcess);
				bidprices=String.valueOf(res);
				finalcosts=String.valueOf(finalcost);
				SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss.SSS");
				String date=sdf.format(new Date());
				System.out.println("updating traders_bid_price by values=bidprices "+bidprices+" commissions "+commissions+" marketcesss "+marketcesss+" finalcosts "+finalcosts+" lotcosts "+lotcosts);
				ps =con.prepareStatement("update traders_bid_price set lotcost=?, bidprice=? , commission=? , marketcess=?, myfinalcost=? where aadharnumber=? and lotnum=?  and bid_time=?");
				ps.setString(1,lotcosts);
				ps.setInt(2,res);
				ps.setString(3,commissions);
				ps.setString(4,marketcesss);
				ps.setString(5,finalcosts);
				ps.setString(6,aadharnumber);
				ps.setString(7,lotnumber);
				ps.setString(8,date);
				ps.execute();
				System.out.println("current time is "+date);
				System.out.println("biddng price the trader is ready to pay now is "+res);
				mc.setBidprice(bidprices);
				mc.setCommission(commissions);
				mc.setLotcost(lotcosts);
				mc.setMarketcess(marketcesss);
				mc.setMyfinalcost(finalcosts);
				return mc;
			}}}
				/*ps =con.prepareStatement("select bidprice, lotnum, aadharnumber from traders_bid_price");
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					System.out.println("bidprice after updating in traders_bid_price "+rs.getInt("bidprice")+" lotnum is "+rs.getString("lotnum")+" aadharnumber "+rs.getString("aadharnumber"));
				}*/					
			/*	ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid from traders_bid_price where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					mfcb=new MyFinalCostBean();
					commissions=rs.getString("commission");
					lotcosts=rs.getString("lotcost");
					marketcesss=rs.getString("marketcess");
					finalcosts=rs.getString("myfinalcost");
					lotnumber=rs.getString("lotnum");
					bidprice=rs.getInt("bidprice");
					bidprices=String.valueOf(bidprice);
					mfcb.setCommission(commissions);
					mfcb.setLotcost(lotcosts);
					mfcb.setMarketcess(marketcesss);
					mfcb.setMyfinalcost(finalcosts);
					mfcb.setPrice(bidprices);
					mfcb.setLotnum(lotnumber);
					mfcb.setBestbid(rs.getString("bestbid"));
					System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
					al.add(mfcb);
				}	
				//mc.setAl(al);
				System.out.println("1al.size()"+al.size());
				System.out.println("insd3 model() al()-> "+al);
			}		
			else
			{
				System.out.println("lotnumber "+lotnumber+" is not there in traders_bid_price");
				lotcost=1*quantity;
				System.out.println("lotcost=1*quantity->"+lotcost);
				commission = (int) (lotcost*0.05);
				System.out.println("commission="+commission);
				marketcess = 1*10;
				System.out.println("marketcess="+marketcess);
				finalcost = lotcost +commission +marketcess + 3000;
				System.out.println("creating traders_bid_price by values="+commissions+" "+marketcesss+" finalcosts "+finalcosts);
				
				commissions=String.valueOf(commission);
				lotcosts=String.valueOf(lotcost);
				marketcesss=String.valueOf(marketcess);
				finalcosts=String.valueOf(finalcost);
				
				ps =con.prepareStatement("insert into traders_bid_price values(?,?,?,?,?,?,?,?)");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.setInt(3,1);
				ps.setString(4,lotcosts);
				ps.setString(5,commissions);
				ps.setString(6,marketcesss);
				ps.setString(7,finalcosts);
				ps.setString(8,"0");
				ps.execute();
				
				ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid from traders_bid_price where aadharnumber=?");
				ps.setString(1,aadharnumber);
			//	ps.setString(2,lotnumber );
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{						
					mfcb=new MyFinalCostBean();
					commissions=rs.getString("commission");
					lotcosts=rs.getString("lotcost");
					marketcesss=rs.getString("marketcess");
					finalcosts=rs.getString("myfinalcost");
					lotnumber=rs.getString("lotnum");
					bidprice=rs.getInt("bidprice");
					bidprices=String.valueOf(bidprice);
					
					
					mfcb.setCommission(commissions);
					mfcb.setLotcost(lotcosts);
					mfcb.setMarketcess(marketcesss);
					mfcb.setMyfinalcost(finalcosts);
					mfcb.setPrice(bidprices);
					mfcb.setLotnum(lotnumber);
					mfcb.setBestbid(rs.getString("bestbid"));
					al.add(mfcb);
				}					
				System.out.println("inside model()-> al->"+al);
				System.out.println("insd3 model() mfcb-> "+mfcb);
			}				
			
			int res[]=new int[19];
			int j=0;
			ps =con.prepareStatement("select myfinalcost from traders_bid_price where aadharnumber=?");
			ps.setString(1,aadharnumber);
			ps.execute();
			rs = ps.getResultSet();	
			while(rs.next())
			{
				finalcosts=rs.getString("myfinalcost");
				res[j]=Integer.parseInt(finalcosts);
				j++;					
			}
			for(int k=0;k<res.length;k++)
			{
				finalcost=finalcost+res[k];
			}
			System.out.println("finalcost= "+finalcost);
			System.out.println("total blocked amount= "+result);
			int diff=finalcost-result;
			System.out.println("finalcost-result"+diff);
			if(finalcost>result)
			{
				 diff=finalcost-result;
				System.out.println("difference between final cost and blocked amount is "+diff);					
				msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
				//mc.setMsg(msg);
			}
			else
			{
				msg="success";
				//mc.setMsg(msg);
			}									
		}						
		con.commit();		
	}*/
	catch(SQLException e)
	{
		e.printStackTrace();
		
		try {
			con.rollback();
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		
	}
	finally
	{
		JDBCHelper.Close(ps);
		JDBCHelper.Close(con);
	}
	return mc;
}
	
	@SuppressWarnings({ "resource", "finally" })
	public Myclass Increment(String name, String pwd, String increments, String lotnum) 
	{
		int increment=0;
		increments=increments.trim();
		increment=Integer.parseInt(increments);
		System.out.println("inside Model()->.....Increment... lotnum is "+lotnum+" increments is "+increment);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		String quantityassigneds=null;
		String quantitys=null;
		int quantityassigned=0;
		String lotcosts="";
		int lotcost;
		String commissions="";
		int commission;
		String lotnumber=lotnum;
		String marketcesss="";
		int marketcess;
		String msg="";
		MyFinalCostBean mfcb=new MyFinalCostBean();
		int finalcost;
		List<MyFinalCostBean> al=new ArrayList<MyFinalCostBean>();		
		Myclass mc=new Myclass();
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
			}
			else
			{
				con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
				}				
				ps =con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnum);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					quantitys=rs.getString("quantityneeded");					
					System.out.println("quantity trader is bidding for lot "+lotnumber+" is "+ quantitys+"Kg");
				}		
				ps =con.prepareStatement("SELECT quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnum);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					quantityassigneds = rs.getString("quantityassigned");							
					System.out.println("quantity of "+lotnumber+" that is assigned is "+ quantityassigneds +"Kg");
				}		
				int result=0;
				ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					result=rs.getInt("blockamount");						
				}				
				System.out.println("total amount blocked by trader "+name+" is Rs."+result);
				int bidprice = 0;
				String bidprices="";		
				String finalcosts="";
				ps =con.prepareStatement("select bidprice from traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2,lotnumber);
				ps.execute();
				rs = ps.getResultSet();				
				if(rs.next())
				{
					bidprice=rs.getInt("bidprice");	
					System.out.println("biddng price the trader was ready to pay is "+bidprice);
					int res =bidprice+increment;	
					System.out.println("biddng price the trader is ready to pay = bidprice before "+bidprice+"+ increment "+increment+"= "+res);
					quantityassigned=Integer.parseInt(quantityassigneds);
					//lotcost = res * quantity;
					lotcost = res * quantityassigned;
					commission = (int) (lotcost*0.05);
					marketcess = 1*10;
					System.out.println("commisiion is "+commission);
					System.out.println(" marketcess is "+marketcess);
					System.out.println(" quantity assigned  is "+quantityassigned);
					System.out.println(" lotcost = "+res+" * "+quantityassigned+"");
					if(quantityassigned==0)						
						finalcost=0;
					else
						finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("lot cost the trader has to pay is "+lotcost);
					System.out.println("traders final cost for lotnumber "+lotnumber+" is "+finalcost);
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					bidprices=String.valueOf(res);
					finalcosts=String.valueOf(finalcost);
					SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss.SSS");
					String date=sdf.format(new Date());
					//System.out.println("updating traders_bid_price by values=bidprices "+bidprices+" commissions "+commissions+" marketcesss "+marketcesss+" finalcosts "+finalcosts+" lotcosts "+lotcosts);
					ps =con.prepareStatement("update traders_bid_price set lotcost=?, bidprice=? , commission=? , marketcess=?, myfinalcost=?, bid_time=? where aadharnumber=? and lotnum=?");//
					
					ps.setString(1,lotcosts);
					ps.setInt(2,res);
					ps.setString(3,commissions);
					ps.setString(4,marketcesss);
					ps.setString(5,finalcosts);
					ps.setString(6,date);
					ps.setString(7,aadharnumber);
					ps.setString(8,lotnumber);
					
					ps.execute();									
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid,quantityassigned from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						bidprices=String.valueOf(bidprice);
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						mfcb.setQuantityassigned(rs.getString("quantityassigned"));
						//System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
						al.add(mfcb);
					}	
					mc.setAl(al);
					System.out.println("1al.size()"+al.size());
					System.out.println("insd3 model() al()-> "+al);
				}		
				else
				{
					System.out.println("lotnumber "+lotnumber+" is not there in traders_bid_price");
					lotcost=increment*quantityassigned;
					System.out.println("lotcost=increment*quantityassigned->"+lotcost);
					commission = (int) (lotcost*0.05);
					System.out.println("commission="+commission);
					marketcess = 1*10;
					System.out.println("marketcess="+marketcess);
					finalcost = lotcost +commission +marketcess + 3000;
					System.out.println("creating traders_bid_price by values="+commissions+" "+marketcesss+" finalcosts "+finalcosts);
					
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					finalcosts=String.valueOf(finalcost);
					SimpleDateFormat sdf=new SimpleDateFormat();
					String date=sdf.format(new Date());
					
					ps =con.prepareStatement("insert into traders_bid_price values(?,?,?,?,?,?,?,?,?,?)");
					ps.setString(1, aadharnumber);
					ps.setString(2,lotnumber);
					ps.setInt(3,1);
					ps.setString(4,lotcosts);
					ps.setString(5,commissions);
					ps.setString(6,marketcesss);
					ps.setString(7,finalcosts);
					ps.setString(8,"0");
					ps.setString(9,"0");
					ps.setString(10,date);
					ps.execute();
					
					ps =con.prepareStatement("select lotnum,bidprice,lotcost,commission,marketcess,myfinalcost,bestbid,quantityassigned from traders_bid_price where aadharnumber=?");
					ps.setString(1,aadharnumber);
				//	ps.setString(2,lotnumber );
					ps.execute();
					rs = ps.getResultSet();	
					while(rs.next())
					{						
						mfcb=new MyFinalCostBean();
						commissions=rs.getString("commission");
						lotcosts=rs.getString("lotcost");
						marketcesss=rs.getString("marketcess");
						finalcosts=rs.getString("myfinalcost");
						lotnumber=rs.getString("lotnum");
						bidprice=rs.getInt("bidprice");
						bidprices=String.valueOf(bidprice);
						
						
						mfcb.setCommission(commissions);
						mfcb.setLotcost(lotcosts);
						mfcb.setMarketcess(marketcesss);
						mfcb.setMyfinalcost(finalcosts);
						mfcb.setPrice(bidprices);
						mfcb.setLotnum(lotnumber);
						mfcb.setBestbid(rs.getString("bestbid"));
						mfcb.setQuantityassigned(rs.getString("quantityassigned"));						
						al.add(mfcb);
					}					
					System.out.println("inside model()-> al->"+al);
					System.out.println("insd3 model() mfcb-> "+mfcb);
				}				
				
				int res[]=new int[19];
				int j=0;
				ps =con.prepareStatement("select myfinalcost from traders_bid_price where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					finalcosts=rs.getString("myfinalcost");
					res[j]=Integer.parseInt(finalcosts);
					j++;					
				}
				for(int k=0;k<res.length;k++)
				{
					finalcost=finalcost+res[k];
				}
				System.out.println("finalcost= "+finalcost);
				System.out.println("total blocked amount= "+result);
				int diff=finalcost-result;
				System.out.println("finalcost-result"+diff);
				if(finalcost>result)
				{
					 diff=finalcost-result;
					System.out.println("difference between final cost and blocked amount is "+diff);					
					msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
					mc.setMsg(msg);
				}
				else
				{
					msg="success";
					mc.setMsg(msg);
				}									
			}						
			con.commit();		
		}
		catch(Exception e)
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
		return mc;		
		}
	}
	
	@SuppressWarnings({ "resource" })
	public Myclass2 orderstatus(String name, String pwd) 
	{
		System.out.println("inside Model()->.....orderstatus");
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		Myclass2 mc=new Myclass2();
		List<OrderStatusBean> al=new ArrayList<OrderStatusBean>();		
		setTradername(name);
		setTraderpwd(pwd);
		String volumes=null;
		String lotnum=null;
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{
			}
			else
			{
				ps =con.prepareStatement("select ar.lotnumber from auction_result ar where ar.tradername=?");//this checks whether the trader has won in auction by checking his name in auction result table
				ps.setString(1,name);
				ps.execute();
				rs = ps.getResultSet();
				if(rs.next())
				{	
					System.out.println("trader has won the auction for lot"+rs.getString("lotnumber"));
					ps =con.prepareStatement("select ar.lotnumber,ar.volumesold from auction_result ar where ar.tradername=?");//this checks whether the trader has won in auction by checking his name in auction result table
					ps.setString(1,name);
					ps.execute();
					rs = ps.getResultSet();
					while(rs.next())
					{				
						volumes=rs.getString("volumesold");
						lotnum=rs.getString("lotnumber");
						con.setAutoCommit(false);
						System.out.println("volume sold is "+volumes+" lotnums is "+lotnum);
					}	
					
					ps =con.prepareStatement("select tl.lotnum,tl.slotnumber,tl.marketcode,tl.produce,tl.qualitygrade,tl.quantityneeded from tradelist tl,treg tr where tl.aadharnumber=tr.aadharnumber and tr.name=? and tr.pass=? and tl.lotnum=? ");
					ps.setString(1, name);
					ps.setString(2, pwd);
					ps.setString(3, lotnum);
					ps.execute();
					rs = ps.getResultSet();
					OrderStatusBean osbn=null;
					while(rs.next())
					{
						osbn=new OrderStatusBean();
						osbn.setLotnum(rs.getString("lotnum"));
						osbn.setMarketcode(rs.getString("marketcode"));
						osbn.setProduce(rs.getString("produce"));
						osbn.setQualitygrade(rs.getString("qualitygrade"));
						osbn.setQuantityneeded(rs.getString("quantityneeded"));
						osbn.setSlotnumber(rs.getString("slotnumber"));
						//al.add(tlbn); 
						
						ps =con.prepareStatement("select tdp.bidprice,tdp.bestbid from traders_bid_price tdp, treg tr, tradelist tl where tdp.aadharnumber=tr.aadharnumber and tl.lotnum=tdp.lotnum and  tr.name=? and tr.pass=?");
						ps.setString(1, name);
						ps.setString(2, pwd);
						ps.execute();
						rs1 = ps.getResultSet();
						while(rs1.next())
						{
							String bidprices=rs1.getString("bidprice");
							int volume=Integer.parseInt(volumes);
							int bidprice=Integer.parseInt(bidprices);
							int lotcost=volume*bidprice;							
							System.out.println("int lotcost=volume*bidprice->"+lotcost);
							int commission = (int) (lotcost*0.05);
							int marketcess = 1*10;
							int myfinalcost=commission+marketcess+3000+lotcost;
							String myfinalcosts=String.valueOf(myfinalcost);
							System.out.println("int myfinalcost=commission+marketcess+3000+lotcost->"+commission+"+"+marketcess+"+"+3000+"+"+lotcost);
							String lotcosts=String.valueOf(lotcost);
							System.out.println("lotcosts-> "+lotcosts);
							osbn.setLotcost(lotcosts);
							osbn.setBestbid(rs1.getString("bestbid"));
							osbn.setBidprice(bidprices);
							osbn.setMyfinalcost(myfinalcosts);
							//osbn.setLotnum(rs.getString("lotnum"));
							//bl.add(mfcb1); 
						}		
						ps =con.prepareStatement("select ar.volumesold from auction_result ar where ar.tradername=? and ar.lotnumber=?");
						ps.setString(1, name);
						ps.setString(2,lotnum);
						ps.execute();
						rs2 = ps.getResultSet();
						while(rs2.next())
						{
							osbn.setVolumesold(rs2.getString("volumesold")); 
						}	
						osbn.setResult("LOT HAS BEEN ASSIGNED");
						osbn.setFarmeraccept("pending");
						System.out.println("inside model-> nside osbn is "+osbn);
						al.add(osbn);						
					}
					mc.setAl(al);
				}
				else
				{
					con.setAutoCommit(false);
					ps =con.prepareStatement("select tl.lotnum from tradelist tl,treg tr where tl.aadharnumber=tr.aadharnumber and tr.name=? and  tl.lotnum  NOT IN (select lotnumber from auction_result where tradername=?)");
					ps.setString(1, name);
					ps.setString(2, name);
					ps.execute();
					rs1 = ps.getResultSet();
					while(rs1.next())
					{							
						ps =con.prepareStatement("select tl.slotnumber,tl.marketcode,tl.produce,tl.qualitygrade,tl.quantityneeded from tradelist tl,treg tr where tl.aadharnumber=tr.aadharnumber and tr.name=? and tl.lotnum=? and tr.pass=?");
						ps.setString(1, name);
						ps.setString(2, rs1.getString("lotnum"));
						ps.setString(3, pwd);
						ps.execute();
						rs2 = ps.getResultSet();
						OrderStatusBean osbn1=null;
						while(rs2.next())
						{					
							osbn1=new OrderStatusBean();
							osbn1.setMarketcode(rs2.getString("marketcode"));
							osbn1.setProduce(rs2.getString("produce"));
							osbn1.setQualitygrade(rs2.getString("qualitygrade"));
							osbn1.setQuantityneeded(rs2.getString("quantityneeded"));
							osbn1.setSlotnumber(rs2.getString("slotnumber"));						
							
							ps =con.prepareStatement("select tdp.lotcost,tdp.lotnum,tdp.bidprice,tdp.bestbid,tdp.myfinalcost from traders_bid_price tdp, treg tr, tradelist tl where tr.aadharnumber=tl.aadharnumber and tr.aadharnumber=tdp.aadharnumber and tdp.lotnum=tl.lotnum and tr.name=? and tr.pass=? and tdp.lotnum=?");
							ps.setString(1, name);
							ps.setString(2, pwd);
							ps.setString(3, rs1.getString("lotnum"));
							ps.execute();
							rs3 = ps.getResultSet();
							while(rs3.next())
							{						
								osbn1.setLotcost(rs3.getString("lotcost"));
								osbn1.setBestbid(rs3.getString("bestbid"));
								osbn1.setBidprice(rs3.getString("bidprice"));
								osbn1.setMyfinalcost(rs3.getString("myfinalcost"));
								osbn1.setLotnum(rs3.getString("lotnum"));						
							}	
							osbn1.setVolumesold("0");
							osbn1.setResult("LOT HAS NOT BEEEN ASSIGNED");	
							osbn1.setFarmeraccept("pending");
							al.add(osbn1);
						}
					}
					System.out.println("inside model indide al is "+al);
					mc.setAl(al);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mc;
	}
	public void TraderProductReject()
	{
		setFarmeracceptresult("reject");
	}
	
	public void TraderProductAccept(String lotnum,String accno)
	{
		System.out.println("***********************************************");
		System.out.println("inside model->........farmer has accpeted the bid price for lot"+lotnum);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		String tradername=getTradername();
		String traderpwd=getTraderpwd();
		setFarmeracceptresult("accept");
		int blockamount[]=new int[1000];
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{
			}
			else
			{		
				ps =con.prepareStatement("select volumesold from auction_result where tradername=? and lotnumber=?");//this checks whether the trader has won in auction by checking his name in auction result table
				ps.setString(1,tradername);
				ps.setString(2, lotnum);
				ps.execute();
				rs = ps.getResultSet();
				if(rs.next())
				{	//now if he has won the auction select volume assigned to him and hs bid price 
					System.out.println("trader has won this lot");
					ps =con.prepareStatement("select ar.volumesold,tbp.bidprice from traders_bid_price tbp, auction_result ar,treg tr where tr.aadharnumber=tbp.aadharnumber and ar.tradername=tr.name and tr.name=? and tr.pass=?");
					ps.setString(1, tradername);
					ps.setString(2, traderpwd);
					ps.execute();
					rs2 = ps.getResultSet();
					while(rs2.next())
					{
						String volumesolds=rs2.getString("volumesold");
						String bidprice=rs2.getString("bidprice");
						int volumesold=Integer.parseInt(volumesolds);
						int bidprice1=Integer.parseInt(bidprice);
						int lotcost=volumesold*bidprice1;
						int commission = (int) (lotcost*0.05);
						int marketcess = 1*10;
						int myfinalcost=commission+marketcess+3000+lotcost;
						int block=0;
						ps =con.prepareStatement("select blockamount from traders_blocked_amount where tradername=?");
						ps.setString(2, tradername);
						ps.execute();
						rs3 = ps.getResultSet();
						int i=0;
						int result=0;
						while(rs3.next())
						{
							result= Integer.parseInt(rs3.getString("blockamount"));
						}						
						System.out.println("total blocked amount is "+result);
						block=result-myfinalcost;
						String bloc=String.valueOf(block);
						ps =con.prepareStatement("update traders_blocked_amount set blockamount=? where tradername=?");
						ps.setString(1,bloc );
						ps.setString(2, tradername);
						ps.execute();
						int fbalance=0;
						ps =con.prepareStatement("select balance from fbankaccount where accountnumber=?");
						ps.setString(1, accno);
						ps.execute();
						rs4 = ps.getResultSet();
						while(rs4.next())
						{
							fbalance=Integer.parseInt(rs.getString("balance"));
							System.out.println("balance available in farmer account is "+fbalance);
						}
						fbalance=fbalance+block;
						ps =con.prepareStatement("update fbankaccount set balance=? where accountnumber=?");
						ps.setString(1,String.valueOf(fbalance));
						ps.setString(2, accno);
						ps.execute();
						System.out.println("traders bid price is "+bidprice1+" his lot cost ="+bidprice1+" * "+volumesold+" his final cost is "+myfinalcost+" his blocked amount after deduction is "+bloc);
						System.out.println("farmers balance after accepting is "+fbalance);						
					}					
				}	
				else
				{
					
				}
}
}catch(Exception e)
		{
	e.printStackTrace();
}}

	public List<TradeSummaryBean> tradeSummary(String name, String pwd, String from, String to) {
		// TODO Auto-generated method stub2016-12-22   SELECT * FROM tradelist WHERE created_at > '2016-12-22' and created_at < '2016-12-27';
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<TradeSummaryBean> al=new ArrayList<TradeSummaryBean>();	
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{}
			else
			{		
				ps =con.prepareStatement("SELECT tl.lotnum,tl.quantity, tl.quantityneeded,tbp.bidprice,tbp.myfinalcost FROM traders_bid_price tbp,tradelist tl,treg tr where tr.name=? and `created_at` BETWEEN ? and ? and tr.pass=? and tr.aadharnumber=tl.aadharnumber and tl.aadharnumber=tbp.aadharnumber and tl.lotnum=tbp.lotnum;");
				ps.setString(1,name);
				ps.setString(2,from);
				ps.setString(3, to);
				ps.setString(4,pwd);
				ps.execute();
				rs = ps.getResultSet();
				TradeSummaryBean tsb=null;
				while(rs.next())
				{	
					tsb=new TradeSummaryBean();
					tsb.setBidprice(rs.getString("bidprice"));
					tsb.setLotnum(rs.getString("lotnum"));
					tsb.setMyfinalcost(rs.getString("myfinalcost"));
					tsb.setQuantity(rs.getString("quantity"));
					tsb.setQuantityneeded(rs.getString("quantityneeded"));
					
					ps =con.prepareStatement("SELECT ar.volumesold FROM auction_result ar where ar.tradername=? and ar.lotnumber=?");//this checks whether the trader has won in auction by checking his name in auction result table
					ps.setString(1,name);
					ps.setString(2,rs.getString("lotnum"));
					ps.execute();
					rs2 = ps.getResultSet();
					if(rs2.next())
					{
						tsb.setVolumesold(rs.getString("volumesold"));
						tsb.setResult("WON");
					}
					else
					{
						tsb.setVolumesold("--");
						tsb.setResult("LOST");
					}
					al.add(tsb);					
				}	
				return al;
			}
		}catch(Exception e)
		{
	e.printStackTrace();
	}
	return al;
}

	public List<FarmerHistoryBean> farmerHistory(String name,String pass,String from,String to){
		// TODO Auto-generated method stub2016-12-22   SELECT * FROM tradelist WHERE created_at > '2016-12-22' and created_at < '2016-12-27';
				PreparedStatement ps = null;
				Connection con = null;
				ResultSet rs = null;
				ResultSet rs2 = null;
				List<FarmerHistoryBean> al=new ArrayList<FarmerHistoryBean>();	
				String aadharnum="";
				try
				{
					con = JDBCHelper.getConnection();
					
					if(con == null)
					{
						
					}
					
					else
					{
						con.setAutoCommit(false);
						//aadharnum
						ps =con.prepareStatement("select aadharnum from freg where name = ?  and pass=? ");
						ps.setString(1, name);
						ps.setString(2, pass);
						
						ps.execute();
						rs = ps.getResultSet();
						
						while(rs.next())
						{
							aadharnum=rs.getString("aadharnum");
							
						}	
						
						//lotnumber
						String farmerid=aadharnum;
						System.out.println("in cs farmerid="+farmerid);
						
						//getsummary details
						ps = con.prepareStatement("select * from productentry where farmerid=?  " );
						ps.setString(1,farmerid);
						//ps.setString(2,from);
						//ps.setString(3,to);
						System.out.println(ps);
						System.out.println("Execute"+ps.executeQuery());
						rs=ps.getResultSet();
						System.out.println(rs+" "+ps.getResultSet());
						FarmerHistoryBean fhb=null;
						String deduction="";
						while(rs!=null&&rs.next())
						{
							System.out.println("inside while()->rs is "+rs);
							fhb=new FarmerHistoryBean();
							fhb.setLotnumber(rs.getString("lotnumber"));
							fhb.setQuantity(rs.getString("quantity"));
							fhb.setAverageprice(rs.getString("averageprice"));
							fhb.setDate(rs.getString("Date"));
							 deduction="null";
							fhb.setDeduction("deduction");
							fhb.setEarnings(rs.getString("myearnings"));
							fhb.setFinalprice(rs.getString("finalprice"));
							fhb.setKindofpro(rs.getString("kindofpro"));
							fhb.setQuantitybidfor(rs.getString("quantitybidfor"));
							fhb.setProduce(rs.getString("produce"));
							fhb.setSlotnumber(rs.getString("slotnumber"));
							al.add(fhb);
						}
					}
				}
				catch(Exception e)
				{
			e.printStackTrace();
			}
			return al;
		
	}
	public Myclass2 farmeracceptstatus(Myclass2 mc) 
	{
		@SuppressWarnings("rawtypes")
		List al=mc.getAl();
		OrderStatusBean osbn=null;	
		for(Object o:al)
		{
			osbn=(OrderStatusBean)o;
			if(osbn.getLotnum().equals(getLotnum()))
			{
			 if(farmeracceptresult!=null)
			 {
	           osbn.setFarmeraccept(farmeracceptresult); 
			 }
			 else
				 osbn.setFarmeraccept("pending");
			}			
		}
		return mc;
	}
	
	//If Farmer Accepts the lot. Changes to be made in product entry table
	public void employeeAcceptResult(String quantitybidfor, String lotnumber)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement ps= null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		FarmerHistoryBean fhb=new FarmerHistoryBean();
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established!");
			}
			else
			{
				con.setAutoCommit(false);
				
				ps=con.prepareStatement("insert into history values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?");
				rs=ps.executeQuery();
				while(rs.next()){
					ps.setString(1,fhb.getFarmerid());
					ps.setString(2,fhb.getLotnumber());
					ps.setString(3,fhb.getMarketcode());
					ps.setString(4,fhb.getKindofpro());
					ps.setString(5,fhb.getProduce());
					ps.setString(6,fhb.getGrade());
					ps.setString(7,fhb.getQuantity());
					ps.setString(8,fhb.getPhoto());
					ps.setString(9,fhb.getDate());
					ps.setString(10,fhb.getTime());
					ps.setString(11,fhb.getSlotnumber());
					ps.setString(12,fhb.getAverageprice());
					ps.setString(13,fhb.getQuantitybidfor());
					ps.setString(14,fhb.getFinalprice());
					ps.setString(15,fhb.getStatus());
					ps.setString(16,fhb.getEarnings());
					ps.execute();
				}
				
				
				String quantity = "";
				int quantitynew = 0;
				String slotnumber = "";
				
				String sql = "SELECT * FROM productentry WHERE lotnumber = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, lotnumber);
				rs1 = pstmt.executeQuery();
				if(rs.next())
				{
					
					quantity = rs1.getString("quantity");
					slotnumber = rs1.getString("slotnumber");
				}
				quantitynew = (int) (Double.parseDouble(quantity) - Double.parseDouble(quantitybidfor));
				
				if(quantity.equals(quantitybidfor))
				{
					String sql1 = "DELETE FROM productentry WHERE lotnumber = ?";
					pstmt1 = con.prepareStatement(sql1);
					pstmt1.setString(1, lotnumber);
					System.out.println("Lot has completely accepted. Entry will be removed: "+pstmt1.execute());
				}
				else
				{
					if(slotnumber.equals("slot1"))
					{
						slotnumber = "slot2";
					}
					else if(slotnumber.equals("slot2"))
					{
						slotnumber = "slot3";
					}
					else if(slotnumber.equals("slot3"))
					{
						slotnumber = "slot4";
					}
					else
					{
						slotnumber = "No slots available. Please try tomorrow";
					}
					
					
					String sql2 = "UPDATE productentry SET quantity = ?, slotnumber = ?, averageprice = '0', quantitybidfor = '0' WHERE lotnumber = ?";
					pstmt1 = con.prepareStatement(sql2);
					pstmt1.setInt(1, quantitynew);
					pstmt1.setString(2, slotnumber);
					pstmt1.setString(3, lotnumber);
					pstmt1.executeUpdate();
					System.out.println("Lot has partially accepted. Entry added for next slot.");
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
			JDBCHelper.Close(rs1);
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(pstmt1);
			JDBCHelper.Close(con);
		}
	}
	
	//If Farmer Rejects the lot. Changes to be made in product entry table
	public void employeeRejectResult(String lotnumber)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				System.out.println("Connection not established!");
			}
			else
			{
				con.setAutoCommit(false);
				
				String slotnumber = "";
				String sql = "SELECT * FROM productentry WHERE lotnumber = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, lotnumber);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					slotnumber = rs.getString("slotnumber");
				}
				
				if(slotnumber.equals("slot1"))
				{
					slotnumber = "slot2";
				}
				else if(slotnumber.equals("slot2"))
				{
					slotnumber = "slot3";
				}
				else if(slotnumber.equals("slot3"))
				{
					slotnumber = "slot4";
				}
				else
				{
					slotnumber = "No slots available. Please try tomorrow";
				}
				
				String sql2 = "UPDATE productentry SET slotnumber = ?, averageprice = '0', quantitybidfor = '0' WHERE lotnumber = ?";
				pstmt1 = con.prepareStatement(sql2);
				pstmt1.setString(1, slotnumber);
				pstmt1.setString(2, lotnumber);
				pstmt1.executeUpdate();
				System.out.println("Lot has not accepted. Entry added for next slot.");
				
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
			JDBCHelper.Close(pstmt1);
			JDBCHelper.Close(con);
		}
	}
}