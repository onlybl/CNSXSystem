<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>部门管理</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css">
	
<script type="text/javascript"
	src="<%=basePath%>view/system/department/listDepartment.js"></script>

<script type="text/javascript">
        function load() {
        	arrayPage(${pageResult.pages},${pageResult.total});
        }
</script>

</head>
<body onload="load()">

	<div style="height: 386px; margin: auto">
		<div style="margin: auto;">
			<ul id="navone" class="nav nav-tabs">
				<li><a
					href="<%=basePath%>view/system/department/departmentAdd.jsp"
					id="one" title="部门列表">部门列表</a></li>
				<li><a
					href="<%=basePath%>view/system/department/departmentAdd.jsp"
					id="two" title="添加部门">添加部门</a></li>
			</ul>

			<!-- 这个下面是写动态获取的内容 -->

			<h2>
				<b style="margin-left: 80px;">部门列表</b>
			</h2>
			<hr>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="view" style="height: 350px">
					<table style="text-align: center"
						class="table table-bordered table-hover">
						<tr style="color: white; font-size: 18px; background-color:rgb(28,192,227); font: bold;">
							<td>部门名：</td>
							<td>部门电话：</td>
							<td>描述：</td>
							<td>职责：</td>
							<td>类型：</td>
							<td colspan="2">操作</td>
						</tr>
						<c:forEach items="${pageResult.dataList}" var="department">
							<tr >
								<td>${department.departmentName}</td>
								<td>${department.departmenTel}</td>
								<td>${department.departmentDesc}</td>
								<td>${department.mainManager}</td>
								<td>${department.departmentType}</td>
								<td><a class="btn btn-block btn-default"
									href="<%=basePath%>departmentController/updateDepartmentUI.do?departmentId=${department.departmentId}">
									<span class="glyphicon glyphicon-edit" style="color: rgb(0, 0, 145);"></span>修改</a></td>
								<td><a class="btn btn-block btn-default"
									href="JavaScript:if(confirm('确实要删除该内容吗?'))location='<%=basePath%>departmentController/deleteDepartment.do?departmentId=${department.departmentId}'">
									<span class="glyphicon glyphicon-trash" style="color: rgb(255, 108, 21);"></span>删除</a></td>
							</tr>
						</c:forEach>
					</table>
					<div id="jpager"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

