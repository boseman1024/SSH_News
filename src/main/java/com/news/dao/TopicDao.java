package com.news.dao;

import java.util.List;

public interface TopicDao {
	@SuppressWarnings("rawtypes")
	public List query();
	/**
	 * 通过ID查询主题类别
	 * **/
	@SuppressWarnings("rawtypes")
	public List queryById(int id);
	/**
	 * 通过ID查询主题类别
	 * **/
	@SuppressWarnings("rawtypes")
	public List queryByTitle(String title);
}
