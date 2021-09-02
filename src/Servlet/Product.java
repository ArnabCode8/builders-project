package Servlet;

public class Product {
	
	public String productname;
	public int price;

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	public void showProduct()
	{
		System.out.println("Product Name : " + this.productname);
		System.out.println("Price : " + this.price);
	}
	
	public static void main(String[] args) 
	{
		Product p1 = new Product();
		p1.setProductname("TeeShirt");
		p1.setPrice(100);
		
		p1.showProduct();
		
	}
}
