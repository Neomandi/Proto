package com.neomandi.prototype;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

/**
 * Servlet implementation class ControllerServlet
 */
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    static int maxvol = 0;
    
    private static void setVal(int maxvol2) {
		maxvol = maxvol2;
		
	}
    
    public static int getVal()
    {
    	return maxvol;
    }
	
	public static void process(HttpServletRequest request,HttpServletResponse response)
	{
		
		RequestDispatcher rd=null;	
		
		RequestDispatcher rd1=null;	
		EmployeeRegisterBean erb = (EmployeeRegisterBean) request.getAttribute("ebean");
		EmployeeLoginBean elbn = (EmployeeLoginBean) request.getAttribute("elbean");
		FarmerRegisterBean frb = (FarmerRegisterBean) request.getAttribute("frreg");
		TraderRegisterBean trb = (TraderRegisterBean) request.getAttribute("trbean");
		FarmerLoginBean flbn = (FarmerLoginBean) request.getAttribute("flbean");
		ProductSearchBean psb = (ProductSearchBean) request.getAttribute("product");
		ProductEntryBean peb = (ProductEntryBean) request.getAttribute("pe");
		ActionTrailBean atbean = (ActionTrailBean) request.getAttribute("atbean");
		SummaryBean sb=(SummaryBean)request.getAttribute("sb");
		
		//ControllerServlet.setVal(atbean.getMaxvol()); 
		
		
		String uri=request.getRequestURI();
		
		System.out.println(uri);
		
		//Employee Registration
		if(uri.contains("EmployeeRegister"))
		{
			Model m = new Model();
			String msg = m.employeeRegister(erb);
			if(msg.equals("SUCCESS"))
			{
				rd=request.getRequestDispatcher("Success.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("EmployeeRegister.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//Farmer Registration
		if(uri.contains("FarmerRegister"))
		{
			Model m = new Model();
			String msg = m.farmerRegister(frb);
			if(msg.equals("SUCCESS"))
			{
				rd=request.getRequestDispatcher("Success.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("FarmerRegister.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//Farmer Login
		if(uri.contains("FarmerLogin"))
		{
			String name=flbn.getFname();
			String pass=flbn.getFpwd();
			Model m = new Model();
			String msg = m.farmerLogin(flbn);
			if(msg.equals("SUCCESS"))
			{
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				HttpSession hs=request.getSession();
				hs.setAttribute("date", date);
				hs.setAttribute("time",date2);
				hs.setAttribute("name", name);
				hs.setAttribute("pass",pass);
				rd=request.getRequestDispatcher("FarmerMaster.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("FarmerLogin.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//farmer trade summary
				if(uri.contains("GetSummary")){
					System.out.println("in cs uri="+uri);
					HttpSession hs=request.getSession(false);
					String name=(String) hs.getAttribute("name");
					String pass=(String) hs.getAttribute("pass");
					System.out.println("in cs pass="+pass);
					System.out.println("in cs name="+name);
					Model m = new Model();
					sb=m.getSummary(name, pass, sb);
					
					System.out.println(" in cs sb="+sb);
					String lotnumber=sb.getLotnumber();
					String lotsize=sb.getLotsize();
					String quantitysold=sb.getQuantitysold();
					String averageprice=sb.getAverageprice();
					String finalprice=sb.getFinalprice();
					String status=sb.getStatus();
					System.out.println(("in cs avg="+averageprice));
					
					HttpSession hsr=request.getSession();
					hsr.setAttribute("lotnumber",lotnumber);
					hsr.setAttribute("lotsize",lotsize);
					hsr.setAttribute("quantitysold", quantitysold);
					hsr.setAttribute("averageprice", averageprice);
					hsr.setAttribute("finalprice", finalprice);
					hsr.setAttribute("status", status);
					rd=request.getRequestDispatcher("GetSummary.jsp");
					
				
					try 
					{
						rd.forward(request, response);			
					}			
					catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
				}
				if(uri.contains("AcceptSummary.do")){
					System.out.println("in cs uri="+uri);
					HttpSession hs=request.getSession(false);
					String name=(String) hs.getAttribute("name");
					String pass=(String) hs.getAttribute("pass");
					System.out.println("in cs pass="+pass);
					System.out.println("in cs name="+name);
					Model m = new Model();
					sb=m.getSummary(name, pass, sb);
					
					System.out.println(" in cs sb="+sb);
					String lotnumber=sb.getLotnumber();
					String lotsize=sb.getLotsize();
					String quantitysold=sb.getQuantitysold();
					String averageprice=sb.getAverageprice();
					String finalprice=sb.getFinalprice();
					String status=sb.getStatus();
					System.out.println(("in cs avg="+averageprice));
					
					HttpSession hsr=request.getSession();
					hsr.setAttribute("lotnumber",lotnumber);
					hsr.setAttribute("lotsize",lotsize);
					hsr.setAttribute("quantitysold", quantitysold);
					hsr.setAttribute("averageprice", averageprice);
					hsr.setAttribute("finalprice", finalprice);
					hsr.setAttribute("status", status);
					rd=request.getRequestDispatcher("AcceptSummary.jsp");
					
				
					try 
					{
						rd.forward(request, response);			
					}			
					catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				if(uri.contains("RejectSummary.do")){
					System.out.println("in cs uri="+uri);
					HttpSession hs=request.getSession(false);
					String name=(String) hs.getAttribute("name");
					String pass=(String) hs.getAttribute("pass");
					System.out.println("in cs pass="+pass);
					System.out.println("in cs name="+name);
					Model m = new Model();
					sb=m.getSummary(name, pass, sb);
					
					System.out.println(" in cs sb="+sb);
					String lotnumber=sb.getLotnumber();
					String lotsize=sb.getLotsize();
					String quantitysold=sb.getQuantitysold();
					String averageprice=sb.getAverageprice();
					String finalprice=sb.getFinalprice();
					String status=sb.getStatus();
					System.out.println(("in cs avg="+averageprice));
					
					HttpSession hsr=request.getSession();
					hsr.setAttribute("lotnumber",lotnumber);
					hsr.setAttribute("lotsize",lotsize);
					hsr.setAttribute("quantitysold", quantitysold);
					hsr.setAttribute("averageprice", averageprice);
					hsr.setAttribute("finalprice", finalprice);
					hsr.setAttribute("status", status);
					rd=request.getRequestDispatcher("RejectSummary.jsp");
					
				
					try 
					{
						rd.forward(request, response);			
					}			
					catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
		
		
		
	
		
		
		//Employee Login
		if(uri.contains("EmployeeLogin"))
		{
			String name=elbn.getEname();
			Model m = new Model();
			String msg = m.employeeLogin(elbn);
			if(msg.equals("SUCCESS"))
			{
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				HttpSession hc=request.getSession();
				hc.setAttribute("date", date);
				hc.setAttribute("time",date2);
				hc.setAttribute("name", name);
				
				HttpSession elog = request.getSession();
				elog.setAttribute("name", elbn.getEname());
				elog.setAttribute("pwd", elbn.getEpwd());
				
				rd=request.getRequestDispatcher("ProductEntry.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("EmployeeLogin.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		//Trader Registration
		if(uri.contains("TraderRegister"))
		{
			System.out.println("***************************************************************************");
			Model m = new Model();
			String msg = m.traderRegister(trb);
			if(msg.equals("SUCCESS"))
			{
				rd=request.getRequestDispatcher("TraderMasterPage.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("TraderRegister.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//Trader Login
		if(uri.contains("TraderLogin"))
		{
			System.out.println("***************************************************************************");
			TraderLoginBean tlbn = (TraderLoginBean) request.getAttribute("tlbean");
			HttpSession tlog=request.getSession();
			tlog.setAttribute("tlog",tlbn);
			String name=tlbn.getTname();
			System.out.println("trader name is "+name);
			System.out.println("inside cs->if(..)");
			Model m = new Model();
			String msg = m.traderLogin(tlbn);
			if(msg.equals("SUCCESS"))
			{
				System.out.println("trader has successfully logged in...:-D....");		
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String time=df1.format(new Date());
				HttpSession hc=request.getSession();
				hc.setAttribute("date", date);
				hc.setAttribute("time",time);
				hc.setAttribute("name", name);
				System.out.println("dt is "+date+" time is "+time);
				rd=request.getRequestDispatcher("TraderMasterPage.jsp");
				try 
				{
					System.out.println("before forwarding");
					rd.forward(request,response);			
				}			
				catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("TraderLogin.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}	
		
		
		if(uri.contains("ProductSearch"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("ProductSearch.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			Model m=new Model();
			List<ProductSearchResultBean> msg = m.productSearch(psb);
			System.out.println("list which is being sent to ProductSearch is "+msg);//sending the product list from product entry to product serch result  
			HttpSession psr=request.getSession();
			psr.setAttribute("beans", msg);
			request.setAttribute("productsearchresult", "productsearchresult");
			rd=request.getRequestDispatcher("ProductSearch.jsp");
			try 
			{
				rd.forward(request, response);			
			}			
			catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//Add Trade
		if(uri.contains("AddTrade"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("ProductSearch.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String lotnumber = request.getParameter("s1");
			System.out.println("inside CS-> inside AddTrade()->"+lotnumber);
			Model m = new Model();
			String msg = m.addTrade(lotnumber,tlbn);
			if(msg.contains("SUCCESS"))
			{
				
				String msg1=msg.substring(7);
				msg="Product "+msg1+" with lotnumber "+lotnumber+" has been added successfully to trade";
				System.out.println("message sent is "+msg);
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("ProductSearch.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {

					e.printStackTrace();
				} catch (IOException e) {

					e.printStackTrace();
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("ProductSearch.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//Product Entry
		if(uri.contains("ProductEntry"))
		{			
			System.out.println("***************************************************************************");
			Model m = new Model();
			String msg = m.productEntry(peb);
			if(msg.equals("SUCCESS"))
			{
				System.out.println("Sending msg "+msg);
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("ProductEntry.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("ProductEntry.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
		}
		
		if(uri.contains("traderblockbank"))
		{
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderBlock.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
				System.out.println("***************************************************************************");
				//HttpSession tlog=request.getSession(false);
				//TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				String name=tlbn.getTname();
				String pwd=tlbn.getTpwd();
				String bankname="";
				if(request.getParameter("ICICI")!=null && request.getParameter("ICICI").equals("on"))
				{
					 bankname="ICICI";
				}
				else if(request.getParameter("SBI")!=null && request.getParameter("SBI").equals("on"))
				{
					 bankname="SBI";
				}
				else if(request.getParameter("HDFC")!=null && request.getParameter("HDFC").equals("on"))
				{
					 bankname="HDFC";
				}
				else if(request.getParameter("SBM")!=null && request.getParameter("SBM").equals("on"))
				{
					 bankname="SBM";
				}
				else if(request.getParameter("CITI")!=null && request.getParameter("CITI").equals("on"))
				{
					 bankname="CITI";
				}
				System.out.println("bankname "+bankname);
				System.out.println("inside CS()-> inside method...banks selected is "+bankname);
				Model m=new Model();
				TraderBlockBean tbb=m.traderBlockBank(bankname,name,pwd);
				HttpSession traderblockbean=request.getSession();
				traderblockbean.setAttribute("tbb", tbb);
				if(tbb.getMsg().contains("SUCCESS"))
				{
					HttpSession hcs=request.getSession();
					hcs.setAttribute("bean",tbb);
					System.out.println("msg sent is SUCCESS");
					request.setAttribute("msg","SUCCESS");
					rd=request.getRequestDispatcher("TraderBlock.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						e.printStackTrace();
					}
				}
				else
				{
					HttpSession hcs=request.getSession();
					hcs.setAttribute("bean",tbb);
					System.out.println("msg sen to model is you dont have account in this bank...Please select other bank");
					request.setAttribute("msg","you dont have account in this bank...Please select other bank");
					rd=request.getRequestDispatcher("TraderBlock.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}			
		}
		
		if(uri.contains("traderblockamount"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			if(tlbn.getTname()==null)
			{
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderBlock.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
			else
			{		
				String name=tlbn.getTname();
				String pwd=tlbn.getTpwd();
				String amount=request.getParameter("block");
				System.out.println("amount length is "+amount.length());
				String bankname=request.getParameter("bank");
				HttpSession traderbank=request.getSession();
				traderbank.setAttribute("traderbank", bankname);
				String accno=request.getParameter("accno");
				Model m=new Model();
				String msg[]=m.traderblockamount(name,pwd,amount,bankname,accno);
				System.out.println("message received by CS is "+msg);
				if(msg[1]==null)
				{
					request.setAttribute("blockmsg",msg[0]);
					rd=request.getRequestDispatcher("TraderBlock.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) 
					{
						e.printStackTrace();
					}	
				}
				else
				{
					int balance=Integer.parseInt(msg[0]);
					int block=Integer.parseInt(msg[1]);
					HttpSession traderblockbean=request.getSession(false);
					TraderBlockBean tbb=(TraderBlockBean)traderblockbean.getAttribute("tbb");
					tbb.setBalance(balance);
					request.setAttribute("blockamount",amount);
					request.setAttribute("totalblock",block);
					request.setAttribute("blockmsg",msg[0]);
					rd=request.getRequestDispatcher("TraderBlock.jsp");
					try 
					{
						rd.forward(request, response);
					} catch (ServletException | IOException e) 
					{
						e.printStackTrace();
					}
				}
				/*request.setAttribute("blockmsg",noinput);
					rd=request.getRequestDispatcher("TraderBlock.jsp");
					try 
					{
						rd.forward(request, response);
					} 
					catch (ServletException | IOException e) 
					{
						e.printStackTrace();
					}		
				}*/
			}
		}
		
		if(uri.contains("TradeorAuction"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
		
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			Model m=new Model();
			List<TradeListBean> al=m.tradeOrAuction(name,pwd);
			HttpSession traderlistbean=request.getSession();
			traderlistbean.setAttribute("tlb",al);
			rd=request.getRequestDispatcher("TraderorAuction2.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) 
			{
				e.printStackTrace();
			}	
		}
		
		
		if(uri.contains("SubmitIncrement1"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			HttpSession traderbank=request.getSession(false);
			String bank=(String)traderbank.getAttribute("traderbank");
			Model m=new Model();
			String lotnumber=request.getParameter("lotnum");
			Myclass mc=(Myclass)m.submitIncrementOne(name,pwd,lotnumber,bank);
			if(mc.getMsg().matches(".*\\d+.*"))
			{
				request.setAttribute("msg", mc.getMsg());
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
			else
			{
				@SuppressWarnings("rawtypes")
				List al=mc.getAl();
				HttpSession MyFinalCost=request.getSession(true);
				MyFinalCost.setAttribute("MyFinalCost",al);
				request.setAttribute("smsg", "success");				
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try 
				{
					rd.forward(request, response);
				}
				catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		if(uri.contains("SubmitIncrement2"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			try
			{
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			HttpSession traderbank=request.getSession(false);
			String bank=(String)traderbank.getAttribute("traderbank");
			Model m=new Model();
			String lotnumber=request.getParameter("lotnum");
			Myclass mc=(Myclass)m.submitIncrementTwo(name,pwd,lotnumber,bank);
			if(mc.getMsg().matches(".*\\d+.*"))
			{
				request.setAttribute("msg", mc.getMsg());
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
			else
			{
				List al=mc.getAl();
				HttpSession MyFinalCost=request.getSession(true);
				MyFinalCost.setAttribute("MyFinalCost",al);
				request.setAttribute("smsg", "success");				
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try 
				{
					rd.forward(request, response);
				}
				catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
		}
		
		if(uri.contains("removelotnumber"))
		{
			System.out.println("***************************************************************************");
			String lotnumber=request.getParameter("lotnum");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			System.out.println("inside CS()-> name is "+name+" "+pwd);
			Model m=new Model();
			List<TradeListBean> al=m.removeLotNumber(lotnumber,name,pwd);
			HttpSession traderlistbean=request.getSession(false);
			traderlistbean.setAttribute("tlb",al);
			System.out.println("inside traderlistbean is "+al);
			HttpSession remove=request.getSession();
			remove.setAttribute("list", al);
			request.setAttribute("remove","hi");
			rd=request.getRequestDispatcher("TraderorAuction2.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) 
			{
				e.printStackTrace();
			}	
		}
		
		if(uri.contains("logout"))
		{
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			if(tlbn!=null)
			{
				tlog.invalidate();
				rd=request.getRequestDispatcher("TraderLogin.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}	
			}
		}
		
		if(uri.contains("ActionTrail"))
		{
			Model m = new Model();
			String msg = m.actionTrail(atbean);
			if(msg.equals("SUCCESS"))
			{
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("AuctionTrailPage.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				//
			}
		}
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(uri.contains("ELogout"))
		{
			HttpSession elog = request.getSession(false);
			if(elog!=null)
			{ 
				elog.invalidate();
				//System.out.println(elog.getAttribute("name")+" "+elog.getAttribute("pwd"));
				out.println("alert('YOU HAVE  LOGGED OUT SUCCESSFULLY ');");
				rd=request.getRequestDispatcher("EmployeeLogin.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				out.println("<html><head><script>alert('Please Login!!');<script></head></html>");
			}
		}
		
		
		//farmer logout
		if(uri.contains("Logout"))
		{
			HttpSession flog = request.getSession(false);
			if(flog!=null)
			{ 
				flog.invalidate();
				//System.out.println(elog.getAttribute("name")+" "+elog.getAttribute("pwd"));
				out.println("alert('YOU HAVE  LOGGED OUT SUCCESSFULLY ');");
				rd=request.getRequestDispatcher("FarmerLogin.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
			{
				out.println("<html><head><script>alert('Please Login!!');<script></head></html>");
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

}
