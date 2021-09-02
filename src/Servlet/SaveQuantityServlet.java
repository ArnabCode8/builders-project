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

@WebServlet(urlPatterns = "/savequantity")
public class SaveQuantityServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String cid = req.getParameter("cartid");
		String qt = req.getParameter("quantity");
		
		int userid = Integer.parseInt(uid);
		int cartid = Integer.parseInt(cid);
		int quantity = Integer.parseInt(qt);
		
		CartBean cb = new CartBean();
		cb.setUserid(userid);
		cb.setCartid(cartid);
		
		try {
			
				ArrayList<CartBean> cart = cb.CartByUserIdAndCartId();
				cart.get(0).setQuantity(quantity);
				
				int res = cart.get(0).updateCartByUserIdAndCartId();
				
				String msg = "";
				
				if(res == 0)
				{
					msg = "Updation Failed";
				}
				else
				{
					msg = "Quantity is Successfully updated to : " + quantity;
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
