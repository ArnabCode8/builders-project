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

import util.OrderForView;
import util.Tool;

@WebServlet(urlPatterns = "/loadallrecord")
public class LoadAllRecordServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Tool t = new Tool();
		ArrayList<OrderForView> orders = t.allActivityForView();
		ObjectMapper mapper = new ObjectMapper();
		PrintWriter out = resp.getWriter();
		String jsonString = mapper.writeValueAsString(orders);
		out.println(jsonString);
	}
}
