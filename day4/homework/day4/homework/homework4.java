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
import java.util.Scanner;

/*
四、根据编号，查询客户的详细信息，效果如下：
请输入编号：1
---------------------------------------------------------------------------------
编号	姓名	邮箱	生日
1	汪峰	wf@126.com	2010-2-2
 */
public class homework4 {
	public static void main(String[] args) {
		Scanner s1 = new Scanner(System.in);
		System.out.print("请输入客户编号：");
		String id = s1.next();
		Properties pro = new Properties();
		try {
			pro.load(new FileInputStream("homeword.properties"));
			String user = pro.getProperty("user");
			String password = pro.getProperty("password");
			String url = pro.getProperty("url");
			String driver = pro.getProperty("driver");
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement statement = connection.prepareStatement("select * from customers where id=?");
			statement.setObject(1, id);
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				int int1 = set.getInt("id");
				String str1 = set.getString("name");
				String str2 = set.getString("email");
				Date date = set.getDate("birth");
				System.out.println(int1 + " " + str1 + " " + str2 + " " + date);
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
