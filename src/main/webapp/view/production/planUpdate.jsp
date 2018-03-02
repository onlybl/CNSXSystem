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
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改计划</title>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#prodName").val(${plan.productionId });
});
</script>
</head>
<body>
	<h2>
		<b style="margin-left: 80px;">修改计划</b>
	</h2>

	<div style="width: 80%; margin: auto; border-collapse: 1px;">
		<form action="<%=basePath%>productionPlanController/planUpdate.do""
			method="post">
			<input type="hidden" name="planId" value=${plan.planId }>
			<table border="1" width="80%" class="table table-bordered ">
				<tr>
					<td>计划编号：<input type="text" name="planNo"
						value="${plan.planNo }"></td>
					<td>产品名称：<select class="combobox" id="prodName"
						name="productionId">
							<c:forEach items="${prodNameList }" var="prod">
								<option value="${prod.productionId}">${prod.productionName }</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td>&emsp;经手人：<input type="text" name="planAssign"
						value="${plan.planAssign }"></td>
					<td>&emsp;&emsp;状态：<select class="combobox" name="status">
							<option value="0" selected>未完成</option>
							<option value="1">已完成</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>生产日期：<input type="text" value="${plan.planCreatetime }"
						readonly class="form_date" name="planCreatetime"></td>
					<td>完成日期：<input type="text" value="${plan.planFinishedtime }"
						readonly class="form_date" name="planFinishedtime"></td>
				</tr>
				<tr>
					<td>计划产量：<input type="text" name="planPlanned"
						value="${plan.planPlanned }"></td>
					<td>实际产量：<input type="text" name="planActualOutput"
						value="${plan.planActualOutput }"></td>
				</tr>
				<tr>
					<td colspan='2'>&emsp;&emsp;备注：<input type="text"
						name="remark" value="${plan.remark }"></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn btn-block btn-info" value="提交"></td>
					<td><input type="reset" class="btn btn-block btn-info" value="重置"></td>
				</tr>
			</table>
		</form>
	</div>


</body>

<script type="text/javascript"
	src="<%=basePath%>jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="<%=basePath%>js/locales/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>
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