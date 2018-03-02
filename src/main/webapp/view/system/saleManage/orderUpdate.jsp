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
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>订单修改</title>
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

		<h2><b style="margin-left:80px;">修改编号为<em style="color: blue;">${requestScope.orderForm.orderNumber }</em>的订单</b></h2>
		<hr>
		
		<div style="width: 500px; margin: auto; border-collapse: 1px;">
		
		<form action="<%=basePath%>OrderFormController/orderUpdate.do" method="post">
			<input type="hidden" class="form-control" name="orderId" value='${requestScope.orderForm.orderId }'>
			<input type="hidden" class="form-control" name="orderNumber" value='${requestScope.orderForm.orderNumber }'>
			<table border="1" width="80%"class="table table-bordered ">
			<tr><td style="color: red;">${requestScope.inf}</td></tr>
				<tr>
						<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">产品id</span>
						<select class="form-control selectpicker show-tick "
							name="productId" id="selectProduction" >
						</select>
					</div></td>
							
					</tr>
					<tr>
						<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">顾客id</span>
						<select class="form-control selectpicker show-tick "
							name="customerId" id="selectCustomer">
						</select>
					</div></td>
           
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">数量：</span> <input
									class="form-control" type="text" name="orderQuantity" value="${requestScope.orderForm.orderQuantity }">
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">总价：</span> <input
									class="form-control" type="text" name="orderTotalPrice" value="${requestScope.orderForm.orderTotalPrice }">
							</div></td>
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">送货方式：</span> <input
									class="form-control" type="text" name="settlementMethod" value="${requestScope.orderForm.settlementMethod }">
							</div>
							<small>请填1-3的数字（1代表圆通，2代表申通，3代表顺丰）</<small></td>
							
					</tr>
					<tr>
						<td><div class="input-group">
								<span class="input-group-addon"
									style="background-color: #F0FFF0">创建人：</span> <input
									class="form-control" type="text" name="depositoryOutAssign" value="${requestScope.orderForm.depositoryOutAssign }">
							</div></td>
					</tr>
				<tr>
					<td><input onclick="{if(confirm('确定修改吗?')){this.document.formname.submit();return true;}return false;}" type="submit" class="btn btn-block btn-info" value="修改"></td>
					
				</tr>
				<tr>
					
					<td><input type="reset" class="btn btn-block btn-info" value="重置"></td>
				</tr>
			</table>

		</form>
		
		
</div>
</body>
</html>