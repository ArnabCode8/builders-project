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

import bean.CartBean;
import bean.ProductBean;
import util.Tool;

@WebServlet(urlPatterns = "/placeorder")
public class PlaceOrderServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String pid = req.getParameter("productid");
		String qt = req.getParameter("quantity");
		String date = req.getParameter("date");
		String pr = req.getParameter("price");
		String cid = req.getParameter("cartid");
		
		int userid = Integer.parseInt(uid);
		int productid = Integer.parseInt(pid);
		int quantity = Integer.parseInt(qt);
		int price = Integer.parseInt(pr);
		int cartid = Integer.parseInt(cid);
		
		int total = quantity*price;
				
		Tool t = new Tool();
		int res = t.addOrder(userid, productid, quantity, total, date);
		CartBean cb = new CartBean();
		cb.setUserid(userid);
		cb.setCartid(cartid);
		int res1;
		try {
			
				res1 = cb.deleteFromCartByUserIdAndCartIdFollowingCartId();
				
				String msg = "";
				ArrayList<String> msgs = new ArrayList<>();
				if(res + res1 == 0)
				{
					msg = "failed to place order";
				}	
				else
				{
					msg = "order for Rs : " + total + " is placed successfully";
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
