<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	
<body>
	<a href="<%=basePath%>view/baseinformationmanage/Customer.jsp">客户管理</a>
	<a href="<%=basePath%>view/baseinformationmanage/Material.jsp">原料信息</a>
	<a href="<%=basePath%>view/baseinformationmanage/production.jsp">产品信息</a>
	<a href="<%=basePath%>view/baseinformationmanage/Manufacturer.jsp">供应商管理</a>
	<a href="<%=basePath%>view/baseinformationmanage/warehouse.jsp">仓库管理</a>
</body>
</html>





