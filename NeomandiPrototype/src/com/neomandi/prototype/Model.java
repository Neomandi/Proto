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
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

public class Model 
{
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


	@SuppressWarnings("resource")
	public String employeeRegister(EmployeeRegisterBean erb) {
		// 
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
				
				ps = con.prepareStatement("select empnumber from ereg where empnumber = ? ");
				ps.setString(1, erb.getEmployeenum());
				ps.execute();
				rs = ps.getResultSet();
				if(!rs.next())
				{
					con.setAutoCommit(false);
					System.out.println("bean "+erb.getEmployeename()+" empnumber "+erb.getEmployeenum());
					ps = con.prepareStatement("insert into ereg values(?,?,?)");
					ps.setString(1, erb.getEmployeename());
					ps.setString(2, erb.getEmployeepwd());
					ps.setString(3, erb.getEmployeenum());
					
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
				// 
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
	public String farmerRegister(FarmerRegisterBean frb) {
		// 
		
		String msg = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs=null;
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
				ps = con.prepareStatement("select aadharnum from freg where aadharnum=?");
				ps.setLong(1, frb.getFarmeraadharnum());
				ps.executeQuery();				
				rs = ps.getResultSet();				
				if(!rs.next())
				
				{
					ps = con.prepareStatement("insert into freg(name,mobile,aadharnum,email,state,district,taluk,hobli,village,bankname,accountnum,branch,ifsccode,pass,pin,address) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");	
					ps.setString(1, frb.getFarmername());
					ps.setLong(2, frb.getFarmermobile());
					ps.setLong(3, frb.getFarmeraadharnum());
					ps.setString(4,frb.getFarmeremail());
					ps.setString(5,frb.getFarmerstate());
					ps.setString(6, frb.getFarmerdistrict());
					ps.setString(7, frb.getFarmertaluk());
					ps.setString(8, frb.getFarmerhobli());
					ps.setString(9, frb.getFarmervillage());
					ps.setString(10, frb.getFarmerbankname());
					ps.setLong(11, frb.getFarmeraccountnum());
					ps.setString(12, frb.getFarmerbranch());
					ps.setString(13, frb.getFarmerifsccode());
					ps.setString(14,frb.getPassword());
					ps.setString(15, frb.getPin());
					ps.setString(16, frb.getAddress());
					//ps.setBlob(15, frb.getFarmerPhoto());
					ps.execute();				
					msg = "SUCCESS";				
					con.commit();
				}
				else{
					
						msg="You are already Registered please try to Login";
					
					
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
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
				
				ps = con.prepareStatement("select pass,empnumber from ereg where name = ?");
				ps.setString(1, elbn.getEname());
				//System.out.println(ps);
				ps.executeQuery();
				
				rs = ps.getResultSet();
				
				if(rs.next())
				{
					String npwd = rs.getString("pass");
					String empnumber = rs.getString("empnumber");
					if(npwd.equals(elbn.getEpwd()))
						msg = msg + "SUCCESS" + ":"+ empnumber;
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
					msg = msg + "Username does not exist. Please register to login.";
				
				con.commit();
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
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
	public String traderRegister(TraderRegisterBean trb) {
		System.out.println("in tradeRegister()");
		String msg ="";
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
				

				ps = con.prepareStatement("select aadharnumber from treg where aadharnumber = ? ");
				ps.setLong(1, trb.getTraderAadharnum());
				ps.execute();
				rs = ps.getResultSet();
				if(!rs.next()){
				con.setAutoCommit(false);
				ps = con.prepareStatement("insert into treg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, trb.getTraderName());
				ps.setLong(2, trb.getTraderMobile());
				ps.setLong(3, trb.getTraderAadharnum());
				ps.setString(4, trb.getTraderEmail());
				ps.setString(5, trb.getTraderState());
				ps.setString(6, trb.getTraderDistrict());
				ps.setString(7, trb.getTraderTaluk());
				
				ps.setString(8, trb.getTraderBankName());
				ps.setLong(9, trb.getTraderAccountNum());
				ps.setString(10, trb.getTraderBranch());
				ps.setString(11, trb.getTraderIfscCode());
				
				ps.setString(12, trb.getTraderLicenseNum());
				ps.setString(13, trb.getTraderPassword());
				ps.setBlob(14, trb.getTraderPhoto());
				ps.setString(15, trb.getTraderDateOfRegistration());
				ps.setString(16, trb.getTraderPlaceOfRegistration());
				ps.setString(17, trb.getTraderAddress());
				ps.setString(18, trb.getTraderLicenseState());
				ps.setString(19, trb.getTraderLiscenseDistrict());
				ps.setString(20, trb.getTraderLicenseTaluk());
				ps.setString(21, trb.getTraderLicensePin());
				ps.setString(22,trb.getLaddress());
				ps.setString(23, trb.getPin());
				ps.execute();				
				msg = "SUCCESS";
				con.commit();
				}
				else{					
						msg =  "Already Registered. Please try to login.";
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
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
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		//System.out.println("trader name is "+tlbn.getTname());
		//System.out.println("trader password is "+tlbn.getTpwd());
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
				con.setAutoCommit(false);
				ps = con.prepareStatement("select pass from treg where name = ?");
				ps.setString(1, name);				
				ps.executeQuery();				
				rs = ps.getResultSet();				
				if(rs.next())
				{
					//System.out.println(" trader is registered ");
					String npwd = rs.getString("pass");
					if(npwd.equals(pwd))
						msg = msg + "SUCCESS";
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
				{
					//System.out.println(" trader has not registered ");				
					msg = msg + "Register first and then login.";
				}				
				con.commit();
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
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
	
	//Farmer Login
	public String farmerLogin(String name,String pass) 
	{		
		String msg = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
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
				ps.setString(1, name);				
				ps.executeQuery();				
				rs = ps.getResultSet();				
				if(rs.next())
				{
					String npwd = rs.getString("pass");
					if(npwd.equals(pass))
						msg = msg + "SUCCESS";
					else
						msg = msg + "Your password does not match. Please provide correct password.";
				}
				else
					msg = msg + "Username does not exist. Please register to login.";				
				con.commit();
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
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
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List farmerMaster(String farmerid){
		System.out.println("farmerid="+farmerid);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		
		List l=new ArrayList();
		try
		{
			con = JDBCHelper.getConnection();
			
			if(con == null)
			{
				
			}
			else{	
			
			ps = con.prepareStatement( "select lotnumber,quantity,averageprice,quantitybidfor from productentry where farmerid=?");
			ps.setString(1,farmerid);
		//	String sql = "select lotnumber,quantity,averageprice,quantitybidfor from productentry where farmerid=?";
			//System.out.println(sql);
			ps.execute();
			rs = ps.getResultSet();
			
			while(rs!=null&&rs.next()){
				String lotnumber=rs.getString("lotnumber");
				String quantity=rs.getString("quantity");
				String averageprice=rs.getString("averageprice");
				String quantitybidfor=rs.getString("quantitybidfor");
				if(averageprice!=null){
					averageprice=averageprice;
					
				}
				else{
					averageprice="0";
				}
				if(quantitybidfor!=null){
					quantitybidfor=quantitybidfor;
					
				}
				else{
					quantitybidfor="0";
				}
				l.add(lotnumber);
				l.add(averageprice);
				l.add(quantity);
				l.add(quantitybidfor);
				
				
			}
			 
		}
	}
		catch(SQLException e)
		{
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// 
				e1.printStackTrace();
			}
		}
		finally
		{
			
			JDBCHelper.Close(con);
			JDBCHelper.Close(ps);
		}
		return l;
	}
	
	//farmer trade summary	
	@SuppressWarnings({ "resource" })
	public SummaryBean getSummary(String name, String pass,SummaryBean sb)
	{
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		
		String aadhar="";
		String account="";
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
					 sb.setAadhar(aadhar);
					 sb.setSlot(rs.getString("slotnumber"));
					 System.out.println(" adhar="+sb.getAadhar()+"lotnumber="+sb.getLotnumber()+",lotsize="+sb.getLotsize()+",quantitysold="+sb.getQuantitysold()+",finalprice="+sb.getFinalprice());
				}
				//sb.setAccountnum(account);
				System.out.println("in model bean="+sb);
				averageprice=sb.getAverageprice();
				
				quantitysold=sb.getQuantitysold();
				if(averageprice!=null){
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
				}
				else{
					averageprice="--";
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
				// 
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
		List<ProductSearchResultBean> l = new ArrayList<>();
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
				String kproduce = psb.getCategory();
				kproduce=kproduce.trim();
				String produce = psb.getProduce();
				String quality = psb.getGrade();
				String slot=psb.getSlot();
			//	System.out.println("produce "+produce+" quality"+quality+" slot"+slot+"kproduce+"+kproduce);					
				if(kproduce.equals("Category"))
				{			
				//	System.out.println("inside if()->slot is "+slot);
					if(slot!=null&&slot.equals("slot3"))
						slot=null;
					pstmt = con.prepareStatement("SELECT lotnumber,slotnumber, marketcode, produce, qualitygrade, quantity,photo FROM productentry WHERE slotnumber=?");
					//System.out.println(pstmt);
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
						psrb.setPhoto(rs.getString("photo"));
					//	System.out.println("in model photo="+rs.getString("photo"));
						l.add(psrb);	
						//System.out.println("inside ProductSearchResultBean"+psrb);
					}
					System.out.println(l); 
					return l;
				}
				else if(slot.equals("base")&&quality.equals("base"))
				{
					//if(kproduce.equals("Vegetables"))
					  //kproduce="Vegetable";
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity,photo FROM productentry WHERE kindofpro = ? and produce = ?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, produce);					
					rs = pstmt.executeQuery();
					System.out.println(pstmt);
					ProductSearchResultBean psrb = null;
					while(rs.next())
					{
						psrb = new ProductSearchResultBean();
						psrb.setLotnumber(rs.getString("lotnumber"));
						psrb.setMarketcode(rs.getString("marketcode"));
						psrb.setProduce(rs.getString("produce"));
						psrb.setQualitygrade(rs.getString("qualitygrade"));
						psrb.setQuantity(rs.getString("quantity"));
						psrb.setPhoto(rs.getString("photo"));
				//		System.out.println("in model photo="+rs.getString("photo"));
						l.add(psrb);	
					}
					System.out.println("list is "+l);
					return l;
				}
				else if(slot.equals("base")&&(!quality.equals("base")))
				{
					System.out.println("slot= base quality!=base");
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode, produce, qualitygrade, quantity,photo FROM productentry WHERE kindofpro = ? and qualitygrade=? and produce = ?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, quality);
					pstmt.setString(3, produce);					
					rs = pstmt.executeQuery();
					ProductSearchResultBean psrb = null;
					System.out.println(pstmt);
					while(rs.next())
					{
						psrb = new ProductSearchResultBean();
						psrb.setLotnumber(rs.getString("lotnumber"));
						psrb.setMarketcode(rs.getString("marketcode"));
						psrb.setProduce(rs.getString("produce"));
						psrb.setQualitygrade(rs.getString("qualitygrade"));
						psrb.setQuantity(rs.getString("quantity"));
						psrb.setPhoto(rs.getString("photo"));
						//System.out.println("in model photo="+rs.getString("photo"));
						l.add(psrb);	
					}
					System.out.println(l);
					return l;
				}
				else
				{
					
					pstmt = con.prepareStatement("SELECT lotnumber, marketcode,slotnumber, produce, qualitygrade, quantity,photo FROM productentry WHERE kindofpro = ? and qualitygrade=? and produce = ? and slotnumber=?");
					pstmt.setString(1, kproduce);
					pstmt.setString(2, quality);
					pstmt.setString(3, produce);	
					pstmt.setString(4, slot);	
					rs = pstmt.executeQuery();
					ProductSearchResultBean psrb = null;
					System.out.println(pstmt);
					while(rs.next())
					{
						psrb = new ProductSearchResultBean();
						psrb.setLotnumber(rs.getString("lotnumber"));
						psrb.setMarketcode(rs.getString("marketcode"));
						psrb.setProduce(rs.getString("produce"));
						psrb.setQualitygrade(rs.getString("qualitygrade"));
						psrb.setQuantity(rs.getString("quantity"));
						psrb.setPhoto(rs.getString("photo"));
						psrb.setSlotnumber(slot);
				//		System.out.println("in model photo="+rs.getString("photo"));
						l.add(psrb);	
						//System.out.println(l);
					}
				//	System.out.println(l);
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
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(con);
		}
		return l;
	}

	//Product Entry
	public String productEntry(ProductEntryBean peb)
	{	
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
				
				
				ps = con.prepareStatement("insert into productentry(farmerid,lotnumber,marketcode,kindofpro,produce,qualitygrade,quantity,photo,Date,Time,slotnumber,averageprice,quantitybidfor) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, peb.getFarmerid());
				ps.setString(2, peb.getlotnumber());
				ps.setString(3, peb.getMarketcode());
				ps.setString(4, peb.getKproduce());
				ps.setString(5, peb.getProduce());
				ps.setString(6, peb.getQuality());
				ps.setString(7, peb.getQuantity());
				ps.setString(8, peb.getPhoto());
				
				SimpleDateFormat df=new SimpleDateFormat("MM/dd/yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss.SSS");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				
				try 
				{
					slot = TimeSlots.time(date+" "+date2);
					System.out.println(slot);
				} catch (ParseException e) {
					// 
					e.printStackTrace();
				}
				
				ps.setString(9, date);
				ps.setString(10, date2);
				ps.setString(11, "slot1");
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
				Calendar calendar = Calendar.getInstance();
		        TimeZone fromTimeZone = calendar.getTimeZone();
		        TimeZone toTimeZone = TimeZone.getTimeZone("MST");

		        calendar.setTimeZone(fromTimeZone);
		        calendar.add(Calendar.MILLISECOND, fromTimeZone.getRawOffset() * -1);
		        if (fromTimeZone.inDaylightTime(calendar.getTime())) {
		            calendar.add(Calendar.MILLISECOND, calendar.getTimeZone().getDSTSavings() * -1);
		        }

		        calendar.add(Calendar.MILLISECOND, toTimeZone.getRawOffset());
		        if (toTimeZone.inDaylightTime(calendar.getTime())) 
		        {
		            calendar.add(Calendar.MILLISECOND, toTimeZone.getDSTSavings());
		        }
		        System.out.println("************"+calendar.getTime());
		        
				
				con.setAutoCommit(false);
		//		System.out.println("traders name and password has been saved in setters in model as "+tlbn.getTname()+" and "+tlbn.getTpwd());
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
				}			
				String lot[]=new String[100];
				int i=0;
				ps = con.prepareStatement("select lotnum from tradelist where aadharnumber=?");
				ps.setString(1,aadharnumber);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					lot[i]=rs.getString("lotnum");
					i++;
				}
				if(Arrays.asList(lot).contains(lotnum))
				{					
						lot[i]=lotnum;
						i++;			
						ps = con.prepareStatement("select quantityneeded from tradelist where aadharnumber=? and lotnum=?");
						ps.setString(1,aadharnumber);
						ps.setString(2,lotnum);
						ps.execute();
						rs = ps.getResultSet();
						while(rs.next())
						{
							return "fail"+rs.getString("quantityneeded");	
						}						
				}
				else
				{					
					//	System.out.println("inserting into tradelist values are "+lotnum+" "+marketcode+" "+produce+" "+slotnumber+" "+quantityneeded);
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
					//System.out.println("values inserted into traders_bid_price is lotnum"+lotnum+" aadharnumber "+aadharnumber+"bidprice,lotcost,commission,marketcess,myfinalcost as 0	0	0	0	0 "+sdf.format(new Date()));
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
	
    //the ver first time when trader clicks on hold funds ths page pop ups
	@SuppressWarnings("resource")
	public TraderBlockBean traderBlockBank(String name,String pwd) 
	{
		//System.out.println("inside model-> traderBlockBank()->..trader name is "+name+" pwd is "+pwd);
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
				ps =con.prepareStatement("select tb.bankname,tb.ifsc,tr.branch,tb.accountnumber from tbankaccount tb,treg tr where tr.aadharnumber =tb.aadharnumber and tb.aadharnumber= ?");
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
				//	tbb.setBalance(rs.getInt("balance"));
					tbb.setBranch(rs.getString("branch"));
					tbb.setMsg("SUCCESS");
				//	System.out.println("total balance amount is "+rs.getInt("balance"));		
			    }	
				int blockamount=0;
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
				
				con = JDBCHelper.getConnection();				
				ps =con.prepareStatement("select blockamount from traders_blocked_amount where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				System.out.println(ps);
				while(rs.next())
				{
					blockamount=rs.getInt("blockamount");
				}				
				System.out.println("total blocked amount is "+blockamount);
				tbb.setBlock(blockamount);
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
		//System.out.println("inside model-> traderBlockamount()->..bankname is"+bankname+" trader name is "+name+" pwd is "+pwd);
		PreparedStatement ps = null;	
		PreparedStatement ps1 = null;	
		PreparedStatement ps2= null;	
		PreparedStatement ps3 = null;	
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
				//con.setAutoCommit(false);	
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
				ps =con.prepareStatement("select ifsc,balance from tbankaccount where aadharnumber = ? ");
				ps.setString(1, aadharnumber);								

				ps.execute();								
				rs = ps.getResultSet();				
				while(rs.next())				
				{					
					balance=rs.getInt("balance");				
				}				
							System.out.println("old balance "+balance);
							
				balance=balance-block;					
				System.out.println("new balance "+balance);
				System.out.println("amount to be blocked is "+block);
				if(balance<0)								
				{									
					balance=balance+block;									
					msg[0]="you dont have sufficient amount to block money..you can block max "+balance+" please enter valid amount";									
					msg[1]=null;								
				}								
				else								
				{		
					ps1 =con.prepareStatement("SELECT tradername FROM traders_blocked_amount where tradername=?");
					ps1.setString(1, name);									
					ps1.execute();									
					rs = ps1.getResultSet();		
					if(rs.next())
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
						System.out.println("old balance          = "+balance);
						System.out.println("amount to be blocked = "+block);
						System.out.println("old blocked amount   = "+blockamount);						
						blockamount=blockamount+block;			
						System.out.println("total blocked amount = "+blockamount);
						String blockamounts=String.valueOf(blockamount);	
						msg[1]=blockamounts;
											
						JDBCHelper.Close(ps);
						JDBCHelper.Close(con);
						
						con = JDBCHelper.getConnection();
						ps2 =con.prepareStatement("update traders_blocked_amount set blockamount=? where aadharnumber=?");											
						ps2.setString(1, blockamounts);											
						ps2.setString(2, aadharnumber);												
						ps2.execute();
						System.out.println(ps2);
						JDBCHelper.Close(ps);
						JDBCHelper.Close(con);
						
						con = JDBCHelper.getConnection();
						ps3 =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where tradername=?");												
						ps3.setString(1, name);												
						ps3.execute();												
							rs = ps3.getResultSet();											
						while(rs.next())													
							blockamount=rs.getInt("blockamount");													
						System.out.println("after updating traders account, total blocked amount is "+blockamount);
					}
					else
					{
						ps =con.prepareStatement("insert into traders_blocked_amount(tradername,aadharnumber,blockamount,bankname,balance) values(?,?,?,?,?)");
						ps.setString(1, name);
						ps.setString(2, aadharnumber);
						ps.setString(3,String.valueOf(block));
						ps.setString(4,bankname);						
						ps.setString(5,String.valueOf(balance));						
						ps.execute();
						System.out.println(ps);	
						msg[0]=String.valueOf(balance);
						msg[1]=String.valueOf(block);
						
						ps =con.prepareStatement("update tbankaccount set balance =? where  aadharnumber= ?");									
						ps.setInt(1, balance);										
						ps.setString(2, aadharnumber);
						ps.execute();
					}							
			}								
			//con.commit();						
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
	

@SuppressWarnings("resource")
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
					//System.out.println("aadharnumber of "+name+" is "+aadharnumber);
				}			
				List<String> lotnumber=new ArrayList<String>();
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
					lotnumber.add(rs.getString("lotnum"));
				//	System.out.println("produce that trader "+name+" is bidding for "+rs.getString("lotnum")+" "+rs.getString("produce")+" for quanity "+rs.getString("quantityneeded"));
				}
				mc.setAl(al);	
				System.out.println("model "+mc.getAl()+lotnumber.size());
				for(int i=0;i<lotnumber.size();i++)
				{
					int lotcost=0;
					int commission=0;
					int marketcess=0;
					int myfinalcost=0;
				
					int quantityneeded=06;
					PreparedStatement ps2 = con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
					ps2.setString(1, aadharnumber);
					ps2.setString(2, lotnumber.get(i));
					System.out.println(ps2);
					ps2.execute();
					ResultSet rs1=ps2.getResultSet();
					while(rs1.next())
					{
						quantityneeded=rs1.getInt("quantityneeded");
						System.out.println("quantity needed "+rs1.getInt("quantityneeded"));
					}
					
					ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
					ps.setString(1, aadharnumber);
					ps.setString(2, lotnumber.get(i));
					ps.execute();
					rs = ps.getResultSet();	
					int bidprice=0;
					int quantityassigned=0;
					while(rs.next())
					{
						quantityassigned=Integer.parseInt(rs.getString("quantityassigned"));
						bidprice=Integer.parseInt(rs.getString("bidprice"));
						//lotcost=bidprice*quantityassigned; ****** I HAVE CHANGED LOTCOST ****
						lotcost=bidprice*quantityassigned;
						commission=(int)(lotcost*0.05);
						marketcess=(int)(lotcost*0.01);
						if(quantityassigned==0)
							myfinalcost=0;
						else
							myfinalcost=100+lotcost+commission+marketcess+3000;
					}
					System.out.println("lotcost "+lotcost);
					System.out.println("myfinalcost "+myfinalcost+" quantityneeded"+quantityneeded);
					int block=0;
					ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
					ps.setString(1, aadharnumber);
					ps.execute();
					//System.out.println(ps);
					rs = ps.getResultSet();
					while(rs.next())
					{
						block=Integer.parseInt(rs.getString("blockamount"));
					}					
					/*String time1 = "16:00:00";
					String time2 = "19:00:00";					
					SimpleDateFormat format= new SimpleDateFormat("HH:mm:ss");
					Date date = new Date();
					Date date1=format1.parse((String)context.getAttribute("starttime"));
					Date date2 = format.parse(time2);
					long difference = date2.getTime() - date1.getTime(); */
					
					  //********THIS IS NEW CODE*******
			        int lotcost2=0;
			        int finalcost2=0;
			        int commission2=0;
			        int marketcess2=0;
			        lotcost2=bidprice*quantityneeded;
					commission2 = (int) (lotcost2*0.05);
					marketcess2 =(int) (lotcost2*0.01);
					finalcost2 = lotcost2 +commission2 +marketcess2 + 3000+100;
					//************END OF NEW CODE****
					System.out.println("lotcost2 "+lotcost2);
					System.out.println("bidprice "+bidprice);
					System.out.println("myfinalcost2 "+finalcost2);
					System.out.println(myfinalcost>block);
					if(finalcost2>block)
					{
						ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
						ps.setString(1, aadharnumber);
						ps.setString(2, lotnumber.get(i));
						ps.execute();
						ResultSet rs3 = ps.getResultSet();				
						while(rs3.next())
						{
							mfcb=new MyFinalCostBean();
							mfcb.setCommission(String.valueOf(commission));
							mfcb.setLotcost(String.valueOf(lotcost));
							mfcb.setMarketcess(String.valueOf(marketcess));
							mfcb.setMyfinalcost(String.valueOf(myfinalcost));
							String prices=String.valueOf(bidprice);
							mfcb.setPrice(prices);
							mfcb.setLotnum(lotnumber.get(i));			
							mfcb.setBestbid(rs3.getString("bestbid"));
							mfcb.setQuantityassigned(String.valueOf(quantityassigned));
							mfcb.setMsg("block");							
							bl.add(mfcb);
							System.out.println("bl is "+bl);
						}
						mc.setBl(bl);
						return mc;
					}
					else
					{
						ps=con.prepareStatement("update traders_bid_price set lotcost=?,commission=?,marketcess=?,myfinalcost=? where aadharnumber=? and lotnum=?" );
						ps.setString(1,String.valueOf(lotcost));
						ps.setString(2,String.valueOf(commission));
						ps.setString(3,String.valueOf(marketcess));
						ps.setString(4,String.valueOf(myfinalcost));
						ps.setString(5,String.valueOf(aadharnumber));
						ps.setString(6,lotnumber.get(i));
						ps.execute();
						
						ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
						ps.setString(1, aadharnumber);
						ps.setString(2, lotnumber.get(i));
						ps.execute();
						ResultSet rs3 = ps.getResultSet();				
						while(rs3.next())
						{
							mfcb=new MyFinalCostBean();
							mfcb.setCommission(String.valueOf(commission));
							mfcb.setLotcost(String.valueOf(lotcost));
							mfcb.setMarketcess(String.valueOf(marketcess));
							mfcb.setMyfinalcost(String.valueOf(myfinalcost));
							int price=rs3.getInt("bidprice");
							String prices=String.valueOf(price);
							mfcb.setPrice(prices);
							mfcb.setLotnum(rs3.getString("lotnum"));
							if(rs3.getString("bestbid")==null)
								mfcb.setBestbid("-");
							else							
								mfcb.setBestbid(rs3.getString("bestbid"));
							mfcb.setQuantityassigned(rs3.getString("quantityassigned"));
						//	System.out.println("inside model lotnumber is"+mfcb.getLotnum()+"lotcost is"+mfcb.getLotcost());
							bl.add(mfcb);
						}//System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
							mc.setBl(bl);
					}
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
				// 
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
public MyFinalCostBean tradeOrAuction1(String name, String pwd) 
{
	PreparedStatement ps = null;
	Connection con = null;
	ResultSet rs = null;
	String aadharnumber="";
	MyFinalCostBean mfcb=null;
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
				//System.out.println("aadharnumber of "+name+" is "+aadharnumber);
			}		
			String lotnum=null;
			ps =con.prepareStatement("SELECT lotnum FROM tradelist where aadharnumber=?");
			ps.setString(1, aadharnumber);
			ps.execute();
			rs = ps.getResultSet();				
			
			while(rs.next())
			{		
				/*
				tlb=new TradeListBean();
				tlb.setLotnum(rs.getString("lotnum"));
				tlb.setMarketcode(rs.getString("marketcode"));
				tlb.setProduce(rs.getString("produce"));
				tlb.setQualitygrade(rs.getString("qualitygrade"));
				tlb.setQuantity(rs.getInt("quantity"));		
				tlb.setSlotnumber(rs.getString("slotnumber"));
				tlb.setQuantityneeded(rs.getString("quantityneeded"));
				al.add(tlb);
				lotnumber.add(rs.getString("lotnum"));
				System.out.println("produce that trader "+name+" is bidding for "+rs.getString("lotnum")+" "+rs.getString("produce")+" for quanity "+rs.getString("quantityneeded"));
			*/
				lotnum=rs.getString("lotnum");
			}	
			
			int quantityneeded=0;
			ps =con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
			ps.setString(1, aadharnumber);
			ps.setString(2, lotnum);
		//	System.out.println(lotnumber.get(i));
			ps.execute();
			while(rs.next())
			{
				quantityneeded=rs.getInt("quantityneeded");
			}			
			
			int lotcost=0;
			int commission=0;
			int marketcess=0;
			int myfinalcost=0;
			int quantityassigned=0;
			int bidprice=0;
			
			//System.out.println("lotnum which trader is bidding for is "+lotnum);
			ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
			ps.setString(1, aadharnumber);
			ps.setString(2, lotnum);
			ps.execute();
		//	System.out.println(ps);
			rs = ps.getResultSet();
			while(rs.next())
			{				
					 quantityassigned=Integer.parseInt(rs.getString("quantityassigned"));
					 bidprice=Integer.parseInt(rs.getString("bidprice"));
					lotcost=bidprice*quantityassigned;
					commission=(int)(lotcost*0.05);
					marketcess=(int)(lotcost*0.01);
					if(quantityassigned==0)
						myfinalcost=0;
					else
						myfinalcost=100+lotcost+commission+marketcess+3000;
					
			}
			int block=0;
			ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
			ps.setString(1, aadharnumber);
			ps.execute();
			//System.out.println(ps);
			rs = ps.getResultSet();
			while(rs.next())
			{
				block=Integer.parseInt(rs.getString("blockamount"));
			}
			//********THIS IS NEW CODE*******
	        int lotcost2=0;
	        int finalcost2=0;
	        int commission2=0;
	        int marketcess2=0;
	        lotcost2=bidprice*quantityneeded;
			commission2 = (int) (lotcost2*0.05);
			marketcess2 =(int) (lotcost2*0.01);
			if(bidprice==0)
				finalcost2=0;
			else
				finalcost2 = lotcost2 +commission2 +marketcess2 + 3000+100;
			//************END OF NEW CODE****
			
			if(finalcost2>block)
			{
				mfcb=new MyFinalCostBean();				
				mfcb.setMsg("block");
				return mfcb;
			}
			else
			{
				ps=con.prepareStatement("update traders_bid_price set lotcost=?,commission=?,marketcess=?,myfinalcost=? where aadharnumber=? and lotnum=?" );
				ps.setString(1,String.valueOf(lotcost));
				ps.setString(2,String.valueOf(commission));
				ps.setString(3,String.valueOf(marketcess));
				ps.setString(4,String.valueOf(myfinalcost));
				ps.setString(5,String.valueOf(aadharnumber));
				ps.setString(6,lotnum);
				ps.execute();
				
				ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnum);
				ps.execute();
				ResultSet rs3 = ps.getResultSet();	
				
				while(rs3.next())
				{
					int price=rs3.getInt("bidprice");
					String prices=String.valueOf(price);					
					mfcb=new MyFinalCostBean();
					mfcb.setCommission(String.valueOf(commission));
					mfcb.setLotcost(String.valueOf(lotcost));
					mfcb.setMarketcess(String.valueOf(marketcess));
					mfcb.setMyfinalcost(String.valueOf(myfinalcost));					
					mfcb.setPrice(prices);
					mfcb.setLotnum(rs3.getString("lotnum"));
					mfcb.setQuantityassigned(String.valueOf(quantityassigned));
					
					lotcost=Integer.parseInt(String.valueOf(lotcost));
					commission=Integer.parseInt(String.valueOf(commission));
					marketcess=Integer.parseInt(String.valueOf(marketcess));
					myfinalcost=Integer.parseInt(String.valueOf(myfinalcost));
					
					String bestbid=null;
					if(rs3.getString("bestbid")==null)
					{
						 bestbid = "-";
					}
					else							
						bestbid=rs3.getString("bestbid");
					mfcb.setQuantityassigned(rs3.getString("quantityassigned"));
					mfcb.setBestbid(bestbid);
				}
			}		
		}
		con.commit();		
		return mfcb;
	}
	catch(SQLException e)
	{
		e.printStackTrace();
		
		try 
		{
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
	return null;
}

	@SuppressWarnings({ "resource" })
	public Mynewclass removeLotNumber(String lotnumber, String name, String pwd) 
	{
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		TradeListBean tlb=null;
		List<TradeListBean> al=new ArrayList<TradeListBean>();		
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
				mc.setAl(al);
				int lotcost=0;
				int commission=0;
				int marketcess=0;
				int myfinalcost=0;
				ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					int quantityassigned=Integer.parseInt(rs.getString("quantityassigned"));
					int bidprice=Integer.parseInt(rs.getString("bidprice"));
					lotcost=bidprice*quantityassigned;
					commission=(int)(lotcost*0.05);
					marketcess=(int)(lotcost*0.01);
					if(quantityassigned==0)
						myfinalcost=100;
					else
						myfinalcost=100+lotcost+commission+marketcess+3000;
					System.out.println("commission                     = "+commission);
					System.out.println("marketcess                     = "+marketcess);
					System.out.println("quantityassigned               = "+quantityassigned);
					System.out.println("bidprice                       = "+bidprice);
					System.out.println("lotcost                        = "+lotcost);
					System.out.println("traders final cost             = "+myfinalcost);
				}
				ps=con.prepareStatement("update traders_bid_price set lotcost=?,commission=?,marketcess=?,myfinalcost=? where aadaharnumber=? and lotnum=?" );
				ps.setString(1,String.valueOf(lotcost));
				ps.setString(2,String.valueOf(commission));
				ps.setString(3,String.valueOf(marketcess));
				ps.setString(4,String.valueOf(myfinalcost));
				ps.setString(5,String.valueOf(aadharnumber));
				ps.setString(6,lotnum);
				
				MyFinalCostBean mfcb=null;
				ps =con.prepareStatement("SELECT lotnum, bidprice,lotcost, commission, marketcess,myfinalcost,bestbid,quantityassigned FROM traders_bid_price where aadharnumber=?");
				ps.setString(1, aadharnumber);
				ps.execute();
				ResultSet rs3 = ps.getResultSet();				
				List<MyFinalCostBean> bl=new ArrayList<MyFinalCostBean>();	
				while(rs3.next())
				{
					mfcb=new MyFinalCostBean();
					mfcb.setCommission(String.valueOf(commission));
					mfcb.setLotcost(String.valueOf(lotcost));
					mfcb.setMarketcess(String.valueOf(marketcess));
					mfcb.setMyfinalcost(String.valueOf(myfinalcost));
					int price=rs3.getInt("bidprice");
					String prices=String.valueOf(price);
					mfcb.setPrice(prices);
					mfcb.setLotnum(rs3.getString("lotnum"));
					mfcb.setBestbid(rs3.getString("bestbid"));
					mfcb.setQuantityassigned(rs3.getString("quantityassigned"));
					bl.add(mfcb);
				}
				System.out.println("inside model inside mfcb list is"+bl);
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
				// 
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

	public String actionTrail(ActionTrailBean atbean) 
	{	
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
					System.out.println("quantity assigned is "+quantityassignedint);
					lotcost = res * quantityassignedint;
					commission = (int) (lotcost*0.05);
					marketcess =(int) (lotcost*0.01);
					finalcost = lotcost +commission +marketcess + 3000+100;

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
					lotcost=1*quantity;					
					commission = (int) (lotcost*0.05);					
					marketcess =  (int) (lotcost*0.01);
					finalcost = lotcost +commission +marketcess + 3000+100;
					System.out.println("trader is bidding this lot for first time");
					System.out.println("lotcost(1*quantity) = "+lotcost);
					System.out.println("commission          = "+commission);
					System.out.println("marketcess          = "+marketcess);
					System.out.println("final cost          = "+finalcost);

					
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
	/*
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
	return mc;
}
	
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
*/
@SuppressWarnings("resource")
	public Myclass2 orderstatus(String name, String pwd) 
	{
		//System.out.println("inside Model()->.....orderstatus");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		Myclass2 mc=new Myclass2();
		List<OrderStatusBean> al=new ArrayList<OrderStatusBean>();		
		String volumes=null;
		String lotnum=null;
		int i=0; 
		String aadharnumber=null;
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{
			}
			else
			{
				ps =con.prepareStatement("select ar.lotnumber from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and tr.name=? and tr.pass=?");//this checks whether the trader has won in auction by checking his name in auction result table
				ps.setString(1,name);
				ps.setString(2,pwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
						ps2 =con.prepareStatement("select ar.lotnumber,ar.quantityassigned from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and ar.lotnumber=? and tr.name=? and tr.pass=?");//this checks whether the trader has won in auction by checking his name in auction result table
						ps2.setString(1,rs.getString("lotnumber"));
						ps2.setString(2,name);
						ps2.setString(3,pwd);
						ps2.execute();
						rs1 = ps2.getResultSet();
						System.out.println(ps2);
						while(rs1.next())
						{				
							volumes=rs1.getString("quantityassigned");
							lotnum=rs1.getString("lotnumber");
							con.setAutoCommit(false);
						}	
						ps=con.prepareStatement("select aadharnumber from treg where name=?");
						ps.setString(1, name);						
						ps.execute();
						ResultSet rs6 = ps.getResultSet();
						while(rs6.next())
						{
							aadharnumber=rs6.getString("aadharnumber");
						}
						ps =con.prepareStatement("select tl.lotnum,tl.quantity,tl.slotnumber,tl.marketcode,tl.produce,tl.qualitygrade,tl.quantityneeded from tradelist tl where tl.aadharnumber=? and tl.lotnum=? ");
						ps.setString(1, aadharnumber);
						ps.setString(2, lotnum);
						ps.execute();
						OrderStatusBean osbn=null;
						rs1 = ps.getResultSet();
						System.out.println(ps);
						while(rs1.next())
						{
							osbn=new OrderStatusBean();
							osbn.setLotnum(rs1.getString("lotnum"));
							osbn.setMarketcode(rs1.getString("marketcode"));
							osbn.setQuantityavailable(rs1.getString("quantity"));
							osbn.setProduce(rs1.getString("produce"));
							osbn.setQualitygrade(rs1.getString("qualitygrade"));
							osbn.setQuantityneeded(rs1.getString("quantityneeded"));
							osbn.setSlotnumber(rs1.getString("slotnumber"));
							
							System.out.println("quantity available is "+rs1.getString("quantity"));
							ps =con.prepareStatement("select tdp.bidprice,tdp.bestbid from traders_bid_price tdp, treg tr where tdp.aadharnumber=tr.aadharnumber and tdp.lotnum=? and  tr.name=? and tr.pass=?");
							ps.setString(1, lotnum);
							ps.setString(2, name);
							ps.setString(3, pwd);
							ps.execute();
							rs2 = ps.getResultSet();
							while(rs2.next())
							{
								String bidprices=rs2.getString("bidprice");
								int volume=Integer.parseInt(volumes);
								int bidprice=Integer.parseInt(bidprices);
								int lotcost=volume*bidprice;							
								int commission = (int) (lotcost*0.05);
								int marketcess = (int) (lotcost*0.01);
								int eplatform=100;
								int myfinalcost=commission+marketcess+3000+lotcost+eplatform;
								String myfinalcosts=String.valueOf(myfinalcost);
								System.out.println("int myfinalcost=commission+marketcess+3000+lotcost+eplatform->"+commission+"+"+marketcess+"+"+3000+"+"+lotcost+"+ 100");
								String lotcosts=String.valueOf(lotcost);
								System.out.println("lotcosts-> "+lotcosts);
								osbn.setLotcost(lotcosts);
								osbn.setCommission(String.valueOf(commission));
								osbn.setMarketcess((String.valueOf(marketcess)));
								osbn.setBestbid(rs2.getString("bestbid"));
								osbn.setBidprice(bidprices);
								if(lotcost==0)
									osbn.setMyfinalcost("0");
								else
									osbn.setMyfinalcost(myfinalcosts);
							}		
							ps =con.prepareStatement("select ar.quantityassigned, ar.farmerstatus from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and tr.name=? and tr.pass=? and ar.lotnumber=?");
							ps.setString(1, name);
							ps.setString(2,pwd);
							ps.setString(3,lotnum);
							ps.execute();
							rs2 = ps.getResultSet();
							while(rs2.next())
							{
								osbn.setVolumesold(rs2.getString("quantityassigned")); 
								if(rs2.getString("farmerstatus")==null||rs2.getString("farmerstatus").equals(""))
									osbn.setFarmeraccept("pending");
								else
									osbn.setFarmeraccept(rs2.getString("farmerstatus"));
							}	
							osbn.setResult("LOT HAS BEEN ASSIGNED");
							System.out.println("inside model-> inside osbn for lotnum"+lotnum+"is "+osbn);
							al.add(osbn);		
							System.out.println("inside al is "+al);
							
						}
						mc.setAl(al);
					    i=1;
				}
				if(i==1)
				{
					System.out.println(mc.getAl());
					return mc;
				}
				con.setAutoCommit(false);				
				ps =con.prepareStatement("select tl.lotnum from tradelist tl,treg tr where tl.aadharnumber=tr.aadharnumber and tr.name=? and  tl.lotnum  NOT IN (select lotnumber from auction_result where aadharnumber=?)");
				ps.setString(1, name);
				ps.setString(2, aadharnumber);
				ps.execute();
				rs1 = ps.getResultSet();
				while(rs1.next())
				{							
					ps =con.prepareStatement("select tl.slotnumber,tl.quantity,tl.marketcode,tl.produce,tl.qualitygrade,tl.quantityneeded from tradelist tl,treg tr where tl.aadharnumber=tr.aadharnumber and tr.name=? and tl.lotnum=? and tr.pass=?");
					ps.setString(1, name);
					ps.setString(2, rs1.getString("lotnum"));
					ps.setString(3, pwd);
					ps.execute();
					rs2 = ps.getResultSet();
					OrderStatusBean osbn1=null;
					while(rs2.next())
					{					
						osbn1=new OrderStatusBean();
						osbn1.setLotnum(rs1.getString("lotnum"));
						osbn1.setMarketcode(rs2.getString("marketcode"));
						osbn1.setQuantityavailable(rs2.getString("quantity"));
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
								osbn1.setLotcost("0");
								osbn1.setBestbid(rs3.getString("bestbid"));
								osbn1.setBidprice(rs3.getString("bidprice"));
								osbn1.setMyfinalcost("0");
								osbn1.setLotnum(rs3.getString("lotnum"));						
						}	
						osbn1.setVolumesold("0");
						osbn1.setResult("LOT HAS NOT BEEN ASSIGNED");
						ps =con.prepareStatement("select farmerstatus from auction_result where lotnumber=?");
						ps.setString(1, osbn1.getLotnum());
						ps.execute();
						rs3 = ps.getResultSet();
						while(rs3.next())
						{ 
							System.out.println("***********************"+rs3.getString("farmerstatus"));
							if(rs3.getString("farmerstatus")==null||rs3.getString("farmerstatus").equals(""))
								osbn1.setFarmeraccept("PENDING");
							else
								osbn1.setFarmeraccept(rs3.getString("farmerstatus"));
						}
						al.add(osbn1);
					}
				}
				//System.out.println("inside model indide al is "+al);
				mc.setAl(al);
			}				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
		return mc;
	}

@SuppressWarnings("resource")
public Myclass2 orderstatus1(String name, String pwd) 
{
	System.out.println("inside Model()->.....orderstatus");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	Connection con = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	Myclass2 mc=new Myclass2();
	List<OrderStatusBean> al=new ArrayList<OrderStatusBean>();		
	String volumes=null;
	String lotnum=null;
	int i=0; 
	String aadharnumber=null;
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{
		}
		else
		{
			ps =con.prepareStatement("select ar.lotnumber from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and tr.name=? and tr.pass=?");//this checks whether the trader has won in auction by checking his name in auction result table
			ps.setString(1,name);
			ps.setString(2,pwd);
			ps.execute();
			rs = ps.getResultSet();
			while(rs.next())
			{
					System.out.println("trader has won the auction for lot"+rs.getString("lotnumber"));
					ps2 =con.prepareStatement("select ar.lotnumber,ar.quantityassigned from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and ar.lotnumber=? and tr.name=? and tr.pass=?");//this checks whether the trader has won in auction by checking his name in auction result table
					ps2.setString(1,rs.getString("lotnumber"));
					ps2.setString(2,name);
					ps2.setString(3,pwd);
					ps2.execute();
					rs1 = ps2.getResultSet();
					System.out.println(ps2);
					while(rs1.next())
					{				
						volumes=rs1.getString("quantityassigned");
						lotnum=rs1.getString("lotnumber");
						con.setAutoCommit(false);
						System.out.println("volume sold form lotnum"+lotnum+" is "+volumes);
					}	
					ps=con.prepareStatement("select aadharnumber from treg where name=?");
					ps.setString(1, name);						
					ps.execute();
					ResultSet rs6 = ps.getResultSet();
					while(rs6.next())
					{
						aadharnumber=rs6.getString("aadharnumber");
					}
					ps =con.prepareStatement("select th.lotnum,th.quantityavailable,th.slotnumber,th.marketcode,th.produce,th.qualitygrade,th.quantityneeded,th.bidprice,th.bestbid,th.quantityassigned,th.lotcost  from trader_histroy th where th.aadharnumber=? and th.lotnum=? ");
					ps.setString(1, aadharnumber);
					ps.setString(2, lotnum);
					ps.execute();
					OrderStatusBean osbn=null;
					rs1 = ps.getResultSet();
					System.out.println(ps);
					while(rs1.next())
					{
						osbn=new OrderStatusBean();
						osbn.setLotnum(rs1.getString("lotnum"));
						osbn.setMarketcode(rs1.getString("marketcode"));
						osbn.setQuantityavailable(rs1.getString("quantityavailable"));
						osbn.setProduce(rs1.getString("produce"));
						osbn.setQualitygrade(rs1.getString("qualitygrade"));
						osbn.setQuantityneeded(rs1.getString("quantityneeded"));
						osbn.setSlotnumber(rs1.getString("slotnumber"));
						osbn.setLotcost(rs1.getString("lotcost"));
						int lotcost=Integer.parseInt(rs1.getString("lotcost"));
						int commission = (int)(lotcost*0.05);
						int marketcess = (int)(lotcost*0.01);
						int eplatform=100;
						int myfinalcost=commission+marketcess+3000+lotcost+eplatform;
						String myfinalcosts=String.valueOf(myfinalcost);
						osbn.setCommission(String.valueOf(commission));
						osbn.setMarketcess((String.valueOf(marketcess)));
						osbn.setBestbid(rs1.getString("bestbid"));
						osbn.setBidprice(rs1.getString("bidprice"));
						osbn.setMyfinalcost(myfinalcosts);
						System.out.println("lotnum 				=	"+rs1.getString("lotnum"));
						System.out.println("Marketcode 			=	"+rs1.getString("marketcode"));
						System.out.println("Quantityavailable 	=	"+rs1.getString("quantityavailable"));
						System.out.println("Produce 			=	"+rs1.getString("produce"));
						System.out.println("Qualitygrade 		=	"+rs1.getString("qualitygrade"));
						System.out.println("Quantityneeded 		=	"+rs1.getString("quantityneeded"));
						System.out.println("Slotnumber 			=	"+rs1.getString("slotnumber"));
						System.out.println("Lotcost				=	"+rs1.getString("lotcost"));
						System.out.println("Commission			=	"+String.valueOf(commission));
						System.out.println("marketcess          =	"+String.valueOf(marketcess));
						System.out.println("bestbid             =	"+rs1.getString("bestbid"));
						System.out.println("bidprice            =	"+rs1.getString("bidprice"));
						System.out.println("quantityassigned    =   "+rs1.getString("quantityassigned"));
						System.out.println("myfinalcosts        =   "+myfinalcosts);
							
						ps =con.prepareStatement("select ar.quantityassigned, ar.farmerstatus from auction_result ar,treg tr where ar.aadharnumber=tr.aadharnumber and tr.name=? and tr.pass=? and ar.lotnumber=?");
						ps.setString(1, name);
						ps.setString(2,pwd);
						ps.setString(3,lotnum);
						ps.execute();
						rs2 = ps.getResultSet();
						while(rs2.next())
						{
							osbn.setVolumesold(rs2.getString("quantityassigned")); 
							if(rs2.getString("farmerstatus")==null||rs2.getString("farmerstatus").equals(""))
								osbn.setFarmeraccept("pending");
							else
								osbn.setFarmeraccept(rs2.getString("farmerstatus"));
						}	
						osbn.setResult("LOT HAS BEEN ASSIGNED");
						System.out.println("inside model-> inside osbn for lotnum"+lotnum+"is "+osbn);
						al.add(osbn);		
						System.out.println("inside al is "+al);
						
					}
					mc.setAl(al);
				    i=1;
			}
			if(i==1)
			{
				System.out.println(mc.getAl());
				return mc;
			}
				con.setAutoCommit(false);
			
			ps =con.prepareStatement("select th.lotnum from trader_histroy th where th.aadharnumber and  th.lotnum  NOT IN (select lotnumber from auction_result where aadharnumber=?)");
			ps.setString(1, aadharnumber);
			ps.setString(2, aadharnumber);
			ps.execute();
			rs1 = ps.getResultSet();
			while(rs1.next())
			{							
				ps =con.prepareStatement("select th.slotnumber,th.quantityavailable,th.marketcode,th.produce,th.qualitygrade,th.quantityneeded from trader_histroy th where th.aadharnumber=? and th.lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, rs1.getString("lotnum"));
				ps.execute();
				rs2 = ps.getResultSet();
				OrderStatusBean osbn1=null;
				while(rs2.next())
				{					
					osbn1=new OrderStatusBean();
					osbn1.setLotnum(rs1.getString("lotnum"));
					osbn1.setMarketcode(rs2.getString("marketcode"));
					osbn1.setQuantityavailable(rs2.getString("quantityavailable"));
					osbn1.setProduce(rs2.getString("produce"));
					osbn1.setQualitygrade(rs2.getString("qualitygrade"));
					osbn1.setQuantityneeded(rs2.getString("quantityneeded"));
					osbn1.setSlotnumber(rs2.getString("slotnumber"));						
					
					ps =con.prepareStatement("select th.lotcost,th.lotnum,th.bidprice,th.bestbid,th.myfinalcost from traders_bid_price tdp, treg tr, tradelist tl where tr.aadharnumber=tl.aadharnumber and tr.aadharnumber=tdp.aadharnumber and tdp.lotnum=tl.lotnum and tr.name=? and tr.pass=? and tdp.lotnum=?");
					ps.setString(1, name);
					ps.setString(2, pwd);
					ps.setString(3, rs1.getString("lotnum"));
					ps.execute();
					rs3 = ps.getResultSet();
					while(rs3.next())
					{						
							osbn1.setLotcost("0");
							osbn1.setBestbid(rs3.getString("bestbid"));
							osbn1.setBidprice(rs3.getString("bidprice"));
							osbn1.setMyfinalcost("0");
							osbn1.setLotnum(rs3.getString("lotnum"));						
					}	
					osbn1.setVolumesold("0");
					osbn1.setResult("LOT HAS NOT BEEN ASSIGNED");
					ps =con.prepareStatement("select farmerstatus from auction_result where lotnumber=?");
					ps.setString(1, osbn1.getLotnum());
					ps.execute();
					rs3 = ps.getResultSet();
					while(rs3.next())
					{ 
						System.out.println("***********************"+rs3.getString("farmerstatus"));
						if(rs3.getString("farmerstatus")==null||rs3.getString("farmerstatus").equals(""))
							osbn1.setFarmeraccept("PENDING");
						else
							osbn1.setFarmeraccept(rs3.getString("farmerstatus"));
					}
					al.add(osbn1);
				}
			}
			System.out.println("inside model indide al is "+al);
			mc.setAl(al);
		}				
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(ps);
		JDBCHelper.Close(con);
	}
	return mc;
}

public String orderstatus2(String name,String pwd)
{
	Connection con = null;
	setFarmeracceptresult("accept");
	String status="not";
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{
		}
		else
		{		
			String aadharnumber=null;
			PreparedStatement ps = con.prepareStatement("select aadharnumber from treg where name=? and pass=?");
			ps.setString(1, name);
			ps.setString(2,pwd);
			ps.execute();
			ResultSet rs = ps.getResultSet();
			while(rs.next())
			{
				aadharnumber=rs.getString("aadharnumber");
			}
			
			ps =con.prepareStatement("select farmerstatus from auction_result where aadharnumber=?");//this checks whether the trader has won in auction by checking his name in auction result table
			ps.setString(1,aadharnumber);
			ps.execute();
			ResultSet rs1 = ps.getResultSet();
			System.out.println(ps);
			while(rs1.next())
			{
				status=rs1.getString("farmerstatus");
			}
			System.out.println("status is "+status);
			return status;
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	finally
	{
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return status;	
}

	public void TraderProductReject(String lotnum)
	{
		Connection con = null;
		try
		{
			con = JDBCHelper.getConnection();
			PreparedStatement ps=con.prepareStatement("update auction_result set farmerstatus=? where lotnumber=?");
			ps.setString(1,"REJECTED");
			ps.setString(2,lotnum);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

@SuppressWarnings("resource")
public void TraderProductAccept(String lotnum,String accno)
{		
		System.out.println("TraderProductAccept.do");
		System.out.println("***********************************************");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3= null;
		PreparedStatement ps4 = null;
		PreparedStatement ps5 = null;
		PreparedStatement ps6 = null;
		PreparedStatement ps9 = null;
		Connection con = null;
		setFarmeracceptresult("accept");
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{
			}
			else
			{		
				ps =con.prepareStatement("select tl.aadharnumber,tr.name from tradelist tl,treg tr where tl.lotnum=? and tl.aadharnumber=tr.aadharnumber");//this checks whether the trader has won in auction by checking his name in auction result table
				ps.setString(1,lotnum);
				ps.execute();
				ResultSet rs = ps.getResultSet();
				String aadharnumber[]=new String[100];
				String name[]=new String[100];
				int i=1;
				while(rs.next())
				{
					aadharnumber[i]=rs.getString("aadharnumber");
					name[i]=rs.getString("name");
					i++;
				}
				int j=1;
				while(aadharnumber[j]!=null)
				{
					ps2 =con.prepareStatement("select quantityassigned from auction_result where aadharnumber=? and lotnumber=?");//this checks whether the trader has won in auction by checking his name in auction result table
					ps2.setString(1,aadharnumber[j]);
					ps2.setString(2, lotnum);
					ps2.execute();
					ResultSet rs2= ps2.executeQuery();
					if(rs2.next())
					{	
						//now if he has won the auction select volume assigned to him and hs bid price						
						ps3 =con.prepareStatement("select ar.quantityassigned,tbp.bidprice from traders_bid_price tbp, auction_result ar,treg tr where tr.aadharnumber=tbp.aadharnumber and ar.aadharnumber=tr.aadharnumber and tr.aadharnumber=?");
						ps3.setString(1, aadharnumber[j]);
						ps3.execute();
						ResultSet rs3 = ps3.executeQuery();
						while(rs3.next())
						{		
							String volumesolds=rs3.getString("quantityassigned");
							String bidprice=rs3.getString("bidprice");
							int volumesold=Integer.parseInt(volumesolds);
							int bidprice1=Integer.parseInt(bidprice);
							int lotcost=volumesold*bidprice1;
							int commission = (int) (lotcost*0.05);
							int marketcess = (int) (lotcost*0.01);
							int pmva=100;
							int eplatform=100;
							int transportation=3000;
							int myfinalcost=commission+marketcess+transportation+lotcost+eplatform;
							System.out.println("quantity assigned = "+volumesold);
							System.out.println("bidprice          = "+bidprice);
							System.out.println("lotcost           = "+volumesold+" + "+bidprice+" = "+lotcost);
							System.out.println("commission        = "+lotcost+" * 0.05 = "+commission);
							System.out.println("market cess       = "+lotcost+" * 0.01 = "+marketcess);
							System.out.println("final cost        = "+lotcost+" + "+commission+" + "+marketcess+" +  3000 +  eplatfrom charges");
							System.out.println("traders final cost="+myfinalcost);
							
							
							int block=0;
							ps4 =con.prepareStatement("select blockamount from traders_blocked_amount where tradername=?");
							ps4.setString(1, name[j]);
							ps4.execute();
							ResultSet rs4 = ps4.executeQuery();
							int result=0;
							while(rs4.next())
							{
								result= Integer.parseInt(rs4.getString("blockamount"));	
							}
							block=result-myfinalcost;
							String bloc=String.valueOf(block);
							System.out.println("blocked amount from trader before deduction = "+result);
							System.out.println("blocked amount from trader after  deduction = "+result+" - "+myfinalcost+" = "+bloc);
							
							ps =con.prepareStatement("select fund_utilized from traders_blocked_amount where aadharnumber=?");//					
							ps.setString(1,aadharnumber[j]);
							ps.execute();		
							ResultSet rs51 = ps.executeQuery();
							int fund=0;
							while(rs51.next())
							{
								fund= Integer.parseInt(rs51.getString("fund_utilized"));	
							}
							fund+=myfinalcost;
							
							ps =con.prepareStatement("update traders_blocked_amount set fund_utilized=? where aadharnumber=?");//					
							ps.setInt(1,fund);
							ps.setString(2,aadharnumber[j]);
							ps.execute();				
							System.out.println(ps);						
							
							//after deducting all the cost from blocked amount we are updating the traders_blocked_amount
							ps5 =con.prepareStatement("update traders_blocked_amount set blockamount=? where aadharnumber=?");
							ps5.setString(1,bloc );
							ps5.setString(2, aadharnumber[j]);
							ps5.execute();
							
							int fbalance=0;
							int neomandibalance=0;
							ps6 =con.prepareStatement("select balance from neomandibankaccount");		
							ps6.execute();
							ResultSet rs5 = ps6.executeQuery();
							while(rs5.next())
							{
								neomandibalance=Integer.parseInt(rs5.getString("balance"));
								System.out.println("balance available in neomandi account before adding traders final cost = "+neomandibalance);
								int bal=neomandibalance+myfinalcost;
								System.out.println("balance available in neomandi account after  adding traders final cost = "+neomandibalance+" + "+myfinalcost+" = "+bal);				
							}
										
							List<String> al=new ArrayList<String>();
							ps=con.prepareStatement("select lotnumber from history");
							ps.execute();
							ResultSet rs17=ps.executeQuery();
							while(rs17.next())
							{
								al.add(rs17.getString("lotnumber"));
							}
							String present;
							if(al.contains(lotnum))
							{
								neomandibalance=neomandibalance+myfinalcost+marketcess+pmva+100;
								present="yes";
							}
							else
							{
								neomandibalance=neomandibalance+myfinalcost+marketcess+pmva+100+500;	
								present="no";
							}
							System.out.println("balance available in neomandi account after collecting my final cost from trader and marketcess, pmva and eplatform charges = "+neomandibalance);							
							
							ps9 =con.prepareStatement("update neomandibankaccount set balance=?");
							ps9.setString(1,String.valueOf(neomandibalance));
							ps9.execute();
							
							int b=neomandibalance-lotcost;	
							System.out.println("balance available in neomandi bank after sending money to farmer is = "+b);
							ps9 =con.prepareStatement("update neomandibankaccount set balance=?");
							ps9.setString(1,String.valueOf(b));
							ps9.execute();
							
							ps =con.prepareStatement("select balance from fbankaccount where accountnumber="+accno);						
							ResultSet rs8 = ps.executeQuery();
							while(rs8.next())
							{
								fbalance=Integer.parseInt(rs8.getString("balance"));
								System.out.println("farmers balance ="+fbalance);
							}
							if(present.equals("yes"))
								fbalance=fbalance+lotcost-marketcess-pmva-100;
							else
								fbalance=fbalance+lotcost-marketcess-pmva-100-500;
							System.out.println("after deducting pmva marketcess eplatform charges and transortation cahrges balance in farmer account = "+fbalance);
							ps =con.prepareStatement("update fbankaccount set balance=? where accountnumber=?");
							ps.setString(1,String.valueOf(fbalance));
							ps.setString(2,accno);
							ps.execute();
							
							ps3 =con.prepareStatement("update auction_result set farmerstatus=? where aadharnumber=? and lotnumber=? ");
							ps3.setString(2, aadharnumber[j]);
							ps3.setString(1, "ACCEPTED");
							ps3.setString(3, lotnum);
							ps3.execute();
						}					
					}	
					else
					{						
						System.out.println("trader has not been assigned any lot ");
					}
					j++;
				}				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		finally
		{
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
	}

	public List<TradeSummaryBean> tradeSummary(String name, String pwd, String from, String to) 
	{
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		ResultSet rs5 = null;
		List<TradeSummaryBean> al=new ArrayList<TradeSummaryBean>();	
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{}
			else
			{	
				System.out.println("from-> "+from+" to->"+to );
				String st[]=to.split("/");
				String ft[]=from.split("/");
				//System.out.println("st[0]"+st[0]);
				//System.out.println("st[1]"+st[1]);
				//System.out.println("st[2]"+st[2]);
				int date=Integer.parseInt(st[1])+1;
				//System.out.println("ate is"+date);
				st[1]=String.valueOf(date);
				if(date<10)
					to=st[2]+"-"+st[0]+"-0"+st[1];
				else
					to=st[2]+"-"+st[0]+"-"+st[1];
				//System.out.println(to);
				from=ft[2]+"-"+ft[0]+"-"+ft[1];
				from=from.replace("/","-");
				//System.out.println(from);
				String date1=from+"%";
				
				ps =con.prepareStatement("SELECT a.quantityassigned FROM auction_result a, treg t where t.name=? and t.aadharnumber=a.aadharnumber");
				ps.setString(1,name);
				ps.execute();
				System.out.println(ps);
				rs = ps.getResultSet();
				if(rs.next())
				{
					ps =con.prepareStatement("SELECT a.quantityassigned FROM auction_result a, treg t where t.name=? and t.aadharnumber=a.aadharnumber and a.farmerstatus=?");
					ps.setString(1,name);
					ps.setString(2, "REJECTED");
					ps.execute();
					System.out.println(ps);
					rs3 = ps.getResultSet();
					if(rs3.next())
					{
						return al;
					}
					else
					{
						ps =con.prepareStatement("SELECT tl.created_at,tl.lotnum,tl.quantity, tbp.lotcost,tbp.commission,tbp.marketcess,tl.quantityneeded,tbp.bidprice,tbp.myfinalcost FROM traders_bid_price tbp,tradelist tl,treg tr where tr.name=? and created_at like ? and tr.pass=? and tr.aadharnumber=tl.aadharnumber and tl.aadharnumber=tbp.aadharnumber and tl.lotnum=tbp.lotnum;");
						ps.setString(1,name);
						ps.setString(2,date1);
						ps.setString(3,pwd);
						ps.execute();
						System.out.println(ps);
						rs4 = ps.getResultSet();
						TradeSummaryBean tsb=null;
						while(rs4.next())
						{	
							System.out.println("lotnum is "+rs4.getString("lotnum"));
							tsb=new TradeSummaryBean();
							tsb.setBidprice(rs4.getString("bidprice"));
							tsb.setLotnum(rs4.getString("lotnum"));
							tsb.setLotcost((rs4.getString("lotcost")));
							tsb.setCommission(rs4.getString("commission"));
							tsb.setMarketcess(rs4.getString("marketcess"));
							tsb.setMyfinalcost(rs4.getString("myfinalcost"));
							String created=((String)rs4.getString("created_at")).split(" ")[0];
						//	System.out.println(created);
							tsb.setCreated(created);
							
							ps=con.prepareStatement("SELECT ar.quantityassigned FROM auction_result ar,treg tr where ar.lotnumber=? and tr.name=? and tr.aadharnumber=ar.aadharnumber");//this checks whether the trader has won in auction by checking his name in auction result table
							ps.setString(2,name);
							ps.setString(1,rs4.getString("lotnum"));
							ps.execute();
							rs2 = ps.getResultSet();
							if(rs2.next())
							{
								tsb.setVolumesold(rs2.getString("quantityassigned"));
								tsb.setResult("WON");
							}
							else
							{
								tsb.setVolumesold("0");
								tsb.setResult("LOST");
							}
							al.add(tsb);					
						}	
						return al;
					}	
				}
				else
				{
					return al;
				}
			}
		}catch(Exception e)
		{
	e.printStackTrace();
	}
		finally
		{
			JDBCHelper.Close(ps);
			JDBCHelper.Close(con);
		}
	return al;
}
	

@SuppressWarnings("rawtypes")
public List traderHistory(String name, String pwd, String from, String to) 
{
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
			System.out.println("from-> "+from+" to->"+to );
			String st[]=to.split("/");
			String ft[]=from.split("/");
			System.out.println("st[0]"+st[0]);
			System.out.println("st[1]"+st[1]);
			System.out.println("st[2]"+st[2]);
			System.out.println("ft[0]"+ft[0]);
			System.out.println("ft[1]"+ft[1]);
			System.out.println("ft[2]"+ft[2]);
			from=ft[2]+"-"+ft[1]+"-"+ft[0];
			System.out.println(st);
			
			int date=(Integer.parseInt(st[0]));
			st[0]=String.valueOf(date);
			if(date<10)
				to=st[2]+"-"+st[1]+"-0"+st[0];
			else
				to=st[2]+"-"+st[1]+"-"+st[0];
			
			if(st[0].equals("31"))
			{
				System.out.println("31");
				st[0]="01";
				int mnt=Integer.parseInt(st[1]);
				st[1]=String.valueOf(mnt+1);/*
				System.out.println(st[0]+" "+st[1]);*/
			}
			else if(st[0].equals("30") &&(st[1].equals("04")||st[1].equals("06")||st[1].equals("09")||st[1].equals("11")))
			{
				st[0]="01";
				int mnt=Integer.parseInt(st[1]);
				st[1]=String.valueOf(mnt+1);/*
				System.out.println(st[0]+" "+st[1]);*/
			}
			else if(st[0].equals("28")&&st[1].equals("02"))
			{
				st[0]="01";
				int mnt=Integer.parseInt(st[1]);
				st[1]=String.valueOf(mnt+1);
				System.out.println("feb "+st[0]+st[1]);
			}
			from=from.replace("/","-");
			to=st[2]+"-"+st[1]+"-"+st[0];
			System.out.println(to);
			
			ps =con.prepareStatement("SELECT tl.created_at, tl.lotnum,tl.quantity, tbp.lotcost,tbp.commission,tbp.marketcess,tl.quantityneeded,tbp.bidprice,tbp.myfinalcost FROM traders_bid_price tbp,tradelist tl,treg tr where tr.name=? and created_at BETWEEN ? AND  ? and tr.pass=? and tr.aadharnumber=tl.aadharnumber and tl.aadharnumber=tbp.aadharnumber and tl.lotnum=tbp.lotnum;");
			ps.setString(1,name);
			ps.setString(2,from);
			ps.setString(3, to);
			ps.setString(4,pwd);
			ps.execute();
			System.out.println(ps);
			rs = ps.getResultSet();
			TradeSummaryBean tsb=null;
			while(rs.next())
			{	
				System.out.println("lotnum is "+rs.getString("lotnum"));
				tsb=new TradeSummaryBean();
				tsb.setBidprice(rs.getString("bidprice"));
				tsb.setLotnum(rs.getString("lotnum"));
				tsb.setLotcost((rs.getString("lotcost")));
				tsb.setCommission(rs.getString("commission"));
				tsb.setMarketcess(rs.getString("marketcess"));
				tsb.setMyfinalcost(rs.getString("myfinalcost"));
				System.out.println("created at "+rs.getString("created_at"));
				String created=((String)rs.getString("created_at")).split(" ")[0];
				System.out.println(created);
				tsb.setCreated(created);
			//	tsb.setQuantity(rs.getString("quantity"));
			//	tsb.setQuantityneeded(rs.getString("quantityneeded"));
				
				ps=con.prepareStatement("SELECT ar.quantityassigned FROM auction_result ar,treg tr where ar.lotnumber=? and tr.name=? and tr.aadharnumber=ar.aadharnumber");//this checks whether the trader has won in auction by checking his name in auction result table
				ps.setString(2,name);
				ps.setString(1,rs.getString("lotnum"));
				ps.execute();
				rs2 = ps.getResultSet();
				if(rs2.next())
				{
					tsb.setVolumesold(rs2.getString("quantityassigned"));
					tsb.setResult("WON");
				}
				else
				{
					tsb.setVolumesold("----");
					tsb.setResult("LOST");
				}
				al.add(tsb);					
			}	
			return al;
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(ps);
		JDBCHelper.Close(con);
	}
    return al;
}

	@SuppressWarnings("resource")
	public List<FarmerHistoryBean> farmerHistory(String name,String pass,String from,String to){
				PreparedStatement ps = null;
				Connection con = null;
				ResultSet rs = null;
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

						System.out.println("from-> "+from+" to->"+to );
						String st[]=to.split("/");
						String st1[]=from.split("/");
						int date=Integer.parseInt(st[0]);
						int month=Integer.parseInt(st[1]);
						if(month==12 && date==31){
							month=1;
							date=1;
							from=st1[2]+"-"+st1[1]+"-"+st1[0];
							to=st[2]+"-"+month+"-"+date;
						}
						else if(date==31){
						
							 month=Integer.parseInt(st[1])+1;
							date=1;
							from=st1[2]+"-"+st1[1]+"-"+st1[0];
							to=st[2]+"-"+month+"-"+date;
						}
						else if(date==28 || date==29 && month==2){
							month=3;
							date=1;
							from=st1[2]+"-"+st1[1]+"-"+st1[0];
							to=st[2]+"-"+month+"-"+date;
						}
						else if(date==30){
							 month=Integer.parseInt(st[1])+1;
							date=1;
							from=st1[2]+"-"+st1[1]+"-"+st1[0];
							to=st[2]+"-"+month+"-"+date;
						}
						else{
							date=Integer.parseInt(st[0])+1;
							int date1=Integer.parseInt(st1[2]);
							st[0]=String.valueOf(date);
							st1[2]=String.valueOf(date1);
							from=st1[2]+"-"+st1[1]+"-"+st1[0];
							to=st[2]+"-"+st[1]+"-"+st[0];
						
						}
						System.out.println("to="+to);
						System.out.println("from="+from);
						//getsummary details
						ps = con.prepareStatement("select * from history h,freg f where f.name=?  and  created_at BETWEEN ? AND ? and f.pass=? and h.farmerid=f.aadharnum ;" );
						ps.setString(1,name);
						ps.setString(2,from);
						ps.setString(3,to);
						ps.setString(4,pass);

						System.out.println(ps);
						System.out.println("Execute"+ps.executeQuery());
						rs=ps.getResultSet();
						System.out.println( "in famerhistory"+rs+" "+ps.getResultSet());
						FarmerHistoryBean fhb=null;
						while(rs!=null&&rs.next())
						{
							System.out.println("inside while()->rs is "+rs);
							fhb=new FarmerHistoryBean();
							fhb.setLotnumber(rs.getString("lotnumber"));
							fhb.setQuantity(rs.getString("quantity"));
							fhb.setAverageprice(rs.getString("averageprice"));
							fhb.setDate(rs.getString("created_at"));
							fhb.setDeduction("deduction");
							fhb.setEarnings(rs.getString("myearnings"));
							fhb.setFinalprice(rs.getString("finalprice"));
							fhb.setKindofpro(rs.getString("kindofpro"));
							fhb.setQuantitybidfor(rs.getString("quantitybidfor"));
							fhb.setProduce(rs.getString("produce"));
							fhb.setSlotnumber(rs.getString("slotnumber"));
							fhb.setCrdate(rs.getString("created_at"));
							al.add(fhb);
						}
					}
				}
				catch(Exception e)
				{
			e.printStackTrace();
			}
				finally
				{
					JDBCHelper.Close(ps);
					JDBCHelper.Close(con);
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
		ResultSet rs = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt2 = null;
		
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

				String quantity = "";
				int quantitynew = 0;
				String slotnumber = "";
				String farmerid = "";
				String marketcode = "";
				String kindofpro = "";
				String produce = "";
				String qualitygrade = "";
				double averageprice = 0;
				String photo = "";
				
				String sql = "SELECT * FROM productentry WHERE lotnumber = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, lotnumber);
				rs1 = pstmt.executeQuery();
				while(rs1.next())
				{					
					quantity = rs1.getString("quantity");
					slotnumber = rs1.getString("slotnumber");
					farmerid = rs1.getString("farmerid");
					marketcode = rs1.getString("marketcode");
					kindofpro = rs1.getString("kindofpro");
					produce = rs1.getString("produce");
					qualitygrade = rs1.getString("qualitygrade");
					averageprice = rs1.getDouble("averageprice");
				    photo = rs1.getString("photo");
				}
				
				System.out.println("avg="+averageprice);
				double finalprice = 0.0;
				finalprice =  averageprice * Double.parseDouble(quantitybidfor);
				System.out.println("avg="+averageprice+"qty="+quantitybidfor+"finalprice="+finalprice);
				double nfinalprice = finalprice;
				double percentage = nfinalprice/100;
				double myearnings = 0.0;
				myearnings = finalprice - 700 - percentage;

				System.out.println("my earnings="+myearnings);
				String sql3 = "INSERT INTO history(farmerid, lotnumber,marketcode,kindofpro, produce,qualitygrade,quantity,photo,slotnumber,averageprice,quantitybidfor,finalprice,status,myearnings) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				pstmt2 = con.prepareStatement(sql3); 
				pstmt2.setString(1, farmerid);
				pstmt2.setString(2, lotnumber);
				pstmt2.setString(3, marketcode);
				pstmt2.setString(4, kindofpro);
				pstmt2.setString(5, produce);
				pstmt2.setString(6, qualitygrade);
				pstmt2.setString(7, quantity);
				pstmt2.setString(8, photo);

				pstmt2.setString(9, slotnumber);
				pstmt2.setDouble(10, averageprice);
				pstmt2.setString(11, quantitybidfor);
				pstmt2.setDouble(12, finalprice);
				pstmt2.setString(13, null);
				pstmt2.setDouble(14, myearnings);

				
				pstmt2.execute();
				
				
				quantitynew = (int) (Double.parseDouble(quantity) - Double.parseDouble(quantitybidfor));
				
				System.out.println("Quantity: "+quantity);
				System.out.println("QuantityBidfor: "+quantitybidfor);
				System.out.println(Double.parseDouble(quantity) == Double.parseDouble(quantitybidfor));
				if(Double.parseDouble(quantity) == Double.parseDouble(quantitybidfor))
				{
					String sql1 = "DELETE FROM productentry WHERE lotnumber = ?";
					pstmt1 = con.prepareStatement(sql1);
					pstmt1.setString(1, lotnumber);
					System.out.println("Lot has completely accepted. Entry will be removed: "+pstmt1.execute());
				}
				else
				{
					if(slotnumber.equals("slot1")||slotnumber.equals("nill"))
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
				
				if(slotnumber.equals("slot1")||slotnumber.equals("nill"))
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
	
	@SuppressWarnings("resource")
	public OrderStatusResult Dispatch() {
		System.out.println("inside model...Dispatch");
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement ps= null;
		ResultSet rs = null;
		List<DispatchBean> al=new ArrayList<DispatchBean>();
		HashMap<String, Integer> a=null;
		OrderStatusResult osrb=new OrderStatusResult();
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
				ps=con.prepareStatement("SELECT lotnumber,count(*) FROM auction_result where farmerstatus=? group by lotnumber order by lotnumber");
				ps.setString(1,"accepted");
				rs=ps.executeQuery();
				a=new HashMap<>();
				while(rs.next())
				{
					System.out.println("lotnum->"+rs.getString("lotnumber")+" count(*)->"+rs.getInt("count(*)"));
					a.put(rs.getString("lotnumber"), rs.getInt("count(*)"));					
				}
				ps=con.prepareStatement("SELECT ar.lotnumber, ar.quantityassigned, ar. aadharnumber,tr.name  FROM auction_result ar, treg tr where ar.farmerstatus=? and ar.aadharnumber=tr.aadharnumber order by lotnumber");
				ps.setString(1,"accepted");
				rs=ps.executeQuery();
				while(rs.next())
				{
					DispatchBean dp=new DispatchBean();
					dp.setLotnum(rs.getString("lotnumber"));
					dp.setQuantityassigned(rs.getString("quantityassigned"));
					dp.setAadharnumber(rs.getString("aadharnumber"));
					dp.setName(rs.getString("name"));
					al.add(dp);
					/*if(al.contains(dp.getLotnum())) 
						System.out.println("yes");
					else
						System.out.println("no");*/
				}
				osrb.setA(a);
				osrb.setAl(al);
				con.commit();
				return osrb;
			}		
		}
		catch(SQLException e)
		{
			try {
				con.rollback();
			} catch (SQLException e1) {
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
		return osrb;
	}

@SuppressWarnings({ "resource" })
public Myajaxclass1 ajaxIncrement(String tname, String tpwd, String lotnumber, String newbids) 
{
		int newbid=0;
		newbids=newbids.trim();
		newbid=Integer.parseInt(newbids);
		System.out.println("inside Model()->.....Increment... lotnum is "+lotnumber+" increments is "+newbid);
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		String aadharnumber="";
		String quantityassigneds=null;
		int quantityassigned=0;
		String lotcosts="";
		int lotcost;
		String commissions="";
		int commission;
		String lotnum=lotnumber;
		String marketcesss="";
		int marketcess;
		String msg="";
		MyFinalCostBean mfcb=new MyFinalCostBean();
		int finalcost;
		Myajaxclass1 mc=new Myajaxclass1();
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{}
			else
			{
				//con.setAutoCommit(false);
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, tname);
				ps.setString(2, tpwd);
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					aadharnumber=rs.getString("aadharnumber");
				}								
				String quantityneededs=null;
				ps =con.prepareStatement("SELECT quantityneeded FROM tradelist where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnum);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{					
					quantityneededs=rs.getString("quantityneeded");
				}		
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
				
				con = JDBCHelper.getConnection();
				ps =con.prepareStatement("SELECT quantityassigned FROM traders_bid_price where aadharnumber=? and lotnum=?");
				ps.setString(1, aadharnumber);
				ps.setString(2, lotnum);
				ps.execute();
				rs = ps.getResultSet();				
				while(rs.next())
				{
					quantityassigneds = rs.getString("quantityassigned");							
				}		
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
				
				con = JDBCHelper.getConnection();				
				int result=0;
				ps =con.prepareStatement("SELECT blockamount FROM traders_blocked_amount where aadharnumber=? ");
				ps.setString(1, aadharnumber);
				ps.execute();
				rs = ps.getResultSet();	
				while(rs.next())
				{
					result=rs.getInt("blockamount");						
				}				
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
				
				con = JDBCHelper.getConnection();
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
					int res =newbid;	
					System.out.println("biddng price the trader is ready to pay = "+res);
					quantityassigned=Integer.parseInt(quantityassigneds);
					//lotcost = res * quantity;
					//lotcost = res * quantityassigned;   *******IMPORTANT*** MARCH 24** CODE CHANGE = LOTCOST IS (LOTCOST* QUANTITY REQUIRED)*****
					lotcost = res * quantityassigned;   
					//lotcost=res*Integer.parseInt(quantityneededs);
					commission = (int) (lotcost*0.05);
					marketcess =(int) (lotcost*0.01);
					if(quantityassigned==0)						
						finalcost=0;
					else
						finalcost = lotcost +commission +marketcess + 3000+100;
					commissions=String.valueOf(commission);
					lotcosts=String.valueOf(lotcost);
					marketcesss=String.valueOf(marketcess);
					bidprices=String.valueOf(res);
					finalcosts=String.valueOf(finalcost);
					SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss.SSS");
					String date=sdf.format(new Date());
					System.out.println("quantity trader is bidding                     = "+quantityneededs);
					System.out.println("quantity assigned to trader                    = "+quantityassigned);
					System.out.println("total amount blocked by trader                 = "+result);
					System.out.println("previous bid price                             = "+bidprice);
					System.out.println("present  bid price                             = "+res);
					System.out.println("lot cost the trader has to pay                 = "+lotcost);
					System.out.println("commission                                     = "+commission);
					System.out.println("marketcess                                     = "+marketcess);
					System.out.println("traders final cost                             = "+finalcost);
					System.out.println("time at whch bid was placed                    = "+date);
					//System.out.println("updating traders_bid_price by values=bidprices "+bidprices+" commissions "+commissions+" marketcesss "+marketcesss+" finalcosts "+finalcosts+" lotcosts "+lotcosts);
					
					//int biddate=Integer.parseInt(date);
					/*String str[]=date.split(":");
					int hour=Integer.parseInt(str[0]);
					int minute=Integer.parseInt(str[1]);
					*/
					Calendar calendar = Calendar.getInstance();
			        TimeZone fromTimeZone = calendar.getTimeZone();
			        TimeZone toTimeZone = TimeZone.getTimeZone("MST");

			        calendar.setTimeZone(fromTimeZone);
			        calendar.add(Calendar.MILLISECOND, fromTimeZone.getRawOffset() * -1);
			        if (fromTimeZone.inDaylightTime(calendar.getTime())) {
			            calendar.add(Calendar.MILLISECOND, calendar.getTimeZone().getDSTSavings() * -1);
			        }

			        calendar.add(Calendar.MILLISECOND, toTimeZone.getRawOffset());
			        if (toTimeZone.inDaylightTime(calendar.getTime())) {
			            calendar.add(Calendar.MILLISECOND, toTimeZone.getDSTSavings());
			        }
			        //********THIS IS NEW CODE*******
			        int lotcost2=0;
			        int finalcost2=0;
			        int commission2=0;
			        int marketcess2=0;
			        lotcost2=res*Integer.parseInt(quantityneededs);
					commission2 = (int) (lotcost2*0.05);
					marketcess2 =(int) (lotcost2*0.01);
					finalcost2 = lotcost2 +commission2 +marketcess2 + 3000+100;
					//************END OF NEW CODE****
			        int diff=result-finalcost2;			        
			        System.out.println("*****diff*******"+diff);
			        if(diff<0)
					{
	                    diff=finalcost-result;
						System.out.println("Your final cost is more than the blocked amount...!!! please increase the blocked amount by "+diff);					
						msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
						mc.setMsg(msg);
						return mc;
					}
					else
					{
						msg="success";
						mc.setMsg(msg);
							
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
						
						
						ps =con.prepareStatement("select tb.lotnum,tb.bidprice,tb.lotcost,tb.commission,tb.marketcess,tb.myfinalcost,tb.bestbid,tb.quantityassigned,tl.quantityneeded from traders_bid_price tb,tradelist tl where tb.aadharnumber=? and tb.lotnum=? and tb.aadharnumber=tl.aadharnumber and tl.lotnum=? ");
						ps.setString(1,aadharnumber);
						ps.setString(2,lotnum);
						ps.setString(3,lotnum);
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
							mfcb.getQuantityneeded();
							mfcb.setCommission(commissions);
							mfcb.setLotcost(lotcosts);
							mfcb.setMarketcess(marketcesss);
							mfcb.setMyfinalcost(finalcosts);
							mfcb.setPrice(bidprices);
							mfcb.setLotnum(lotnumber);
							if(rs.getString("bestbid")==null)
								mfcb.setBestbid("-");
							else							
								mfcb.setBestbid(rs.getString("bestbid"));
							mfcb.setQuantityassigned(rs.getString("quantityassigned"));
							//System.out.println("bid price before storing in an array "+mfcb.getPrice()+" final price "+mfcb.getMyfinalcost()+" lotnum"+mfcb.getLotnum());
							//al.add(mfcb);
						}	
						mc.setMfcb(mfcb);
						System.out.println("inside model() mfcb is-> "+mfcb);
					}
				}		
				else
				{
					lotcost=newbid*quantityassigned;
					commission = (int) (lotcost*0.05);
					marketcess = (int) (lotcost*0.01);
					finalcost = lotcost +commission +marketcess + 3000+100;
					System.out.println("trader is bidding this lot for first time");
					System.out.println("lotcost(increment*quantity) = "+lotcost);
					System.out.println("commission                  = "+commission);
					System.out.println("marketcess                  = "+marketcess);
					System.out.println("final cost                  = "+finalcost);
					
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
					
					ps =con.prepareStatement("select tb.lotnum,tb.bidprice,tb.lotcost,tb.commission,tb.marketcess,tb.myfinalcost,tb.bestbid,tb.quantityassigned, tl.quantityneeded from traders_bid_price tb,tradelist tl where tb.aadharnumber=? and tb.aadharnumber=tl.aadharnumber and tl.lotnum=?");
					ps.setString(1,aadharnumber);
					ps.setString(2,lotnum);
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
						if(rs.getString("bestbid")==null)
							mfcb.setBestbid("-");
						else							
							mfcb.setBestbid(rs.getString("bestbid"));
						mfcb.setQuantityassigned(rs.getString("quantityassigned"));						
						
					}		
					mc.setMfcb(mfcb);
					System.out.println("inside model() mfcb-> "+mfcb);
				}				
				
				/*int res[]=new int[19];
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
				System.out.println("finalcost            = "+finalcost);
				System.out.println("total blocked amount = "+result);
				int diff=result-finalcost;
				System.out.println("finalcost-result     = "+diff);
				if(diff<0)
				{
                    diff=finalcost-result;
					System.out.println("Your final cost is more than the blocked amount...!!! please increase the blocked amount by "+diff);					
					msg="Your final cost is more than the blocked amount...!!! please increase the blocked amount by atleast "+diff;
					mc.setMsg(msg);
				}
				else
				{
					msg="success";
					mc.setMsg(msg);
				}		*/							
			}					
		}
		catch(Exception e)
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

public String holdfundsgetbalance(String account) 
{
	String balance=null;
	PreparedStatement ps = null;
	Connection con = null;
	ResultSet rs = null;	
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{			
		}
		else
		{
			con.setAutoCommit(false);
			ps =con.prepareStatement("select balance from tbankaccount where accountnumber=?");
			ps.setString(1, account);
	//		ps.setString(2, tpwd);
			ps.execute();
			rs = ps.getResultSet();
			while(rs.next())
			{
				balance=rs.getString("balance");
			}
	return balance;
}
	}
	catch(Exception e)
	{e.printStackTrace();
	
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
		return balance;
	}

public int release(String name, String pwd, String release,String bank) 
{
	String balance="dance";
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	Connection con = null;
	ResultSet rs = null;	
	ResultSet rs1 = null;	
	ResultSet rs2 = null;	
	ResultSet rs3 = null;	
	String aadharnumber=null;
	int block = 0;
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{			
		}
		else
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement("select aadharnumber from treg where name=? and pass=?");
			ps.setString(1, name);
			ps.setString(2, pwd);
			ps.executeQuery();
			rs = ps.getResultSet();
			while(rs.next())
			{
				aadharnumber=rs.getString("aadharnumber");				
			}
			System.out.println("aadharnumber is "+aadharnumber);
			int releas=Integer.parseInt(release);
			
			ps1 =con.prepareStatement("select balance from tbankaccount where aadharnumber=? and bankname=?");
			ps1.setString(1, aadharnumber);
			ps1.setString(2, bank);
			System.out.println(ps1.executeQuery()+" "+ps1);
			rs1 = ps1.getResultSet();
			while(rs1.next())
			{
				balance=rs1.getString("balance");							
				System.out.println("old balance      = "+balance);
				System.out.println("amount released  = "+release);
			}
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			int balan=Integer.parseInt(balance);
			balan=balan+releas;
			System.out.println("new balance      = "+String.valueOf(balan));
			
			con = JDBCHelper.getConnection();
			ps2 =con.prepareStatement("update tbankaccount set balance=? where aadharnumber=? and bankname=?");
			ps2.setString(1, String.valueOf(balan));
			ps2.setString(2, aadharnumber);
			ps2.setString(3, bank);
			System.out.println(ps2.execute()+" "+ps2);
			
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			con = JDBCHelper.getConnection();
			ps2 =con.prepareStatement("update tbankaccount set balance=? where aadharnumber=? and bankname=?");
			ps2.setString(1, String.valueOf(balan));
			ps2.setString(2, aadharnumber);
			ps2.setString(3, bank);
			System.out.println(ps2.execute()+" "+ps2);
			
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			con = JDBCHelper.getConnection();
			ps2 =con.prepareStatement("update tbankaccount set balance=? where aadharnumber=? and bankname=?");
			ps2.setString(1, String.valueOf(balan));
			ps2.setString(2, aadharnumber);
			ps2.setString(3, bank);
			System.out.println(ps2.execute()+" "+ps2);
			
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			con = JDBCHelper.getConnection();
			ps3 =con.prepareStatement("select balance from tbankaccount where aadharnumber=?");
			ps3.setString(1, aadharnumber);
			System.out.println(ps3.executeQuery()+" "+ps3);
			rs2 = ps3.executeQuery();
			while(rs2.next())
			{
				System.out.println("total balance available = "+rs2.getString("balance"));
			}
			
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			con = JDBCHelper.getConnection();
			ps4 =con.prepareStatement("select blockamount from traders_blocked_amount where aadharnumber=?");
			ps4.setString(1, aadharnumber);
			System.out.println(ps4.executeQuery()+" "+ps4);
			rs3 = ps4.executeQuery();
			while(rs3.next())
			{
				block=Integer.parseInt(rs3.getString("blockamount"));				
			}
			
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			con = JDBCHelper.getConnection();
			System.out.println("old blocked amount      = "+block);
			System.out.println("amount released         = "+release);
			block=block-releas;
			System.out.println("new blocked amount      = "+block);
			ps =con.prepareStatement("update traders_blocked_amount set blockamount=? where aadharnumber=?");
			ps.setString(1, String.valueOf(block));
			ps.setString(2, aadharnumber);
			System.out.println(ps.execute()+" "+ps);
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
			con = JDBCHelper.getConnection();
			ps1 =con.prepareStatement("select blockamount from traders_blocked_amount where aadharnumber=?");
			ps1.setString(1, aadharnumber);
			System.out.println(ps1.executeQuery()+" "+ps1);
			rs2 = ps1.getResultSet();
			while(rs2.next())
			{
				block=Integer.parseInt(rs2.getString("blockamount"));		
				System.out.println("block amount is  "+block);
			}
			JDBCHelper.Close(ps);
			JDBCHelper.Close(ps1);
			JDBCHelper.Close(ps2);
			JDBCHelper.Close(ps3);
			JDBCHelper.Close(ps4);
			JDBCHelper.Close(con);
			
	return block;
	}
		}
	catch(Exception e)
	{e.printStackTrace();
	
	try {
		con.rollback();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	}
	finally
	{
		JDBCHelper.Close(ps);
		JDBCHelper.Close(ps1);
		JDBCHelper.Close(ps2);
		JDBCHelper.Close(ps3);
		JDBCHelper.Close(ps4);
		JDBCHelper.Close(con);
	}	
	return block;
}

@SuppressWarnings("resource")
public void PostAuction() 
{
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	PreparedStatement ps5 = null;
	PreparedStatement ps6 = null;
	Connection con = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	try
	{
		con = JDBCHelper.getConnection();
		if(con == null)
		{
			System.out.println("Connection not established!");
		}
		else
		{	
			System.out.println("Inside model.....");
			ps=con.prepareStatement("select * from tradelist");
			ps.execute();
			rs = ps.getResultSet();
			while(rs.next())
			{
				System.out.println("lotnumber is "+rs.getString("lotnum"));
				ps1=con.prepareStatement("select tbp.marketcess,tbp.bidprice,tbp.lotcost,tbp.commission,tbp.myfinalcost,tbp.bestbid,tbp.quantityassigned from traders_bid_price tbp where tbp.aadharnumber=? and tbp.lotnum=?");
				ps1.setString(1,rs.getString("aadharnumber"));
				ps1.setString(2,rs.getString("lotnum"));
				ps1.execute();
				rs2=ps1.getResultSet();
				System.out.println(ps1);
				while(rs2.next())
				{
					ps2=con.prepareStatement("insert into trader_histroy values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					ps2.setString(1,rs.getString("aadharnumber"));
					ps2.setString(2,rs.getString("lotnum"));
					ps2.setString(3,rs.getString("marketcode"));
					ps2.setString(4,rs.getString("produce"));
					ps2.setString(5,rs.getString("qualitygrade"));
					ps2.setString(6,rs2.getString("bidprice"));
					ps2.setString(7,rs2.getString("myfinalcost"));
					ps2.setString(8,rs2.getString("bestbid"));
					ps2.setString(9,rs.getString("quantity"));
					ps2.setString(10,rs.getString("quantityneeded"));
					ps2.setString(11,rs2.getString("quantityassigned"));
					ps2.setString(12,rs.getString("slotnumber"));
					ps2.setString(13,rs2.getString("lotcost"));
					ps2.setString(14,rs2.getString("commission"));
					ps2.setString(15,rs2.getString("marketcess"));
					ps2.setString(16,rs.getString("created_at"));
					ps2.execute();
					System.out.println(ps2+" added entry into histroy table");		
	
					
					ps2=con.prepareStatement("delete from traders_bid_price where aadharnumber=? and lotnum=?");
					ps2.setString(1,rs.getString("aadharnumber"));
					ps2.setString(2,rs.getString("lotnum"));
					ps2.execute();
					System.out.println(ps2);
					System.out.println(ps2+" Data deleted from traders_bid_price");
					
					ps3=con.prepareStatement("delete from tradelist where aadharnumber=? and lotnum=?");
					ps3.setString(1,rs.getString("aadharnumber"));
					ps3.setString(2,rs.getString("lotnum"));
					ps3.execute();
					System.out.println(ps3+" Data deleted from tradelist");
					
					ps4=con.prepareStatement("delete from auction_result where aadharnumber=? and lotnumber=?");
					ps4.setString(1,rs.getString("aadharnumber"));
					ps4.setString(2,rs.getString("lotnum"));
					ps4.execute();
					System.out.println(ps4+" Data deleted from auction_result");
					
					/*ps5=con.prepareStatement("delete from productentry where lotnumber=?");
					ps5.setString(1,rs.getString("lotnum"));
					ps5.execute();
					System.out.println(ps5+" Data deleted from productentry");
					*/
					ps6=con.prepareStatement("update traders_blocked_amount set blockamount=0 and fund_utilized=0");
					ps6.execute();
					System.out.println(ps6+" Data updated from traders_blocked_amount");
					
					ps6=con.prepareStatement("update tbankaccount set balance=1000000");
					ps6.execute();
				}
			}
			ps6=con.prepareStatement("update traders_blocked_amount set blockamount=0, fund_utilized=0");
			ps6.execute();
			System.out.println(ps6);
			
			
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		JDBCHelper.Close(ps);
		JDBCHelper.Close(ps1);
		JDBCHelper.Close(ps2);
		JDBCHelper.Close(ps3);
		JDBCHelper.Close(ps4);
		JDBCHelper.Close(ps5);
		JDBCHelper.Close(ps6);
		JDBCHelper.Close(rs);
		JDBCHelper.Close(rs2);
		JDBCHelper.Close(con);
	}
  }

	public String adminLogin(String aname, String apwd) 
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String msg = "";
		try
		{
			con = JDBCHelper.getConnection();
			if(con == null)
			{
				System.out.println("Connection not established");
			}
			else
			{
				con.setAutoCommit(false);
				String sql = "select pass from areg where name=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, aname);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					String pass = rs.getString("pass");
					if(pass.equals(apwd))
					{
						System.out.println("Success: "+pass.equals(apwd));
						msg = msg + "SUCCESS";
					}
					else
					{
						msg = msg + "Username/Password is incorrect";
					}
				}
				else
				{
					msg = msg + "Username/Password is incorrect";
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
			e1.printStackTrace();
			}
		}
		finally
		{
			JDBCHelper.Close(rs);
			JDBCHelper.Close(pstmt);
			JDBCHelper.Close(con);
		}
		return msg;
	}

	public String addTradeAgain(String lotnumber, TraderLoginBean tlbn, String quantityneeded) 
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
				Calendar calendar = Calendar.getInstance();
		        TimeZone fromTimeZone = calendar.getTimeZone();
		        TimeZone toTimeZone = TimeZone.getTimeZone("MST");

		        calendar.setTimeZone(fromTimeZone);
		        calendar.add(Calendar.MILLISECOND, fromTimeZone.getRawOffset() * -1);
		        if (fromTimeZone.inDaylightTime(calendar.getTime())) {
		            calendar.add(Calendar.MILLISECOND, calendar.getTimeZone().getDSTSavings() * -1);
		        }

		        calendar.add(Calendar.MILLISECOND, toTimeZone.getRawOffset());
		        if (toTimeZone.inDaylightTime(calendar.getTime())) 
		        {
		            calendar.add(Calendar.MILLISECOND, toTimeZone.getDSTSavings());
		        }
		        System.out.println("************"+calendar.getTime()); 
				
				con.setAutoCommit(false);
		//		System.out.println("traders name and password has been saved in setters in model as "+tlbn.getTname()+" and "+tlbn.getTpwd());
				ps =con.prepareStatement("select aadharnumber from treg where name = ? and pass=?");
				ps.setString(1, tlbn.getTname());
				ps.setString(2, tlbn.getTpwd());
				ps.execute();
				rs = ps.getResultSet();
				while(rs.next())
				{
					 aadharnumber=rs.getString("aadharnumber");
				}				
				JDBCHelper.Close(ps);
				JDBCHelper.Close(con);
				
				con = JDBCHelper.getConnection();
				ps = con.prepareStatement("update tradelist set quantityneeded=? where aadharnumber=? and lotnum=?");
				ps.setString(2,aadharnumber);
				ps.setString(1,quantityneeded);
				ps.setString(3,lotnumber);
				ps.execute();
				System.out.println(ps);
				rs = ps.getResultSet();
				return null;
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

	public String Slotchange() 
	{
		String msg = null;
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
				/*ps=con.prepareStatement("update productentry set slotnumber='nill' where slotnumber='slot1'");
				ps.execute();
				System.out.println(ps);
				*/
				ps=con.prepareStatement("select * from productentry where slotnumber='slot1'");
				ps.execute();
				rs=ps.getResultSet();
				if(rs.next()){
					System.out.println("LOTS ARE STILL PRESENT IN SLOT 1 ");
				}
				else
					System.out.println("lots are removed");
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
		return null;
		
	}
}