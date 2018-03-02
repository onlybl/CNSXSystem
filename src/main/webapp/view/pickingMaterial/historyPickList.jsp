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
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css">
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>领料单管理</title>
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
					id="one" title="部门列表">已领取材料列表</a></li>
				<li><a
					href="<%=basePath%>pickingMaterialController/pickList.do"
					id="two" title="添加部门">待领取材料列表</a></li>
			</ul>

			<!-- 这个下面是写动态获取的内容 -->

			<h2>
				<b style="margin-left: 80px;">已领取材料列表</b>
			</h2>
			<hr>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="view" style="height: 350px">
					<table style="text-align: center"
						class="table table-bordered table-hover">
						<tr
							style="color: white; font-size: 18px; background-color: rgb(28, 192, 227); font: bold;">
							<td>编号</td>
							<td>产品</td>
							<td>材料</td>
							<td>数量</td>
							<td>领料人</td>
							<td>领料日期</td>
						</tr>
						<c:forEach items="${historyPickList }" var="historyPick">
			<tr>
				<td>${historyPick.pickersNo}</td>
				<td>${historyPick.productionName}</td>
				<td>${historyPick.materialName}</td>
				<td>${historyPick.materialQuantity}</td>
				<td>${historyPick.pickers}</td>
				<td>${historyPick.pickingDate}</td>
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