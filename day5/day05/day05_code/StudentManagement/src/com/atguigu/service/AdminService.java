package com.atguigu.service;

import com.atguigu.dao.AdminDao;

public class AdminService {
	AdminDao dao = new AdminDao();
	
	public boolean login(String username,String password){
		
		Long count =  (Long)dao.scalar("select count(*) from admin where username=? and password=?", username,password);
		return count>0;
	
	}
	
	

}
