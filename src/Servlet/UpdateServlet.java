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

@WebServlet(urlPatterns = "/update")
public class UpdateServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		String contact = req.getParameter("contact");
		String address = req.getParameter("address");
		
		ArrayList<String> msgs = new ArrayList<>();
		
		ObjectMapper mapper = new ObjectMapper();
	    int uid = Integer.parseInt(userid);
		UserBean ub = new UserBean();
		ub.setUserid(uid);
		ub.setUsername(username);
		ub.setContact(contact);
		ub.setAddress(address);
		
		String msg = "";
		
		try {
			
				int res = ub.updateUser();
				
				if(res == 0)
				{
					msg = "failed";
				}
				else
				{
					msg = "successful";
				}	
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		msgs.add(msg);
		PrintWriter out = resp.getWriter();
		String jsonString = mapper.writeValueAsString(msgs);
		out.println(jsonString);
	}
}
