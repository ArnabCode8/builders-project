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

import bean.UserBean;

@WebServlet(urlPatterns = "/userslist")
public class UsersListServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		UserBean ub = new UserBean();
		try {
			
				ArrayList<UserBean> users = ub.allUsers();
				ObjectMapper mapper = new ObjectMapper();
				String jsonString = mapper.writeValueAsString(users);
				PrintWriter out = resp.getWriter();
				out.println(jsonString);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
