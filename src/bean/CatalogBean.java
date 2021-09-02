package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class CatalogBean 
{
	private int userid;
	private int orderid;
	private int productid;
	private int quantity;
	private String date;
	private int total;
	private int carry;
	public int getCarry() {
		return carry;
	}
	public void setCarry(int carry) {
		this.carry = carry;
	}

	private String status;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void showOrder() 
	{
		String st = this.status;
		
		if(st.equals("payment"))
		{
			System.out.println("Payment of Rs:"  + this.total + ": Done By " + this.userid + " on " + this.date);
		}
		else if(st.equals("purchase"))
		{
			System.out.println("Purchase of : Product" + this.productid + " of quantity : " + this.quantity + " for Rs : " + this.total + " on "+ this.date);
		}
		else
		{
			System.out.println("Order by : userid " + this.userid + " of productid :" + this.productid + " quantity : " + this.quantity + " total : " + this.total + " on : " + this.date + " status : " + this.status + " carry : " + this.carry);
		}	
	}
	
	
	int addOrderToCatalog() throws SQLException
	{
		//register the driver
				Connection con = DBConnection.buildersdbConnect();
				
				
				//sql query
				
				String sql = "insert into catalog values(?,?,?,?,?,?,?,?)";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setInt(1, userid);
				ps.setInt(2, orderid);
				ps.setInt(3, productid);
				ps.setInt(4,quantity);
				ps.setString(5,date);
				ps.setInt(6,total);
				ps.setInt(7,carry);
				ps.setString(8, status);
					
				
				//execute
				//ps.execute();
				int res = ps.executeUpdate();
				
				//close the connection
				con.close();
				
				return res;
	}
	
	
	public ArrayList<CatalogBean> allOrders() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from catalog";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		
		ArrayList<CatalogBean> allcats = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CatalogBean cb = new CatalogBean();
			
			
			cb.setUserid(rs.getInt("userid"));
			cb.setOrderid(rs.getInt("orderid"));
			cb.setProductid(rs.getInt("productid"));
			cb.setQuantity(rs.getInt("quantity"));
			cb.setDate(rs.getString("date"));
			cb.setTotal(rs.getInt("total"));
			cb.setCarry(rs.getInt("carry"));
			cb.setStatus(rs.getString("status"));
			
			allcats.add(cb);
		}
		
		return allcats;
		
	}
	
	public ArrayList<CatalogBean> CatalogByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from catalog where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<CatalogBean> cart = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CatalogBean cb = new CatalogBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setOrderid(rs.getInt("orderid"));
			cb.setProductid(rs.getInt("productid"));
			cb.setQuantity(rs.getInt("quantity"));
			cb.setDate(rs.getString("date"));
			cb.setTotal(rs.getInt("total"));
			cb.setCarry(rs.getInt("carry"));
			cb.setStatus(rs.getString("status"));
			
		
			
			cart.add(cb);
		} 
		
		return cart;
		
	}
	
	
	public ArrayList<CatalogBean> CatalogByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from catalog where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		ps.setInt(2, orderid);
		
		ArrayList<CatalogBean> cart = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			CatalogBean cb = new CatalogBean();
			cb.setUserid(rs.getInt("userid"));
			cb.setOrderid(rs.getInt("orderid"));
			cb.setProductid(rs.getInt("productid"));
			cb.setQuantity(rs.getInt("quantity"));
			cb.setDate(rs.getString("date"));
			cb.setTotal(rs.getInt("total"));
			cb.setCarry(rs.getInt("carry"));
			cb.setStatus(rs.getString("status"));
			
		
			
			cart.add(cb);
		} 
		
		return cart;
		
	}
	public int deleteFromCatalogByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from catalog where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, userid);
		ps.setInt(2, orderid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	public int deleteFromCatalogByUserId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from catalog where userid=?";
		
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
	
	
	public int updateOrderStatusByUserIdAndOrderId() throws SQLException
	{
		//register the driver
				Connection con = DBConnection.buildersdbConnect();
				
				
				//sql query
				
				String sql = "update catalog set status=? where userid=? and orderid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, status);
				ps.setInt(2, userid);
				ps.setInt(3, orderid);
				
				//execute
				//ps.execute();
				int res = ps.executeUpdate();
				
				//close the connection
				con.close();
				
				return res;
		
	}
	
	public int updateOrderTotalByUserIdAndOrderId() throws SQLException
	{
		//register the driver
				Connection con = DBConnection.buildersdbConnect();
				
				
				//sql query
				
				String sql = "update catalog set total=? where userid=? and orderid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setInt(1, total);
				ps.setInt(2, userid);
				ps.setInt(3, orderid);
				
				//execute
				//ps.execute();
				int res = ps.executeUpdate();
				
				//close the connection
				con.close();
				
				return res;
		
	}
	
	public int updateOrderTotalAndCarryAndStatusByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update catalog set total=?, carry=?, status=? where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, total);
		ps.setInt(2, carry);
		ps.setString(3, status);
		ps.setInt(4, userid);
		ps.setInt(5, orderid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateOrderTotalAndStatusByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update catalog set total=?, status=? where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, total);
		ps.setString(2, status);
		ps.setInt(3, userid);
		ps.setInt(4, orderid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	public int updateOrderQuantityByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update catalog set quantity=? where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, quantity);
		ps.setInt(2, userid);
		ps.setInt(3, orderid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}

	
	
	
	
	
	
	public int updateOrderByUserIdAndOrderId() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update catalog set productid=?, quantity=?, date=?, total=?, status=? where userid=? and orderid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, productid);
		ps.setInt(2, quantity);
		ps.setString(3, date);
		ps.setInt(4, total);
		ps.setString(5, status);
		ps.setInt(6, userid);
		ps.setInt(7, orderid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int addToCatalogFollowingOrderId() throws SQLException
	{
		ArrayList<CatalogBean> cat = this.CatalogByUserId();
		int len = cat.size();
		
		this.setOrderid(len + 1);
		
		int res = this.addOrderToCatalog();
		
	return res;	
	}

	public int deleteFromCatalogByUserIdAndOrderIdFollowingOrderId() throws SQLException
	{
		int res = this.deleteFromCatalogByUserIdAndOrderId();
		int flag = 1;
		
		if(res == 1)
		{	
			ArrayList<CatalogBean> cart = this.CatalogByUserId();
			int res2 = this.deleteFromCatalogByUserId();
			
			System.out.println("Delete from kart by userid : " + res2);
			
				for(CatalogBean c : cart)
				{
					
					int res3 = c.addToCatalogFollowingOrderId();
					flag = flag * res3;
				}	
			
			
		}
		
		
	return flag;	
	}
	
	public static void main(String[] args) 
	{
		CatalogBean cb = new CatalogBean();
		
		cb.setUserid(1);
		
		try {
			
				ArrayList<CatalogBean> cat= cb.CatalogByUserId();
				
				if(cat.size() != 0)
				{
					for(CatalogBean c : cat)
					{
						c.showOrder();
					}
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
