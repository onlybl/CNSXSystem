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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div style="width:80%; margin: auto; border-collapse: 1px;">
		<div style="width:80%; margin: auto; border-collapse: 1px;">
			<form action="<%=basePath%>roleController/roleAdd.do" method="post">
				<table border="1" class="table table-bordered ">
					<tr>
						<td colspan="2" style="background-color: rgb(28, 192, 227);">
							<div>
								<span class="glyphicon glyphicon-user"
									style="text-align: center; font-size: 33px; margin-left: 20px; color: white;">
									新增角色</span>
							</div>
						</td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">角色名：</span> <input
									class="form-control" type="text" name="roleName" value="">
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">描述：</span> <input
									class="form-control" type="text" name="roleDesc" value="">
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><input style="color: white; font-size: 20px;"
							class="btn btn-block btn-info" type="submit"
							value="立    即    创     建"></td>
					</tr>
				</table>

			</form>

		</div>
	</div>

</body>
</html>