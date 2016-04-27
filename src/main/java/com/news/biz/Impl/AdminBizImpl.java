package com.news.biz.Impl;

import com.news.biz.AdminBiz;
import com.news.dao.Impl.AdminDaoImpl;
import com.news.entity.Admin;

public class AdminBizImpl implements AdminBiz {
	private AdminDaoImpl adminDaoImpl;

	public void setAdminDaoImpl(AdminDaoImpl adminDaoImpl) {
		this.adminDaoImpl = adminDaoImpl;
	}

	public Admin login(String loginname,String loginpwd) {
		return adminDaoImpl.query(loginname,loginpwd);
	}

}
