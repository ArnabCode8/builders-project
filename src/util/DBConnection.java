package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection 
{
	public static Connection buildersdbConnect() throws SQLException
	{
		//register the driver
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				
		//connection(url,user,password)
		String url = "jdbc:mysql://localhost:3306/buildersdb";
		String user = "root";
		String pass = "";
				
		Connection con = DriverManager.getConnection(url,user,pass);
				
		return con;
	}

}
