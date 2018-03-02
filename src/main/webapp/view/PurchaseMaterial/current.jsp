<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<base href="<%=basePath%>" />
<link rel="stylesheet"
	href="dependicyLibraries/css/bootstrap3.3.7cssbootstrap.min.css" />
<link rel="stylesheet"
	href="dependicyLibraries/css/font-awesome.min.css" />
<script src="dependicyLibraries/jquery2.1.1jquery.min.js"></script>
<script src="dependicyLibraries/bootstrap3.3.7jsbootstrap.min.js"></script>
<link rel="stylesheet" href="assets/layer/mobile/need/layer.css" />
<script src="assets/layer/mobile/layer.js"></script>
<title>物料采购单管理</title>
<style type="text/css">
ul {
	list-style: none;
}

table th {
	text-align: center;
	vertical-align: middle !important;
}
</style>
</head>
<body>
<div style="margin: auto;margin: 20px ">
<table class="table  table-bordered table-hover" >
							<thead>
								<tr class="warning">
									<th>采购编号</th>
									<th>物料编号</th>
									<th>物料名称</th>
									<th>物料单价</th>
									<th>采购数量</th>
									<th>采购人员</th>
									<th>交易金额</th>
									<th>创建日期</th>
									<th>采购状态</th>
									<th>删除订单</th>
								</tr>
							</thead>
							<tbody id="tbody" class="pre-scrollable">

							</tbody>
						</table>
						</div>
</body>
<script type="text/javascript" src="view/PurchaseMaterial/current.js"></script>
</html>