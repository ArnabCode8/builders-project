package Servlet;

public class Order 
{
	public String username;
	public String productname;
	public int quantity;
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public void showOrder()
	{
		System.out.println("Username : " + this.username);
		System.out.println("Productname : " + this.productname + " and Quantity : " + this.quantity);
	}
	
	public static void main(String[] args) 
	{
		Order or = new Order();
		or.setUsername("Arnab Das");
		or.setProductname("Sand");
		or.setQuantity(10);
		
		or.showOrder();
		
	}

}
