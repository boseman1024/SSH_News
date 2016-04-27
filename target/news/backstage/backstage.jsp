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
	<jsp:include page="backstage_header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href="#" class="list-group-item active disabled" id="news">新闻管理<span
						class="badge"><s:property value="#request.newsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=1&pageIndex=1"
						class="list-group-item">国内新闻<span class="badge"><s:property
								value="#request.NativeNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=2&pageIndex=1"
						class="list-group-item">国外新闻<span class="badge"><s:property
								value="#request.ForeignNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=3&pageIndex=1"
						class="list-group-item">娱乐新闻<span class="badge"><s:property
								value="#request.ENTNewsCount" /></span></a> <a
						href="backstageQueryNewslist.action?newsType=4&pageIndex=1"
						class="list-group-item">科技新闻<span class="badge"><s:property
								value="#request.ITNewsCount" /></span></a><a
						href="backstageQueryNewslist.action?newsType=5&pageIndex=1"
						class="list-group-item">社会新闻<span class="badge"><s:property
								value="#request.SocialNewsCount" /></span></a> <a href=""
						class="list-group-item disabled"> 新闻发表 </a>
				</div>

			</div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-body" id="info">
						<h2>类型</h2>
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
								<s:iterator value="#request.newsList" status="status" var="news">
									<tr>
										<td style="text-align: center;"><s:property
												value="#news.id" /></td>
										<td style="text-align: center;"><s:property
												value="#news.title" /></td>
										<td style="text-align: center;"><s:property
												value="#news.author" /></td>
										<td style="text-align: center;"><s:property
												value="#news.createDate" /></td>
										<td style="text-align: center;">编辑 <a
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
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>
