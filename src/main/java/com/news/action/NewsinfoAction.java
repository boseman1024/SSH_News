package com.news.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.news.biz.Impl.NewsinfoBizImpl;
import com.news.biz.Impl.TopicBizImpl;
import com.news.entity.Newsinfo;
import com.news.entity.Topic;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class NewsinfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private NewsinfoBizImpl newsinfoBizImpl;
	private TopicBizImpl topicBizImpl;
	private int newsType;
	private List<Newsinfo> newsList;
	private int pageIndex;
	private Newsinfo newsinfo;
	private int newsId;
	private String newsTitle;
	private Topic topic;
	private int operate = 0;
	private Long newsCount;
	private Long NativeNewsCount;
	private Long ForeignNewsCount;
	private Long ENTNewsCount;
	private Long ITNewsCount;
	private Long SocialNewsCount;

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public int getOperate() {
		return operate;
	}

	public void setOperate(int operate) {
		this.operate = operate;
	}

	public void setTopicBizImpl(TopicBizImpl topicBizImpl) {
		this.topicBizImpl = topicBizImpl;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public int getNewsId() {
		return newsId;
	}

	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Newsinfo getNewsinfo() {
		return newsinfo;
	}

	public void setNewsinfo(Newsinfo newsinfo) {
		this.newsinfo = newsinfo;
	}

	public List<Newsinfo> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<Newsinfo> newsList) {
		this.newsList = newsList;
	}

	public int getNewsType() {
		return newsType;
	}

	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}

	public Long getNativeNewsCount() {
		return NativeNewsCount;
	}

	public void setNativeNewsCount(Long nativeNewsCount) {
		NativeNewsCount = nativeNewsCount;
	}

	public Long getForeignNewsCount() {
		return ForeignNewsCount;
	}

	public void setForeignNewsCount(Long foreignNewsCount) {
		ForeignNewsCount = foreignNewsCount;
	}

	public Long getENTNewsCount() {
		return ENTNewsCount;
	}

	public void setENTNewsCount(Long eNTNewsCount) {
		ENTNewsCount = eNTNewsCount;
	}

	public Long getITNewsCount() {
		return ITNewsCount;
	}

	public void setITNewsCount(Long iTNewsCount) {
		ITNewsCount = iTNewsCount;
	}

	public Long getSocialNewsCount() {
		return SocialNewsCount;
	}

	public void setSocialNewsCount(Long socialNewsCount) {
		SocialNewsCount = socialNewsCount;
	}

	public void setNewsCount(Long newsCount) {
		this.newsCount = newsCount;
	}

	public void setNewsinfoBizImpl(NewsinfoBizImpl newsinfoBizImpl) {
		this.newsinfoBizImpl = newsinfoBizImpl;
	}

	@SuppressWarnings("unchecked")
	public String NewsCount() {
		newsCount = newsinfoBizImpl.queryNewsCount();
		NativeNewsCount = newsinfoBizImpl.queryNewsCountByType(1);
		ForeignNewsCount = newsinfoBizImpl.queryNewsCountByType(2);
		ENTNewsCount = newsinfoBizImpl.queryNewsCountByType(3);
		ITNewsCount = newsinfoBizImpl.queryNewsCountByType(4);
		SocialNewsCount = newsinfoBizImpl.queryNewsCountByType(5);
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("newsCount", newsCount);
		request.put("NativeNewsCount", NativeNewsCount);
		request.put("ForeignNewsCount", ForeignNewsCount);
		request.put("ENTNewsCount", ENTNewsCount);
		request.put("ITNewsCount", ITNewsCount);
		request.put("SocialNewsCount", SocialNewsCount);
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryNewslistByTypeAndNum() {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("nativNews", newsinfoBizImpl.queryNewsByNum(1));
		request.put("foreignNews", newsinfoBizImpl.queryNewsByNum(2));
		request.put("ENTNews", newsinfoBizImpl.queryNewsByNum(3));
		request.put("ITNews", newsinfoBizImpl.queryNewsByNum(4));
		request.put("socialNews", newsinfoBizImpl.queryNewsByNum(5));
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryNewslistByTypeAndPage() {

		Long pageCount = newsinfoBizImpl.getPageCount(newsType);
		List<Integer> page = new ArrayList<Integer>();
		for (int i = 1; i <= pageCount; i++) {
			page.add(i);
		}
		if (page.size() < pageIndex) {
			pageIndex -= 1;
		}
		newsList = newsinfoBizImpl.queryNewsByPage(pageIndex, newsType);
		topic = topicBizImpl.queryById(newsType);
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("newsList", newsList);
		request.put("pageCount", pageCount);
		request.put("newsType", newsType);
		request.put("pageIndex", pageIndex);
		request.put("page", page);
		request.put("topic", topic);

		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String showNewsDetail() {
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		newsinfo = newsinfoBizImpl.queryNewsById(newsId);
		request.put("newsinfo", newsinfo);
		return Action.SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryTopic() {
		List<Topic> topicList = topicBizImpl.query();
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("topicList", topicList);
		return Action.SUCCESS;
	}

	/**
	 * 删除新闻
	 */
	public String deleteNews() {
		newsinfoBizImpl.deleteNewsById(newsId);
		return queryNewslistByTypeAndPage();
	}

	/**
	 * 添加新闻
	 **/
	public String addNews() {

		newsinfo.setTopic(topicBizImpl.queryById(topic.getId()));
		newsinfoBizImpl.addNews(newsinfo);
		operate = 1;
		newsType = topic.getId();
		pageIndex = 1;

		return Action.SUCCESS;
	}

	/******
	 * 添加新闻表单验证
	 */
	public void validateAddNews() {
		if (newsinfo.getTitle() == null || "".equals(newsinfo.getTitle())) {
			this.addFieldError("title", "标题不能为空");
		} else if (newsinfo.getTitle().length() > 40) {
			this.addFieldError("title", "标题大于40字符");
		} else if (topic.getId() > 5 || topic.getId() < 1) {
			this.addFieldError("topic", "类型不存在");
		} else if (newsinfo.getAuthor().length() > 20) {
			this.addFieldError("author", "作者大于20字符");
		} else if (newsinfo.getAuthor() == null || "".equals(newsinfo.getAuthor())) {
			this.addFieldError("author", "作者大于20字符");
		} else if (newsinfo.getCreateDate() == null) {
			System.out.println(newsinfo.getCreateDate());
			this.addFieldError("createdate", "日期不能为空");
		} else if (newsinfo.getSummary().length() > 500) {
		} else if (newsinfo.getSummary() == null || "".equals(newsinfo.getSummary())) {
			this.addFieldError("summary", "摘要不能为空");
		} else if (newsinfo.getContent().length() > 10000) {
			this.addFieldError("content", "正文大于10000字符");
		} else if (newsinfo.getContent() == null || "".equals(newsinfo.getContent())) {
			this.addFieldError("content", "正文不能为空");
		} else {
			this.clearFieldErrors();
		}
	}

	/**
	 * 编辑新闻
	 **/
	@SuppressWarnings("unchecked")
	public String toUpdateNews() {
		List<Topic> topicList = topicBizImpl.query();
		newsinfo = newsinfoBizImpl.queryNewsById(newsId);
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("topicList", topicList);
		request.put("newsinfo", newsinfo);

		return Action.SUCCESS;
	}

	public String updateNews() {
		newsinfo.setTopic(topicBizImpl.queryById(topic.getId()));
		newsinfoBizImpl.updateNews(newsinfo);
		return queryNewslistByTypeAndPage();
	}

	/******
	 * 编辑新闻表单验证
	 */
	public void validateUpdateNews() {
		if (newsinfo.getTitle() == null || "".equals(newsinfo.getTitle())) {
			this.addFieldError("title", "标题不能为空");
		} else if (newsinfo.getTitle().length() > 40) {
			this.addFieldError("title", "标题大于40字符");
		} else if (topic.getId() > 5 || topic.getId() < 1) {
			this.addFieldError("topic", "类型不存在");
		} else if (newsinfo.getAuthor().length() > 20) {
			this.addFieldError("author", "作者大于20字符");
		} else if (newsinfo.getAuthor() == null || "".equals(newsinfo.getAuthor())) {
			this.addFieldError("author", "作者大于20字符");
		} else if (newsinfo.getCreateDate() == null) {
			System.out.println(newsinfo.getCreateDate());
			this.addFieldError("createdate", "日期不能为空");
		} else if (newsinfo.getSummary().length() > 500) {
		} else if (newsinfo.getSummary() == null || "".equals(newsinfo.getSummary())) {
			this.addFieldError("summary", "摘要不能为空");
		} else if (newsinfo.getContent().length() > 10000) {
			this.addFieldError("content", "正文大于10000字符");
		} else if (newsinfo.getContent() == null || "".equals(newsinfo.getContent())) {
			this.addFieldError("content", "正文不能为空");
		} else {
			this.clearFieldErrors();
		}
	}

	/*
	 * 搜索新闻
	 */
	@SuppressWarnings("unchecked")
	public String searchNews() {

		Long pageCount = newsinfoBizImpl.getPageCountByTitle(newsTitle);
		List<Integer> page = new ArrayList<Integer>();
		for (int i = 1; i <= pageCount; i++) {
			page.add(i);
		}
		if (page.size() < pageIndex) {
			pageIndex -= 1;
		}
		newsList = newsinfoBizImpl.queryNewsByTitle(pageIndex, newsTitle);
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("newsList", newsList);
		request.put("newsTitle", newsTitle);
		request.put("pageCount", pageCount);
		request.put("pageIndex", pageIndex);
		request.put("page", page);
		return Action.SUCCESS;
	}
	/**
	 * 搜索新闻表单验证
	 * 
	 * public void validateSearchNews(){ if(newsTitle.length()>40){
	 * this.addFieldError("newsTitle", "新闻标题大于40字符"); }else
	 * if(!newsTitle.matches("^[\u4E00-\u9FA5A-Za-z0-9]+$")){
	 * this.addFieldError("newsTitle", "新闻标题存在非法字符"); }else{
	 * this.clearFieldErrors(); } }
	 */

}
