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

import bean.ProductBean;

@WebServlet(urlPatterns = "/loadproduct")
public class AllProductServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ProductBean pb = new ProductBean();
		ArrayList<ProductBean> prod;
		try {
				prod = pb.allProducts();
				PrintWriter out = resp.getWriter();
				ObjectMapper mapper = new ObjectMapper();
				String jsonString = mapper.writeValueAsString(prod);
				out.println(jsonString);
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
