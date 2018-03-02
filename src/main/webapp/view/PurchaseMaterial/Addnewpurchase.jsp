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
	<div style="margin: 12px;">
		<div style="background-color: rgb(28, 192, 227); height: 50px;">
			<span
				style="font-size: 24px; color: white; line-height: 50px; margin-left: 10px; font-weight: 200">
				物 料 采 购 管 理 </span>
		</div>
		<hr />
		<div>
			<ul class="list-inline">
				<li style="margin-left: 40px"><a class="btn btn-success"
					onclick="addnewpurchase()"> <span class="icon-add">新采购单</span>
				</a></li>
				<li><a class="btn btn-default" onclick="findpurchasebystatus()">
						<span class="icon-add">当前采购任务</span>
				</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li
					style="margin-right: 50px; position: relative; float: right; margin-bottom: 20px">每页显示条数
					：<select id="selectPageSize">
						<option value="6" selected="selected">=06=</option>
						<option value="2">=02=</option>
						<option value="8">=08=</option>
						<option value="10">=10=</option>
						<option value="12">=12=</option>
						<option value="15">=15=</option>
				</select>
					<button class="btn btn-info btn-xs" onclick="setPagelist()">确认</button>
				</li>
			</ul>
		</div>
		<table class="table  table-bordered table-hover">
			<thead>
				<tr class="info">
					<th>采购编号</th>
					<th>物料编号</th>
					<th>物料名称</th>
					<th>物料单价</th>
					<th>采购数量</th>
					<th>采购人员</th>
					<th>交易金额</th>
					<th>创建日期</th>
					<th>采购状态</th>
					<th style="width: 80px">操作</th>
				</tr>
			</thead>
			<tbody id="tbody" class="pre-scrollable">

			</tbody>
		</table>
		<div class="TruePageDivide " style="margin: 40px;">
			<ul class="pagination " id="pageNavis">
				<li><a
					style="background-color: rgba(255, 255, 255, 0); border: 0px;">共&nbsp;<b
						id="totalPage">0</b>&nbsp;页&nbsp;/&nbsp;<b id="dataCount">0</b>&nbsp;条数据
				</a></li>
				<li><a
					style="background-color: rgba(255, 255, 255, 0); border: 0px;">&nbsp;</a></li>
				<li id="firstPage"><a href="javascript:firstPage()">首页</a></li>
				<li id="previousPage"><a href="javascript:previousPage()"><span
						class="icon-chevron-left"></span></a></li>
				<li><a id="currentPage">error</a></li>
				<li id="nextPage"><a href="javascript:nextPage()"><span
						class="icon-chevron-right"></span></a></li>
				<li id="lastPage"><a href="javascript:lastPage()">尾页</a></li>


			</ul>
		</div>
		<!-- 模态框（Modal）(1) -->
		<div class="modal fade" id="example" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span style="color: red" class="icon-remove"></span>
						</button>
						<div class="mainInf" style="font-size: 24px;">
							<span style="color: orange;">采购单编号 ：</span><span id="purchaseNo">
								noNo</span>
						</div>
					</div>
					<div class="modal-body">
						<table border="1" class="table table-bordered ">
							<tr>
								<td><div class="input-group">
										<span class="input-group-addon"
											style="background-color: #F0FFF0">物料名称</span> <input
											class="form-control" data-toggle="tooltip"
											disabled="disabled" placeholder="" type="text"
											id="materialName" value="">
									</div></td>
								<td><div class="input-group">
										<span class="input-group-addon"
											style="background-color: #FFF8DC">选择物料</span> <select
											class="form-control selectMaterial" name="selectMaterial"
											id="selectMaterial">
										</select>
									</div></td>
							</tr>

							<tr>
								<td><div class="input-group">
										<span class="input-group-addon"
											style="background-color: #F0FFF0">物料编号</span><input
											class="form-control" data-toggle="tooltip"
											disabled="disabled" type="text" id="materialNo" value="">
									</div></td>
								<td>
									<div class="input-group">
										<span class="input-group-addon"
											style="background-color: #FFF8DC;">采购状态</span> <select
											class="form-control  selectpicker show-tick"
											disabled='disabled' id="purchaseStatus">
											<option value="0">待入库</option>
											<option value="-1">采购中</option>
											<option value="1">已入库</option>
											<option value="2">入库中</option>

										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td><div class="input-group">
										<span class="input-group-addon"
											style="background-color: #F0FFF0">物料单价</span> <input
											class="form-control" type="text" disabled="disabled"
											id="materialUnitprice" value="" />
									</div></td>
								<td><div class="input-group">
										<span class="input-group-addon"
											style="background-color: #FFF8DC">采购数量</span><input
											class="form-control" data-toggle="tooltip" placeholder=""
											type="text" id="purchaseQuantity" value="">
									</div></td>
							</tr>
							<!--  -->
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon"
											style="background-color: #F0FFF0">供应商</span> <input
											class="form-control" type="text" id="ManufacturerName"
											value="" disabled="disabled">
									</div>
								</td>
								<td>
									<div class="input-group">
										<span class="input-group-addon"
											style="background-color: #FFF8DC">采购审核</span> <input
											class="form-control" type="text" id="purchaseAssign" value="">
									</div>

								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success"
							onclick="modifypurchase()" data-dismiss="modal">
							<i class='icon-edit'> 确认修改 </i>
						</button>
						<button class='btn btn-danger' data-dismiss="modal"
							onclick='deletepurchase() '>
							<i class='icon-trash'> 删除</i>
						</button>
						<button style="margin-left: 320px" type="button"
							class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>



		<!-- 模态框（Modal）(2) -->
		<div class="modal fade" id="newpurchase" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span style="color: red" class="icon-remove"></span>
						</button>
						<div class="mainInf" style="font-size: 24px;"></div>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button style="margin-left: 400px" type="button" class="btn"
							data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="view/PurchaseMaterial/puachasemanage1.js">
	
</script>
</html>