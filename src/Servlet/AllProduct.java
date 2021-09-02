package Servlet;

import java.util.ArrayList;

public class AllProduct {
	
	public ArrayList<Product> getAllProducts()
	{
		
		ArrayList<Product> prod = new ArrayList<>();
		
		Product p1 = new Product();
		p1.setProductname("Sand");
		p1.setPrice(50);
		
		Product p2 = new Product();
		p2.setProductname("Cement");
		p2.setPrice(350);
		
		Product p3 = new Product();
		p3.setProductname("Stone Cheaps 0.50");
		p3.setPrice(70);
		
		Product p4 = new Product();
		p4.setProductname("Stone Cheaps 0.25");
		p4.setPrice(90);
		
		Product p5 = new Product();
		p5.setProductname("Brick");
		p5.setPrice(12);
		
		prod.add(p1);
		prod.add(p2);
		prod.add(p3);
		prod.add(p4);
		prod.add(p5);
		
		
		return prod;
	}

 	
	public static void main(String[] args) 
	{
		AllProduct alp = new AllProduct();
		ArrayList<Product> prod = alp.getAllProducts();
		int len = prod.size();
		System.out.println("Number of Products : " + len);
		
		/*for(Product p:prod)
		{
			p.showProduct();
			System.out.println("-------------------------");
		}*/
		
		for(int i = 0;i<len;i++)
		{
			prod.get(i).showProduct();
		}
		
	}
	
	
}
