<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<style>
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top"
		style="background-color:">
		<!-- 图标，标题 -->
		<div class="navbar-header">
			<a class="navbar-brand " href="toBackstage.action?operate=0">
				Lemon News</a>
		</div>


		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><s:property
							value="#session.admin.loginName" /> <span class="caret"></span>&nbsp;&nbsp;&nbsp;</a>
					<ul class="dropdown-menu">
						<li role="separator" class="divider"></li>
						<li><a href="toIndex.action">退出</a></li>
					</ul></li>

			</ul>
			<!-- 搜索栏 -->
			<form class="navbar-form navbar-right" role="search"
				action="backstageSearchNews.action?pageIndex=1&operate=4" method="post" onsubmit="return validateSearchForm(this)">
				<div class="form-group" id="searchBox">
					<input type="text" class="form-control" placeholder="Search"
						name="newsTitle">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>

			</form>

		</div>

	</nav>





	<script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function validateSearch(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g, "");
				if (value.length > 40) {
					return false;
				} else if (value == "" || value == null
						|| reg.exec(value) != null) {
					return false;
				} else {
					return true;
				}
			}
		}

		function validateSearchForm(form) {
			with (form) {
				if (validateSearch(newsTitle, "搜索内容有误") == false) {
					newsTitle.focus();
					$("#searchBox").addClass("has-error");
					return false;
				} else {
					return true;
				}
			}
		}
	</script>
</body>
</html>