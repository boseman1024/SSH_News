package com.news.action;

import com.news.biz.Impl.AdminBizImpl;
import com.news.entity.Admin;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Admin admin;
	private AdminBizImpl adminBizImpl;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public void setAdminBizImpl(AdminBizImpl adminBizImpl) {
		this.adminBizImpl = adminBizImpl;
	}

	/**
	 * 
	 * 登录
	 * 
	 */
	public String loginIn() {
		Admin adminReturn = adminBizImpl.login(admin.getLoginName(), admin.getLoginPwd());
		ActionContext.getContext().getSession().put("admin", adminReturn);
		return Action.SUCCESS;
	}

	/**
	 * 登录验证
	 */
	public void validateLoginIn() {
		if (admin.getLoginName() == null || "".equals(admin.getLoginName())) {
			this.addFieldError("loginName", "用户名不能为空");
		} else if (!admin.getLoginName().matches("^[\u4E00-\u9FA5A-Za-z0-9]+$")) {
			this.addFieldError("loginName", "用户名存在非法字符");
		} else if (admin.getLoginName().length() > 20) {
			this.addFieldError("loginName", "用户名大于20字符");
		} else if (admin.getLoginPwd() == null || "".equals(admin.getLoginPwd())) {
			this.addFieldError("loginPwd", "密码不能为空");
		} else if (!admin.getLoginPwd().matches("^[\u4E00-\u9FA5A-Za-z0-9]+$")) {
			this.addFieldError("loginPwd", "密码存在非法字符");
		} else if (admin.getLoginPwd().length() > 20) {
			this.addFieldError("loginPwd", "密码大于20字符");
		} else if (adminBizImpl.login(admin.getLoginName(), admin.getLoginPwd()) == null) {
			this.addFieldError("loginNamePwd", "用户名或密码错误");
		} else {
			this.clearFieldErrors();
		}

	}
	public void validate(){
		
	}
	/**
	 * 
	 * 登出
	 * 
	 */
	public String loginOut() throws Exception {
		ActionContext.getContext().getSession().remove("admin");
		return Action.SUCCESS;
	}
}
