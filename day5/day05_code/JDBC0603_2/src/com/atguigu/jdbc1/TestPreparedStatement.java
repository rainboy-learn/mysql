package com.atguigu.jdbc1;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.Scanner;

import org.junit.Test;

/**
 * 此类用于演示使用PreparedStatement实现增删改查
 * @author liyuting
 *
 */
public class TestPreparedStatement {
	/*
	 * 二、修改指定客户
		请输入待修改的客户编号：3
		请输入新的客户姓名：林小玲
		修改成功！

	 */
	@Test
	public void testUpdate() throws Exception{
		
		Scanner input  = new Scanner(System.in);
		
		System.out.println("请输入待修改的客户编号：");
		int id = input.nextInt();
		
		System.out.println("请输入新的客户姓名：");
		String name = input.next();
		
		//----------------------连接数据库的步骤----------------
		
		Properties info = new Properties();
		info.load(new FileInputStream("src\\jdbc.properties"));

		String user = info.getProperty("user");
		String password= info.getProperty("password");
		String url = info.getProperty("url");
		String driver = info.getProperty("driver");
		
		//1.注册驱动
		Class.forName(driver);
		//2.获取连接
		Connection connection = DriverManager.getConnection(url, user, password);
		
		//3.执行修改
		String sql = "update customers set name=? where id=?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, name);
		statement.setInt(2, id);
		int update = statement.executeUpdate();
		System.out.println(update>0?"修改成功！":"修改失败！");
		
		//4.关闭
		statement.close();
		connection.close();
		
		
		
		
		
		
		
	}

}
