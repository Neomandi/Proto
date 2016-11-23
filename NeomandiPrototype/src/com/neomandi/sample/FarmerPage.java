package com.neomandi.sample;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FarmerPage
 */
public class FarmerPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FarmerPage() {
        super();
        System.out.println("Inside Farmerpage1 servlet Constr().....");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside  Farmerpage1 servlet doGet().....");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside Farmerpage1 servlet  doPost().....");
		//fetching the aadhar number
				//-----------------------------------------------------------------------------------
				PrintWriter out = response.getWriter();
				
				String farmerid = request.getParameter("farmerid");
				String lotnum = request.getParameter("lotnum");
				String marketcode = request.getParameter("marketcode");
				String kproduce = request.getParameter("kproduce");
				String produce = request.getParameter("produce");
				String quality = request.getParameter("quality");
				String qunatity = request.getParameter("photo");
				String pass= request.getParameter("pwd");
				System.out.println("password="+pass);
				//hover the details
			        out.println("<html>");
			        out.println("<style>");
			        out.println(" div {"+
			 	    	   " background-color:pink;"+
			 	    	    "padding: 20px;"+
			 	    	   " display: none;"+
			 	    	"}"+
			 	    	    
			 	    	"span:hover + div {"+
			 	    	   " display: block;"+
			 	    	"}");
			      out.println("table {"+
			           " border-spacing: 1;"+
			           " border-collapse: collapse;"+
			           " overflow: hidden;"+
			           " z-index: 1;"+
			       " }"+

			       " td, th {"+
			            "cursor: pointer;"+
			           " padding: 10px;"+
			            "position: relative;"+
			       " }"+

			       " td:hover::after {"+ 
			           " background-color: #ffa;"+
			           " content: '\00a0';  "+
			          "  height: 10000px;  "+  
			          "  left: 0;"+
			           " position: absolute;  "+
			            "top: -5000px;"+
			           " width: 100%;"+
			            "z-index: -1; "+       
			       " }");
			      out.println(" div #div1{"+
			 	    	   " background-color:pink;"+
			 	    	    "padding: 20px;"+
			 	    	   " display: none;"+
			 	    	"}"+
			 	    	    
			 	    	"span:hover + div  #div1{"+
			 	    	   " display: block;"+
			 	    	"}");
			      
			 	    	
			 	    	out.println("</style>");
			        //-------------------------------------------------
			        out.println("<body>");
			        
			        //for display the aadhar number
			        out.println("<h1><font color='orange'>");
			        out.println("Farmer Page");
			        out.println("</h1></font>");
			        out.println("<font color='blue'>");
			        out.println("<h3>");
			       
			        out.println("</h3>");
			        out.println("</font>");
			        out.println("");
			        
			        Connection con = null;
			        Statement statement = null;
			        ResultSet resultSet = null;    

			        con = JDBCHelper.getConnection();
			        String s="";
			        try{	
			        	if(con == null)
			        	{
			        		System.out.println("Connection establish failed");
			        	}
			        	statement = con.createStatement();
			        	String sql = "select aadharnum from freg where pass='"+pass+"' ";
			        	System.out.println(sql);
			        	resultSet = statement.executeQuery(sql);
			        	out.print("<table><tr><th><font color='blue' size='5'>Aadhar number</font></th></tr>");
			        	while(resultSet.next()){
			        		out.print("<tr><td background='pink'>"+resultSet.getString("aadharnum")+"</td></tr>");

				        	 s+=resultSet.getString("aadharnum");
				        	System.out.println("aadhar number="+s);
			        	}
			        	out.println("</table>");
			    	} catch (Exception e) {
			    		e.printStackTrace();
			    	}
				
				
				
				
				//-----------------------------------------------------------------------------------
			        
			        //for fetching lotnumber
			        //-------------------------------------------------------------------------------
			     
			        String lot="";
			        try{	
			        	if(con == null)
			        	{
			        		System.out.println("Connection establish failed");
			        	}
			        	statement = con.createStatement();
			        	String sql = "select lotnumber from productentry where farmerid='"+s+"' ";
			        	System.out.println(sql);
			        	resultSet = statement.executeQuery(sql);
			        	out.println("<table border='1'><th><font color='green' size='5'>Lot number</font></th>"
			        			+ "<th><font color='green' size='5'>Average price</font></th>"
			        			+ "<th><font color='green' size='5'>Lot size</font></th>"
			        			+ "<th><font color='green' size='5'>Quantity bid for:</font></th>"
			        			+ "</tr>");
			       
			        	while(resultSet.next()){
			        		out.println("<tr><td background='pink'><span><form action=' ' ><input type = 'button' name = 'lotno1' value ='"+resultSet.getString("lotnumber")+"' readonly/></form></span><div id = 'div1'>");
			        		lot+=resultSet.getString("lotnumber");
					        
			        		 try{	
									if(con == null)
									{
										System.out.println("Connection establish failed");
									}
									statement = con.createStatement();
									String sql5 = "select produce,kindofpro,qualitygrade,quantity from productentry where lotnumber='"+lot+"'";
									System.out.println(sql5);		
									resultSet = statement.executeQuery(sql5);
									while(resultSet.next()){
										out.println("<br/><table border='1'>"+
										"<tr>"+
										"<th>produce</th>"+
										"<th>product</th>"+
										"<th>grade</th>"+
										"<th>quantity</th></tr>"+
										"<tr>"+
										"<td>"+resultSet.getString("produce")+" </td>"+
										"<td>"+resultSet.getString("kindofpro")+" </td>"+
										"<td> "+resultSet.getString("qualitygrade")+"</td>"+
										"<td>"+resultSet.getString("quantity")+"</td>");
										
										
									}
									
								} catch (Exception e) {
									e.printStackTrace();
								}

								out.println("</table>"+
						"</div>");
								
								
			        				out.println( "</td><td></td><td></td><td></td><div></tr>");
			        		lot+=resultSet.getString("lotnumber");
			        
			        		
			        		out.println("<br/><br/>");
			        		
			        		
			        	}
			        	
			    	} catch (Exception e) {
			    		e.printStackTrace();
			    	}
			        out.println("</table>");
			        out.println("<input type='button' value='Accept all' style='position: absolute; right:200;'>");
			        out.println("<input type='button' value='Reject all' style='position: absolute; right: 0;'>");
 //--------------------------------------------------------------------------------------
				        //for hover the button
				   /*   
				    	out.println("<span>"+
				    	"<form action='lotservlet' method='post'>"+
				    	"<input type='submit' value='Lot details'/></form>"+
				    	"<br/>"+
				    	"</span>"+
				    	"<div>");
				      
				       try{	
						if(con == null)
						{
							System.out.println("Connection establish failed");
						}
						statement = con.createStatement();
						String sql = "select produce,kindofpro,qualitygrade,quantity from productentry where farmerid='"+s+"'";
						System.out.println(sql);		
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
							out.println("<br/><table border='1'>"+
							"<tr>"+
							"<th>produce</th>"+
							"<th>product</th>"+
							"<th>grade</th>"+
							"<th>quantity</th></tr>"+
							"<tr>"+
							"<td>"+resultSet.getString("produce")+" </td>"+
							"<td>"+resultSet.getString("kindofpro")+" </td>"+
							"<td> "+resultSet.getString("qualitygrade")+"</td>"+
							"<td>"+resultSet.getString("quantity")+"</td>");
							
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}

					out.println("</table>"+
			"</div>");*/
					
					
				       //--------------------------------------------------------------------------
					//for displaY the bid details
					//-------------------------------------------------------------------------
			      
			        
			        out.print("<input type='button' name='accept' value='Accept all'/>");
				       out.print("<input type='button' name='reject' value='Reject all'/><br/><br/>");
				       out.print("<h3>Time progress:</h3>");
				       out.print("<progress value='70' max='100'>70%</progress><br/>");
				       out.println("<br/><br/>");
				       

					       	out.println("<table border='1'>"+
							"<tr>"+
								"<th colspan='3'>Bid Details</th>"+
								"<th colspan='3' cellpading='50'></th>"+
							"</tr>"+
							"<tr>"+
								"<th>Quantity</th>"+
								"<th>Bid</th>"+
								"<th></th>"+
								"<th cellpadding=10></th>"+
								"<th></th>"+
								"<th></th>"+
							"</tr>"+
							"<tr>"+
								"<td><input type='text'></td>"+
								"<td><input type='text'</td>"+
								"<td><input type='button' value='Accept'></td>"+
								"<td><input type='button' value='Reject'></td>"+
								"<td><input type='button' value='Accept till here '></td>"+
								"<td><input type='button' value='Reject all below '></td>"+
							"</tr>"+
							"<tr>"+
							    "<td><input type='text'></td>"+
							    "<td><input type='text'</td>"+
							    "<td><input type='button' value='Accept'></td>"+
							    "<td><input type='button' value='Reject'></td>"+
							    "<td><input type='button' value='Accept till here '></td>"+
							"	<td><input type='button' value='Reject all below '></td>"+
							"</tr>"+
						"<tr>"+
						"<td><input type='text'></td>"+
						"<td><input type='text'</td>"+
						"<td><input type='button' value='Accept'></td>"+
						"<td><input type='button' value='Reject'></td>"+
						"<td><input type='button' value='Accept till here '></td>"+
						"<td><input type='button' value='Reject all below '></td>"+
					"</tr>"+
					"<tr>"+
					"<td><input type='text'></td>"+
					"<td><input type='text'</td>"+
					"<td><input type='button' value='Accept'></td>"+
					"<td><input type='button' value='Reject'></td>"+
					"<td><input type='button' value='Accept till here '></td>"+
					"<td><input type='button' value='Reject all below '></td>"+
				"</tr>");
							
						out.println("</table>");
						
						//out.println("</form>");
				       out.println("</body></html>"); 
				       
				       
				       //------------------------------------------------------------------------------------
				   
				       
				       
				       
				       
				       
	}

}
