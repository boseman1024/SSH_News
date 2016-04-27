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
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="queryNewslistByTypeAndPage.action?newsType=1&pageIndex=1&operate=0">国内新闻</a>
					</div>
					<ul class="list-group">
						<s:iterator value="#request.nativNews" status="status" var="news">
							<li class="list-group-item"><a
								href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
										value="#news.title" /></a></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="queryNewslistByTypeAndPage.action?newsType=2&pageIndex=1&operate=0">国外新闻</a>
					</div>
					<ul class="list-group">
						<s:iterator value="#request.foreignNews" status="status"
							var="news">
							<li class="list-group-item"><a
								href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
										value="#news.title" /></a></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="queryNewslistByTypeAndPage.action?newsType=3&pageIndex=1&operate=0">娱乐新闻
						</a>
					</div>
					<ul class="list-group">
						<s:iterator value="#request.ENTNews" status="status" var="news">
							<li class="list-group-item"><a
								href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
										value="#news.title" /></a></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="queryNewslistByTypeAndPage.action?newsType=4&pageIndex=1&operate=0">科技新闻</a>
					</div>
					<ul class="list-group">
						<s:iterator value="#request.ITNews" status="status" var="news">
							<li class="list-group-item"><a
								href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
										value="#news.title" /></a></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a
							href="queryNewslistByTypeAndPage.action?newsType=5&pageIndex=1&operate=0">社会新闻
						</a>
					</div>
					<ul class="list-group">
						<s:iterator value="#request.socialNews" status="status" var="news">
							<li class="list-group-item"><a
								href="showNewsdetail.action?newsId=<s:property value="#news.id" />"><s:property
										value="#news.title" /></a></li>
						</s:iterator>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>
