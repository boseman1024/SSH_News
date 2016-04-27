package com.news.biz;

import com.news.entity.Topic;
import java.util.List;

public interface TopicBiz {
	public List<Topic> query();
	public Topic queryById(int Id);
	public Topic queryByTitle(String title);
}
