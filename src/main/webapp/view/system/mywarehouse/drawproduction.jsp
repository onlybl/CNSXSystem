<%@ page language="java" contentType="text/html; charset=utf-8"
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
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="view/system/mywarehouse/model.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="js/kkpager/jpager.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/kkpager/jpager.js"></script>

<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>出库管理</title>
</head>

<body>

	<div id="modal-overlay">
		<div class="modal-data">

			<h3 style="color: darkgreen">
				<span class="glyphicon glyphicon-check"> 任务接收成功！</span>
			</h3>
			<p>
			<p>
				<button class="btn btn-success" onclick="overlay()">确认</button>
			</p>
		</div>
	</div>
	<div id="modal-overlay1">
		<div class="modal-data">

			<h3 style="color: darkgreen">
				<span class="glyphicon glyphicon-check"> 已完成该任务！</span>
			</h3>
			<p>
			<p>
				<button class="btn btn-success" onclick="overlay1()">确认</button>
			</p>
		</div>
	</div>
	<div class="margin clearfix">
		<div  style="background-color: rgb(28, 192, 227);height:50px;text-align: center;">
		   <b class="l_f  icon-inbox "
				style="font-size: 27px; color: white;line-height: 50px;margin-left:10px; ">
				产品出库管理 </b>
		</div>
		<div class="stystems_style">
			<div class="tabbable">
				<ul class="nav nav-tabs" id="myTab">
					<li class="active"><a style="color: teal;" data-toggle="tab"
						href="#home" onclick="tobehandle(1)"><i
							class="green fa fa-home bigger-110"></i>&nbsp;待出库产品 <span
							class="badge badge-danger" id="headh1">0</span></a></li>
					<li class=""><a style="color: teal;" data-toggle="tab"
						href="#profile" onclick="currenttask()">当前任务 <span
							class="badge badge-warning" id="headh2">0</span></a></li>
					<li class=""><a style="color: teal;" data-toggle="tab"
						data-toggle="dropdown" class="dropdown-toggle" href="#dropdown"
						onclick="finishedtoday()">今日已完成任务 <span
							class="badge badge-success" id="headh3">0</span>
					</a></li>
					<li class=""><a style="color: teal;" data-toggle="tab"
						data-toggle="dropdown" class="dropdown-toggle" href="#other"
						onclick="finishedhistory()">出库历史查询 <span
							class="badge badge-info" id="headh4">0</span>
					</a></li>
				</ul>
				<div class="tab-content">

					<!-- 1 -->
					<div id="home" class="tab-pane active">
						<div>
							<div class="border clearfix">
								<span class="l_f">

									<button class="btn disabled btn-success" id="batch_receive"
										onclick="checkboxes()">
										<i class="icon-plus"></i>接收任务
									</button>
								</span> <span class="r_f">已选中 : <b id="checkboxchecked"> 0 </b>
									条
								</span>
							</div>
							<table class='table table-bordered table-hover'
								id='sample-table'>
								<thead>
									<tr>
										<th width='25'><label><input type='checkbox'
												class='ace'><span class='lbl'></span></label></th>
										<th>订单编号</th>
										<th>产品编号</th>
										<th>订单数量</th>
										<th>客户名称</th>
										<th>送货地址</th>
										<th>客户电话</th>
										<th>库存数量</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
										<th colspan='2'>操作</th>
									</tr>
								</thead>
								<tbody id="tbody">
								</tbody>
							</table>
						</div>
						<div id="jpager" style="margin-left: 50px"></div>
					</div>

					<!-- 2 -->
					<div id="profile" class="tab-pane">
						<div style="height: 400px; overflow-x: hiden; overflow-y: auto;">
							<table class="table  table-bordered table-hover"
								id="my-table">
								<thead>
									<tr>
										<th>完成任务</th>
										<th>订单编号</th>
										<th>产品编号</th>
										<th>订单数量</th>
										<th>客户名称</th>
										<th>送货地址</th>
										<th>客户电话</th>
										<th>库存数量</th>
										<th>仓库编号</th>
										<th>仓库地址</th>

									</tr>
								</thead>

								<tbody id="tbody1" class="pre-scrollable">

								</tbody>

							</table>
						</div>
						<div id="jpager" style="margin-left: 50px"></div>
					</div>
					<!-- 3 -->
					<div id="dropdown" class="tab-pane">
						<div style="height: 400px; overflow-x: hiden; overflow-y: auto;">
							<table class="table  table-bordered table-hover">
								<thead>
									<tr>
										<th>订单编号</th>
										<th>产品编号</th>
										<th>订单数量</th>
										<th>客户名称</th>
										<th>送货地址</th>
										<th>客户电话</th>
										<th>库存数量</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
									</tr>
								</thead>
								<tbody id="tbody2" class="pre-scrollable">

								</tbody>
							</table>
						</div>
					</div>
					<!-- 4 -->
					<div id="other" class="tab-pane">
						<!--  -->
						<ul class="search_content list-inline">
							<li><input type="text" placeholder="请输入产品名称..."
								id="sproductionName" value='' /></li>
							<li><input class="laydate-icon" value=''
								placeholder="=====请选择时间====" id="start"
								style="margin-left: 10px;"></li>
							<li><button onclick="searchproductionout()">
									<b class="icon-search"></b>
								</button></li>
						</ul>
						<!--  -->
						<div style="height: 300px; overflow-x: hiden; overflow-y: auto;">

							<table class="table  table-bordered table-hover">
								<thead>
									<tr>
										<th>订单编号</th>
										<th>产品编号</th>
										<th>订单数量</th>
										<th>客户名称</th>
										<th>送货地址</th>
										<th>客户电话</th>
										<th>库存数量</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
									</tr>
								</thead>
								<tbody id="tbody3" class="pre-scrollable">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!--添加图层-->
	<div id="modal-editbaseinf">
		<div id="editbaseinf">
			<div class="modal-header">
				<button class="close" onclick="overlay2()">&times;</button>
				<h3 class="text-warning">
					<span>订单编号：</span><span style="color: purple;" id="orderNo">orderNo</span>
					<span style="margin-left: 20px">产品名称：</span><span
						style="color: purple;" id="productionName">ProductionName</span>
				</h3>
				<h3 class="text-warning">
					<span>客户名称：</span><span style="color: purple;" id="Cname">Cname</span>
					<span style="margin-left: 20px">客户电话：</span><span
						style="color: purple;" id="Cphone">Cphone</span>
				</h3>
				<h3 class="text-info">
					<span>送货地址：</span>
				</h3>
				<input type="hidden" id="ncustomerId" value=''> <input
					type='text' class='form-control' id="DeliveryAddressModify"
					value='DeliveryAddress' placeholder="送货地址不能为空......"
					style="color: black" />

				<h3>
					<button type="button" onclick="updateaddress()"
						style="margin-left: 40px" class="btn btn-warning"
						data-dismiss="modal">修改</button>
				</h3>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript"
	src="view/system/mywarehouse/drawproduction.js"></script>
</html>

