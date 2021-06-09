package com.atguigu.homework;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/*
三、查询所有客户信息
 */
public class homework3 {
	public static void main(String[] args) {
		Properties pro = new Properties();
		try {
			pro.load(new FileInputStream("homeword.properties"));
			String user = pro.getProperty("user");
			String password = pro.getProperty("password");
			String url = pro.getProperty("url");
			String driver = pro.getProperty("driver");
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement statement = connection.prepareStatement("select * from customers");
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				int o1 = set.getInt("id");
				String o2 = set.getString("name");
				String o3 = set.getString("email");
				Date o4 = set.getDate("birth");
				Object o5 = set.getObject("photo");
				System.out.println(o1 + " " + o2 + " " + o3 + " " + o4 + " " + o5);
			}
			statement.close();
			connection.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
