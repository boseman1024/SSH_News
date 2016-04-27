package com.news.dao;

import java.util.List;

import com.news.entity.Newsinfo;

public interface NewsinfoDao {
	/**
	 * 
	 * 查询指定数量的指定类别的新闻
	 * 
	 * **/
	@SuppressWarnings("rawtypes")
	public List queryNewsByNum(int num,int newsType);
	
	/**
	 * 
	 * 分页查询指定类别的新闻
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public List queryNewsByPage(int pageIndex,int pageSize,int newsType);
	/**
	 * 
	 * 查询所有新闻数量
	 * */
	public Long queryNewsCount();
	/**
	 * 
	 * 根据类别查询新闻数量
	 * */
	public Long queryNewsCountByType(int newsType);
	/*
	 * 根据标题查询新闻数量
	 */
	public Long queryNewsCountByTitle(String newsTitle);
	
	/*
	 * 通过新闻ID查询新闻
	 * */
	@SuppressWarnings("rawtypes")
	public List queryNewsById(int newsId);
	/**
	 * 通过Id删除新闻
	 * ***/
	public void deleteNewsById(Newsinfo newsinfo);
	/**
	 * 添加新闻
	 * */
	public void addNews(Newsinfo newsinfo);
	/**
	 * 编辑新闻
	 * **/
	public void updateNews(Newsinfo newsinfo);
	/*
	 * 根据标题查询新闻
	 * */
	@SuppressWarnings("rawtypes")
	public List queryNewsByTitle(int pageIndex, int pageSize, String newsTitle);
}
