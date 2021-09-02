package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.catalina.startup.Catalina;
import org.codehaus.jackson.map.ObjectMapper;

import bean.CatalogBean;
import util.OrderForView;
import util.Tool;

@WebServlet(urlPatterns = "/loadrecord")
public class LoadRecordServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String date = req.getParameter("date");
		String payment = req.getParameter("payment");
		String request = req.getParameter("request");
		String accept = req.getParameter("accept");
		String process = req.getParameter("process");
		String complete = req.getParameter("complete");
		
		
		
		int userid = Integer.parseInt(uid);
		Tool t = new Tool();
		ArrayList<CatalogBean> cat = t.activityByUserId(userid);
		ArrayList<OrderForView> fcat = t.convertToOrderViewList(cat);
		
		
		if(!date.equals("none"))
		{
			fcat = t.dateFilter(fcat, date);
			
		}	
		
		
		if(!payment.equals("none"))
		{
			String str = "payment";
			fcat = t.statusFilter(fcat,str);
		}	
		
		if(!request.equals("none"))
		{
			String str = "requested";
			fcat = t.statusFilter(fcat,str);
			
		}
		
		if(!accept.equals("none"))
		{
			String str = "accepted";
			fcat = t.statusFilter(fcat,str);
			
		}
		
		if(!process.equals("none"))
		{
			String str = "processing";
			fcat = t.statusFilter(fcat,str);
			
		}
		
		if(!complete.equals("none"))
		{
			String str = "completed";
			fcat = t.statusFilter(fcat,str);
			
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(fcat);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);
		
	}
}
