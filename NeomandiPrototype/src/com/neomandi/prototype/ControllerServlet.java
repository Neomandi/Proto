package com.neomandi.prototype;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.collections4.bag.SynchronizedSortedBag;

import sun.print.PrinterJobWrapper;

@MultipartConfig(maxFileSize = 16177215)
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //static int maxvol = 0;
	private static String traderPin;
    
    /*private static void setVal(int maxvol2) {
		maxvol = maxvol2;
		
	}
    
    public static int getVal()
    {
    	return maxvol;
    }*/
	
	public static void process(HttpServletRequest request,HttpServletResponse response)
	{		
		RequestDispatcher rd=null;	
		EmployeeRegisterBean erb = (EmployeeRegisterBean) request.getAttribute("ebean");
		//EmployeeLoginBean elbn = (EmployeeLoginBean) request.getAttribute("elbean");

		//FarmerRegisterBean frb = (FarmerRegisterBean) request.getAttribute("frreg");
		TraderRegisterBean trb = (TraderRegisterBean) request.getAttribute("trbean");

		FarmerRegisterBean frb = (FarmerRegisterBean) request.getAttribute("frreg");
		//TraderRegisterBean trb = (TraderRegisterBean) request.getAttribute("trbean");

		FarmerLoginBean flbn = (FarmerLoginBean) request.getAttribute("flbean");
		//TraderLoginBean tlbn=(TraderLoginBean) request.getAttribute("tlbean");
		ProductSearchBean psb = (ProductSearchBean) request.getAttribute("product");
		//ProductEntryBean peb = (ProductEntryBean) request.getAttribute("pe");
		ActionTrailBean atbean = (ActionTrailBean) request.getAttribute("atbean");
		SummaryBean sb=(SummaryBean)request.getAttribute("sb");	
		String starttime = "";
		String endtime = "";
		String uri=request.getRequestURI();		
		if(uri.contains("refresh")||uri.contains("Status2"))
		{}else
			System.out.println(uri);		
		//Employee Registration
		
		
		if(uri.contains("Start"))
		{
			starttime = request.getParameter("starttime");
			endtime = request.getParameter("endtime");
			System.out.println("Starttime: "+starttime);
			System.out.println("Endtime: "+endtime);
			HttpSession fss = request.getSession();
			fss.setAttribute("starttime", starttime);
			fss.setAttribute("endtime", endtime);
			
			ServletContext context = request.getSession().getServletContext();
			context.setAttribute("starttime", starttime);
			context.setAttribute("endtime", endtime);
			
			HttpSession tss = request.getSession();
			tss.setAttribute("starttime", starttime);
			tss.setAttribute("endtime", endtime);
			boolean flag = true;
			
			SchedulerServlet.process(starttime, endtime, flag);
		}
		
		if(uri.contains("EmployeeRegister"))
		{
			System.out.println("********************************************");
			Model m = new Model();
			System.out.println(erb);
			String msg = m.employeeRegister(erb);
			
			if(msg.equals("SUCCESS"))
			{
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("EmployeeRegister.jsp");
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
			    rd=request.getRequestDispatcher("EmployeeRegister.jsp");
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
		
		//Farmer Registration
		if(uri.contains("FarmerRegister"))
		{
			System.out.println("**********************************************************");
			/*String farmerName = request.getParameter("farmername");
			long farmerMobile = Long.valueOf(request.getParameter("farmermobile")).longValue();
			long farmerAadharnum = Long.valueOf(request.getParameter("farmeraadharnum")).longValue();
			String farmerEmail = request.getParameter("farmeremail");
			String farmerState = request.getParameter("farmerstate");
			String farmerDistrict = request.getParameter("farmerdistrict");
			String farmerTaluk = request.getParameter("farmertaluk");
			String farmerHobli = request.getParameter("farmerhobli");
			String farmerVillage = request.getParameter("farmervillage");
			String farmerBankName = request.getParameter("farmerbankname");
			long farmerAccountNum = Long.valueOf(request.getParameter("farmeraccountnum")).longValue();
			String farmerBranch = request.getParameter("farmerbranch");
			String farmerIfscCode = request.getParameter("farmerifsccode");
			
			System.out.println("The fname: "+farmerName+" The mobile: "+farmerMobile+" The Aadhar number: "+farmerAadharnum+" The Email: "+farmerEmail+" The state: "+farmerState+" The district: "+farmerDistrict+" The taluk: "+farmerTaluk+" The hobli: "+farmerHobli+" The village: "+farmerVillage+" The bankname: "+farmerBankName+" The accountnum: "+farmerAccountNum+" The branchname: "+farmerBranch+" The IFSC code: "+farmerIfscCode);
			
			InputStream farmerPhoto = null; // input stream of the upload file

			// obtains the upload file part in this multipart request
	        Part filePart = null;;
			try {
				filePart = request.getPart("farmerPhoto");
			} catch (IllegalStateException | IOException | ServletException e1) {
				
				e1.printStackTrace();
			}
	        
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            try {
	            	farmerPhoto = filePart.getInputStream();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
	        }
	        
			System.out.println(filePart);
			System.out.println(farmerPhoto);*/
			
			Model m = new Model();
			System.out.println(frb);
			String msg = m.farmerRegister(frb);
			System.out.println("msg is "+msg);
			if(msg.equals("SUCCESS"))
			{
				rd=request.getRequestDispatcher("FarmerRegister.jsp");
				try 
				{
					request.setAttribute("errmsg", "success");
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
			    rd=request.getRequestDispatcher("FarmerRegister.jsp");
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
		
		//Farmer Login
		if(uri.contains("FarmerLogin"))
		{
			String name=request.getParameter("name");
			String pass=request.getParameter("pwd");
			Model m = new Model();
			String msg = m.farmerLogin(name,pass);
			System.out.println("mag is "+msg);
			if(msg.equals("SUCCESS"))
			{
				HttpSession fss = request.getSession(false);
				starttime = (String) fss.getAttribute("starttime");
				endtime = (String) fss.getAttribute("endtime");
				System.out.println("FLogin sttime: "+starttime);
				System.out.println("Flogin etime: "+endtime);
				
				
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				HttpSession hs=request.getSession();
				hs.setAttribute("starttime", starttime);
				hs.setAttribute("endtime",endtime);
				hs.setAttribute("name", name);
				hs.setAttribute("pass",pass);
				ServletContext context = request.getSession().getServletContext();
				starttime=(String)context.getAttribute("starttime");
				endtime=(String)context.getAttribute("endtime");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("SUCCESS");
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			else
			{

				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println(msg);
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
//				request.setAttribute("errmsg", msg);
//			    rd=request.getRequestDispatcher("FarmerLogin.jsp");
//				try 
//				{
//					rd.forward(request, response);			
//				}			
//				catch (ServletException e) {
//					
//					e.printStackTrace();
//				} catch (IOException e) {
//					
//					e.printStackTrace();
//				}
			}
		}						
		if(uri.contains("Averageprice")){
			

			String farmerid=request.getParameter("farmerid");

			
			
			System.out.println("in cs farmerid="+farmerid);
			Model m = new Model();
			System.out.println("before model is called");
			@SuppressWarnings("unchecked")
			List<String> l = m.farmerMaster(farmerid);
			if(!l.isEmpty()) {
			System.out.print("after model is called"+l);
			String lotnumber=l.get(0);
			String averageprice=l.get(1);
			System.out.print("after model1 is called"+l);
			System.out.println(l.get(1)+" "+l.get(3));
			String quantity=l.get(2);
			String quantitybidfor=l.get(3);
			
			HttpSession hf=request.getSession();
			hf.setAttribute("lotnumber",lotnumber);
			hf.setAttribute("averageprice",averageprice);
			hf.setAttribute("quantity",quantity);
			hf.setAttribute("quantitybidfor",quantitybidfor);
			
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.println("averageprice"+l.get(1)+"averageprice for"+l.get(3)+"for");
			    out.flush();
			    out.close();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
			
			rd=request.getRequestDispatcher("FarmerMaster.jsp");
			
			return;
			}
			else{
				String msg="empty";
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("FarmerMaster.jsp");
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
			
				
				
			
		
		//Farmer logout
		if(uri.contains("FLogout"))
		{
			System.out.println("Inside FarmerLogout");
			HttpSession hc=request.getSession(false);
			if(hc!=null)
			{
				hc.removeAttribute("flbean");
				hc.invalidate();				
			}
/*			String msg="YOU HAVE SUCCESSFULLY LOGGED OUT";
			 request.setAttribute("logout", msg);*/
			 rd=request.getRequestDispatcher("FarmerLogin.jsp");	
			 try 
				{
					rd.forward(request, response);	
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					try 
				{
					rd.forward(request, response);	
					return;
				}			
				catch (ServletException e1) {
					
					e1.printStackTrace();
				} catch (IOException e3) {
					
					e3.printStackTrace();
				}
					e.printStackTrace();
				}
		}

		/*if(uri.contains("FarmerMaster")){
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
			String myearnings=sb.getMyearning();
			String slot=sb.getSlot();
			String aadhar=sb.getAadhar();
			System.out.println(("in cs avg="+averageprice));
			
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("finalprice", finalprice);
			hsr.setAttribute("status", status);
			hsr.setAttribute("aadhar", aadhar);
			hsr.setAttribute("slot",slot);
			rd=request.getRequestDispatcher("FarmerMaster.jsp");
			
		
			try 
			{
				rd.forward(request, response);			
			}			
			catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
			
		}*/
		//GetSummary
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
			
			//}
			String lotnumber=sb.getLotnumber();
			String lotsize=sb.getLotsize();
			String quantitysold=sb.getQuantitysold();
			String averageprice=sb.getAverageprice();
			String finalprice=sb.getFinalprice();
			String status=sb.getStatus();
			String myearnings=sb.getMyearning();
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
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
			
		}
		
		//AcceptSummary
		if(uri.contains("AcceptSummary"))
		{	
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
			String account=sb.getAccountnum();
			String msg="Accept";
			System.out.println(("in cs avg="+averageprice));
			m.employeeAcceptResult(quantitysold,lotnumber);
			
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("msg",msg);
			
			HttpSession farmerstatus=request.getSession();
			farmerstatus.setAttribute("msg",msg);
			farmerstatus.setAttribute("lotnumber",lotnumber);
			farmerstatus.setAttribute("accountnumber", account);
			System.out.println("**********************farmer is sending the accept request***************");
			m.TraderProductAccept(lotnumber,account);
			rd=request.getRequestDispatcher("AcceptSummary.jsp");
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
		
		//RejectSummary
		if(uri.contains("RejectSummary"))
		{
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
			String account=sb.getAccountnum();
			System.out.println(("in cs avg="+averageprice));
			String msg="reject";
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("finalprice", finalprice);
			hsr.setAttribute("status", status);
			m.employeeRejectResult(lotnumber);
			m.TraderProductReject(lotnumber);
			rd=request.getRequestDispatcher("RejectSummary.jsp");
			HttpSession farmerstatus=request.getSession();
			 farmerstatus.setAttribute("msg",msg);
			 farmerstatus.setAttribute("lotnumber",lotnumber);
			farmerstatus.setAttribute("accountnumber", account);
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

		if(uri.contains("BeforeAuction")){
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
			String account=sb.getAccountnum();
			System.out.println(("in cs avg="+averageprice));
		
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("finalprice", finalprice);
			hsr.setAttribute("status", status);
		
		
			rd=request.getRequestDispatcher("BeforeAuction.jsp");
			HttpSession farmerstatus=request.getSession();
			
			 farmerstatus.setAttribute("lotnumber",lotnumber);
			farmerstatus.setAttribute("accountnumber", account);
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
		
		if(uri.contains("DuringAuction")){
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
			String account=sb.getAccountnum();
			System.out.println(("in cs avg="+averageprice));
		
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("finalprice", finalprice);
			hsr.setAttribute("status", status);
		
		
			rd=request.getRequestDispatcher("DuringAuction.jsp");
			HttpSession farmerstatus=request.getSession();
			
			 farmerstatus.setAttribute("lotnumber",lotnumber);
			farmerstatus.setAttribute("accountnumber", account);
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
		
		if(uri.contains("AfterAuctionSummary")){
			System.out.println("in cs uri="+uri);
			HttpSession hs=request.getSession(false);
			String name=(String) hs.getAttribute("name");
			String pass=(String) hs.getAttribute("pass");
			System.out.println("in cs pass="+pass);
			System.out.println("in cs name="+name);
			Model m = new Model();
			sb=m.getSummary(name, pass, sb);
			String status="";
			System.out.println(" in cs sb="+sb);
			String lotnumber=sb.getLotnumber();
			String lotsize=sb.getLotsize();
			String quantitysold=sb.getQuantitysold();
			String averageprice=sb.getAverageprice();
			String finalprice=sb.getFinalprice();
			/*int lsize=Integer.parseInt(lotsize);
			int qsold=Integer.parseInt(quantitysold);
			*/
			
			
			System.out.println(("in cs avg="+averageprice));
			String msg="reject";
			HttpSession hsr=request.getSession();
			hsr.setAttribute("lotnumber",lotnumber);
			hsr.setAttribute("lotsize",lotsize);
			hsr.setAttribute("quantitysold", quantitysold);
			hsr.setAttribute("averageprice", averageprice);
			hsr.setAttribute("finalprice", finalprice);
		
			
			rd=request.getRequestDispatcher("AuctionSummary.jsp");
			HttpSession farmerstatus=request.getSession();
			 farmerstatus.setAttribute("msg",msg);
			 farmerstatus.setAttribute("lotnumber",lotnumber);
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
		//Employee Login
		if(uri.contains("EmployeeLogin"))
		{
			String ename=request.getParameter("ename");
			String epwd=request.getParameter("epwd");
			EmployeeLoginBean elbn = new EmployeeLoginBean();
			elbn.setEname(ename);
			elbn.setEpwd(epwd);
			Model m = new Model();
			//System.out.println("Elbn: "+elbn.getEname());
			//System.out.println("Elbn: "+elbn.getEpwd());
			String msg = m.employeeLogin(elbn);
			String arr[] = msg.split(":");
			if(arr[0].equals("SUCCESS"))
			{
				/*SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				*/
				HttpSession elog = request.getSession();
				elog.setAttribute("ename", elbn.getEname());
				elog.setAttribute("epwd", elbn.getEpwd());
				elog.setAttribute("eempnumber", arr[1]);
				
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("SUCCESS");
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				
				/*rd=request.getRequestDispatcher("ProductEntry.jsp");
				try 
				{
					rd.forward(request, response);	
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}*/
			}
			else
			{
				
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println(msg);
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				
				/*request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("EmployeeLogin.jsp");
				try 
				{
					rd.forward(request, response);
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}*/
			}
		}
		
		
		//Trader Registration
		if(uri.contains("TraderRegister"))
		{
			System.out.println("in cs uri="+uri);
			/*String traderName = request.getParameter("traderName");
			long traderMobile = Long.valueOf(request.getParameter("traderMobile")).longValue();
			long traderAadharnum = Long.valueOf(request.getParameter("traderAadharnum")).longValue();
			String traderEmail = request.getParameter("traderEmail");
			String traderState = request.getParameter("traderState");
			String traderDistrict = request.getParameter("traderDistrict");
			String traderTaluk = request.getParameter("traderTaluk");
			String traderHobli = request.getParameter("traderHobli");
			String traderVillage = request.getParameter("traderVillage");
			String traderBankName = request.getParameter("traderBankName");
			long traderAccountNum = Long.valueOf(request.getParameter("traderAccountNum")).longValue();
			String traderBranch = request.getParameter("traderBranch");
			String traderIfscCode = request.getParameter("traderIfscCode");
			String traderUid = request.getParameter("traderUid");
			String traderLicenseNum = request.getParameter("traderLicenseNum");
			String traderPwd = request.getParameter("traderPassword");
			String dateOfRegistration = request.getParameter("traderDateOfRegistration");
			String placeOfRegistration = request.getParameter("traderPlaceOfRegistration");
			String address = request.getParameter("traderAddress");
			String licenseState = request.getParameter("traderLicenseState");
			String licenseDistrict = request.getParameter("traderLiscenseDistrict");
			String licenseTaluk = request.getParameter("traderLicenseTaluk");
			String licensePin = request.getParameter("traderLicensePin");
			String bstate=request.getParameter("bstate");
			String bDistrict=request.getParameter("bDistrict");
			String bTaluk=request.getParameter("bTaluq");
			String bPin=request.getParameter("bPin");
			
			
			
			System.out.println("The fname: "+traderName+" The mobile: "+traderMobile+" The Aadhar number: "+traderAadharnum+" The Email: "+traderEmail+" The state: "+traderState+" The district: "+traderDistrict+" The taluk: "+traderTaluk+" The hobli: "+traderHobli+" The village: "+traderVillage+" The bankname: "+traderBankName+" The accountnum: "+traderAccountNum+" The branchname: "+traderBranch+" The IFSC code: "+traderIfscCode+" Date of Reg"+dateOfRegistration+" Place of Reg"+placeOfRegistration+" lstate "+licenseState+" ldistrict "+licenseDistrict+" ltaluk "+licenseTaluk+" lpin "+licensePin);*/
			
			InputStream traderPhoto = null; // input stream of the upload file

			// obtains the upload file part in this multipart request
	        Part filePart = null;
			try {
				filePart = request.getPart("traderPhoto");
			} catch (IllegalStateException | IOException | ServletException e1) {
				
				e1.printStackTrace();
			}
	        
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            try {
	            	traderPhoto = filePart.getInputStream();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
	        }
	        
			//System.out.println(filePart);
			//System.out.println(traderPhoto);
			
			//TraderRegisterBean tbean = new TraderRegisterBean(traderName, traderMobile, traderAadharnum, traderEmail, traderState, traderDistrict, traderTaluk, traderHobli, traderVillage, traderBankName, traderAccountNum, traderBranch, traderIfscCode, traderUid, traderLicenseNum, traderPwd, traderPhoto, dateOfRegistration, placeOfRegistration, address, licenseState, licenseDistrict, licenseTaluk, licensePin,bstate,bDistrict,bTaluk,bPin,);
			
			Model m = new Model();
			String msg = m.traderRegister(trb);
			if(msg.equals("SUCCESS"))
			{
				rd=request.getRequestDispatcher("TraderRegister.jsp");
				try 
				{
					request.setAttribute("errmsg",msg);
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
			    rd=request.getRequestDispatcher("TraderRegister.jsp");
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
		
		//Trader Login
		if(uri.contains("TraderLogin"))
		{
			System.out.println("***************************************************************************");
			TraderLoginBean tlbn = new TraderLoginBean();
			String name=request.getParameter("name");
			String pwd=request.getParameter("pwd");
			tlbn.setTname(name);
			tlbn.setTpwd(pwd);
			HttpSession tlog=request.getSession(true);
			tlog.setAttribute("tlog",tlbn);
			Model m = new Model();
			String msg = m.traderLogin(tlbn);
		//	System.out.println("msg received from model is "+msg);
			if(msg.equals("SUCCESS"))
			{
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String time=df1.format(new Date());
				HttpSession hc=request.getSession();
				hc.setAttribute("date", date);
				hc.setAttribute("time",time);
				hc.setAttribute("name", name);
//				System.out.println("dt is "+date+" time is "+time);
				 HttpSession psr=request.getSession();		           
		         psr.setAttribute("msg",null);
				
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("SUCCESS");
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				//System.out.println("success");				
			}
			else
			{
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println(msg);
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("TraderLogin.jsp");
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
		
		//Product Search
		if(uri.contains("ProductSearch"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn =null;
			try
			{
				tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("product.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			Model m=new Model();
			List<ProductSearchResultBean> msg = m.productSearch(psb);
			if(msg.isEmpty())
			{
				HttpSession psr=request.getSession();
				psr.setAttribute("msg", "nill");
				psr.setAttribute("category",psb.getCategory());
				psr.setAttribute("produce",psb.getProduce());
				psr.setAttribute("grade",psb.getGrade());
				psr.setAttribute("slot",psb.getSlot());				
				rd=request.getRequestDispatcher("product.jsp");
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
				HttpSession psr=request.getSession();
				psr.setAttribute("beans", msg);				
				request.setAttribute("productsearchresult", "productsearchresult");
				request.setAttribute("category",psb.getCategory());
				request.setAttribute("produce",psb.getProduce());
				request.setAttribute("grade",psb.getGrade());
				request.setAttribute("slot",psb.getSlot());
				RequestDispatcher rd1 = request.getRequestDispatcher("product.jsp");
				try 
				{
					rd1.forward(request, response);			
				}			
				catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//Add Trade
		if(uri.contains("AddTrade"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn =null;
			try
			{
				tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
				System.out.println(tlbn.getTname());
				if(tlbn.getTname().equals("ki"))
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("product.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String lotnumber = request.getParameter("s1");
			String quantity= request.getParameter("quantity");
			//System.out.println("inside CS-> inside AddTrade()->lotnumber is "+lotnumber+" quantity needed is "+quantity);
			Model m = new Model();
			System.out.println("request.getParameter(again"+request.getParameter("again"));
			if(request.getParameter("again")!=null)
			{
				m.addTradeAgain(lotnumber,tlbn,quantity);
			}
			else
			{
			String msg = m.addTrade(lotnumber,tlbn,quantity);
			if(msg.contains("SUCCESS"))
			{				
				String msg1=msg.substring(7);
				msg="Product "+msg1+" with lotnumber "+lotnumber+" has been added successfully to trade";
				System.out.println("message sent is "+msg);
				msg="success";
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("msg"+msg+"msg");
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("product.jsp");
				/*try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) {
							e.printStackTrace();
				} catch (IOException e) {
							e.printStackTrace();
				}*/ 
				return;
			}
			else if(msg.contains("fail"))
			{
				String ms=msg.substring(4);
				System.out.println("quantityalready bid for first time is"+ms);
				int old=Integer.parseInt(ms);
				int news=Integer.parseInt(quantity);
				if(news<old)
				{
					PrintWriter out = null;
					try 
					{
						out = response.getWriter();
						out.println("fail"+old+"fail");
					    out.flush();
					    out.close();
					}
					catch (IOException e) 
					{
						e.printStackTrace();
					}
				}
				else
				{
					PrintWriter out = null;
					try 
					{
						out = response.getWriter();
						out.println("lotnumber"+ms+"lotnumber");
					    out.flush();
					    out.close();
					}
					catch (IOException e) 
					{
						e.printStackTrace();
					}
				}
			}
			else
			{
				request.setAttribute("errmsg", msg);
			    rd=request.getRequestDispatcher("product.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException e) 
				{
					e.printStackTrace();
				} 
				catch (IOException e) 
				{
					e.printStackTrace();
				}
			}		  
			}
	}
		
		//Product Entry
		if(uri.contains("ProductEntry"))
		{			
			String farmerid = request.getParameter("farmerid");
			String lotnumber = request.getParameter("lotnumber");
			String marketcode = request.getParameter("marketcode");
			String kproduce = request.getParameter("category");
			String produce = request.getParameter("produce");
			String quality = request.getParameter("quality");
			String quantity = request.getParameter("quantity");
			String ename = request.getParameter("empnumber");
			String epwd = request.getParameter("epwd");
			System.out.println("Name and pwd from form: "+ename+" "+epwd);
			
			HttpSession elog = request.getSession(false);
			String name = (String) elog.getAttribute("ename");
			String pwd = (String) elog.getAttribute("epwd");
			System.out.println("Name and pwd from session: "+name+" "+pwd);
			
			
			//System.out.println("Farmerid: "+farmerid+" Lotnum: "+lotnum+" Marketcode: "+marketcode+" Kproduce: "+kproduce+" Produce: "+produce+" Quality: "+quality+" Quantity: "+quantity);
			
			// obtains the upload file part in this multipart request
	        Part filePart = null;
			try {
				filePart = request.getPart("fileID");
				//System.out.println(filePart);
			} catch (IllegalStateException | IOException | ServletException e1) {
				e1.printStackTrace();
			}         
	        String photo="";

	        String path="/usr/local/easy/share/easy-tomcat7/webapps/NeomandiPrototype/ProductImages";

	        System.out.println("Path "+path);
	        File file=new File(path);
	        file.mkdir();
	         //String fileName = getFileName(filePart);
	        String nfileName = lotnumber + ".jpg";  
	        OutputStream out = null;	          
	        InputStream filecontent = null;    
	        try
	        {
	         out = new FileOutputStream(new File(path + File.separator + nfileName));
	         filecontent = filePart.getInputStream();
	     
	 
	        int read = 0;
	        final byte[] bytes = new byte[1024];
	 
	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	           
	            photo=path+"/"+nfileName;
	            
	            
	        }
	            }
	            catch(Exception e)
	            {
	            	e.printStackTrace();
	            }
	        System.out.println("Photo: "+photo);
			ProductEntryBean pebean = new ProductEntryBean(farmerid, marketcode, kproduce, produce, quality, quantity, lotnumber, photo);
			System.out.println("***************************************************************************");
			System.out.println("in cs productentry pebean="+pebean);
			
			
			Model m = new Model();
			String msg = "";
			if(ename.equals(name) && epwd.equals(pwd))
			{
				msg = m.productEntry(pebean);
			}
			else
			{
				msg = msg + "Employee Number/Password is incorrect";
			}
			
			if(msg.equals("SUCCESS"))
			{
				request.setAttribute("errmsg", msg);
				rd = request.getRequestDispatcher("ProductEntry.jsp");
				try {
					rd.forward(request, response);
					return;
				} catch (ServletException | IOException e) {
					
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
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}			
		}	
		
		/*if(uri.contains("ImageInsert")){
		 *  response.setContentType("text/html;charset=UTF-8");
		    // Create path components to save the file
		    final String path = request.getParameter("destination");
		    Part filePart = null;
			try {
				filePart = request.getPart("photo");
			} catch (IllegalStateException | IOException | ServletException e2) {
				
				e2.printStackTrace();
			}
		    final String fileName = getFileName(filePart);

		    OutputStream out = null;
		    InputStream filecontent = null;
		    PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}

		    try {
		        out = new FileOutputStream(new File(path + File.separator+ fileName));
		        filecontent = filePart.getInputStream();

		        int read = 0;
		        final byte[] bytes = new byte[1024];

		        while ((read = filecontent.read(bytes)) != -1) {
		            out.write(bytes, 0, read);
		        }
		        writer.println("New file " + fileName + " created at " + path);
		        LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
		                new Object[]{fileName, path});
		    } catch (FileNotFoundException fne) {
		        writer.println("You either did not specify a file to upload or are "
		                + "trying to upload a file to a protected or nonexistent "
		                + "location.");
		        writer.println("<br/> ERROR: " + fne.getMessage());

		        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
		                new Object[]{fne.getMessage()});
		    } catch (IOException e) {
				
				e.printStackTrace();
			} finally {
		        if (out != null) {
		            try {
						out.close();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
		        }
		        if (filecontent != null) {
		            try {
						filecontent.close();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
		        }
		        if (writer != null) {
		            writer.close();
		        }
		    }
		}*/

		/*private String getFileName(final Part part) {
		    final String partHeader = part.getHeader("content-disposition");
		    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
		    for (String content : part.getHeader("content-disposition").split(";")) {
		        if (content.trim().startsWith("filename")) {
		            return content.substring(
		                    content.indexOf('=') + 1).trim().replace("\"", "");
		        }
		    }
		    return null;
		}*/
				
		//Trader Block Bank
		if(uri.contains("TraderBlock"))
		{
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn =null;
			String name=null;
			String pwd=null;
			try
			{
				tlbn = (TraderLoginBean)tlog.getAttribute("tlog");
				//System.out.println(tlbn.getTname());
			//	System.out.println(tlbn.getTpwd());
				name=tlbn.getTname();
				pwd=tlbn.getTpwd();
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("HoldFunds.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			System.out.println("***************************************************************************");			
			Model m=new Model();
			TraderBlockBean tbb=m.traderBlockBank(name,pwd);
			HttpSession traderblockbean=request.getSession();
			traderblockbean.setAttribute("tbb", tbb);
			if(tbb.getMsg().contains("SUCCESS"))
			{
				HttpSession hcs=request.getSession();
				hcs.setAttribute("bean",tbb);
			//	System.out.println("msg sent is SUCCESS");
				request.setAttribute("msg","SUCCESS");
				rd=request.getRequestDispatcher("HoldFunds.jsp");
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
		//		System.out.println("msg sen to model is you dont have account in this bank...Please select other bank");
				request.setAttribute("msg","you dont have account in this bank...Please select other bank");
				rd=request.getRequestDispatcher("HoldFunds.jsp");
				/*try {
				//	rd.forward(request, response);
					return;
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}*/
			}			
		}
		
		if(uri.contains("holdfundsgetbalance"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			if(tlbn.getTname()==null)
			{
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("HoldFunds.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}
			}
			else
			{
				String account=request.getParameter("accountnumber");
				System.out.println("account in CS is "+account);
				Model m=new Model();
				String balance=m.holdfundsgetbalance(account);
				System.out.println("balance in CS is "+balance);
				 PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println(balance);
						out.flush();
					    out.close();
					}
					 catch (IOException e) {
							
							e.printStackTrace();
						}
			}
		}
		//Trader Block Amount
		if(uri.contains("traderblockamount"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			if(tlbn.getTname()==null)
			{
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("HoldFunds.jsp");
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
				String bankname=request.getParameter("bank");
				HttpSession traderbank=request.getSession();
				traderbank.setAttribute("traderbank", bankname);
				String accno=request.getParameter("accno");
				Model m=new Model();
				String msg[]=m.traderblockamount(name,pwd,amount,bankname,accno);
				System.out.println("message received by CS is msg[0]"+msg[0]+" msg1 "+msg[1]);
				if(msg[1]==null)
				{
					System.out.println("msg[1]==null");
					request.setAttribute("blockmsg",msg[0]);
					rd=request.getRequestDispatcher("HoldFunds.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) 
					{
						e.printStackTrace();
					}	
				}
				else
				{
					System.out.println("msg[1]!=null");
					int balance=Integer.parseInt(msg[0]);
					int block=Integer.parseInt(msg[1]);
					HttpSession traderblockbean=request.getSession(false);
					TraderBlockBean tbb=(TraderBlockBean)traderblockbean.getAttribute("tbb");
					tbb.setBalance(balance);
					request.setAttribute("blockamount",amount);
					request.setAttribute("totalblock",block);
					request.setAttribute("blockmsg",msg[0]);
					rd=request.getRequestDispatcher("HoldFunds.jsp");
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
		}
		
		//TradeorAuction
		if(uri.contains("TradeorAuction"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			
			ServletContext context = request.getSession().getServletContext();
			String start=(String)context.getAttribute("starttime");
			TraderLoginBean tlbn=null;
			String name=null;
			String pwd=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				pwd=tlbn.getTpwd();
				name=tlbn.getTname();
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				//rd=request.getRequestDispatcher("ajax2.jsp");
			//	rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				/*try {
				//	rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}*/
			}
			/*first code*/
			HttpSession countdown=request.getSession();
			countdown.setAttribute("timer",0);
			Model m=new Model();
			Mynewclass mc=(Mynewclass) m.tradeOrAuction(name,pwd);
			if(mc.getBl().size()==0&&mc.getAl().size()!=0)
			{
				request.setAttribute("msg","block");
				RequestDispatcher rd2 =request.getRequestDispatcher("TraderorAuction2.jsp");
				try 
				{									
						rd2.forward(request, response);					
				}
				catch (ServletException | IOException| NullPointerException e) 
				{
					e.printStackTrace();
				}	
			}
			else{
			HttpSession traderlistbean=request.getSession();
			traderlistbean.setAttribute("tlb",mc.getAl());
			HttpSession MyFinalCost=request.getSession(true);
			MyFinalCost.setAttribute("MyFinalCost",mc.getBl());
		//	System.out.println("inside mfcb in CS"+MyFinalCost.getAttribute("MyFinalCost"));
			//rd=request.getRequestDispatcher("ajax2.jsp");
			RequestDispatcher rd1 = request.getRequestDispatcher("TraderorAuction2.jsp");
			try 
			{
				if(start!=null)
				{
					rd1.forward(request, response);
				}
				else		
				{					
					rd1.forward(request, response);
				}
			}
			catch (ServletException | IOException| NullPointerException e) 
			{
				e.printStackTrace();
			}	
			
		}
		}
		
		if(uri.contains("refresh"))
		{	
			//System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			String name=null;
			String pwd=null;
			pwd=tlbn.getTpwd();
			name=tlbn.getTname();
			/*try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				pwd=tlbn.getTpwd();
				name=tlbn.getTname();
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
			//	rd=request.getRequestDispatcher("ajax2.jsp");
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					
					e1.printStackTrace();
				}
			}*/
			Model m=new Model();
			MyFinalCostBean mfcb=(MyFinalCostBean) m.tradeOrAuction1(name,pwd);
			//rd=request.getRequestDispatcher("ajax2.jsp");
			/*RequestDispatcher rd3 = request.getRequestDispatcher("TraderorAuction2.jsp");
			*/if((mfcb.getMsg()==null))
			{
				try 
				{
						PrintWriter out = null;
						try 
						{
							//System.out.println(mfcb);
							out = response.getWriter();
							out.println("lotnum"+mfcb.getLotnum()+"lotnum lotcost"+mfcb.getLotcost()+"lotcost bestbid"+mfcb.getBestbid()+"bestbid commission"+mfcb.getCommission()+"commission final"+mfcb.getMyfinalcost()+"final market"+mfcb.getMarketcess()+"market mybid"+mfcb.getPrice()+"mybid assigned"+mfcb.getQuantityassigned()+"assigned");
						    out.flush();
						    out.close();
						 //   System.out.println("lotnum"+mfcb.getLotnum()+"lotnum lotcost"+mfcb.getLotcost()+"lotcost bestbid"+mfcb.getBestbid()+"bestbid commission"+mfcb.getCommission()+"commission final"+mfcb.getMyfinalcost()+"final market"+mfcb.getMarketcess()+"market mybid"+mfcb.getPrice()+"mybid assigned"+mfcb.getQuantityassigned()+"assigned");
						}
						catch (IOException e) {
							e.printStackTrace();
						}
					//	rd3.forward(request, response);
						return;
				}
				catch ( Exception e) 
				{
					e.printStackTrace();
				}					
			}
			else if(mfcb.getMsg().equals("block"))
			{
				PrintWriter out = null;
				try {
					//System.out.println(mfcb);
					out = response.getWriter();
					out.println("block");
				    out.flush();
				    out.close();
				 //   System.out.println("lotnum"+mfcb.getLotnum()+"lotnum lotcost"+mfcb.getLotcost()+"lotcost bestbid"+mfcb.getBestbid()+"bestbid commission"+mfcb.getCommission()+"commission final"+mfcb.getMyfinalcost()+"final market"+mfcb.getMarketcess()+"market mybid"+mfcb.getPrice()+"mybid assigned"+mfcb.getQuantityassigned()+"assigned");
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//Increment
	/*	if(uri.contains("increment"))
		{
			String increment=request.getParameter("number");
			String lotnum=request.getParameter("lotnumber");
			if(increment==null)
			{
				request.setAttribute("assigned","assigned");
				RequestDispatcher rd2 = request.getRequestDispatcher("TraderorAuction2.jsp");
				try 
				{
					rd2.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			try
			{			
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("TraderorAuction2.jsp");
				try 
				{
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			Model m=new Model();
			Myclass mc=(Myclass)m.Increment(name,pwd,increment,lotnum);
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
				HttpSession MyFinalCost=request.getSession(false);
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
		*/
		//SubmitIncrement1
		/*if(uri.contains("SubmitIncrement1"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
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
				HttpSession MyFinalCost=request.getSession();
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
		
		//SubmitIncrement2
		if(uri.contains("SubmitIncrement2"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
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
		}*/
		
		//RemoveLotnumber
		if(uri.contains("removelotnumber"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
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
			String lotnumber=request.getParameter("lotnum");
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			Model m=new Model();
			Mynewclass mc=(Mynewclass)m.removeLotNumber(lotnumber,name,pwd);
			HttpSession remove=request.getSession(false);
			remove.setAttribute("list",mc.getAl()); 
			System.out.println("in CS->inside traderlistbean is "+mc.getAl());
			HttpSession MyFinalCost=request.getSession();
			MyFinalCost.setAttribute("MyFinalCost", mc.getBl());
			request.setAttribute("remove","hi");
			rd=request.getRequestDispatcher("TraderorAuction2.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) 
			{
				e.printStackTrace();
			}	
		}
		
		//PostAuction
		if(uri.contains("PostAuction"))
		{
			System.out.println("**********************************************************");
			{
				Model m=new Model();
				m.PostAuction();
				/*rd=request.getRequestDispatcher("OrderStatus.do");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}	*/
			}			
		}
		
		//TraderLogout
		if(uri.contains("logout"))
		{
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
			HttpSession psr=request.getSession(false);
			//psr.invalidate();
			psr.setAttribute("msg",null);
			if(tlbn==null)
			{
				rd=request.getRequestDispatcher("TraderLogin.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) 
				{
					e.printStackTrace();
				}	
			}
			else
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
		
		//AuctionTrail
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
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				//
			}
		}
		
		//EmployeeLogout
		if(uri.contains("ELogout"))
		{
			System.out.println("Inside ELogout");
			RequestDispatcher rde=null;
			HttpSession elog = request.getSession(false);
			
			if(elog!=null)
			{ 
				System.out.println("Inside if---invalidate session");
				elog.removeAttribute("name");
				elog.removeAttribute("pwd");
				elog.removeAttribute("empnumber");
				elog.invalidate();
				//System.out.println(elog.getAttribute("name")+" "+elog.getAttribute("pwd"));
				//out.println("alert('YOU HAVE  LOGGED OUT SUCCESSFULLY ');");
				rde=request.getRequestDispatcher("Login.html");
				try 
				{
					rde.forward(request, response);	
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				System.out.println("Inside else---invalidate session");
				rde=request.getRequestDispatcher("Login.html");
				try {
					rde.forward(request, response);
					return;
				} catch (ServletException | IOException e) {
					// 
					e.printStackTrace();
				}
			}
		}
		
		//Order Status
		if(uri.contains("OrderStatus"))
		{
			//System.out.println("time is "+sdf.format(new Date()));s
			System.out.println("***************************************************************************");
			//System.out.println("inside CS");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			String name=null;
			String pwd=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				if(tlbn.getTname()==null)
				{}
				 name=tlbn.getTname();
				pwd=tlbn.getTpwd();
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("status.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			
			Model m=new Model();
			//Myclass2 mc=(Myclass2)m.orderstatus(name,pwd);  FOR TIME BEING I WILL USE ORDERSTATUS;)
			Myclass2 mc=(Myclass2)m.orderstatus(name,pwd);
			HttpSession orderstatus=request.getSession();
			orderstatus.setAttribute("msg", mc);
			request.setAttribute("errmsg", mc);
			rd=request.getRequestDispatcher("status.jsp");
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
		
		if(uri.contains("Status2"))
		{
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			String name=null;
			String pwd=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				if(tlbn.getTname()==null)
				{}
				 name=tlbn.getTname();
				pwd=tlbn.getTpwd();
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("status.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			
			Model m=new Model();
			String m1=m.orderstatus2(name,pwd);
			try 
			{
				PrintWriter out = null;
				try
				{
						out = response.getWriter();
						out.println(m1);
					    out.flush();
					    out.close();
				}
				catch (IOException e)
				{
					
					e.printStackTrace();
				}
			}			
			catch (Exception e) {				
				e.printStackTrace();
			} 
		}
		
		if(uri.contains("farmeracceptstatus"))
		{
				System.out.println("***************************************************************************");
				HttpSession tlog=request.getSession(false);
				TraderLoginBean tlbn=null;
				try
				{
					tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
					tlbn.getTname();
					tlbn.getTpwd();
				}
				catch(NullPointerException e)
				{			
					request.setAttribute("notlogged","not loggedin");
					rd=request.getRequestDispatcher("status.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e1) {
						e1.printStackTrace();
					}
				}
				HttpSession orderstatus=request.getSession();
				Myclass2 mc=(Myclass2)orderstatus.getAttribute("msg");
				Model m=new Model();
				mc=(Myclass2)m.farmeracceptstatus(mc);
				request.setAttribute("errmsg", mc);
				rd=request.getRequestDispatcher("status.jsp");
				try 
				{
					rd.forward(request, response);			
				}			
				catch (ServletException | IOException e) {
				e.printStackTrace();
				} 		
		}
		/*else
		{				
			    System.out.println("***************************************************************************");
			    String lotnumber = request.getParameter("lotnumber");
			    String value = request.getParameter("value");
				HttpSession tlog=request.getSession(false);
				TraderLoginBean tlbn=null;
				try
				{
					tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
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
				Myclass1 mc=(Myclass1)m.submitIncrement1(name,pwd,lotnumber,bank);
			    JSONObject json = new JSONObject();
			    json.put("bidprice", mc.getBidprice());
			    json.put("commission", mc.getCommission());
			    json.put("lotcost", mc.getLotcost());
			    json.put("myfinalcost", mc.getMyfinalcost());
			    response.setContentType("application/json");
			    try {
					response.getWriter().write(json.toString());
				} catch (IOException e) {
					
					e.printStackTrace();
				}
		}*/	
		
		//Farmer Logout
		if(uri.contains("FLogout"))
		{
			HttpSession flog = request.getSession(false);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			if(flog!=null)
			{ 
				flog.invalidate();
				try 
				{
					rd.forward(request, response);
					return;
				}			
				catch (ServletException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else
			{
				out.println("<html><head><script>alert('Please Login!!');<script></head></html>");
			}
		}
		
		if(uri.contains("tradeSummary"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			String name=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				tlbn.getTname();
				tlbn.getTpwd();

				name=tlbn.getTname();
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String from=request.getParameter("from");
			String to=request.getParameter("to");
	        System.out.println("from is "+from);
	        System.out.println("to is "+to);
			String pwd=tlbn.getTpwd();
			Model m=new Model();
			@SuppressWarnings("rawtypes")
			List al=(List)m.traderHistory(name,pwd,from,to);
			if(al.size()==0)
			{
				request.setAttribute("tradesummary","no");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			else
			{
				HttpSession tradeSummary=request.getSession();
				tradeSummary.setAttribute("tradesummary", al);
				request.setAttribute("tradesummary","success");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}	
			}
		}
		if(uri.contains("Summary1"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				tlbn.getTname();
				tlbn.getTpwd();
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
			String date=sdf.format(new Date());
			String name=tlbn.getTname();
			String pwd=tlbn.getTpwd();
			Model m=new Model();
			@SuppressWarnings("rawtypes")
			List al=(List)m.tradeSummary(name,pwd,date,date);
			if(al.size()==0)
			{
				HttpSession tradeSummary=request.getSession();
				tradeSummary.setAttribute("todaysummarymsg", "fail");
				request.setAttribute("todaysummary","no");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			else
			{
				HttpSession tradeSummary=request.getSession();
				tradeSummary.setAttribute("todaysummary", al);
				tradeSummary.setAttribute("todaysummarymsg", "success");
				request.setAttribute("todaysummary","success");
				rd=request.getRequestDispatcher("Summary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}	
			}
		}
		if(uri.contains("FarmerHistory"))
		{
			System.out.println("***************************************************************************");
			String from=request.getParameter("from");
			String to=request.getParameter("to");
	        System.out.println("from is "+from);
	        System.out.println("to is "+to);
	        HttpSession hs=request.getSession(false);
			String name=(String) hs.getAttribute("name");
			String pass=(String) hs.getAttribute("pass");
			
			Model m=new Model();
			List<?> al=(List<?>)m.farmerHistory(name,pass,from,to);
			if(al.size()==0)
			{
				request.setAttribute("farmerhistory","no");
				rd=request.getRequestDispatcher("FarmerTradeSummary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			else{
				HttpSession farmerhistory=request.getSession();
				farmerhistory.setAttribute("farmerhistory", al);
				request.setAttribute("farmerhistory","success");
				rd=request.getRequestDispatcher("FarmerTradeSummary.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		if(uri.contains("Dispatch"))
		{
			System.out.println("***************************************************************************");
		//	System.out.println("inside CS");
			Model m=new Model();
			OrderStatusResult osrb=m.Dispatch();
			System.out.println("osrb.getAl().size()"+osrb.getAl().size());
			if(osrb.getAl().size()==0)
			{
				request.setAttribute("msg", "fail");
				rd=request.getRequestDispatcher("dispatch2.jsp");
				try 
				{
					rd.forward(request, response);
				}
				catch (ServletException | IOException e1) 
				{
					e1.printStackTrace();
				}
			}
			else
			{
				HttpSession dispatch=request.getSession();
				dispatch.setAttribute("al",osrb);
				rd=request.getRequestDispatcher("dispatch2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}		
		}
		
		if(uri.contains("ajaxIncrement"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			String tname=null;
			String tpwd=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				tname=tlbn.getTname();
				tpwd=tlbn.getTpwd();
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("ajax2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			String lotnumber=request.getParameter("lotnumber");
			String newbid=request.getParameter("number");
			Model m=new Model();
			Myajaxclass1 mc=(Myajaxclass1)m.ajaxIncrement(tname,tpwd,lotnumber,newbid);
			if(mc.getMsg().matches(".*\\d+.*"))
			{
				 PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("block");
						out.flush();
					    out.close();
					}
					 catch (IOException e) {
							
							e.printStackTrace();
						}
			}
			else
			{
				MyFinalCostBean mfcb=mc.getMfcb();
				response.setContentType("text/plain");
			    PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("lotnumber"+mfcb.getLotnum()+"lotnumber lotcost"+mfcb.getLotcost()+"lotcost commission"+mfcb.getCommission()+"commission market"+mfcb.getMarketcess()+"market bestbid"+mfcb.getBestbid()+"bestbid mybid"+mfcb.getPrice()+"mybid assigned"+mfcb.getQuantityassigned()+"assigned final"+mfcb.getMyfinalcost()+"final");
				    out.flush();
				    out.close();
				}
				 catch (IOException e) {
						
						e.printStackTrace();
					}
			}			
		}
		
		if(uri.contains("ajaxReleasefunds"))
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
				String release=request.getParameter("release");
				String bank=request.getParameter("bank");
				Model m=new Model();
				int block=m.release(name,pwd,release,bank);
				PrintWriter out = null;
				try
				{
						out = response.getWriter();
						out.println(block);
					    out.flush();
					    out.close();
				}
				catch (IOException e)
				{
					
					e.printStackTrace();
				}
			}
		}
		
		if(uri.contains("ajaxBlockfunds"))
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
				String block=request.getParameter("block");
				String account=request.getParameter("account");
				String bankname=request.getParameter("bank");
				System.out.println(block+" "+account+" "+bankname+" ");
				Model m=new Model();
				String msg[]=m.traderblockamount(name,pwd,block,bankname,account);
				System.out.println("message received by CS is msg[0]"+msg[0]+" msg1 "+msg[1]);
				if(msg[1]==null)
				{
					System.out.println("msg[1]==null");
					PrintWriter out = null;
					try 
					{
						out = response.getWriter();
						out.println("fail");
					    out.flush();
					    out.close();
					}
					catch (IOException e) {
						e.printStackTrace();
					}
					request.setAttribute("blockmsg",msg[0]);
					rd=request.getRequestDispatcher("TraderBlock.jsp");
				/*	try {
						//rd.forward(request, response);
					} catch (ServletException | IOException e) 
					{
						e.printStackTrace();
					}	*/
				}
				else
				{
					System.out.println("msg[1]!=null");
					int balance=Integer.parseInt(msg[0]);
					int totalblocked=Integer.parseInt(msg[1]);
					System.out.println("in cs balance is "+balance+" total blocked amount is "+totalblocked);
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.println("balance"+balance+"balance totalblocked"+totalblocked+"totalblocked z"+block+"z");
					    out.flush();
					    out.close();
					}
					catch (IOException e) {
						e.printStackTrace();
					}
				}
				}
		}
		/*if(uri.contains("TableRefresh"))
		{
			System.out.println("***************************************************************************");
			HttpSession tlog=request.getSession(false);
			TraderLoginBean tlbn=null;
			String name=null;
			String pwd=null;
			try
			{
				tlbn=(TraderLoginBean)tlog.getAttribute("tlog");
				pwd=tlbn.getTpwd();
				name=tlbn.getTname();
				if(tlbn.getTname()==null)
				{}
			}
			catch(NullPointerException e)
			{			
				request.setAttribute("notlogged","not loggedin");
				rd=request.getRequestDispatcher("ajax2.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e1) {
					e1.printStackTrace();
				}
			}
			Model m=new Model();
			Mynewclass mc=(Mynewclass) m.tradeOrAuction(name,pwd);
			HttpSession traderlistbean=request.getSession();
			traderlistbean.setAttribute("tlb",mc.getAl());
			HttpSession MyFinalCost=request.getSession(true);
			MyFinalCost.setAttribute("MyFinalCost",mc.getBl());
			rd=request.getRequestDispatcher("TableRefresh.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) 
			{
				e.printStackTrace();
			}	
		}*/
		
		//Admin Login
		if(uri.contains("Admin"))
		{
			String aname = request.getParameter("aname");
			String apwd = request.getParameter("apwd");
			
			Model m = new Model();
			String msg = m.adminLogin(aname,apwd);
			if(msg.equals("SUCCESS"))
			{
				System.out.println("SUCCESS");
				HttpSession alog = request.getSession();
				alog.setAttribute("aname", aname);
				alog.setAttribute("apwd", apwd);
				
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println("SUCCESS");
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
			else
			{
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.println(msg);
				    out.flush();
				    out.close();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//Admin Logout
		if(uri.contains("ALogout"))
		{
			HttpSession alog = request.getSession(false);
			RequestDispatcher rdal = null;
			
			if(alog != null)
			{
				alog.removeAttribute("aname");
				alog.removeAttribute("apwd");
				alog.invalidate();
				//System.out.println(request.getAttribute("errmsg"));
//				try {
//					request.logout();
//				} catch (ServletException e1) {
//					
//					e1.printStackTrace();
//				}

				rdal = request.getRequestDispatcher("AdminLogin.jsp");
				try {
					rdal.forward(request, response);
					return;
				} catch (ServletException | IOException e) {
					
					e.printStackTrace();
				}
			}
		}
		
		if(uri.contains("Slotchange"))
		{
			System.out.println("Slotchange.do");
			System.out.println("******************************");
			Model m=new Model();
			m.Slotchange();			
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request,response);
	}
}
