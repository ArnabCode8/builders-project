package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class UserBean {
	
	private int userid;
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}


	private String username;
	private String contact;
	private String address;
	private int dues;
	
		
	public int getDues() {
		return dues;
	}

	public void setDues(int dues) {
		this.dues = dues;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public void showUser()
	{
		System.out.println("UserID : " + this.userid);
		System.out.println("User Name : " + this.username);
		System.out.println("Contact : " + this.contact);
		System.out.println("Address : " + this.address);
		System.out.println("Dues : " + this.dues);
	}



	public int addUser() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "insert into user(username,contact,address,dues) values(?,?,?,?)";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, username);
		ps.setString(2,contact);
		ps.setString(3, address);
		ps.setInt(4, dues);
			
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	public int updateUser() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "update user set username=?, contact=?, address=? where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		
				
		ps.setString(1, username);
		ps.setString(2, contact);
		ps.setString(3, address);
		ps.setInt(4, userid);
		
		//execute
		//ps.execute();
		int res = ps.executeUpdate();
		
		//close the connection
		con.close();
		
		return res;
		
	}
	
	
	public int updateUserDuesByUserId() throws SQLException
	{
		
		//register the driver
				Connection con = DBConnection.buildersdbConnect();
				
				
				//sql query
				
				String sql = "update user set dues=? where userid=?";
				
				//prepare statement
				
				PreparedStatement ps = con.prepareStatement(sql);
				
						
				ps.setInt(1, dues);
				ps.setInt(2, userid);
				
				//execute
				//ps.execute();
				int res = ps.executeUpdate();
				
				//close the connection
				con.close();
				
				return res;
		
		
	}
	
	public ArrayList<UserBean> allUsers() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from user";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);	
		
		ArrayList<UserBean> alluser = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			UserBean ub = new UserBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setUsername(rs.getString("username"));
			ub.setContact(rs.getString("contact"));
			ub.setAddress(rs.getString("address"));
			ub.setDues(rs.getInt("dues"));
			
			alluser.add(ub);
		}
		
		return alluser;
		
	}

	public ArrayList<UserBean> UserById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "select *from user where userid=?";
		
		//prepare statement
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userid);
		
		ArrayList<UserBean> alluser = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			UserBean ub = new UserBean();
			ub.setUserid(rs.getInt("userid"));
			ub.setUsername(rs.getString("username"));
			ub.setContact(rs.getString("contact"));
			ub.setAddress(rs.getString("address"));
			ub.setDues(rs.getInt("dues"));
			
			alluser.add(ub);
		}
		
		return alluser;
		
	}
	
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
			ub.setDues(rs.getInt("dues"));
		
			
			alluser.add(ub);
		}
		
		return alluser;
	}

	public int deleteUserById() throws SQLException
	{
		//register the driver
		Connection con = DBConnection.buildersdbConnect();
		
		
		//sql query
		
		String sql = "delete from user where userid=?";
		
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
	
	
	public static void main(String[] args)
	{
		UserBean ub = new UserBean();
		ub.setUserid(1);
		ub.setUsername("Arnab Das");
		ub.setContact("8274909021");
		ub.setAddress("367B,M.I.D Road,Behala, Kolkata : 700 060");
		
		try {
			
				ArrayList<UserBean> users = ub.allUsers();
				
				for(UserBean u : users)
				{
					u.showUser();
				}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
