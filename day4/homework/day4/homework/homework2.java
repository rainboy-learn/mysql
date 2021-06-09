package com.atguigu.homework;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

/*
二、修改指定客户
请输入待修改的客户编号：3
请输入新的客户姓名：林小玲
修改成功！
 */
public class homework2 {
	public static void main(String[] args) {
		Scanner s1 = new Scanner(System.in);
		System.out.print("请输入待修改的客户编号：");
		String id = s1.next();
		Scanner s2 = new Scanner(System.in);
		System.out.print("请输入新的客户姓名：");
		String name = s2.next();
		Properties pro = new Properties();
		try {
			pro.load(new FileInputStream("homeword.properties"));
			String user = pro.getProperty("user");
			String password = pro.getProperty("password");
			String url = pro.getProperty("url");
			String driver = pro.getProperty("driver");
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement statement = connection.prepareStatement("update from customers set name=? where id=?");
			statement.setObject(1, name);
			statement.setObject(2, id);	
			statement.executeUpdate();
			System.out.println("修改成功");
			statement.close();
			connection.close();
		} catch (IOException e) {
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
