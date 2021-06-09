package com.atguigu.jdbc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.Scanner;

import org.junit.Test;

/**
 * 此类用于演示PreparedStatement和Statement的区别
 * @author liyuting
 * 案例：登录验证
 * 
 * 
 * 使用PreparedStatement的好处：
 * 1、不再使用+拼接sql语句，减少语法错误，语义性强
 * 2、将模板sql（固定的部分）和参数部分进行了分离，提高维护性
 * 3、有效的解决了sql注入问题！
 * 4、大大减少了编译次数，效率较高
 * 
 * 
 * 
 */
public class TestPrepareStatement {
	//使用Statement实现登录
	@Test
	public void testStatement() throws Exception{
		Scanner input  = new Scanner(System.in);
		System.out.println("Please input username:");
		String username = input.next();
		System.out.println("Please input password:");
		String pwd = input.next();
		
		
		//----------------以下为连接数据库的步骤---------------------------
		Properties info  = new Properties();
		info.load(new FileInputStream("src\\jdbc.properties"));
		String user = info.getProperty("user");
		String password = info.getProperty("password");
		String driver = info.getProperty("driver");
		String url = info.getProperty("url");
		
		//1.注册驱动
		Class.forName(driver);
		//2.获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		//3.执行查询
		String sql = "SELECT COUNT(*) FROM admin WHERE username = '"+username+"' AND PASSWORD='"+pwd+"'";
		
		Statement statement = connection.createStatement();
		
		ResultSet set = statement.executeQuery(sql);
		
		if(set.next()){
			int count = set.getInt(1);
			System.out.println(count>0?"Login Success!":"Login Failure!!");
			
		}
		
		//4.关闭
		set.close();
		statement.close();
		connection.close();
		
	}
	
	//使用PreparedStatement实现登录
	@Test
	public void testPreparedStatement() throws Exception{
		Scanner input  = new Scanner(System.in);
		System.out.println("Please input username:");
		String username = input.next();
		System.out.println("Please input password:");
		String pwd = input.next();
		
		
		//----------------以下为连接数据库的步骤---------------------------
		Properties info  = new Properties();
		info.load(new FileInputStream("src\\jdbc.properties"));
		String user = info.getProperty("user");
		String password = info.getProperty("password");
		String driver = info.getProperty("driver");
		String url = info.getProperty("url");
		
		//1.注册驱动
		Class.forName(driver);
		//2.获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		
		//3.执行查询
		//3-1 编写sql
		String sql = "SELECT COUNT(*) FROM admin WHERE username =?  AND PASSWORD=?";
		//3-1 获取PreparedStatement命令对象
		PreparedStatement statement = connection.prepareStatement(sql);
		//预编译
		//3-2 设置占位符的值
		statement.setString(1, username);
		statement.setString(2, pwd);
		
		//3-3 执行sql命令
//		int update = statement.executeUpdate();//执行增删改，返回受影响的行数
		ResultSet set = statement.executeQuery();//执行查询，返回结果集
		if (set.next()) {
			int count = set.getInt(1);
			System.out.println(count>0?"Login Success!":"Login Failure!!");
		}
		
		//4.关闭
		set.close();
		statement.close();
		connection.close();
		
		
		
		
	}

}
