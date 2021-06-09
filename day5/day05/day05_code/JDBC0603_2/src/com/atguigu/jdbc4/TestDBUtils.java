package com.atguigu.jdbc4;

import java.sql.Connection;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.atguigu.bean.Admin;
import com.atguigu.bean.Boys;
import com.atguigu.bean.Customers;
import com.atguigu.utils.JDBCUtilsByDruid;

/**
 * 此类用于演示DBUtils的使用
 * @author liyuting
 * 功能：封装了和数据库存取相关的一些方法
 * 通用的增删改查等等
 * 
 * QueryRunner类：
 * 		update(connection，sql，params):执行任何增删改语句
 * 		query(connection,sql,ResultSetHandler,params)：执行任何查询语句
 * ResultSetHandler接口
 * 		BeanHandler:将结果集的第一行，封装成对象，并返回                     new BeanHandler<>(XX.class)
 * 		BeanListHandler:将结果集中的所有行，封装成对象的集合，并返回        new BeanListHandler<>(XX.class)
 * 		ScalarHandler:将结果集中的第一行第一列，以Object形式返回   new ScalarHandler()
 * 
 * 
 * 使用步骤：
 * 
 * 1、导入jar包commons-dbutils-1.3.jar
 * 2、看帮助
 * 3、使用
 *
 */
public class TestDBUtils {
	@Test
	public void testUpadte() throws Exception{
		
		//1.获取连接
		Connection connection = JDBCUtilsByDruid.getConnection();
		
		//2.执行增删改
		QueryRunner qr = new QueryRunner();
		int update = qr.update(connection, "update boys set boyname=? where id=4", "慕容复");
		
		System.out.println(update>0?"success":"failure");
		
		//3.关闭连接
		JDBCUtilsByDruid.close(null, null, connection);
	}
	
	@Test
	public void testQuerySingle() throws Exception{
		
		//1.获取连接
		Connection connection = JDBCUtilsByDruid.getConnection();
		
		//2.执行增删改
		QueryRunner qr = new QueryRunner();
		
//		Admin admin = qr.query(connection, "select * from admin where id=?", new BeanHandler<>(Admin.class),3);
//		System.out.println(admin);
		
		
		Boys boys = qr.query(connection, "select * from  boys where usercp=?", new BeanHandler<>(Boys.class),300);
		System.out.println(boys);
		
		
		//3.关闭连接
		JDBCUtilsByDruid.close(null, null, connection);
	}

	@Test
	public void testQueryMulti() throws Exception{
		
		//1.获取连接
		Connection connection = JDBCUtilsByDruid.getConnection();
		
		//2.执行增删改
		QueryRunner qr = new QueryRunner();
		
//		Admin admin = qr.query(connection, "select * from admin where id=?", new BeanHandler<>(Admin.class),3);
//		System.out.println(admin);
		
//		List<Admin> list2 = qr.query(connection, "select * from admin", new BeanListHandler<>(Admin.class));
//		
//		for (Admin admin : list2) {
//			System.out.println(admin);
//		}
//		
		List<Boys> list = qr.query(connection, "select * from  boys where usercp>?", new BeanListHandler<>(Boys.class),10);
		
		for (Boys boys : list) {
			System.out.println(boys);
		}
		
		//3.关闭连接
		JDBCUtilsByDruid.close(null, null, connection);
	}
	@Test
	public void testScalar() throws Exception{
		
		//1.获取连接
		Connection connection = JDBCUtilsByDruid.getConnection();
		
		//2.执行查询单个值
		QueryRunner qr = new QueryRunner();
		Object query = qr.query(connection, "select * from admin", new ScalarHandler());
		System.out.println(query);
		
		//3.关闭
		JDBCUtilsByDruid.close(null, null, connection);
		
		
	}

}
