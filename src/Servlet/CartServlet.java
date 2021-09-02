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
import util.CartForView;
import util.Tool;

@WebServlet(urlPatterns = "/loadcart")
public class CartServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String userid = req.getParameter("userid");
		int uid = Integer.parseInt(userid);
		ArrayList<CartForView> cartf = new ArrayList<>();
		CartBean cb = new CartBean();
		cb.setUserid(uid);
		
		ArrayList<CartBean> cart = new ArrayList<>();
		
		try {
				Tool t = new Tool();
				cart = cb.CartByUserId();
				cartf = t.convertCartListForView(cart);
				
				
		    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		PrintWriter out = resp.getWriter();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(cartf);
		out.println(jsonString);
	}
}
