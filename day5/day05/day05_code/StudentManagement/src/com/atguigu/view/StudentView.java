package com.atguigu.view;

import java.util.Scanner;

import com.atguigu.service.AdminService;

public class StudentView {
	AdminService as = new AdminService();
	public static void main(String[] args) {
		new StudentView().login();
	}

	public void login(){
		Scanner input = new Scanner(System.in);
		System.out.println("请输入用户名：");
		String username = input.next();
		System.out.println("请输入密码：");
		String password = input.next();
		
		
		if( as.login(username, password)){
			System.out.println("登录成功！");
			showMainMenu();
		}else{
			System.out.println("登录失败！");
		}
		
	}

	/**
	 * 功能：显示主菜单
	 */
	private void showMainMenu() {
		System.out.println("显示主菜单");
	}
}
