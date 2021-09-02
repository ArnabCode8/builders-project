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

import bean.CatalogBean;
import util.OrderForView;
import util.Tool;

@WebServlet(urlPatterns = "/loaddelrecord")
public class LoadDelRecordServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String status = req.getParameter("status");
		System.out.println(status);
		Tool t = new Tool();
		ArrayList<CatalogBean> cat = t.allActivity();
		ArrayList<OrderForView> fcat = t.convertToOrderViewList(cat);
		
		fcat = t.statusFilter(fcat, status);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(fcat);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);
	}
}
