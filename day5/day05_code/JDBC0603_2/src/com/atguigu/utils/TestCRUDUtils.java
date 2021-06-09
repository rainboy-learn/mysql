package com.atguigu.utils;

import java.util.List;

import org.junit.Test;

import com.atguigu.bean.Boys;

public class TestCRUDUtils {
	@Test
	public void testUpdate(){
		
//		int update = CRUDUtils.update("update beauty set sex = ? where name='柳岩'", "男");
//		
//		System.out.println(update>0?"success":"failure");
		
		
		int update = CRUDUtils.update("delete from admin where id>5");
		
		System.out.println(update>0?"success":"failure");
	}
	@Test
	public void testQuery() throws Exception{
//		Boys boy = CRUDUtils.querySingle("select * from boys where id = ?", 2);
//		System.out.println(boy);
		
		List<Boys> list = CRUDUtils.queryMulti("select * from boys");
		for (Boys boys : list) {
			System.out.println(boys);
		}
		
	}

}
