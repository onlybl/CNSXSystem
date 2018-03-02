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
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改领料单</title>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<h2>
		<b style="margin-left: 80px;">修改领料单</b>
	</h2>

	<div style="width: 80%; margin: auto; border-collapse: 1px;">
		<form action="<%=basePath%>pickingMaterialController/pickUpdate.do"
			method="post">
			<input type="hidden" name="pickingMaterialId"
				value=${pick.pickingMaterialId }> <input id="prod"
				type="hidden" name="productionId" value=${pick.productionId }>
			<table border="1" width="80%" class="table table-bordered ">
				<tr>
					<td>产品：<input type="text" disabled="disabled"
						name="productionName" value="${pick.productionName }">
					</td>
				</tr>
				<tr>
					<td id="mate">.............</td>
					<td>数量：<input type="text" name="materialQuantity"
						value="${pick.materialQuantity }"></td>
				</tr>
				<tr>
					<td>编号：<input type="text" name="pickersNo"
						value="${pick.pickersNo }"></td>
					<td>领料人：<input type="text" name="pickers"
						value="${pick.pickers }"></td>
				</tr>
				<tr>
					<td>状态：<select class="combobox" name="pickingStatus"
						id="status">
							<option value="0" selected>未完成</option>
							<option value="1">已完成</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" class="btn btn-block btn-info" value="提交"></td>
					<td><input type="reset" class="btn btn-block btn-info" value="重置"></td>
				</tr>
			</table>
		</form>
		<input type="hidden" name="pickingDate" id="date" value="">
	</div>


</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var productionId = $("#prod").val();
						$
								.ajax({
									url : "pickingMaterialController/findMateByProd.do",
									dataType : "json",
									type : "POST",
									data : {
										"productionId" : productionId
									},
									success : function(prodMateList) {
										var inf = "材料：<select class='combobox' id='mateName' name='materialId'>";
										for (var i = 0; i < prodMateList.length; i++) {
											var pm = prodMateList[i];
											inf += "<option value="+pm.materialId+">"
													+ pm.materialName
													+ "</option>"
										}
										inf += "</select>";
										$("#mate").html(inf);
										var m = $
										{
											pick.materialId
										}
										;
										$("#mateName").val(m);
									},
									error : function(e) {
										alert("ajax请求错误");
									}
								});
					});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		/**
		 * 
		 * 获取当前时间
		 */
		function p(s) {
			return s < 10 ? '0' + s : s;
		}

		var myDate = new Date();
		//获取当前年
		var year = myDate.getFullYear();
		//获取当前月
		var month = myDate.getMonth() + 1;
		//获取当前日
		var date = myDate.getDate();

		var now = year + '/' + p(month) + "/" + p(date);

		$("#status").change(function() {
			var s = $("#status").val();
			if (s == 1) {
				$("#date").val(now);
			} else if (s == 0) {
				$("#date").val("");
			}
		});
	});
</script>
</html>