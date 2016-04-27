package com.news.biz.Impl;

import java.util.ArrayList;
import java.util.List;

import com.news.biz.TopicBiz;
import com.news.dao.Impl.TopicDaoImpl;
import com.news.entity.Topic;

public class TopicBizImpl implements TopicBiz {
	private TopicDaoImpl topicDaoImpl;

	public void setTopicDaoImpl(TopicDaoImpl topicDaoImpl) {
		this.topicDaoImpl = topicDaoImpl;
	}

	public Topic queryById(int Id) {
		Topic topic = (Topic) topicDaoImpl.queryById(Id).get(0);
		return topic;
	}

	@SuppressWarnings("rawtypes")
	public List<Topic> query() {
		List list = topicDaoImpl.query();
		List<Topic> topicList = new ArrayList<Topic>();
		for (Object t : list) {
			topicList.add((Topic) t);
		}
		return topicList;
	}

	public Topic queryByTitle(String title) {
		Topic topic = (Topic) topicDaoImpl.queryByTitle(title).get(0);
		return topic;
	}

}
