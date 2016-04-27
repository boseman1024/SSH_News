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
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="queryNewslistByTypeAndPage.action?newsType=1&pageIndex=1">国内新闻</a>
					</div>
<%-- 					<s:action name="getNewsListByType" namespace="">
						<s:param name="newsType" value="4" />
						<ul class="list-group">
							<s:iterator value="#request.newsList" status="status" var="news">
								<li class="list-group-item"><s:property value="#news.title"/></li>
							</s:iterator>

						</ul>

					</s:action> --%>
				</div>
			</div>
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="queryNewslistByTypeAndPage.action?newsType=2&pageIndex=1">国外新闻</a>
					</div>
					<ul class="list-group">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
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
						<a href="queryNewslistByTypeAndPage.action?newsType=3&pageIndex=1">娱乐新闻 </a>
					</div>
					<ul class="list-group">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="queryNewslistByTypeAndPage.action?newsType=4&pageIndex=1">科技新闻</a>
					</div>
					<ul class="list-group">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href="queryNewslistByTypeAndPage.action?newsType=5&pageIndex=1">社会新闻 </a>
					</div>
					<ul class="list-group">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
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
