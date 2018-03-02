<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="view/system/unassigneduser/model.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap/js/bootstrap.js"></script>
<script src="view/system/unassigneduser/addUser.js"></script>
</head>
<body>
	<div id="modal-overlay">
		<div class="modal-data">
			<h2 style="color: green">
				<span class="glyphicon glyphicon-ok"> 添加成功！</span>
			</h2>
			<p>
				<button class="btn btn-success" onclick="overlay()">确认</button>
			</p>
		</div>
	</div>
	<div
		style="margin: auto; border-collapse: 1px; padding-left: 150px; padding-right: 150px">
		
		<form action="orderFormController/update.do" method="post" style="width:60%;margin-left:20%;">
		<table border="1" class="table table-bordered ">
			<tr>
				<td colspan="2" style="background-color: #3399cc;">
					<div>
						<span class="glyphicon glyphicon-pencil"
							style="text-align: center; font-size: 24px; margin-left: 20px; color: white;">
							<b>销售信息修改</b>
						</span>
					</div>
				</td>
			</tr>
			<tr>
			<input type="hidden" name="saleId" value="${sale.saleId }">
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">产品名称：</span>
						<input class="form-control" data-toggle="tooltip" type="text" name="saleName" value="${sale.saleName }">
					</div></td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">产品状态：</span>
						<input class="form-control" data-toggle="tooltip" type="text" name="saleStatus" value="${sale.saleStatus }">
					</div></td>
			</tr>
			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon"   style="background-color: #F0FFF0">生产厂家：</span>
						<input class="form-control" data-toggle="tooltip" type="text" name="saleFactory" value="${sale.saleFactory }">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC;">销售日期：</span>
						<input class="form-control" data-toggle="tooltip" type="text" name="saleTime" value="${sale.saleTime }">
					</div>
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">销售数量：</span>
						<input class="form-control" data-toggle="tooltip" type="text"  name="saleAmount" value="${sale.saleAmount }">
					</div></td>
			</tr>

			<tr>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">销售金额：</span>
						<input class="form-control" type="text" name="saleMoney"  value="${sale.saleMoney }">
					</div></td>
			</tr>

			<tr>
				<td colspan="2"><input style="color: white; font-size: 20px;"
					class="btn btn-block btn-info" type="submit"
					 value="保    存   修     改"></td>
			</tr>
		</table>
		</form>
	</div>
	<br />
</body>

</html>