package com.atguigu.jdbc;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/**
 * 此类用于演示JDBC的使用步骤3：增删改查
 * 
 * @author liyuting
 *
 */
public class TestJDBC3 {
	
	public static void main(String[] args) throws Exception {
		
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
		
		//3.执行增删改查
		//①编写sql命令
		
//		String sql = "select id,name,sex,borndate from beauty";
		//②获取执行sql的命令对象
		Statement statement = connection.createStatement();
		//③执行sql语句
		
//		boolean execute = statement.execute(sql);//执行任何sql语句
//		int update = statement.executeUpdate(sql);//执行增删改语句，返回受影响的行数
		ResultSet set = statement.executeQuery( "select id,name,sex,borndate from beauty");//执行查询语句，返回一个结果集
		
		//④处理执行后的结果
		while(set.next()){
			
			int id = set.getInt(1);
			String name = set.getString(2);
			String sex = set.getString(3);
			Date date = set.getDate(4);
			
			System.out.println(id+"\t"+name+"\t"+sex+"\t"+date);
		}
		//4.关闭连接
		
		set.close();
		statement.close();
		connection.close();
		
		
		
		
		
		
	}

}
