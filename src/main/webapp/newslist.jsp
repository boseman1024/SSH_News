<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lemon News</title>
<link rel="stylesheet" href="static/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<div class="list-group">
					<a
						href="queryNewslistByTypeAndPage.action?newsType=1&pageIndex=1&operate=0"
						class="list-group-item">国内新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=2&pageIndex=1&operate=0"
						class="list-group-item">国外新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=3&pageIndex=1&operate=0"
						class="list-group-item">娱乐新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=4&pageIndex=1&operate=0"
						class="list-group-item">科技新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=5&pageIndex=1&operate=0"
						class="list-group-item">社会新闻</a>
				</div>
			</div>
			<div class="col-md-7">
				<div class="panel panel-default">
					<s:if test="#request.operate==4">
						<!--                 搜索结果                                       -->
						<div class="panel-heading">
							搜索关键词：<s:property value="#request.newsTitle" />
						</div>
						<div class="panel-body">
							<ul class="list-group">
								<s:iterator value="#request.newsList" status="status" var="news">
									<li class="list-group-item"><a
										href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
												value="#news.title" /></a>
										<p class="pull-right">
											<s:date name="#news.createDate" format="yyyy-MM-dd" />
										</p></li>
								</s:iterator>
							</ul>

							<nav>
								<ul class="pagination">
									<s:if test="#request.pageIndex==1">
										<li class="disabled"><span aria-hidden="true">&laquo;</span>
										</li>
									</s:if>
									<s:else>
										<li><a href="searchNews.action?pageIndex=1&operate=4"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</s:else>

									<s:iterator value="#request.page" status="status" var="page">
										<s:if test="#request.pageIndex ==#page">
											<li class="active"><a
												href="searchNews.action?pageIndex=<s:property />&operate=4"><s:property /></a></li>
										</s:if>
										<s:else>
											<li><a
												href="searchNews.action?pageIndex=<s:property />&operate=4"><s:property /></a></li>
										</s:else>
									</s:iterator>

									<s:if test="#request.pageIndex == #request.pageCount">
										<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
									</s:if>
									<s:else>
										<li><a
											href="searchNews.action?&pageIndex=<s:property value='#request.pageCount' />&operate=4"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</s:else>

								</ul>
							</nav>

						</div>
					</s:if>
					<s:else>
						<!--                 新闻列表                                       -->
						<div class="panel-heading">
							<s:property value="#request.topic.title" />
						</div>
						<div class="panel-body">
							<ul class="list-group">
								<s:iterator value="#request.newsList" status="status" var="news">
									<li class="list-group-item"><a
										href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
												value="#news.title" /></a>
										<p class="pull-right">
											<s:date name="#news.createDate" format="yyyy-MM-dd" />
										</p></li>
								</s:iterator>
							</ul>

							<nav>
								<ul class="pagination">
									<s:if test="#request.pageIndex==1">
										<li class="disabled"><span aria-hidden="true">&laquo;</span>
										</li>
									</s:if>
									<s:else>
										<li><a
											href="queryNewslistByTypeAndPage.action?newsType=<s:property value='#request.newsType' />&pageIndex=1"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</s:else>

									<s:iterator value="#request.page" status="status" var="page">
										<s:if test="#request.pageIndex ==#page">
											<li class="active"><a
												href="queryNewslistByTypeAndPage.action?newsType=<s:property value='#request.newsType' />&pageIndex=<s:property />"><s:property /></a></li>
										</s:if>
										<s:else>
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=<s:property value='#request.newsType' />&pageIndex=<s:property />"><s:property /></a></li>
										</s:else>
									</s:iterator>

									<s:if test="#request.pageIndex == #request.pageCount">
										<li class="disabled"><span aria-hidden="true">&raquo;</span></li>
									</s:if>
									<s:else>
										<li><a
											href="queryNewslistByTypeAndPage.action?newsType=<s:property value='#request.newsType' />&pageIndex=<s:property value='#request.pageCount' />"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</s:else>

								</ul>
							</nav>

						</div>
					</s:else>

				</div>
			</div>
			<div class="col-md-2 "></div>
		</div>

	</div>



	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>
