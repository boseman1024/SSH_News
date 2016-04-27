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
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">管理员登录</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="login.action" method="post">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-9">
									<input type="text" name="admin.loginName" class="form-control" placeholder="Loginname">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-3 control-label">密码</label>
								<div class="col-sm-9">
									<input type="password" name="admin.loginPwd" class="form-control"
										placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-5 col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-4"></div>

				</div>
			</div>
		</div>
	</div>




	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>