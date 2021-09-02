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

@WebServlet(urlPatterns = "/loadprofileinfo")
public class LoadProfileInfoServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		int userid = Integer.parseInt(uid);
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		
		try {
			
				ArrayList<UserBean> users = ub.UserById();
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
