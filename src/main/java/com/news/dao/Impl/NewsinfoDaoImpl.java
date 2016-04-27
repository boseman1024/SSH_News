package com.news.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.news.dao.NewsinfoDao;
import com.news.entity.Newsinfo;

public class NewsinfoDaoImpl implements NewsinfoDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 
	 * 查询指定数量的指定类别的新闻
	 * 
	 **/
	@SuppressWarnings("rawtypes")
	public List queryNewsByNum(int num, int newsType) {
		String hql = "from Newsinfo newsinfo where Tid=" + newsType + " order by createDate desc";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setFirstResult(0).setMaxResults(num);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	/**
	 * 
	 * 分页查询指定类别的新闻
	 * 
	 */
	@SuppressWarnings("rawtypes")
	public List queryNewsByPage(int pageIndex, int pageSize, int newsType) {
		String hql = "from Newsinfo newsinfo where Tid=" + newsType + " order by createDate desc,id desc";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageIndex * pageSize);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	/**
	 * 
	 * 查询所有新闻数量
	 */
	@SuppressWarnings("rawtypes")
	public Long queryNewsCount() {
		String hql = "select count(*) from Newsinfo ";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		Long count;
		if (list.size() > 0) {
			count = (Long) list.get(0);
			return count;
		} else {
			count = null;
			return null;
		}
	}

	/**
	 * 
	 * 根据类别查询新闻数量
	 */
	@SuppressWarnings("rawtypes")
	public Long queryNewsCountByType(int newsType) {
		String hql = "select count(*) from Newsinfo where tid='" + newsType + "'";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		Long count;
		if (list.size() > 0) {
			count = (Long) list.get(0);
			return count;
		} else {
			count = null;
			return null;
		}
	}

	/*
	 * 通过新闻ID查询新闻
	 */
	@SuppressWarnings("rawtypes")
	public List queryNewsById(int newsId) {
		String hql = "from Newsinfo newsinfo where id=" + newsId;
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

	/**
	 * 通过Id删除新闻
	 ***/
	public void deleteNewsById(Newsinfo newsinfo) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(newsinfo);
		transaction.commit();
		session.close();
	}

	/**
	 * 添加新闻
	 */
	public void addNews(Newsinfo newsinfo) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(newsinfo);
		transaction.commit();
		session.close();
	}

	/*
	 * 编辑新闻
	 */
	public void updateNews(Newsinfo newsinfo) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(newsinfo);
		transaction.commit();
		session.close();
	}

	/*
	 * 根据标题查询新闻
	 */
	@SuppressWarnings("rawtypes")
	public List queryNewsByTitle(int pageIndex, int pageSize, String newsTitle) {
		String hql = "from Newsinfo newsinfo where title like '%" + newsTitle + "%' order by createDate desc,id desc";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql).setFirstResult((pageIndex - 1) * pageSize)
				.setMaxResults(pageIndex * pageSize);
		List list = query.list();
		session.close();
		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	/**
	 * 根据新闻标题分页查询新闻数量
	 */
	@SuppressWarnings("rawtypes")
	public Long queryNewsCountByTitle(String newsTitle) {
		String hql = "select count(*) from Newsinfo newsinfo where title like '%" + newsTitle + "%'";
		Session session = sessionFactory.openSession();
		Query query = session.createQuery(hql);
		List list = query.list();
		session.close();
		Long count;
		if (list.size() > 0) {
			count = (Long) list.get(0);
			return count;
		} else {
			count = null;
			return null;
		}
	}

}
