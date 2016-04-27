package com.news.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.news.dao.TopicDao;

public class TopicDaoImpl implements TopicDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("rawtypes")
	public List queryById(int id) {
		String hql = "from Topic topic where id=" + id;
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public List query() {
		String hql = "from Topic";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public List queryByTitle(String title) {
		String hql = "from Topic topic where title=" + title;
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

}
