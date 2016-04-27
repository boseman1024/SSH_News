package com.news.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.news.dao.AdminDao;
import com.news.entity.Admin;

public class AdminDaoImpl implements AdminDao {

	private SessionFactory sessionFactory;
	private Admin admin;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@SuppressWarnings("rawtypes")
	public Admin query(String loginname, String loginpwd) {
		String hql = "from Admin where loginName='" + loginname + "' and loginPwd='" + loginpwd + "'";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			admin = (Admin) list.get(0);
			return admin;
		} else {
			return admin = null;
		}

	}

}
