package com.news.biz.Impl;

import java.util.ArrayList;
import java.util.List;

import com.news.biz.NewsinfoBiz;
import com.news.dao.Impl.NewsinfoDaoImpl;
import com.news.entity.Newsinfo;

public class NewsinfoBizImpl implements NewsinfoBiz {
	private NewsinfoDaoImpl newsinfoDaoImpl;
	int pageSize = 10;

	public void setNewsinfoDaoImpl(NewsinfoDaoImpl newsinfoDaoImpl) {
		this.newsinfoDaoImpl = newsinfoDaoImpl;
	}

	@SuppressWarnings("rawtypes")
	public List queryNewsByNum(int newsType) {
		int num = 5;
		List list = newsinfoDaoImpl.queryNewsByNum(num, newsType);
		List<Newsinfo> newsList = new ArrayList<Newsinfo>();
		for (Object n : list) {
			newsList.add((Newsinfo) n);
		}
		return newsList;
	}

	@SuppressWarnings("rawtypes")
	public List queryNewsByPage(int pageIndex, int newsType) {

		return newsinfoDaoImpl.queryNewsByPage(pageIndex, pageSize, newsType);
	}

	public Long queryNewsCount() {
		return newsinfoDaoImpl.queryNewsCount();
	}

	public Long queryNewsCountByType(int newsType) {
		return newsinfoDaoImpl.queryNewsCountByType(newsType);
	}

	public Newsinfo queryNewsById(int newsId) {
		Newsinfo newsinfo = (Newsinfo) newsinfoDaoImpl.queryNewsById(newsId).get(0);
		return newsinfo;
	}

	public Long getPageCount(int newsType) {
		Long rest = (newsinfoDaoImpl.queryNewsCountByType(newsType) % pageSize);
		if (rest > 0) {
			return (newsinfoDaoImpl.queryNewsCountByType(newsType) / pageSize) + 1;
		} else {
			return (newsinfoDaoImpl.queryNewsCountByType(newsType) / pageSize);
		}

	}

	public void deleteNewsById(int newsId) {
		Newsinfo newsinfo = (Newsinfo) newsinfoDaoImpl.queryNewsById(newsId).get(0);
		if (newsinfo != null) {
			newsinfoDaoImpl.deleteNewsById(newsinfo);
		}
	}

	public void addNews(Newsinfo newsinfo) {
		newsinfoDaoImpl.addNews(newsinfo);
	}

	public void updateNews(Newsinfo newsinfo) {
		newsinfoDaoImpl.updateNews(newsinfo);
	}

	@SuppressWarnings("unchecked")
	public List<Newsinfo> queryNewsByTitle(int pageIndex, String newsTitle) {
		return newsinfoDaoImpl.queryNewsByTitle(pageIndex, pageSize, newsTitle);

	}

	public Long getNewsCountByTitle(String newsTitle) {
		return newsinfoDaoImpl.queryNewsCountByTitle(newsTitle);
	}

	public Long getPageCountByTitle(String newsTitle) {
		Long rest = (newsinfoDaoImpl.queryNewsCountByTitle(newsTitle) % pageSize);
		if (rest > 0) {
			return (newsinfoDaoImpl.queryNewsCountByTitle(newsTitle) / pageSize) + 1;
		} else {
			return (newsinfoDaoImpl.queryNewsCountByTitle(newsTitle) / pageSize);
		}
	}

}
