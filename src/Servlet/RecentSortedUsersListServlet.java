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

import bean.UserBean;
import util.Tool;


@WebServlet(urlPatterns = "/recentsorteduserslist")
public class RecentSortedUsersListServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Tool t = new Tool();
		ArrayList<UserBean> recusers = t.RecentSortedUsers();
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(recusers);
		PrintWriter out = resp.getWriter();
		out.println(jsonString);
	}
}
