<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lemon News ！！Backstage System</title>
<link rel="stylesheet" href="static/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="backstage_header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href="#" class="list-group-item active disabled" id="news">新闻管理<span
						class="badge"><s:property value="#request.newsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=1&pageIndex=1&operate=1"
						class="list-group-item">国内新闻<span class="badge"><s:property
								value="#request.NativeNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=2&pageIndex=1&operate=1"
						class="list-group-item">国外新闻<span class="badge"><s:property
								value="#request.ForeignNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=3&pageIndex=1&operate=1"
						class="list-group-item">娱乐新闻<span class="badge"><s:property
								value="#request.ENTNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=4&pageIndex=1&operate=1"
						class="list-group-item">科技新闻<span class="badge"><s:property
								value="#request.ITNewsCount" /></span></a><a
						href="backstageQueryNewslist.action?newsType=5&pageIndex=1&operate=1"
						class="list-group-item">社会新闻<span class="badge"><s:property
								value="#request.SocialNewsCount" /></span></a> <a
						href="toAddNews.action?operate=2" class="list-group-item">
						新闻发表 </a>
				</div>

			</div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-body">
						<s:if test="#request.operate==0">
							<!--                    欢迎界面                                                       -->
							<div id="welcome">
								<h2>Welcome</h2>
								<p>欢迎来到后台管理</p>
							</div>
						</s:if>
						<s:elseif test="#request.operate==1">
							<!--                     新闻管理                                                          -->
							<div id="newsinfo">
								<h2>
									<s:property value="#request.topic.title" />
								</h2>
								<hr>
								<table class="table table-responsive table-hover ">
									<thead>
										<tr>
											<th style="text-align: center;">ID</th>
											<th style="text-align: center;">标题</th>
											<th style="text-align: center;">作者</th>
											<th style="text-align: center;">日期</th>
											<th style="text-align: center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="#request.newsList" status="status"
											var="news">
											<tr>
												<td style="text-align: center;"><s:property
														value="#news.id" /></td>
												<td style="text-align: center;"><s:property
														value="#news.title" /></td>
												<td style="text-align: center;"><s:property
														value="#news.author" /></td>
												<td style="text-align: center;"><s:date
														name="#news.createDate" format="yyyy-MM-dd" /></td>
												<td style="text-align: center;"><a
													href="toUpdateNews.action?operate=3&newsId=<s:property
												value="#news.id" />">编辑</a>
													<a
													href="deleteNews.action?newsId=<s:property
												value="#news.id" />">删除</a></td>
											</tr>
										</s:iterator>


									</tbody>
								</table>
								<nav>
									<ul class="pagination">
										<s:if test="#request.pageIndex==1">
											<li class="disabled"><span aria-hidden="true">&laquo;</span>
											</li>
										</s:if>
										<s:else>
											<li><a
												href="backstageQueryNewslist.action?newsType=<s:property value='#request.newsType' />&pageIndex=1"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</s:else>

										<s:iterator value="#request.page" status="status" var="page">
											<s:if test="#request.pageIndex ==#page">
												<li class="active"><a href=""><s:property /></a></li>
											</s:if>
											<s:else>
												<li><a
													href="backstageQueryNewslist.action?newsType=<s:property value='#request.newsType' />&pageIndex=<s:property />"><s:property /></a></li>
											</s:else>
										</s:iterator>

										<s:if test="#request.pageIndex == #request.pageCount">
											<li class="disabled"><span aria-hidden="true">&raquo;</span>
											</li>
										</s:if>
										<s:else>
											<li><a
												href="backstageQueryNewslist.action?newsType=<s:property value='#request.newsType' />&pageIndex=<s:property value='#request.pageCount' />"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</s:else>
									</ul>
								</nav>
							</div>
						</s:elseif>
						<s:elseif test="#request.operate==2">
							<!--                      新闻发表                                                              -->
							<h1>新闻发表</h1>
							<hr>
							<form class="form-horizontal" action="addNews.action"
								method="post" onsubmit="return validateForm(this)">
								<div class="form-group form-group-lg">
									<div class="col-md-2"></div>
									<div class="col-md-8" id="titleBox">
										<input class="form-control" type="text" id="title"
											placeholder="标题" name="newsinfo.title">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-4" id="typeBox">
										<select id="type" class="form-control" name="topic.id">
											<option value="0">请选择新闻类型</option>
											<s:iterator value="#request.topicList" status="status"
												var="topicType">
												<option value="<s:property value="#topicType.id" />"><s:property
														value="#topicType.title" />
												</option>
											</s:iterator>
										</select>
									</div>
									<div class="col-md-4" id="authorBox">
										<input type="text" class="form-control" placeholder="作者"
											name="newsinfo.author" id="author">

									</div>
									<div class="col-md-4" id="dateBox">
										<input type="text" class="form-control" id="date"
											placeholder="日期:YYYY-MM-DD" name="newsinfo.createDate">
									</div>

								</div>
								<div class="form-group">
									<div class="col-md-2"></div>
									<div class="col-md-8" id="summaryBox">
										<textarea class="form-control" rows="3" style="resize: none"
											placeholder="摘要" name="newsinfo.summary" id="summary"></textarea>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="form-group">
									<div class="col-md-12" id="contentBox">
										<textarea class="form-control" rows="10" style="resize: none"
											placeholder="正文" name="newsinfo.content" id="content"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-4"></div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary">发表</button>
									</div>
									<div class="col-md-2">
										<button type="reset" class="btn btn-primary">重置</button>
									</div>
									<div class="col-md-4"></div>
								</div>
							</form>
						</s:elseif>
						<s:elseif test="#request.operate==3">
							<!--                   新闻编辑                                                              -->
							<h1>新闻编辑</h1>
							<hr>
							<form class="form-horizontal"
								action="updateNews.action?operate=1" method="post" onsubmit="return validateUpdateForm(this)">
								<div class="form-group form-group-lg">
									<div class="col-md-2"></div>
									<div class="col-md-8" id="utitleBox">
										<input class="form-control" type="text" id="utitle"
											placeholder="标题" name="newsinfo.title"
											value="<s:property value="#request.newsinfo.title" />">
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-4" id="utypeBox">
										<select id="utype" class="form-control" name="topic.id">
											<s:iterator value="#request.topicList" status="status"
												var="topicType">
												<s:if test="#request.newsinfo.topic.id==#topicType.id">
													<option selected="selected"
														value="<s:property value="#topicType.id" />"><s:property
															value="#topicType.title" />
													</option>
												</s:if>
												<s:else>
													<option value="<s:property value="#topicType.id" />"><s:property
															value="#topicType.title" />
													</option>
												</s:else>
											</s:iterator>
										</select>
									</div>
									<div class="col-md-4" id="uauthorBox">
										<input type="text" class="form-control" placeholder="作者"
											name="newsinfo.author"
											value="<s:property value="#request.newsinfo.author" />" id="uauthor">

									</div>
									<div class="col-md-4" id="udateBox">
										<input type="text" class="form-control" id="udate"
											placeholder="日期:YYYY-MM-DD" name="newsinfo.createDate"
											value="<s:date name="#request.newsinfo.createDate" format="yyyy-MM-dd"/>">
									</div>

								</div>
								<div class="form-group">
									<div class="col-md-2"></div>
									<div class="col-md-8" id="usummaryBox">
										<textarea class="form-control" rows="3" style="resize: none"
											placeholder="摘要" name="newsinfo.summary" id="usummary"><s:property
												value="#request.newsinfo.summary" /></textarea>
									</div>
									<div class="col-md-2"></div>
								</div>
								<div class="form-group">
									<div class="col-md-12" id="ucontentBox">
										<textarea class="form-control" rows="10" style="resize: none"
											placeholder="正文" name="newsinfo.content" id="ucontent"><s:property
												value="#request.newsinfo.content" /></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-4"></div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-primary">发表</button>
									</div>
									<div class="col-md-2">
										<button type="reset" class="btn btn-primary">重置</button>
									</div>
									<div class="col-md-4"></div>
								</div>
							</form>
						</s:elseif>
						<s:elseif test="#request.operate==4">
							<!--                  搜索结果                                            -->
							<div id="newsinfo">
								<h2>
									<s:property value="#request.newsTitle" />
								</h2>
								<hr>
								<table class="table table-responsive table-hover ">
									<thead>
										<tr>
											<th style="text-align: center;">ID</th>
											<th style="text-align: center;">标题</th>
											<th style="text-align: center;">作者</th>
											<th style="text-align: center;">日期</th>
											<th style="text-align: center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="#request.newsList" status="status"
											var="news">
											<tr>
												<td style="text-align: center;"><s:property
														value="#news.id" /></td>
												<td style="text-align: center;"><s:property
														value="#news.title" /></td>
												<td style="text-align: center;"><s:property
														value="#news.author" /></td>
												<td style="text-align: center;"><s:date
														name="#news.createDate" format="yyyy-MM-dd" /></td>
												<td style="text-align: center;"><a
													href="toUpdateNews.action?operate=3&newsId=<s:property
												value="#news.id" />">编辑</a>
													<a
													href="deleteNews.action?newsId=<s:property
												value="#news.id" />">删除</a></td>
											</tr>
										</s:iterator>


									</tbody>
								</table>
								<nav>
									<ul class="pagination">
										<s:if test="#request.pageIndex==1">
											<li class="disabled"><span aria-hidden="true">&laquo;</span>
											</li>
										</s:if>
										<s:else>
											<li><a
												href="backstageSearchNews.action?pageIndex=1&operate=4"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</s:else>

										<s:iterator value="#request.page" status="status" var="page">
											<s:if test="#request.pageIndex ==#page">
												<li class="active"><a
													href="backstageSearchNews.action?pageIndex=<s:property />&operate=4"><s:property /></a></li>
											</s:if>
											<s:else>
												<li><a
													href="backstageSearchNews.action?pageIndex=<s:property />&operate=4"><s:property /></a></li>
											</s:else>
										</s:iterator>

										<s:if test="#request.pageIndex == #request.pageCount">
											<li class="disabled"><span aria-hidden="true">&raquo;</span>
											</li>
										</s:if>
										<s:else>
											<li><a
												href="backstageSearchNews.action?pageIndex=<s:property value='#request.pageCount' />&operate=4"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</s:else>
									</ul>
								</nav>
							</div>
						</s:elseif>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function validateTitle(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g, "");
				if (value.length > 40) {
					return false;
				} else if (value == "" || value == null) {
					return false;
				} else {
					return true;
				}
			}
		}
		function validateAuthor(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g, "");
				if (value.length > 20) {
					return false;
				} else if (value == "" || value == null) {
					return false;
				} else {
					return true;
				}
			}
		}
		function validateDate(field, alerttxt) {
			with (field) {
				var dateFormat = /^\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/;
				if (!dateFormat.test(value)) {
					return false;
				} else {
					return true;
				}
			}
		}
		function validateSummary(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g, "");
				if (value.length > 500) {
					return false;
				} else if (value == "" || value == null) {
					return false;
				} else {
					return true;
				}
			}
		}
		function validateContent(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g, "");
				if (value.length > 10000) {
					return false;
				} else if (value == "" || value == null) {
					return false;
				} else {
					return true;
				}
			}
		}
		function validateForm(form) {
			with (form) {
				var title = $("#title");
				var type = $("#type");
				var author = $("#author");
				var date = $("#date");
				var summary = $("#summary");
				var content = $("#content");
				if (validateTitle(title, "内容有误") == false) {
					$("#title").focus();
					$("#titleBox").addClass("has-error");
					return false;
				} else if (type.value > 5 || type.value < 1) {
					$("#type").focus();
					$("#typeBox").addClass("has-error");
					return false;
				} else if (validateAuthor(author, "内容有误") == false) {
					$("#author").focus();
					$("#authorBox").addClass("has-error");
					return false;
				} else if (validateDate(date, "内容有误") == false) {
					$("#date").focus();
					$("#dateBox").addClass("has-error");
					return false;
				} else if (validateSummary(summary, "内容有误") == false) {
					$("#summary").focus();
					$("#summaryBox").addClass("has-error");
					return false;
				} else if (validateContent(content, "内容有误") == false) {
					$("#content").focus();
					$("#contentBox").addClass("has-error");
					return false;
				} else {
					return true;
				}
			}
		}
		function validateUpdateForm(form) {
			with (form) {
				var utitle = $("#utitle");
				var utype = $("#utype");
				var uauthor = $("#uauthor");
				var udate = $("#udate");
				var usummary = $("#usummary");
				var ucontent = $("#ucontent");
				if (validateTitle(utitle, "内容有误") == false) {
					$("#utitle").focus();
					$("#utitleBox").addClass("has-error");
					return false;
				} else if (utype.value > 5 || utype.value < 1) {
					$("#utype").focus();
					$("#utypeBox").addClass("has-error");
					return false;
				} else if (validateAuthor(uauthor, "内容有误") == false) {
					$("#uauthor").focus();
					$("#uauthorBox").addClass("has-error");
					return false;
				} else if (validateDate(udate, "内容有误") == false) {
					$("#udate").focus();
					$("#udateBox").addClass("has-error");
					return false;
				} else if (validateSummary(usummary, "内容有误") == false) {
					$("#usummary").focus();
					$("#usummaryBox").addClass("has-error");
					return false;
				} else if (validateContent(ucontent, "内容有误") == false) {
					$("#ucontent").focus();
					$("#ucontentBox").addClass("has-error");
					return false;
				} else {
					return true;
				}
			}
		}
	</script>
</body>
</html>
