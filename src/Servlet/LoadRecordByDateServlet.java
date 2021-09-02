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

@WebServlet(urlPatterns = "/loadrecordbydate")
public class LoadRecordByDateServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String date = req.getParameter("date");
		int userid = Integer.parseInt(uid);
		
		//System.out.println("userid : "  + userid);
		//System.out.println("date : " + date);
		
		
		Tool t = new Tool();
		
		ArrayList<CatalogBean> orders = t.activityByUserIdAndDate(userid, date);
		ArrayList<OrderForView> forders = t.convertToOrderViewList(orders);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(forders);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);
		
	}

}
