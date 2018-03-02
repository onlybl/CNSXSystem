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
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
	$.ajax({
		type : "post",
		url : "<%=basePath%>OrderFormController/getCustomer.do",
		dataType : "json",
		data : {},
		success : function(customerList) {
			var option;
			var selected = customerList[1];
			for (var i = 0; i < customerList.length; i++) {
				var customer = customerList[i];
				option += "<option  value='"+customer.customerId+"'>"
						+ customer.customerName + "</option>";
			}
			$("#selectCustomer").html(option);
			$(
					"#selectCustomer option[value='"
							+ selected.departmentId + "']").attr(
					"selected", "selected");
		},
		error : function(i) {
		}
	});
	$.ajax({
		type : "post",
		url : "<%=basePath%>OrderFormController/getProduction.do",
		dataType : "json",
		data : {},
		success : function(productionList) {
			var option;
			var selected = productionList[1];
			for (var i = 0; i < productionList.length; i++) {
				var production = productionList[i];
				option += "<option  value='"+production.productionId+"'>"
						+ production.productionName + "</option>";
			}
			$("#selectProduction").html(option);
			$(
					"#selectProduction option[value='"
							+ selected.productionId + "']").attr(
					"selected", "selected");
		},
		error : function(i) {
		}
	});
	})
	
</script>
</head>
<body>
	<div class="title">
		<button class="btn btn-large btn-block" onclick=" alerta()">返回</button>
	</div>
	<hr>
	<div style="width: 600px; margin: auto; border-collapse: 1px;">
		<hr>

		<div style="width: 600px; margin: auto; border-collapse: 1px;">
		
			<form action="orderFormController/orderAdd.do" method="post">
				<table border="1" class="table table-bordered ">
					<tr>
						<td colspan="2" style="background-color: rgb(28, 192, 227);">
							<div>
								<span class="glyphicon glyphicon-plus"
									style="text-align: center; font-size: 33px; margin-left: 20px; color: white;">
									新增销售信息</span>
							</div>
						</td>
					</tr>
					<tr><td style="color: red;"></td></tr>
					<tr>
						<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">产品名称：</span>
						<input class="form-control" type="text" name="saleName" value="">
					</div></td>
							
					</tr>
					<tr>
						<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">销售状态：</span>
						<input class="form-control" type="text" name="saleStatus" value="">
					</div></td>
                </td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">生产厂家：</span> <input
									class="form-control" type="text" name="saleFactory" value="">
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">销售时间：</span> <input
									class="form-control" type="text" name="saleTime" value="">
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">销售数量：</span> <input
									class="form-control" type="text" name="saleAmount" value="">
							</div></td>
							
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">销售金额：</span> <input
									class="form-control" type="text" name="saleMoney" value="">
							</div></td>
					</tr>
					
					<tr>
						<td colspan="2"><input style="color: white; font-size: 20px;"
							class="btn btn-block btn-info" type="submit"
							value="立    即    创     建"></td>
					</tr>
				</table>

			</form>

		</div>
	</div>

</body>
</html>