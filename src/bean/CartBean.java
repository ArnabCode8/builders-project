package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.ResultSet;

import util.DBConnection;

public class CartBean 
{
	private int userid;
	private int cartid;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}


	private int productid;
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	void showCart()
	{
		System.out.println(this.userid);
		System.out.println(this.cartid);
		System.out.println(this.productid);
		System.out.println(this.quantity);
	}
	
	public int addToCart() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "insert into cart values(?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2,cartid);
		ps.setInt(3,productid);
		ps.setInt(4,quantity);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	public ArrayList<CartBean> CartByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from cart where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<CartBean> cart = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CartBean cb = new CartBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setCartid(rs.getInt("cartid"));
			cb.setProductid(rs.getInt("productid"));
			cb.setQuantity(rs.getInt("quantity"));
			
		
			
			cart.add(cb);
		}
		
		return cart;
		
	}
	
	public ArrayList<CartBean> CartByUserIdAndCartId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from cart where userid=? and cartid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		ps.setInt(2, cartid);
		
		ArrayList<CartBean> cart = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CartBean cb = new CartBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setCartid(rs.getInt("cartid"));
			cb.setProductid(rs.getInt("productid"));
			cb.setQuantity(rs.getInt("quantity"));
			
		
			
			cart.add(cb);
		}
		
		return cart;
		
	}
	
	public int deleteFromCartByUserIdAndCartId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from cart where userid=? and cartid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2, cartid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	public int deleteFromCartByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from cart where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int addToCartFollowingCartId() throws SQLException
	{
		ArrayList<CartBean> cart = this.CartByUserId();
		int len = cart.size();
		
		this.setCartid(len + 1);
		
		int res = this.addToCart();
		
	return res;	
	}

	public int deleteFromCartByUserIdAndCartIdFollowingCartId() throws SQLException
	{
		int res = this.deleteFromCartByUserIdAndCartId();
		int flag = 1;
		
		if(res == 1)
		{	
			ArrayList<CartBean> cart = this.CartByUserId();
			int res2 = this.deleteFromCartByUserId();
			
			System.out.println("Delete from kart by userid : " + res2);
			
				for(CartBean c : cart)
				{
					c.showCart();
					
					int res3 = c.addToCartFollowingCartId();
					flag = flag * res3;
				}	
			
			
		}
		
		
	return flag;	
	}
	
	
	public int updateCartByUserIdAndCartId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update cart set quantity=? where userid=? and cartid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setInt(1, quantity);
		ps.setInt(2, userid);
		ps.setInt(3, cartid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	void allCartTest() throws SQLException
	{
		CartBean cb1 = new CartBean();
		cb1.setUserid(1);
		cb1.setProductid(1);
		cb1.setQuantity(100);
		
		
		CartBean cb2 = new CartBean();
		cb2.setUserid(1);
		cb2.setProductid(2);
		cb2.setQuantity(200);

		CartBean cb3 = new CartBean();
		cb3.setUserid(1);
		cb3.setProductid(3);
		cb3.setQuantity(50);

		CartBean cb4 = new CartBean();
		cb4.setUserid(1);
		cb4.setProductid(4);
		cb4.setQuantity(500);
		
		int res = cb1.addToCartFollowingCartId();
		res = cb2.addToCartFollowingCartId();
		res = cb3.addToCartFollowingCartId();
		res = cb4.addToCartFollowingCartId();
		    

	}
	
	public static void main(String[] args) 
	{
		CartBean cb = new CartBean();
		cb.setUserid(1);
		cb.setCartid(2);
		
		try {
			
			cb.allCartTest();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try 
		{
			 int res = cb.deleteFromCartByUserIdAndCartIdFollowingCartId();
			 
			 if(res == 1)
			 {
				 System.out.println("SuccessFul");
			 }
			 else
			 {
				 System.out.println("Failed");
			 }	 
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
