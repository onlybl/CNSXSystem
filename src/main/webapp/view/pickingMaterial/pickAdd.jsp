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
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link href="<%=basePath%>css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function(){
$("#prod").change(function(){
	var productionId=$("#prod").val();
	$.ajax({
		url : "pickingMaterialController/findMateByProd.do",
		dataType : "json",
		type : "POST",
		data : {"productionId":productionId},
		success : function(prodMateList) {
			var inf="";
			for(var i=0;i<prodMateList.length;i++){
				var pm=prodMateList[i];
				inf+="<label><input name='materialId' type='checkbox' value="+pm.materialId+">"+pm.materialName+"</label>";
				inf+="<input type='text' name='materialQuantity'>";
				inf+="&emsp;"
			}
				$("#mate").html(inf);
		},
		error : function(e) {
			alert("ajax请求错误");
		}
	});
});
});
</script>
<title>添加领料单</title>
</head>
<body>
	<h1>添加领料单</h1>
	<a href="<%=basePath%>pickingMaterialController/pickList.do">返回</a>
	<hr>
	<form action="<%=basePath%>pickingMaterialController/pickAdd.do" method="post">
	<table class="table">
		<tr>
			<td>产品：<select class="combobox" id="prod" name="productionId">
						<option></option>
					<c:forEach items="${prodNameList }" var="prod">
						<option value="${prod.productionId}">${prod.productionName }</option>
					</c:forEach>
					</select>
			</td>
		</tr>
		<tr>
			<td id="mate">
			材料
			</td>
		</tr>
		<tr>
			<td>编号：<input type="text" name="pickersNo"></td>
			<td>领料人：<input type="text" name="pickers"></td>
		</tr>
		<tr>
			<td><input type="submit" value="提交"></td>
			<td><input type="reset" value="重置"></td>
		</tr>
	</table>
	</form>
</body>
</html>