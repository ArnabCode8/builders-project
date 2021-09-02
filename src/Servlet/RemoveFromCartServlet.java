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

@WebServlet(urlPatterns = "/removefromcart")
public class RemoveFromCartServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String cid = req.getParameter("cartid");
		
		int userid = Integer.parseInt(uid);
		int cartid = Integer.parseInt(cid);
		
		CartBean cb = new CartBean();
		
		cb.setUserid(userid);
		cb.setCartid(cartid);
		
		try {
			
				int res = cb.deleteFromCartByUserIdAndCartIdFollowingCartId();
				String msg = "";
				ArrayList<String> msgs = new ArrayList<>();
				
				if(res == 0)
				{
					msg = "Failed to Remove";
				}
				else
				{
					msg = "Successfully Removed";
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
