 package com.atguigu.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.atguigu.utils.JDBCUtilsByDruid;

public class BasicDao<T> {
	QueryRunner qr = new QueryRunner();
	/*
	 * 功能：	通用的增删改方法，针对于任何表
	 */
	public int update(String sql,Object...param){
		Connection connection = null;
		try {
			connection = JDBCUtilsByDruid.getConnection();
			int update = qr.update(connection, sql, param);
			return update;
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(null, null, connection);
		}
	}
	/**
	 * 功能：返回单个对象，针对于任何表
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return
	 */
	public  T querySingle(String sql,Class<T> clazz,Object...params){
		Connection connection = null;
		try {
			connection = JDBCUtilsByDruid.getConnection();
			
			//执行查询
			return qr.query(connection, sql, new BeanHandler<T>(clazz), params);
			
			
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(null, null, connection);
		}
	}
	
	/**
	 * 功能：返回多个对象，针对于任何表
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return
	 */
	public List<T> queryMulti(String sql,Class<T> clazz,Object...params){
		Connection connection = null;
		try {
			connection = JDBCUtilsByDruid.getConnection();
			
			//执行查询
			return qr.query(connection, sql, new BeanListHandler<T>(clazz), params);
			
			
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(null, null, connection);
		}
	}
	/**
	 * 功能：返回单个值
	 * @param sql
	 * @param params
	 * @return
	 */
	public Object scalar(String sql,Object...params){
		Connection connection = null;
		try {
			connection = JDBCUtilsByDruid.getConnection();
			
			
			//执行查询
			return qr.query(connection, sql, new ScalarHandler(),params);
			
			
		}  catch (Exception e) {
			throw new RuntimeException(e);
		}finally{
			JDBCUtilsByDruid.close(null, null, connection);
		}
	}

}
