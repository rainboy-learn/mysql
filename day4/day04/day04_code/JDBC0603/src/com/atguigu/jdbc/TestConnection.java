package com.atguigu.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Driver;

/**
 * 此类用于演示JDBC的简单使用步骤
 * @author liyuting
 * 
 * 步骤：
 * 前提：准备mysql的驱动包，加载到项目中
 *  复制mysql-connector-java-5.1.37-bin.jar到项目的根目录下或libs目录下，然后右击build path——add to build path
 * 
 * 1、加载驱动
 * 2、获取连接
 * 3、执行增删改查操作★
 * 4、关闭连接
 * 
 * 
 * 
 *
 */
public class TestConnection {
	
	public static void main(String[] args) throws SQLException {
		//1.加载驱动
		
		DriverManager.registerDriver(new Driver());
		
		//2.获取连接
		
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/girls", "root", "root");

		//3.执行增删改查
		
		//3-1.编写sql语句
		//删除
//		String sql = "delete from beauty where id = 9";
		//更新
//		String sql = "update beauty set name='关晓彤' where id = 7";
		//增加
		String sql = "insert into beauty values(null,'小龙女','女','1998-1-1','110',null,3)";
		//3-2.获取执行sql语句的命令对象
		Statement statement = connection.createStatement();
		//3-3.使用命令对象指向sql语句
		int update = statement.executeUpdate(sql);
		
		//3-4.处理执行结果	
		System.out.println(update>0?"success":"failure");
		//4.关闭连接
		statement.close();
		connection.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
