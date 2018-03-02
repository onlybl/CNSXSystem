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
<base href="<%=basePath%>" />
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加计划</title>
</head>
<body>
	<h1>添加计划</h1>
	<a href="<%=basePath%>productionPlanController/planList.do">返回</a>
	<hr>
	<form action="<%=basePath%>productionPlanController/planAdd.do" method="post">
	<table class="table">
		<tr>
			<td>计划编号：<input type="text" name="planNo"></td>
			<td>产品名称：
				<select class="combobox" name="productionId">
					<c:forEach items="${prodNameList }" var="prod">
						<option value="${prod.productionId}">${prod.productionName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>&emsp;经手人：<input type="text" name="planAssign"></td>
			<td>&emsp;&emsp;状态：<select class="combobox" name="status">
						<option value="0" selected>未完成</option>
						<option value="1">已完成</option>
					</select>
			</td>
		</tr>
		<tr>
			<td>生产日期：<input type="text" value="" readonly class="form_date" name="planCreatetime"></td>
			<td>完成日期：<input type="text" value="" readonly class="form_date" name="planFinishedtime"></td>
		</tr>
		<tr>
			<td>计划产量：<input type="text" name="planPlanned"></td>
			<td>实际产量：<input type="text" name="planActualOutput" value=0></td>
		</tr>
		<tr>
			<td colspan='2'>&emsp;&emsp;备注：<input type="text" name="remark"></td>
		</tr>
		<tr>
			<td><input type="submit" value="提交"></td>
			<td><input type="reset" value="重置"></td>
		</tr>
	</table>
	</form>
</body>

<script type="text/javascript" src="<%=basePath%>jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
		format: 'yyyy/mm/dd'
    });
</script>

</html>