package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.util.ArrayList;import bean.UserBean;

import bean.UserBean;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String username = req.getParameter("username");
		int uid = Integer.parseInt(username);
		String contact = req.getParameter("password");
		
		System.out.println("received in control username : " + uname + " and ph num : " + contact);
		
		UserBean ub = new UserBean();
		ub.setUserid(uid);
		ub.setContact(contact);
		
		try {
			
				ArrayList<UserBean> users = ub.UserByIdAndContact();
				if(users.size() == 0)
				{
					RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
					rd.forward(req, resp);
				}
				else
				{
					RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
					req.setAttribute("user", users);
					rd.forward(req, resp);
				}	
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter out = resp.getWriter();
		
		String msg = username + contact;
		
		out.println("Username " + username);
		out.println("Contact : " + contact);
		
		
	}
}
