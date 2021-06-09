package com.atguigu.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;

import com.atguigu.jdbc1.JDBCUtils;

/**
 * 此类用于演示JDBC中的事务
 * @author liyuting
 * 
 * 使用步骤：
 * 1、开启新事务
 * 取消隐式事务自动提交的功能
 * setAutoCommit(false);
 * 2、编写组成事务的一组sql语句
 * 
 * 3、结束事务
 * commit();提交
 * rollback();回滚
 * 
 * 细节：
 * 要求开启事务的连接对象和获取命令的连接对象必须是同一个！否则事务无效
 * 
 * 
 * 
 * 
 * 
 * 案例：转账案例
 * 张三丰给灭绝转5000
 * 
 *
 */
public class TestTransaction {
	//不用事务
	@Test
	public void testNoTransaction() throws Exception{
		//1.获取连接
		Connection connection = JDBCUtils.getConnection();
		
		//2.执行sql语句
		PreparedStatement statement = connection.prepareStatement("update account set balance = ? where stuname=?");
		
		//操作1：张三丰的钱-5000
		
		statement.setDouble(1, 5000);
		statement.setString(2, "张三丰");
		
		statement.executeUpdate();
		
		int i = 1/0;//模拟异常
		
		//操作2：张三丰的钱-5000
		
		statement.setDouble(1, 15000);
		statement.setString(2, "灭绝师太");
		
		statement.executeUpdate();
		
		
		//3.释放资源
		
		JDBCUtils.close(null, statement, connection);
		
		
		
	}

	//使用事务
	@Test
	public void testTransaction(){
		Connection connection  = null;
		PreparedStatement statement = null;
		
		try {
			//1.获取连接
			 connection = JDBCUtils.getConnection();
			//①事务的使用步骤1：开启事务
			
			connection.setAutoCommit(false);
			
			//②事务的使用步骤2：编写sql语句，并且执行
			
			 statement = connection.prepareStatement("update account set balance = ? where stuname=?");
			//操作1：张三丰的钱-5000
			
			statement.setDouble(1, 5000);
			statement.setString(2, "张三丰");
			
			statement.executeUpdate();
			
//			int i = 1/0;//模拟异常
			
			//操作2：张三丰的钱-5000
			
			statement.setDouble(1, 15000);
			statement.setString(2, "灭绝师太");
			
			statement.executeUpdate();
			
			
			//③事务的使用步骤3：结束事务
			
			connection.commit();
		} catch (SQLException e) {
			try {
				//回滚事务
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			JDBCUtils.close(null, statement, connection);
		}
		
	}
	
}
