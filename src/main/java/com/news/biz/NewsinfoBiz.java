package com.news.biz;

import java.util.List;

import com.news.entity.Newsinfo;

public interface NewsinfoBiz {
	/**
	 * 
	 * 查询指定数量的指定类别的新闻
	 * 
	 **/
	@SuppressWarnings("rawtypes")
	public List queryNewsByNum(int newsType);

	/**
	 * 
	 * 分页查询指定类别的新闻
	 * 
	 */
	@SuppressWarnings("rawtypes")
	public List queryNewsByPage(int pageIndex,int newsType);
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
	 * */
	public Long getNewsCountByTitle(String newsTitle);
	/*
	 * 根据ID查询新闻
	 * */
	public Newsinfo queryNewsById(int newsId);
	/**
	 * 获取新闻页数
	 * */
	public Long getPageCount(int newsType);
	
	/*
	 * 标题获取新闻页数
	 * */
	public Long getPageCountByTitle(String newsTitle);
	/*
	 * 根据Id删除新闻
	 * */
	public void deleteNewsById(int newsId);
	/*
	 * 添加新闻
	 * */
	public void addNews(Newsinfo newsinfo);
	/**
	 * 编辑新闻
	 * **/
	public void updateNews(Newsinfo newsinfo);
	/**
	 * 根据标题查询新闻
	 * */
	public List<Newsinfo> queryNewsByTitle(int pageIndex, String newsTitle);
}
