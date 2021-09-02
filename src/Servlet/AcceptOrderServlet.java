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

@WebServlet(urlPatterns = "/acceptorder")
public class AcceptOrderServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String oid = req.getParameter("orderid");
		String tot = req.getParameter("total");
		String car = req.getParameter("carry");
		
		int userid = Integer.parseInt(uid);
		int orderid = Integer.parseInt(oid);
		int total = Integer.parseInt(tot);
		int carry = Integer.parseInt(car);
		String status = "accepted";
		
		
		CatalogBean cb = new CatalogBean();
		cb.setOrderid(orderid);
		cb.setUserid(userid);
		cb.setTotal(total);
		cb.setCarry(carry);
		cb.setStatus(status);
		
		try {
				ArrayList<String> msgs = new ArrayList<>();
				String msg = "";
				
				int res = cb.updateOrderTotalAndCarryAndStatusByUserIdAndOrderId();
				
				if(res == 0)
				{
					msg = "failed";
				}
				else
				{
					msg = "successful";
				}	
				
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
