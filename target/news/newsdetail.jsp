<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<div class="list-group">
					<a href="queryNewslistByTypeAndPage.action?newsType=1&pageIndex=1"
						class="list-group-item"> 国内新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=2&pageIndex=1"
						class="list-group-item">国外新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=3&pageIndex=1"
						class="list-group-item">娱乐新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=4&pageIndex=1"
						class="list-group-item">科技新闻</a> <a
						href="queryNewslistByTypeAndPage.action?newsType=5&pageIndex=1"
						class="list-group-item">社会新闻</a>
				</div>
			</div>
			<div class="col-md-7">
				<div class="panel panel-default">
					<div class="panel-body">
						<h1>
							<s:property value="#request.newsinfo.title" />
						</h1>

						<blockquote>
							<p>
								作者：
								<s:property value="#request.newsinfo.author" /><br>
								<s:if test="#session.admin!=null">
							文章ID：<s:property value="#request.newsinfo.id" />
								</s:if>
							</p>
							<footer>
								日期：
								<s:property value="#request.newsinfo.createDate" />
							</footer>
						</blockquote>

						<s:property value="#request.newsinfo.content" />



					</div>
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