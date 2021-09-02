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

@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet 
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
	
		
		PrintWriter out = resp.getWriter();
		String msg = userid + " " + username + " " + contact + " " + address;
		msgs.add(msg);
		String jsonString = mapper.writeValueAsString(msgs);
		out.println(jsonString);
	}
}
