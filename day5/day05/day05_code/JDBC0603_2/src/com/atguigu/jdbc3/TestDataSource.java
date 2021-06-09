package com.atguigu.jdbc3;

import java.beans.PropertyVetoException;
import java.io.FileInputStream;
import java.sql.Connection;
import java.util.Properties;

import javax.sql.DataSource;

import org.junit.Test;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 此类用于演示德鲁伊数据库连接池的使用
 * @author liyuting
 * 
 * 开源框架的使用步骤：
 * 1.导jar包
 * 2.看帮助
 * 3.调用方法，去使用
 * 
 * 
 *
 */
public class TestDataSource {

	@Test
	public void testDataSource() throws Exception{
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\druid.properties"));
		
		//1.创建了一个指定参数的数据库连接池
		DataSource ds = DruidDataSourceFactory.createDataSource(properties);
		
		
		//2.从数据库连接池中获取可用的连接对象
		Connection connection = ds.getConnection();
		
		
		
		System.out.println("连接成功");
		
		
		//3.关闭连接
		connection.close();
		
	}
	
	//测试C3P0数据库连接池的方式1：
	
	@Test
	public void testC3P0() throws Exception{
		
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		cpds.setDriverClass( "com.mysql.jdbc.Driver" ); //loads the jdbc driver            
		cpds.setJdbcUrl( "jdbc:mysql://localhost:3306/girls" );
		cpds.setUser("root");                                  
		cpds.setPassword("root");    
		cpds.setInitialPoolSize(10);
		cpds.setMaxPoolSize(50);
	
		
		Connection connection = cpds.getConnection();
		
		System.out.println("连接成功");
		connection.close();
		
		
		      
	}
	
	//测试C3P0数据库连接池的方式2：
	
	@Test
	public void testC3P02() throws Exception{
		
		ComboPooledDataSource cpds = new ComboPooledDataSource("hello");
		Connection connection = cpds.getConnection();
		System.out.println("连接成功");
		connection.close();
		
		
		      
	}
	
	
	
	
	
	
	
	
	
	
}
