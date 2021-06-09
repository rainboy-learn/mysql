package com.atguigu.utils;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * 此类是通过德鲁伊数据库连接池获取连接对象
 * @author liyuting
 *
 */
public class JDBCUtilsByDruid {
	static DataSource ds;
	static{
		try {
			Properties properties = new Properties();
			properties.load(new FileInputStream("src\\druid.properties"));
			
			//1.创建了一个指定参数的数据库连接池
			 ds = DruidDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception{
		//2.从数据库连接池中获取可用的连接对象
		return ds.getConnection();
		
	}
	/**
	 * 功能：释放资源
	 * @param set
	 * @param statement
	 * @param connection
	 * @throws Exception
	 */
	public static void close(ResultSet set,Statement statement,Connection connection){
		try {
			if (set!=null) {
				set.close();
			}
			if (statement!=null) {
				statement.close();
			}
			if (connection!=null) {
				connection.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		
	}
}
