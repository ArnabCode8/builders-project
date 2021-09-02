package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.CatalogBean;
import util.OrderForView;
import util.Tool;

@WebServlet(urlPatterns = "/usertransaction")
public class UserTransactionServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		int userid = Integer.parseInt(uid);
		Tool t = new Tool();
		ArrayList<CatalogBean> cat = t.activityByUserId(userid);
		ArrayList<OrderForView> fcat = t.convertToOrderViewList(cat);
		ArrayList<OrderForView> fcat1 = new ArrayList<>();
		
		for(OrderForView of : fcat)
		{
			if(of.getStatus().equals("payment") || of.getStatus().equals("completed"))
			{
				fcat1.add(of);
			}	
		}	
		
		
		//the dues arraylist is also sorted by recent ,ie reversed
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(fcat1);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);

	}

}
