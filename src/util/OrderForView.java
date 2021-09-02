package util;

public class OrderForView 
{
	private int userid;
	private String username;
	private int orderid;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private int productid;
	private String productname;
	private int quantity;
	private int total;
	private String date;
	private String status;
	private int carry;
	
	
	public int getCarry() {
		return carry;
	}
	public void setCarry(int carry) {
		this.carry = carry;
	}
	public void showOrderForView()
	{
		System.out.println("userid : " + this.userid);
		System.out.println("username : " + this.username);
		System.out.println("order id : " + this.orderid);
		System.out.println("product id : " + this.productid);
		System.out.println("product name : " + this.productname);
		System.out.println("quantity : " + this.quantity);
		System.out.println("date : " + this.date);
		System.out.println("status : " + this.status);
		System.out.println("total : " + this.total);
		System.out.println("carry : " + this.carry);
	}
	
	

}
