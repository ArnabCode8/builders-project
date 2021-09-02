package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class ProductBean 
{
	private int productid;
	private String productname;
	private int price;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	public void showProduct()
	{
		System.out.println("ProductID : " + this.productid);
		System.out.println("Product Name : " + this.productname);
		System.out.println("Price : " + this.price);
	}



	public int addProduct() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "insert into product(productname,price) values(?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, productname);
		ps.setInt(2,price);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateProduct() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update product set productname=?, price=? where productid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, productname);
		ps.setInt(2, price);
		ps.setInt(3, productid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public ArrayList<ProductBean> allProducts() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from product";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		
		ArrayList<ProductBean> allprods = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			ProductBean pb = new ProductBean();
			pb.setProductid(rs.getInt("productid"));
			pb.setProductname(rs.getString("productname"));
			pb.setPrice(rs.getInt("price"));
			
			allprods.add(pb);
		}
		
		return allprods;
		
	}

	public ArrayList<ProductBean> ProductById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from product where productid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productid);
		
		ArrayList<ProductBean> allprods = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			ProductBean pb = new ProductBean();
			pb.setProductid(rs.getInt("productid"));
			pb.setProductname(rs.getString("productname"));
			pb.setPrice(rs.getInt("price"));
		
		
			
			allprods.add(pb);
		}
		
		return allprods;
		
	}
	
	/*
	public ArrayList<UserBean> UserByIdAndContact() throws SQLException
	{
		
		Connection con = DBConnection.buildersdbConnect();
		
		//sql query
		
		String sql = "select *from user where userid = ? and contact = ?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setInt(1, userid);
		ps.setString(2, contact);
		
		//execute
		//ps.execute();
        ArrayList<UserBean> alluser = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			UserBean ub = new UserBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setUsername(rs.getString("username"));
			ub.setContact(rs.getString("contact"));
			ub.setAddress(rs.getString("address"));
		
			
			alluser.add(ub);
		}
		
		return alluser;
	}*/

	public int deleteProductById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from product where productid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1,productid);	
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	

	public static void main(String[] args) 
	{
		ProductBean pb = new ProductBean();
		pb.setProductname("Brick");
		pb.setPrice(12);
		
		try {
			
				int res = pb.addProduct();
				
				if(res == 1)
				{
					System.out.println("Successful");
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
