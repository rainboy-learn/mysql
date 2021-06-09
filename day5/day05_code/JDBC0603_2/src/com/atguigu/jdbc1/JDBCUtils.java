package com.atguigu.jdbc1;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 此类是封装JDBC连接的工具类
 * @author liyuting
 * 
 * 功能：
 * 1、获取连接
 * 2、释放资源
 *
 */
public class JDBCUtils {
	static String user;
	static String password;
	static String url;
	static String driver;
	
	static{
		try {
			Properties info = new Properties();
			info.load(new FileInputStream("src\\jdbc.properties"));
			 user = info.getProperty("user");
			 password = info.getProperty("password");
			 url = info.getProperty("url");
			 driver = info.getProperty("driver");
			//1.注册驱动
			Class.forName(driver);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 功能：获取可用的连接对象
	 * @return 连接
	 * @throws Exception
	 */
	
	public static Connection getConnection(){
		
		try {
			return DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	
	/**
	 * 功能：释放资源
	 * @param set
	 * @param statement
	 * @param connection
	 * @throws Exception
	 */
	public static void close(ResultSet set,Statement statement,Connection connection){
		try {
			if (set!=null) {
				set.close();
			}
			if (statement!=null) {
				statement.close();
			}
			if (connection!=null) {
				connection.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		
	}
	
	

}
