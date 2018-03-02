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
<link rel="stylesheet" href="dist/searchable.css">
<script type="text/javascript" src="dist/searchable.js"></script>
<link rel="stylesheet" href="assets/layer/mobile/need/layer.css" />
<script src="assets/layer/mobile/layer.js"></script>
<title>新采购单</title>
</head>
<body>
	<div style="margin: 12px;">
		<div style="background-color: rgb(28, 192, 227); height: 50px;">
			<span
				style="font-size: 24px; color: white; line-height: 50px; margin-left: 10px; font-weight: 200">
				新 采 购 单 </span>
		</div>
		<hr />
		<table border="1" style="width: 600px; margin: auto"
			class="table table-bordered ">
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">物料名称</span>
						<input class="form-control" disabled="disabled" placeholder=""
							type="text" id="materialName" value="">
					</div></td>
				<td><div class="input-group">
						<span class=" input-group-addon" style="background-color: #FFF8DC">选择物料</span>
						<select class="selectMaterial form-control" id="selectMaterial">
						</select>
						<button class=" input-group-addon" onclick="confirm()">显示</button>
					</div></td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">物料编号</span><input
							class="form-control" data-toggle="tooltip" disabled="disabled"
							type="text" id="materialNo" value="">
					</div></td>
				<td>
					<button class="btn btn-block btn-info" onclick="Material()">物料不在列表里</button>
				</td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">物料单价</span>
						<input class="form-control" type="text" disabled="disabled"
							id="materialUnitprice" value="" />
					</div></td>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC">采购数量</span><input
							class="form-control" data-toggle="tooltip" placeholder=""
							type="text" id="purchaseQuantity" value="">
					</div></td>
			</tr>
			<!--  -->
			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">供应商</span>
						<input class="form-control" type="text" id="ManufacturerName"
							value="" disabled="disabled">
					</div>
				</td>
				<td>
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC">采购人员</span>
						<input class="form-control" type="text" id="purchaseAssign"
							value="">
					</div>

				</td>
			</tr>
			<tr>
				<td><button
						style="color: orange; font-size: 18px; border: 1px solid orange; background-color: white"
						class="btn btn-block btn-default" onclick="addpurchasematerial()">新建采购任务</button></td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		$(function() {
			materialSelectList();
		})
		function materialSelectList() {
			$.ajax({
				type : "post",
				url : "Purchase/selectMaterialidName.do",
				dataType : "json",
				data : {},
				success : function(inf) {
					var option;
					for (var i = 0; i < inf.length; i++) {
						var d = inf[i];
						option += "<option  value='" + d.materialId + "'>"
								+ d.materialName + "</option>";
					}
					$('#selectMaterial').html(option);
					$('.selectMaterial').searchableSelect();

				},
				error : function(msg) {
				}
			});

		}
		function getMaterialbyId(MaterialId) {
			$
					.ajax({
						type : "post",
						url : "Purchase/selectMaterialbyId.do",
						dataType : "json",
						data : {
							"materialId" : MaterialId
						},
						success : function(material) {

							var unp = parseFloat(material.materialUnitPrice)
									.toFixed(2);
							$('#ManufacturerName').val(material.keepField1);
							$('#materialNo').val(material.materialNo);
							$('#materialName').val(material.materialName);
							$('#materialUnitprice').val(unp);
						},
						error : function(msg) {
						}
					});

		}
		function addpurchasematerial() {
			$
					.ajax({
						type : "post",
						url : "Purchase/insertPurchase.do",
						dataType : "json",
						data : {
							"materialId" : $(".selectMaterial").val(),
							"purchaseQuantity" : $("#purchaseQuantity").val(),
							"purchaseAssign" : $('#purchaseAssign').val()
						},
						success : function(inf) {
							if (inf) {
								layer
										.open({
											content : '<i style="font-size:27px;">添加成功！</i>',
											style : 'background-color:green; color:#fff; border:none;' // 自定风格
											,
											time : 2
										});

							}
						},
						error : function(msg) {
						}
					});

		}
		function confirm() {
			var s = $(".selectMaterial option:selected").val();
			getMaterialbyId(s);
		}
	</script>

</body>
</html>