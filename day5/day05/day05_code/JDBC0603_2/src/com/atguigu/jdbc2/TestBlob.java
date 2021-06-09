package com.atguigu.jdbc2;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Test;

import com.atguigu.jdbc1.JDBCUtils;

/**
 * 此类用于演示Blob类型数据的存取
 * @author liyuting
 * 相关API：
 * 
 * setBlob(占位符索引，InputStream对象)
 * getBlob(列索引或列名)
 * getBinaryStream(列索引或列名)
 * 
 */
public class TestBlob {

	//存图片
	@Test
	public void testSave() throws SQLException, Exception{
		
		//1.获取连接
		Connection connection = JDBCUtils.getConnection();
		
		//2.执行修改语句
		PreparedStatement statement = connection.prepareStatement("update beauty set photo=? where id = 1");
		
		statement.setBlob(1, new FileInputStream("src\\6.jpg"));
		int update = statement.executeUpdate();
		
		
		//3.关闭连接
		JDBCUtils.close(null, statement, connection);
	}
	
	//读图片
		@Test
		public void testRead() throws SQLException, Exception{
			
		//1.获取连接
		Connection connection = JDBCUtils.getConnection();
		
		//2.执行修改语句
		PreparedStatement statement = connection.prepareStatement("select photo from beauty where id = 1");
		ResultSet set = statement.executeQuery();
		if(set.next()){
			//方式1：
//			Blob blob = set.getBlob("photo");
//			InputStream binaryStream = blob.getBinaryStream();
			
			//方式2：
			InputStream inputStream = set.getBinaryStream("photo");
			
			FileOutputStream fos = new FileOutputStream("src\\beauty.jpg");
			
			int len;
			byte[] b = new byte[1024];
			while((len=inputStream.read(b))!=-1){
				fos.write(b,0,len);
			}
			
			fos.close();
			inputStream.close();
		}
		
		
		
		//3.关闭连接
		JDBCUtils.close(null, statement, connection);
		}
}
