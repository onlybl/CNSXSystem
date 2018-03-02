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
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已完成计划</title>
</head>
<body>

	<div style="margin: auto">
		<div style="margin: auto;">
			<ul id="navone" class="nav nav-tabs">
				<li><a
					href="<%=basePath%>productionPlanController/planList.do"
					id="one" title="部门列表">未完成计划</a></li>
			</ul>

			<!-- 这个下面是写动态获取的内容 -->

			<h2>
				<b style="margin-left: 80px;">已完成计划</b>
			</h2>
			<hr>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="view" style="height: 350px">
					<table style="text-align: center"
						class="table table-bordered table-hover">
						<tr style="color: white; font-size: 18px; background-color:rgb(28,192,227); font: bold;">
							<td>计划编号</td>
			<td>产品名称</td>
			<td>经手人</td>
			<td>生产日期</td>
			<td>完成日期</td>
			<td>计划产量</td>
			<td>实际产量</td>
			<td>备注</td>
						</tr>
						<c:forEach items="${historyPlanList }" var="plan">

							<tr >
								
							
							<td>${plan.planNo}</td>
			<td>${plan.productionName}</td>
			<td>${plan.planAssign}</td>
			<td>${plan.planCreatetime}</td>
			<td>${plan.planFinishedtime}</td>
			<td>${plan.planPlanned}</td>
			<td>${plan.planActualOutput}</td>
			<td>${plan.remark}</td>
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