package com.news.interceptor;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {

	/**
	 * 监听器
	 * 判断管理员是否登录
	 */
	private static final long serialVersionUID = 1L;

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	public String intercept(ActionInvocation invo) throws Exception {
		if(ActionContext.getContext().getSession().get("admin")!=null){
			System.out.println("用户已经登录......");
		      return invo.invoke();
		}else{
			System.out.println("你还没有登录......");
		      return Action.ERROR;

		}
	}

}
