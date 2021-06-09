package com.atguigu.homework;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.Scanner;
import org.junit.Test;

public class HomeWork {

//	一、向customers表中插入数据，效果如下：
//	请输入编号：55
//	请输入姓名：上官红
//	请输入邮箱：shangguan@126.com
//	请输入生日（要求按xxxx-xx-xx格式）：1988-11-11
//	插入成功！
	@Test
	public void work1() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("请输入编号:");
		String id = input.next();
		System.out.print("请输入姓名:");
		String name = input.next();
		System.out.print("请输入邮箱:");
		String email = input.next();
		System.out.print("请输入生日:");
		String borndate = input.next();

		// 一下为连接数据库的步骤
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// 注册驱动
		Class.forName(driver);

		// 获取连接
		Connection connection = DriverManager.getConnection(url, user, password);

		// 执行操作
		String sql = "insert into customers(id,name,email,birth) values(?, ?, ?, ?)";

		PreparedStatement prepareStatement = connection.prepareStatement(sql);

		prepareStatement.setInt(1, Integer.parseInt(id));
		prepareStatement.setString(2, name);
		prepareStatement.setString(3, email);
		prepareStatement.setString(4, borndate);

		int executeUpdate = prepareStatement.executeUpdate();

		if (executeUpdate != 0) {
			System.out.println("插入成功");
		}

		prepareStatement.close();
		connection.close();
	}

//	二、修改指定客户
//	请输入待修改的客户编号：3
//	请输入新的客户姓名：林小玲
//	修改成功！
	@Test
	public void work2() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("请输入待修改的客户编号:");
		String id = input.next();
		System.out.print("请输入新的客户姓名:");
		String name = input.next();

		// 一下为连接数据库的步骤
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// 注册驱动
		Class.forName(driver);

		// 获取连接
		Connection connection = DriverManager.getConnection(url, user, password);

		// 执行操作
		String sql = "update customers set name = ? where id = ?";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, name);
		prepareStatement.setString(2, id);

		int executeUpdate = prepareStatement.executeUpdate();
		if (executeUpdate != 0) {
			System.out.println("修改成功");
		}

		prepareStatement.close();
		connection.close();
	}
	
//	三、查询所有客户信息
	@Test
	public void work3() throws Exception, IOException {

		// 一下为连接数据库的步骤
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// 注册驱动
		Class.forName(driver);

		// 获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		
		//执行操作
		String sql = "select * from customers";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		
		while (executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name = executeQuery.getString(2);
			String email = executeQuery.getString(3);
			String date = executeQuery.getString(4);
			Blob blob = executeQuery.getBlob(5);
			System.out.println(id + "\t" + name + "\t" + email + "\t" + date + "\t" + blob);
		}
		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
		
	}
	
//	三、根据编号，查询客户的详细信息，效果如下：
//	请输入编号：1
//	---------------------------------------------------------------------------------
//	编号	姓名	邮箱	生日
//	1	汪峰	wf@126.com	2010-2-2
	
	@Test
	public void work4() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("请输入编号:");
		String id = input.next();
		
		// 一下为连接数据库的步骤
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// 注册驱动
		Class.forName(driver);

		// 获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		
		// 执行操作
		String sql = "select id,name,email,birth from customers where id = ?";
		
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, id);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		executeQuery.next();
		int id1 = executeQuery.getInt(1);
		String name = executeQuery.getString(2);
		String email = executeQuery.getString(3);
		String date = executeQuery.getString(4);
		System.out.println("---------------------------------------------------------------------------------");
		System.out.println("编号\t姓名\t邮箱\t生日");
		System.out.println(id1 + "\t" + name + "\t" + email + "\t" + date);
		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
	}
	
//	四、根据姓名，查询客户的详细信息，效果如下：
//	请输入姓名：王菲
//	---------------------------------------------------------------------------------
//	查无此人
	
	@Test
	public void work5() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("请输入姓名:");
		String name = input.next();
		System.out.println("---------------------------------------------------------------------------------");
		
		// 一下为连接数据库的步骤
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// 注册驱动
		Class.forName(driver);

		// 获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		
		// 执行操作
		String sql = "select * from customers where name = ? ";
		
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		
		prepareStatement.setString(1, name);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		
		if(executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name1 = executeQuery.getString(2);
			String email = executeQuery.getString(3);
			String birth = executeQuery.getString(4);
			Blob blob = executeQuery.getBlob(5);
			System.out.println(id + "\t" + name1 + "\t" + email + "\t" + birth + "\t" + blob);
		} else {
			System.out.println("查无此人");
		}

		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
	}
}
