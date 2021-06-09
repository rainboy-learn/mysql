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
�����޸�ָ���ͻ�
��������޸ĵĿͻ���ţ�3
�������µĿͻ���������С��
�޸ĳɹ���
 */
public class homework2 {
	public static void main(String[] args) {
		Scanner s1 = new Scanner(System.in);
		System.out.print("��������޸ĵĿͻ���ţ�");
		String id = s1.next();
		Scanner s2 = new Scanner(System.in);
		System.out.print("�������µĿͻ�������");
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
			System.out.println("�޸ĳɹ�");
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
