package com.news.entity;
// Generated 2016-4-21 20:48:51 by Hibernate Tools 4.3.1.Final

/**
 * Admin generated by hbm2java
 */
public class Admin implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String loginName;
	private String loginPwd;

	public Admin() {
	}

	public Admin(String loginName, String loginPwd) {
		this.loginName = loginName;
		this.loginPwd = loginPwd;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return this.loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

}
