<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<style>
.jumbotron {
	background: url(static/pic/background.jpg) no-repeat;
	background-size: cover;
	text-align: center;
}
</style>
</head>
<body>

	<div class="jumbotron">
		<div class="container ">

			<div class="navbar-wrapper">
				<div class="container">
					<nav class="navbar navbar-inverse ">
						<div class="container-fluid">
							<!-- 图标，标题 -->
							<div class="navbar-header">
								<a class="navbar-brand " href="toIndex.action">Lemon News</a>
							</div>

							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">新闻资讯 <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=1&pageIndex=1&operate=0">国内新闻</a></li>
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=2&pageIndex=1&operate=0">国外新闻</a></li>
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=3&pageIndex=1&operate=0">娱乐新闻</a></li>
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=4&pageIndex=1&operate=0">科技新闻</a></li>
											<li><a
												href="queryNewslistByTypeAndPage.action?newsType=5&pageIndex=1&operate=0">社会新闻</a></li>
										</ul></li>
								</ul>
								<ul class="nav navbar-nav navbar-right" id="adminNavbar">
									<s:if test="#session.admin!=null">
										<li><a href="toBackstage.action?operate=0">进入后台</a></li>
										<li><a id="loginOut" href="">登出</a></li>
									</s:if>
									<s:else>
										<li><a href="toLogin.action">登入</a></li>
									</s:else>




								</ul>



							</div>

						</div>
					</nav>
				</div>
			</div>

			<h1>
				<br>
			</h1>
			<div class="row ">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<!-- 搜索栏 -->
					<form action="searchNews.action?pageIndex=1&operate=4"
						method="post" onsubmit="return validateSearchForm(this)">
						<div class="input-group input-group-lg " id="searchBox">
							<input type="text" class="form-control "
								placeholder="Search for..." name="newsTitle"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">Go!</button>
							</span>
						</div>
					</form>
				</div>
				<div class="col-md-4"></div>
			</div>

		</div>
	</div>





	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//登出：ajax实现局部刷新
		$("#loginOut").click(function() {
			var url = "loginOut.action";
			var data = "";
			$.ajax({
				type : "get",
				async : true,
				url : url,
				data : data,
				success : function() {
					$("#adminNavbar").html();
				},
				error : function() {

				}
			});

		});

		function validateSearch(field, alerttxt) {
			with (field) {
				value = value.replace(/\s+/g,"");
				if (value.length>40) {
					return false;
				}else if(value==""||value==null){
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
				}else{
					return true;
				}
			}
		}
	</script>
</body>
</html>