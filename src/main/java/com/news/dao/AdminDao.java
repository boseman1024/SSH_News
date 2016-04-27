package com.news.dao;

import com.news.entity.Admin;

public interface AdminDao {
	/***
	 * 管理员登录
	 * */
	public Admin query(String loginname,String loginpwd);
}
