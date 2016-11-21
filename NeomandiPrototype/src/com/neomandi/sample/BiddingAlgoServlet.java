package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BiddingAlgoServlet
 */
@WebServlet("/BiddingAlgoServlet")
public class BiddingAlgoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BiddingAlgoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Inside doPost()......");
		
		double v1 = Double.parseDouble(request.getParameter("v1"));
		double v2 = Double.parseDouble(request.getParameter("v2"));
		System.out.println();
		
		double p1 = Double.parseDouble(request.getParameter("p1"));
		double p2 = Double.parseDouble(request.getParameter("p2"));
		
		PrintWriter pw = response.getWriter();
 		
 		//Step 3
 		if(p1 == p2)//Go to step 9
 		{
 			if(v1 > v2)//Step 9
 			{
 				pw.write("<html><body><h1>T1 wins the lot "+v1+" @ "+p1+"</h1></body></html>");
 			}
 			else if(v1 < v2)//Step 10
 			{
 				pw.write("<html><body><h1>T2 wins the lot "+v2+" @ "+p2+"</h1></body></html>");
 			}
 			else if(v1 == v2)//Step 11
 			{
 				pw.write("<html><body><h1>Revise your bids</h1></body></html>");
 			}
 		}
 		else//Go to step 4
 		{
 			if(v1 > v2 && p1 > p2)//Step 5
 			{
 				pw.write("<html><body><h1>T1 wins the lot "+v1+" @ "+p1+"</h1></body></html>");
 			}
 			else if(v1 < v2 && p1 < p2)//Step 6
 			{
 				pw.write("<html><body><h1>T2 wins the lot "+v2+" @ "+p2+"</h1></body></html>");
 			}
 			else if(v1 == v2 && p1 > p2)//Step 7
 			{
 				pw.write("<html><body><h1>T1 wins the lot "+v1+" @ "+p1+"</h1></body></html>");
 			}
 			else if(v1 == v2 && p1 < p2)//Step 8
 			{
 				pw.write("<html><body><h1>T2 wins the lot "+v2+" @ "+p2+"</h1></body></html>");
 			}
 			else if(v1 > v2 && p1 < p2)//Step 12
 			{
 				double v11 = v1 - v2;//Step 12.1
 				double vp11 = v11 * p1;//Step 12.2
 				double vp2 = v2 * p2;//Step 12.3
 				double vv2 = v11 + v2;//Step 12.4
 				double vp12 = vp11 + vp2;//Step 12.5
 				double vvp12 = vp12 / vv2;//Step 12.6
 				
 				pw.write("<html><body><h1>T1 gets "+v11+" @ "+p1+" and T2 gets "+v2+" @ "+p2+". T1 revise your bid to "+vvp12+" to retain : "+v1+"</h1></body></html>");//Step 12.7
 				
 			}
 			else if(v1 < v2 && p1 > p2)//Step 13
 			{
 				double v21 = v2 - v1;//Step 13.1
 				double vp21 = v21 * p2;//Step 13.2
 				double vp1 = v1 * p1;//Step 13.3
 				double vv1 = v21 + v1;//Step 13.4
 				double vp211 = vp21 + vp1;//Step 13.5
 				double vvp21 = vp211 / vv1;//Step 13.6
 				
 				pw.write("<html><body><h1>T1 gets "+v1+" @ "+p1+" and T2 gets "+v21+" @ "+p2+". T2 revise your bid to "+vvp21+" to retain "+v2+"</h1></body></html>");//Step 13.7
 			}
 		}
	}

}
