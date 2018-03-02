<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品与材料</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="margin: auto">
		<div style="margin: auto;">
			<ul id="navone" class="nav nav-tabs">
				<li><a
					href="<%=basePath%>productionMaterialController/pmAddUI.do" id="one" >添加产品所需材料</a></li>
			</ul>

			<!-- 这个下面是写动态获取的内容 -->

			<h2>
				<b style="margin-left: 80px;">产品所需材料列表</b>
			</h2>
			<hr>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="view" style="height: 350px">
					<table style="text-align: center"
						class="table table-bordered table-hover">
						<tr
							style="color: white; font-size: 18px; background-color: rgb(28, 192, 227); font: bold;">
							<td>产品</td>
							<td>材料</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${pmList }" var="pm">
							<tr>
								<td>${pm.productionName}</td>
								<td>${pm.materialName}</td>
								<td><a
									href="JavaScript:if(confirm('确实要删除该内容吗?'))location='<%=basePath%>productionMaterialController/pmDelete.do?pmId=${pm.pmId}'">删除</a></td>
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