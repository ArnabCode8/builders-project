package Servlet;

import java.util.ArrayList;

public class MyOrders 
{
	public ArrayList<Order> allMyOrders()
	{
		ArrayList<Order> orders = new ArrayList<>();
		
		Order or1 = new Order();
		or1.setUsername("Arnab Das");
		or1.setProductname("Sand");
		or1.setQuantity(10);

		Order or2 = new Order();
		or2.setUsername("Arnab Das");
		or2.setProductname("Cement");
		or2.setQuantity(5);

		Order or3 = new Order();
		or3.setUsername("Arnab Das");
		or3.setProductname("Brick");
		or3.setQuantity(100);

		Order or4 = new Order();
		or4.setUsername("Arnab Das");
		or4.setProductname("Stone Cheaps 0.50");
		or4.setQuantity(10);

		orders.add(or1);
		orders.add(or2);
		orders.add(or3);
		orders.add(or4);
		
	return orders;	
	}
	
	public static void main(String[] args) 
	{
		MyOrders mo = new MyOrders();
		ArrayList<Order> orders = mo.allMyOrders();
		
		for(Order or : orders)
		{
			or.showOrder();
		}
		
	}

}
