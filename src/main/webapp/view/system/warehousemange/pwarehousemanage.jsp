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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet"
	href="dependicyLibraries/css/bootstrap3.3.7cssbootstrap.min.css">
<link rel="stylesheet"
	href="dependicyLibraries/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/layer/skin/layer.css">
<link rel="stylesheet" type="text/css" href="js/kkpager/jpager.css">
<script src="dependicyLibraries/jquery2.1.1jquery.min.js"></script>
<script src="dependicyLibraries/bootstrap3.3.7jsbootstrap.min.js"></script>

<script type="text/javascript" src="js/kkpager/jpager.js"></script>
<script type="text/javascript" src="assets/layer/layer.js"></script>
<title>产品库存管理</title>
</head>
<body>
	<div class="margin clearfix">

		<div style="background-color: rgb(28, 192, 227); height: 50px">

			<span class="l_f icon-inbox"
				style="font-size: 27px; color: white; margin-left: 10px; line-height: 50px;">
				产品库存管理 
			<button onclick="refresh()" style="margin-left: 30px;color:rgb(28, 192, 227);border:0px  "
					class="icon-refresh"></button>
 </span>
		</div>
		<hr />

		<table class='table table-bordered table-hover' id='sample-table'>
			<thead>
				<tr>
					<th>产品编号</th>
					<th>产品名称</th>
					<th>库存数量</th>
					<th>仓库编号</th>
					<th>仓库地址</th>
					<th>联系仓库</th>
					<th>修改仓库</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>

		<div id="jpager" style="margin-left: 50px"></div>
	</div>


	<div id="displayid" style="display: none;">
		<table class="table table-bordered ">
			<tr>
				<td colspan="2">
					<div class="input-group">
						<span class="input-group-addon">产品编号</span> <span
							class="form-control" id="productionNo">productionNo</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="input-group">
						<span class="input-group-addon">产品名称</span> <span
							class="form-control" id="productionName">productionName</span>
					</div>
				</td>
			</tr>
			<tr>
				<td width="320px">
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC">选择仓库</span>
						<select class="form-control selectpicker show-tick "
							name="warehouseselect" id="warehouseselect">
						</select>
					</div>
				</td>
				<td width="60px"><button class=" btn btn-success btn-block"
						onclick="confirmWarehouse()">选择</button></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #ACFFAF">仓库编号</span>
						<span class="form-control" id="storeNo">storeNo</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #ACFFAF">仓库地址</span>
						<input class="form-control" id="storeaddress" value="">
					</div>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #ACFFAF">仓库电话</span>
						<input class="form-control" id="storecall" value="">
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="view/system/warehousemange/productionwarehouse.js"></script>
</html>