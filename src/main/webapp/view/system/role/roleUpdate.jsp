<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

		<h2><b style="margin-left:80px;">修改角色</b></h2>
		<hr>
		
		<div style="width: 500px; margin: auto; border-collapse: 1px;">
		<form action="<%=basePath%>roleController/roleUpdate.do" method="post">
			<input type="hidden" class="form-control" name="roleId" value=${role.roleId }>
			<table border="1" width="80%" class="table table-bordered ">
				<tr>
					<td>角色名：</td>
					<td><input type="text" class="form-control" name="roleName"
						value="${role.roleName }"></td>
				</tr>
				<tr>
					<td>描述：</td>
					<td><input type="text" class="form-control" name="roleDesc"
						value="${role.roleDesc }"></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn btn-block btn-info" value="提交"></td>
					<td><input type="reset" class="btn btn-block btn-info" value="重置"></td>
				</tr>
			</table>

		</form>
</div>
</body>
</html>