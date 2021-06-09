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
一、向customers表中插入数据，效果如下：
请输入编号：55
请输入姓名：上官红
请输入邮箱：shangguan@126.com
请输入生日（要求按xxxx-xx-xx格式）：1988-11-11
插入成功！
 */
public class homework1 {
	public static void main(String[] args) {
		Scanner s1 = new Scanner(System.in);
		System.out.print("请输入编号：");
		String id = s1.next();
		Scanner s2 = new Scanner(System.in);
		System.out.print("请输入姓名：");
		String name = s2.next();
		Scanner s3 = new Scanner(System.in);
		System.out.print("请输入邮箱：");
		String email = s3.next();
		Scanner s4 = new Scanner(System.in);
		System.out.print("请输入生日（要求按xxxx-xx-xx格式）：");
		String birth = s3.next();
		Properties pro = new Properties();
		try {
			pro.load(new FileInputStream("homeword.properties"));
			String user = pro.getProperty("user");
			String password = pro.getProperty("password");
			String url = pro.getProperty("url");
			String driver = pro.getProperty("driver");
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement statement = connection
					.prepareStatement("insert into customers(id,name,email,birth) values(?,?,?,?)");
			statement.setObject(1, id);
			statement.setString(2, name);
			statement.setString(3, email);
			statement.setObject(4, birth);
			statement.executeUpdate();
			System.out.println("插入成功");
			connection.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
