package com.atguigu.homework;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

/*
 五、根据姓名，查询客户的详细信息，效果如下：
请输入姓名：王菲
---------------------------------------------------------------------------------
查无此人
 */
public class homework5 {
	public static void main(String[] args) {
		Scanner s1 = new Scanner(System.in);
		System.out.println("请输入姓名：");
		String name = s1.next();
		Properties pro = new Properties();
		try {
			pro.load(new FileInputStream("homeword.properties"));
			String user = pro.getProperty("user");
			String password = pro.getProperty("password");
			String url = pro.getProperty("url");
			String driver = pro.getProperty("driver");
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement statement = connection.prepareStatement("select * from customers where name=?");
			statement.setString(1, name);
			ResultSet set = statement.executeQuery();
			if(set ==null) {
				System.out.println("查无此人");
			}
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
