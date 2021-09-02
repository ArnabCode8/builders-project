package util;

import java.util.*;
import java.sql.SQLException;

import Servlet.Order;
import bean.CartBean;
import bean.CatalogBean;
import bean.ProductBean;
import bean.UserBean;

public class Tool {
	
	public String getDay(String date)
	{
		return date.substring(0,2);
	}
	
	public String getMonth(String date)
	{
		return date.substring(3,5);
	}
	
	public String getYear(String date)
	{
		return date.substring(6);
	}
	
	
	public ArrayList<OrderForView> statusFilter(ArrayList<OrderForView> fcat,String status)
	{
		ArrayList<OrderForView> f1 = new ArrayList<>();
		
		if(status.equals("processing"))
		{
			for(OrderForView of : fcat)
			{
				String st = of.getStatus();
				
				if(st.length() < 17)
				{
					if(st.equals(status))
					{
						f1.add(of);
					}
				}
				else
				{
					// || st.substring(0,17).equals("partiallyComplete")
					
					if(st.substring(0,17).equals("partiallyComplete"))
					{
						f1.add(of);
					}
					
				}	
					
			}
			
		}
		else
		{
			for(OrderForView of : fcat)
			{
				String st = of.getStatus();
				if(st.equals(status))
				{
					f1.add(of);
				}	
			}
		}
		
		
		
	return f1;	
	}
	
	
	
	
	public ArrayList<OrderForView> dateFilter(ArrayList<OrderForView> fcat,String date)
	{
		String dd = this.getDay(date);
		String mm = this.getMonth(date);
		String yy = this.getYear(date);
		
		ArrayList<OrderForView> f1 = new ArrayList<>();
		
		
		if(dd.equals(00) && !mm.equals(00))
		{
			//only month and year are being checked
			for(OrderForView of : fcat)
			{
				String tempDate = of.getDate();
				String mm1 = this.getMonth(tempDate);
				String yy1 = this.getYear(tempDate);
				
				if(mm.equals(mm1) && yy.equals(yy1))
				{
					f1.add(of);
				}	
			
			}	
		}
		else if(dd.equals(00) && mm.equals(00))
		{
			//only year is being checked
			for(OrderForView of : fcat)
			{
				String tempDate = of.getDate();
				//String mm1 = t.getMonth(tempDate);
				String yy1 = this.getYear(tempDate);
				
				if(yy.equals(yy1))
				{
					f1.add(of);
				}	
			
			}
		}
		else
		{
			//only month,day,year are being checked
			for(OrderForView of : fcat)
			{
				String tempDate = of.getDate();
				
				String dd1 = this.getDay(tempDate);
				String mm1 = this.getMonth(tempDate);
				String yy1 = this.getYear(tempDate);
				
				if(mm.equals(mm1) && yy.equals(yy1) && dd.equals(dd1))
				{
					f1.add(of);
				}	
			
			}
			
		}
		
	return f1;	
	}
	
	
	
	
	public int addOrder(int userid,int productid,int quantity,int total,String date)
	{
		CatalogBean cb = new CatalogBean();
		int res = 0;
		cb.setUserid(userid);
		cb.setProductid(productid);
		cb.setQuantity(quantity);
		cb.setTotal(total);
		cb.setCarry(0);
		cb.setDate(date);
		cb.setStatus("requested");
		
		try {
			
				res = cb.addToCatalogFollowingOrderId();
				
		    }
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return res;	
	}
	
	public int addPayment(int userid,int total,String date)
	{
		CatalogBean cb = new CatalogBean();
		int res = 0;
		cb.setUserid(userid);
		cb.setProductid(0);
		cb.setQuantity(0);
		cb.setTotal(total);
		cb.setCarry(0);
		cb.setDate(date);
		cb.setStatus("payment");
		
		try {
			
				res = cb.addToCatalogFollowingOrderId();
				
		    }
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return res;
	}
	
	public int addPurchase(int productid,int quantity,int total,String date)
	{
		CatalogBean cb = new CatalogBean();
		int res = 0;
		cb.setUserid(0);
		cb.setProductid(productid);
		cb.setQuantity(quantity);
		cb.setTotal(total);
		cb.setCarry(0);
		cb.setDate(date);
		cb.setStatus("purchase");
		
		try {
			
				res = cb.addToCatalogFollowingOrderId();
				
		    }
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return res;
	}
	
	
	public ArrayList<CatalogBean> activityByUserId(int userid)
	{
		CatalogBean cb = new CatalogBean();
		cb.setUserid(userid);
		ArrayList<CatalogBean> cat = new ArrayList<>();
		try {
			
			 cat = cb.CatalogByUserId();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Collections.reverse(cat); //reversing to start from the latest activity
		
	return cat;	
	}
	
	public ArrayList<CatalogBean> activityByUserIdAndDate(int userid,String date)
	{
		String dd = this.getDay(date);
		String mm = this.getMonth(date);
		String yy = this.getYear(date);
		
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
		
		CatalogBean cb = new CatalogBean();
		cb.setUserid(userid);
		try {
			
				ArrayList<CatalogBean> cat = cb.CatalogByUserId();
				for(CatalogBean c : cat)
				{
					String recdate = c.getDate();
					String dd1 = this.getDay(recdate);
					String mm1 = this.getMonth(recdate);
					String yy1 = this.getYear(recdate);
					
					
					if(dd.equals("00") && !mm.equals("00") && !yy.equals("0000"))
					{
						if(mm1.equals(mm) && yy1.equals(yy))
						{
							finalcat.add(c);
						}	
						
					}
					else if(dd.equals("00") && mm.equals("00") && !yy.equals("0000"))
					{
						if(yy1.equals(yy))
						{
							finalcat.add(c);
						}
					}
					else
					{
						if(dd1.equals(dd) && mm1.equals(mm) && yy1.equals(yy))
						{
							finalcat.add(c);
						}
					}	
				}	
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return finalcat;
	}
	
	public ArrayList<UserBean> RecentSortedUsers()
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cats = new ArrayList<>();
		ArrayList<UserBean> users = new ArrayList<>();
		UserBean ub = new UserBean();
		
		try {
				cats = cb.allOrders();
				Collections.reverse(cats);
				HashSet<Integer> h = new HashSet<Integer>();
				
				for(CatalogBean c : cats)
				{
					Integer uid = c.getUserid();
					h.add(uid);
				}	
				
				Iterator<Integer> i = h.iterator();
				while(i.hasNext())
				{
					int k = i.next();
					ub.setUserid(k);
					ArrayList<UserBean> tempusers = ub.UserById();
					users.add(tempusers.get(0));
				}	
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	return users;	
		
	}
	
	
	
	
	
	public ArrayList<CatalogBean> allActivityByDate(String date)
	{
		String dd = this.getDay(date);
		String mm = this.getMonth(date);
		String yy = this.getYear(date);
		
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
		
		CatalogBean cb = new CatalogBean();
		try {
			
				ArrayList<CatalogBean> cat = cb.allOrders();
				for(CatalogBean c : cat)
				{
					String recdate = c.getDate();
					String dd1 = this.getDay(recdate);
					String mm1 = this.getMonth(recdate);
					String yy1 = this.getYear(recdate);
					
					
					if(dd.equals("00") && !mm.equals("00") && !yy.equals("0000"))
					{
						if(mm1.equals(mm) && yy1.equals(yy))
						{
							finalcat.add(c);
						}	
						
					}
					else if(dd.equals("00") && mm.equals("00") && !yy.equals("0000"))
					{
						if(yy1.equals(yy))
						{
							finalcat.add(c);
						}
					}
					else
					{
						if(dd1.equals(dd) && mm1.equals(mm) && yy1.equals(yy))
						{
							finalcat.add(c);
						}
					}	
				}	
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return finalcat;
	}
	
	public ArrayList<CatalogBean> allPaymentsByDate(String date)
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cat = new ArrayList<>();
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
				
			cat = this.allActivityByDate(date);
			
			for(CatalogBean c : cat)
			{
				String st = c.getStatus();
				if(st.equals("payment"))
				{
					finalcat.add(c);
				}
			}
			
		
		return finalcat;
	}

	public ArrayList<CatalogBean> allActivity()
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cat = new ArrayList<>(); 
				
			try {
				
					cat = cb.allOrders();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		Collections.reverse(cat); 	
		return cat;	
	}
	
	
	public ArrayList<OrderForView> allActivityForView()
	{
		ArrayList<CatalogBean> allorders = this.allActivity();
		ArrayList<OrderForView> fallorders = this.convertToOrderViewList(allorders);
		
	return fallorders;	
	}
	
	public ArrayList<CatalogBean> allRequestedActivity()
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cat = new ArrayList<>();
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
				
			try {
				
					cat = cb.allOrders();
					
					for(CatalogBean c : cat)
					{
						String st = c.getStatus();
						if(st.equals("requested"))
						{
							finalcat.add(c);
						}
					}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return finalcat;	
	}
	
	
	public ArrayList<CatalogBean> allPaymentsByUserId(int userid)
	{
		CatalogBean cb = new CatalogBean();
		cb.setUserid(userid);
		ArrayList<CatalogBean> cat = new ArrayList<>();
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
				
			try {
				
					cat = cb.CatalogByUserId();
					
					for(CatalogBean c : cat)
					{
						String st = c.getStatus();
						if(st.equals("payment"))
						{
							finalcat.add(c);
						}
					}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		Collections.reverse(finalcat);	
		
		return finalcat;	
	}
	
	
	public ArrayList<CatalogBean> allAcceptedActivity()
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cat = new ArrayList<>();
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
				
			try {
				
					cat = cb.allOrders();
					
					for(CatalogBean c : cat)
					{
						String st = c.getStatus();
						if(st.equals("accepted"))
						{
							finalcat.add(c);
						}
					}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return finalcat;	
	}
	
	public ArrayList<CatalogBean> allpurchase()
	{
		CatalogBean cb = new CatalogBean();
		ArrayList<CatalogBean> cat = new ArrayList<>();
		ArrayList<CatalogBean> finalcat = new ArrayList<>();
				
			try {
				
					cat = cb.allOrders();
					
					for(CatalogBean c : cat)
					{
						String st = c.getStatus();
						if(st.equals("purchase"))
						{
							finalcat.add(c);
						}
					}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		Collections.reverse(finalcat);	
			
		return finalcat;
	}
	
	public OrderForView convertOrderForView(CatalogBean cb)
	{
		OrderForView of = new OrderForView();
		int pid1 = cb.getProductid();
		int uid1 = cb.getUserid();
		
		String checkst = cb.getStatus();
		
		UserBean u = new UserBean();
		u.setUserid(uid1);
		ProductBean p = new ProductBean();
		p.setProductid(pid1);
		
		
		if(checkst.equals("payment"))
		{
			//no need of productbean
			
			
			try {
				
				ArrayList<UserBean> user = u.UserById();
				//ArrayList<ProductBean> prod = p.ProductById();
				
				UserBean u1 = new UserBean();
				u1 = user.get(0);
				ProductBean p1 = new ProductBean();
				//p1 = prod.get(0);
				
				int uid = u1.getUserid();
				String uname = u1.getUsername();
				int oid = cb.getOrderid();
				//int pid = p1.getProductid();
				//String pname = p1.getProductname();
				int t = cb.getTotal();
				int qt = cb.getQuantity();
				String st = cb.getStatus();
				String d = cb.getDate();
				
				of.setUserid(uid);
				of.setUsername(uname);
				of.setOrderid(oid);
				//of.setProductid(pid);
				//of.setProductname(pname);
				of.setTotal(t);
				of.setQuantity(qt);
				of.setStatus(st);
				of.setDate(d);
		
				
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}
		else if(checkst.equals("purchase"))
		{
			//no nead of userbean
			
			try {
				
				//ArrayList<UserBean> user = u.UserById();
				ArrayList<ProductBean> prod = p.ProductById();
				
				//UserBean u1 = new UserBean();
				//u1 = user.get(0);
				ProductBean p1 = new ProductBean();
				p1 = prod.get(0);
				
				//int uid = u1.getUserid();
				//String uname = u1.getUsername();
				int oid = cb.getOrderid();
				int pid = p1.getProductid();
				String pname = p1.getProductname();
				int t = cb.getTotal();
				int qt = cb.getQuantity();
				String st = cb.getStatus();
				String d = cb.getDate();
				
				//of.setUserid(uid);
				//of.setUsername(uname);
				of.setOrderid(oid);
				of.setProductid(pid);
				of.setProductname(pname);
				of.setTotal(t);
				of.setQuantity(qt);
				of.setStatus(st);
				of.setDate(d);
		
				
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}
		else
		{
			try {
				
				ArrayList<UserBean> user = u.UserById();
				ArrayList<ProductBean> prod = p.ProductById();
				
				UserBean u1 = new UserBean();
				u1 = user.get(0);
				ProductBean p1 = new ProductBean();
				p1 = prod.get(0);
				
				int uid = u1.getUserid();
				String uname = u1.getUsername();
				int oid = cb.getOrderid();
				int pid = p1.getProductid();
				String pname = p1.getProductname();
				int t = cb.getTotal();
				int qt = cb.getQuantity();
				String st = cb.getStatus();
				String d = cb.getDate();
				int c = cb.getCarry();
				
				of.setUserid(uid);
				of.setUsername(uname);
				of.setOrderid(oid);
				of.setProductid(pid);
				of.setProductname(pname);
				of.setTotal(t);
				of.setQuantity(qt);
				of.setStatus(st);
				of.setDate(d);
				of.setCarry(c);
		
				
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
		
		
	return of;	
	}
	
	
	public ArrayList<OrderForView> convertToOrderViewList(ArrayList<CatalogBean> ord)
	{
		ArrayList<OrderForView> finalord = new ArrayList<>();
		Tool t = new Tool();
		
		for(CatalogBean c : ord)
		{
			finalord.add(t.convertOrderForView(c));
		}
		
	 return finalord;	
	}
	
	public CartForView convertCartToCartForView(CartBean cb)
	{
		ProductBean pb = new ProductBean();
		pb.setProductid(cb.getProductid());
		
		CartForView cf = new CartForView();
		
		try {
			
				ArrayList<ProductBean> prod = pb.ProductById();
				
				String productname = prod.get(0).getProductname();
				int price = prod.get(0).getPrice();
				
				cf.setUserid(cb.getUserid());
				cf.setCartid(cb.getCartid());
				cf.setProductid(cb.getProductid());
				cf.setProductname(productname);
				cf.setQuantity(cb.getQuantity());
				cf.setPrice(price);
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return cf;	
	}
	
	public ArrayList<CartForView> convertCartListForView(ArrayList<CartBean> cart)
	{
		ArrayList<CartForView> cartf = new ArrayList<>();
		for(CartBean c : cart)
		{
			cartf.add(this.convertCartToCartForView(c));
		}
		
	return cartf;	
	}
	
	
	public static void main(String[] args) 
	{
		//String str = "loadrecord?date=none&payment=none&request=none&process=none&accept=none&complete=none&userid=";
		Tool t = new Tool();
		ArrayList<CatalogBean> cat = t.allActivity();
		ArrayList<OrderForView> fcat = t.convertToOrderViewList(cat);
		fcat = t.statusFilter(fcat,"processing");
		
		for(OrderForView of : fcat)
		{
			of.showOrderForView();
		}	
		
	}
	
}
