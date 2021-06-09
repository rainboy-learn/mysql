package com.atguigu.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.atguigu.bean.Boys;

/**
 * 此类用于封装通用的增删改查方法
 * @author liyuting
 * 功能：
 * 1、执行增删改
 * 2、执行查询
 * 
 * 
 */
public class CRUDUtils {
	/**
	 * 功能：增删改
	 * 针对于任何表的任何增删改语句
	 * @return
	 * @throws Exception 
	 */
	public static int update(String sql,Object...params){
		
		try {
			//1.获取连接
			Connection connection = JDBCUtilsByDruid.getConnection();
			
			
			//2.执行sql语句
			PreparedStatement statement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				statement.setObject(i+1, params[i]);
			}
			
			int update = statement.executeUpdate();
			return update;
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
	/**
	 * orm：object relation mapping
	 * @param sql
	 * @param params
	 * @return
	 * 
	 * 只针对Boys表，查询单条
	 * @throws Exception 
	 */
	public static Boys querySingle(String sql,Object...params) throws Exception{
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet set = null;
		try {
			//1.获取连接
			 connection = JDBCUtilsByDruid.getConnection();
			
			//2.执行查询
			 statement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				statement.setObject(i+1, params[i]);
			}
			 set = statement.executeQuery();
			
			if(set.next()){
				int id = set.getInt("id");
				String boyName = set.getString("boyname");
				int userCP = set.getInt("userCP");
				Boys bo = new Boys(id,boyName,userCP);
				return bo;
			}
			return null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(set, statement, connection);
		}
		
		
	}
	/**
	 * orm：object relation mapping
	 * @param sql
	 * @param params
	 * @return
	 * 
	 * 只针对Boys表，查询单条
	 * @throws Exception 
	 */
	public static List<Boys> queryMulti(String sql,Object...params) throws Exception{
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet set = null;
		try {
			//1.获取连接
			 connection = JDBCUtilsByDruid.getConnection();
			
			//2.执行查询
			 statement = connection.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				statement.setObject(i+1, params[i]);
			}
			 set = statement.executeQuery();
			List<Boys> list = new ArrayList<>();
			while(set.next()){
				int id = set.getInt("id");
				String boyName = set.getString("boyname");
				int userCP = set.getInt("userCP");
				Boys bo = new Boys(id,boyName,userCP);
				list.add(bo);
			}
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(set, statement, connection);
		}
		
		
	}
	
}
