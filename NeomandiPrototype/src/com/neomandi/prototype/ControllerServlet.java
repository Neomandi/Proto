package com.neomandi.prototype;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public static void process(HttpServletRequest request,HttpServletResponse response)
	{
		
		RequestDispatcher rd=null;	
		EmployeeRegisterBean erb = (EmployeeRegisterBean) request.getAttribute("ebean");
		EmployeeLoginBean elbn = (EmployeeLoginBean) request.getAttribute("elbean");
		FarmerRegisterBean frb = (FarmerRegisterBean) request.getAttribute("frreg");
		TraderRegisterBean trb = (TraderRegisterBean) request.getAttribute("trbean");
		TraderLoginBean tlbn = (TraderLoginBean) request.getAttribute("tlbean");
		FarmerLoginBean flbn = (FarmerLoginBean) request.getAttribute("flbean");
		ProductSearchBean psb = (ProductSearchBean) request.getAttribute("product");
		ProductEntryBean peb = (ProductEntryBean) request.getAttribute("pe");
		
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
			Model m = new Model();
			String msg = m.farmerLogin(flbn);
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
				rd=request.getRequestDispatcher("FarmerPage.jsp");
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
			String name=tlbn.getTname();
			System.out.println("trader name is "+name);
			System.out.println("inside cs->if(..)");
			Model m = new Model();
			String msg = m.traderLogin(tlbn);
			/*SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			   Date date = new Date();
			  String date1 =dateFormat.format(date); 
			HttpSession dates =request.getSession();
			dates.setAttribute("date",date1);*/
			if(msg.equals("SUCCESS"))
			{
				System.out.println("trader has successfully logged in...:-D....");		
				SimpleDateFormat df=new SimpleDateFormat("E dd MMMM yyyy");
				SimpleDateFormat df1=new SimpleDateFormat("HH:mm:ss");
				String date=df.format(new Date());
				String date2=df1.format(new Date());
				HttpSession hc=request.getSession();
				hc.setAttribute("date", date);
				hc.setAttribute("time",date2);
				hc.setAttribute("name", name);
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
		
		
		//Product Search
		if(uri.contains("ProductSearch"))
		{
			
			Model m=new Model();
			List<ProductSearchResultBean> msg = m.productSearch(psb);
			//request.setAttribute("productsearch", msg);
			HttpSession psr=request.getSession();
			psr.setAttribute("beans", msg);
			rd=request.getRequestDispatcher("ProductSearchResult.jsp");
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
		
		//Add Trade
		if(uri.contains("AddTrade"))
		{
			String lotnumber = request.getParameter("s1");
			System.out.println("inside CS-> inside AddTrade()->"+lotnumber);
			Model m = new Model();
			String msg = m.addTrade(lotnumber);
			if(msg.contains("SUCCESS"))
			{
				
				String msg1=msg.substring(7);
				msg="Product "+msg1+" with lotnumber "+lotnumber+" has been added successfully to trade";
				System.out.println("message sent is "+msg);
				request.setAttribute("errmsg", msg);
				rd=request.getRequestDispatcher("ProductSearchResult.jsp");
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
			    rd=request.getRequestDispatcher("ProductSearchResult.jsp");
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
		
		//Product Entry
		if(uri.contains("ProductEntry"))
		{
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
