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
import util.Tool;

@WebServlet(urlPatterns = "/paymentuser")
public class PaymentUserServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String uid = req.getParameter("userid");
		String am = req.getParameter("amount");
		String date = req.getParameter("date");
		
		int userid = Integer.parseInt(uid);
		int amount = Integer.parseInt(am);
		
		Tool t = new Tool();
		UserBean ub = new UserBean();
		ub.setUserid(userid);
		
		
		try {
			
			int res = t.addPayment(userid, amount, date);
			
			ArrayList<UserBean> users = ub.UserById();
			int due = users.get(0).getDues();
			
			//System.out.println("Dues : " + due);
			//System.out.println("Amount : " + amount);
			
			due = due - amount;
			
			//System.out.println(due);
			
			ub.setDues(due);
			int res1 = ub.updateUserDuesByUserId();
			
			String msg = "";
			ArrayList<String> msgs = new ArrayList<>();
			
			if(res*res1 == 0)
			{
				msg = "failed";
			}
			else
			{
				msg = "successful";
			}	
			
			msgs.add(msg);
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(msgs);
			PrintWriter out = resp.getWriter();
			out.println(jsonString);

			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
				
	}
}
