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
import bean.UserBean;

@WebServlet(urlPatterns = "/partialworksubmit")
public class PartialWorkSubmitServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String oid = req.getParameter("orderid");
		String dn = req.getParameter("done");
		
		int userid = Integer.parseInt(uid);
		int orderid = Integer.parseInt(oid);
		int done = Integer.parseInt(dn);
		
		CatalogBean cb = new CatalogBean();
		cb.setUserid(userid);
		cb.setOrderid(orderid);
		
		try {
			
				ArrayList<CatalogBean> cat = cb.CatalogByUserIdAndOrderId();
				String st = cat.get(0).getStatus();
				
				String msg = "";
				ArrayList<String> msgs = new ArrayList<>();
				
				
				if(st.equals("processing"))
				{
					int qt = cat.get(0).getQuantity();
					String status1 = "partiallyComplete" + String.valueOf(qt);
					int remained = qt - done;
					cb.setQuantity(remained);
					cb.setStatus(status1);
					
					int res1 = cb.updateOrderQuantityByUserIdAndOrderId();
					int res2 = cb.updateOrderStatusByUserIdAndOrderId();
					
					if(res1*res2 == 0)
					{
						msg = "failed";
					}
					else
					{
						msg = "successful";
					}	
					
					
				}	
				else
				{
					//partiallyComplete
					int qt = Integer.parseInt(cat.get(0).getStatus().substring(17));
					int qt1 = cat.get(0).getQuantity();
					int remained = qt1 - done;
					if(remained == 0)
					{
						//complete order
						cb.setStatus("completed");
						cb.setQuantity(qt);
						
						
						int total = cat.get(0).getTotal();
						int carry = cat.get(0).getCarry();
						total = total + carry;
						UserBean ub = new UserBean();
						ub.setUserid(userid);
						ArrayList<UserBean> users = ub.UserById();
						int due = users.get(0).getDues();
						due = due + total;
						ub.setDues(due);
						
						int res3 = ub.updateUserDuesByUserId();
						int res1 = cb.updateOrderQuantityByUserIdAndOrderId();
						int res2 = cb.updateOrderStatusByUserIdAndOrderId();
						
						if(res1*res2*res3 == 0)
						{
							msg = "failed";
						}
						else
						{
							msg = "successful";
						}
						
					}
					else
					{
						//just change the remained
						cb.setQuantity(remained);
						int res1 = cb.updateOrderQuantityByUserIdAndOrderId();
						
						if(res1 == 0)
						{
							msg = "failed";
						}
						else
						{
							msg = "successful";
						}
					}	
					
					
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
