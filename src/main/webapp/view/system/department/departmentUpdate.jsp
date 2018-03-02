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

		<h2><b style="margin-left:80px;">修改部门</b></h2>
		<hr>
		
		<div style="width: 500px; margin: auto; border-collapse: 1px;">
		<form action="<%=basePath%>departmentController/updateDepartment.do" method="post">
			<input type="hidden" name="departmentId" class="form-control" value=${department.departmentId }>
			<table border="1" width="80%"class="table table-bordered ">		
			
				<tr>
					<td>部门名：</td>
					<td><input type="text" class="form-control" name="departmentName"
						value="${department.departmentName }"></td>
				</tr>
				<tr>
					<td>部门电话：</td>
					<td><input type="text" class="form-control" name="departmenTel"
						value="${department.departmenTel }"></td>
				</tr>
				<tr>
					<td>描述：</td>
					<td><input type="text" class="form-control" name="departmentDesc"
						value="${department.departmentDesc }"></td>
				</tr>
				<tr>
					<td>职责：</td>
					<td><input type="text" class="form-control" name="mainManager" value="${department.mainManager }"></td>
				</tr>
				<tr>
					<td>类型</td>
					<td><input type="number" class="form-control" name="departmentType" value="${department.departmentType }"></td>
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