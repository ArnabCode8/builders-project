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

@WebServlet(urlPatterns = "/addtokart")
public class AddToKartServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String username = req.getParameter("username");
		String pid = req.getParameter("productid");
		String productname = req.getParameter("productname");
		String qty = req.getParameter("quantity");
		
		int userid = Integer.parseInt(uid);
		int productid = Integer.parseInt(pid);
		int quantity = Integer.parseInt(qty);
		
		CartBean cb = new CartBean();
		cb.setUserid(userid);
		cb.setProductid(productid);
		cb.setQuantity(quantity);
		
		try {
			
				int res = cb.addToCartFollowingCartId();
				ArrayList<String> msgs = new ArrayList<>();
				String msg = "";
				if(res == 0)
		        {
		        	msg = "Addition to cart failed";
		        }
		        else
		        {
		    	    msg = productname + " of quantity " + quantity + " is Successfully added to the kart of " + userid + ": " + username;
		        }	
				
				msgs.add(msg);
	    		PrintWriter out = resp.getWriter();
	    		ObjectMapper mapper = new ObjectMapper();
	    		String jsonString = mapper.writeValueAsString(msgs);
	    		out.println(jsonString);
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
}
