package com.atguigu.jdbc1;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;

import org.junit.Test;

/**
 * 此类用于演示使用PreparedStatement实现增删改查
 * @author liyuting
 *
 */
public class TestPreparedStatementByUtils {
	/*
	 * 二、修改指定客户
		请输入待修改的客户编号：3
		请输入新的客户姓名：林小玲
		修改成功！

	 */
	@Test
	public void testUpdate() {
		
		Scanner input  = new Scanner(System.in);
		
		System.out.println("请输入待修改的客户编号：");
		int id = input.nextInt();
		
		System.out.println("请输入新的客户姓名：");
		String name = input.next();
		
		//----------------------连接数据库的步骤----------------
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			//1.获取连接
			connection = JDBCUtils.getConnection();
			
			
			//2.执行修改
			String sql = "update customers set name=? where id=?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			statement.setInt(2, id);
			int update = statement.executeUpdate();
			System.out.println(update>0?"修改成功！":"修改失败！");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		
			//3.关闭
			JDBCUtils.close(null, statement, connection);
		}
		
		
		
		
		
		
		
		
		
	}

}
