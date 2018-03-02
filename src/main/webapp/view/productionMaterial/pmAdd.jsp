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
<title>为产品添加原料</title>
</head>
<body>
	<h1>添加产品所需原料</h1>
	<a href="<%=basePath%>productionMaterialController/pmList.do">返回</a>
	<hr>
	<form action="<%=basePath%>productionMaterialController/pmAdd.do" method="post">
	<table class="table">
		<tr>
			<td>产品：<select class="combobox" name="productionId">
					<c:forEach items="${prodNameList}" var="prod">
						<option value="${prod.productionId}">${prod.productionName }</option>
					</c:forEach>
					</select>
			</td>
			<td>原料：<select class="combobox" name="materialId">
					<c:forEach items="${materialNameList}" var="mate">
						<option value="${mate.materialId}">${mate.materialName}</option>
					</c:forEach>
					</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="提交"></td>
			<td><input type="reset" value="重置"></td>
		</tr>
	</table>
	</form>
</body>
</html>