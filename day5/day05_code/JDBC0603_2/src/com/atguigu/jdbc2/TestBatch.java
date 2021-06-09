package com.atguigu.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;

import com.atguigu.jdbc1.JDBCUtils;

/**
 * 此类用于演示批处理的使用
 * @author liyuting
 *案例：向admin表中插入50000行数据
 * 相关API：
 *  addBatch
 *  executeBatch
 *  clearBatch
 *  
 *  说明：批处理往往和PreparedStatement一起搭配使用，可以既减少编译次数，又减少运行次数，效率大大提高
 * 追加url：?rewriteBatchedStatements=true
 *  
 */
public class TestBatch {

	//么有使用批处理
	@Test
	public void testNoBatch() throws SQLException{
		
		//1.获取连接
		Connection connection = JDBCUtils.getConnection();
		
		//2.执行插入
		
		PreparedStatement statement = connection.prepareStatement("insert into admin values(null,?,?)");
		
		for(int i=1;i<=50000;i++){
			
			statement.setString(1,"john"+i);
			statement.setString(2, "0000");
			
			statement.executeUpdate();//执行
		}
		
		//3.释放资源
		JDBCUtils.close(null, statement, connection);
	}
	
	//使用批处理
		@Test
		public void testBatch() throws SQLException{
			
			//1.获取连接
			Connection connection = JDBCUtils.getConnection();
			
			//2.执行插入
			
			PreparedStatement statement = connection.prepareStatement("insert into admin values(null,?,?)");
			
			for(int i=1;i<=50000;i++){
				
				statement.setString(1,"john"+i);
				statement.setString(2, "0000");
				
				statement.addBatch();//添加sql语句到批处理包中
				if(i%1000==0){
					statement.executeBatch();//执行批处理包中的sql语句
					statement.clearBatch();//清空批处理包中的sql语句
				}
				
			}
			
			//3.释放资源
			JDBCUtils.close(null, statement, connection);
		}

}
