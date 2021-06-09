package com.atguigu.exec;

import java.sql.Connection;
import java.util.Scanner;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.junit.Test;

import com.atguigu.utils.JDBCUtilsByDruid;

public class TestCustomers {
//	请输入编号：1
//	---------------------------------------------------------------------------------
//	编号	姓名	邮箱	生日
//	1	汪峰	wf@126.com	2010-2-2
	
	@Test
	public void testQuery() throws Exception{
		Scanner input  = new Scanner(System.in);
		System.out.println("请输入编号：");
		int id = input.nextInt();
		
		//1.获取连接
		Connection connection = JDBCUtilsByDruid.getConnection();
		
		//2.执行查询
		QueryRunner qr = new QueryRunner();
		Customers customer = qr.query(connection, "select id,name,email,birth from customers where id = ?", new BeanHandler<Customers>(Customers.class),id);
		System.out.println(customer);
		//3.关闭连接
		JDBCUtilsByDruid.close(null, null, connection);
		
	}

}
