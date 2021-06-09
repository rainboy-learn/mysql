package com.atguigu.homework;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.Scanner;
import org.junit.Test;

public class HomeWork {

//	һ����customers���в������ݣ�Ч�����£�
//	�������ţ�55
//	�������������Ϲٺ�
//	���������䣺shangguan@126.com
//	���������գ�Ҫ��xxxx-xx-xx��ʽ����1988-11-11
//	����ɹ���
	@Test
	public void work1() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("��������:");
		String id = input.next();
		System.out.print("����������:");
		String name = input.next();
		System.out.print("����������:");
		String email = input.next();
		System.out.print("����������:");
		String borndate = input.next();

		// һ��Ϊ�������ݿ�Ĳ���
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// ע������
		Class.forName(driver);

		// ��ȡ����
		Connection connection = DriverManager.getConnection(url, user, password);

		// ִ�в���
		String sql = "insert into customers(id,name,email,birth) values(?, ?, ?, ?)";

		PreparedStatement prepareStatement = connection.prepareStatement(sql);

		prepareStatement.setInt(1, Integer.parseInt(id));
		prepareStatement.setString(2, name);
		prepareStatement.setString(3, email);
		prepareStatement.setString(4, borndate);

		int executeUpdate = prepareStatement.executeUpdate();

		if (executeUpdate != 0) {
			System.out.println("����ɹ�");
		}

		prepareStatement.close();
		connection.close();
	}

//	�����޸�ָ���ͻ�
//	��������޸ĵĿͻ���ţ�3
//	�������µĿͻ���������С��
//	�޸ĳɹ���
	@Test
	public void work2() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("��������޸ĵĿͻ����:");
		String id = input.next();
		System.out.print("�������µĿͻ�����:");
		String name = input.next();

		// һ��Ϊ�������ݿ�Ĳ���
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// ע������
		Class.forName(driver);

		// ��ȡ����
		Connection connection = DriverManager.getConnection(url, user, password);

		// ִ�в���
		String sql = "update customers set name = ? where id = ?";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, name);
		prepareStatement.setString(2, id);

		int executeUpdate = prepareStatement.executeUpdate();
		if (executeUpdate != 0) {
			System.out.println("�޸ĳɹ�");
		}

		prepareStatement.close();
		connection.close();
	}
	
//	������ѯ���пͻ���Ϣ
	@Test
	public void work3() throws Exception, IOException {

		// һ��Ϊ�������ݿ�Ĳ���
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// ע������
		Class.forName(driver);

		// ��ȡ����
		Connection connection = DriverManager.getConnection(url, user, password);
		
		//ִ�в���
		String sql = "select * from customers";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		
		while (executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name = executeQuery.getString(2);
			String email = executeQuery.getString(3);
			String date = executeQuery.getString(4);
			Blob blob = executeQuery.getBlob(5);
			System.out.println(id + "\t" + name + "\t" + email + "\t" + date + "\t" + blob);
		}
		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
		
	}
	
//	�������ݱ�ţ���ѯ�ͻ�����ϸ��Ϣ��Ч�����£�
//	�������ţ�1
//	---------------------------------------------------------------------------------
//	���	����	����	����
//	1	����	wf@126.com	2010-2-2
	
	@Test
	public void work4() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("��������:");
		String id = input.next();
		
		// һ��Ϊ�������ݿ�Ĳ���
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// ע������
		Class.forName(driver);

		// ��ȡ����
		Connection connection = DriverManager.getConnection(url, user, password);
		
		// ִ�в���
		String sql = "select id,name,email,birth from customers where id = ?";
		
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, id);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		executeQuery.next();
		int id1 = executeQuery.getInt(1);
		String name = executeQuery.getString(2);
		String email = executeQuery.getString(3);
		String date = executeQuery.getString(4);
		System.out.println("---------------------------------------------------------------------------------");
		System.out.println("���\t����\t����\t����");
		System.out.println(id1 + "\t" + name + "\t" + email + "\t" + date);
		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
	}
	
//	�ġ�������������ѯ�ͻ�����ϸ��Ϣ��Ч�����£�
//	����������������
//	---------------------------------------------------------------------------------
//	���޴���
	
	@Test
	public void work5() throws Exception, IOException {
		Scanner input = new Scanner(System.in);
		System.out.print("����������:");
		String name = input.next();
		System.out.println("---------------------------------------------------------------------------------");
		
		// һ��Ϊ�������ݿ�Ĳ���
		Properties properties = new Properties();
		properties.load(new FileInputStream("src\\usetest.properties"));
		String user = properties.getProperty("user");
		String password = properties.getProperty("password");
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");

		// ע������
		Class.forName(driver);

		// ��ȡ����
		Connection connection = DriverManager.getConnection(url, user, password);
		
		// ִ�в���
		String sql = "select * from customers where name = ? ";
		
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		
		prepareStatement.setString(1, name);
		
		ResultSet executeQuery = prepareStatement.executeQuery();
		
		if(executeQuery.next()) {
			int id = executeQuery.getInt(1);
			String name1 = executeQuery.getString(2);
			String email = executeQuery.getString(3);
			String birth = executeQuery.getString(4);
			Blob blob = executeQuery.getBlob(5);
			System.out.println(id + "\t" + name1 + "\t" + email + "\t" + birth + "\t" + blob);
		} else {
			System.out.println("���޴���");
		}

		
		executeQuery.close();
		prepareStatement.close();
		connection.close();
	}
}
