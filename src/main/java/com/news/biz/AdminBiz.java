package com.news.biz;

import com.news.entity.Admin;

public interface AdminBiz {
	/**
	 * 管理员登录
	 * 
	 * **/
	public Admin login(String loginname,String loginpwd);
	
}
