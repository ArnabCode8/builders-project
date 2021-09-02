package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import bean.CatalogBean;
import util.Tool;

@WebServlet(urlPatterns = "/cancelorderrequest")
public class CancelOrderRequestServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String oid = req.getParameter("orderid");
		
		int userid = Integer.parseInt(uid);
		int orderid = Integer.parseInt(oid);
		
		CatalogBean cb = new CatalogBean();
		cb.setUserid(userid);
		cb.setOrderid(orderid);
		
		try {
				String msg = "";
				int res = cb.deleteFromCatalogByUserIdAndOrderIdFollowingOrderId();
				
				if(res == 0)
				{
					msg = "failed";
				}
				else
				{
					msg = "successful";
				}	
				
				ArrayList<String> msgs = new ArrayList<>();
				msgs.add(msg);
				ObjectMapper mapper = new ObjectMapper();
				String jsonString = mapper.writeValueAsString(msgs);
				PrintWriter out = resp.getWriter();
				out.println(jsonString);
				
				
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
