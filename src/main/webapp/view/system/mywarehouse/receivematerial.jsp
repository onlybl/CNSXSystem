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
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="view/system/mywarehouse/model.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css" href="js/kkpager/jpager.css">
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>物料出库管理</title>
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
				物料出库管理 </b>
		</div>
		<div class="stystems_style">
			<div class="tabbable">
				<ul class="nav nav-tabs"  id="myTab">
					<li class="active"><a  data-toggle="tab" href="#home"
						onclick="tobehandle(1)"><i class="gray fa fa-home bigger-110"></i>&nbsp;待出库物料
							<span class="badge badge-danger" id="headh1">0</span></a></li>
					<li class=""><a  data-toggle="tab" href="#profile"
						onclick="currenttask()">当前出库任务 <span class="badge badge-warning"
							id="headh2">0</span></a></li>
					<li class=""><a  data-toggle="tab" data-toggle="dropdown"
						class="dropdown-toggle" href="#dropdown" onclick="finishedtoday()">今日已完成任务
							<span class="badge badge-success" id="headh3">0</span>
					</a></li>
					<li class=""><a  data-toggle="tab" data-toggle="dropdown"
						class="dropdown-toggle" href="#other" onclick="finishedhistory()">出库历史查询
							<span class="badge badge-info" id="headh4">0</span>
					</a></li>
				</ul>
				<div class="tab-content">

					<!-- 1 -->
					<div id="home" class="tab-pane active">
						<div>
							<div class="border clearfix">
								<span class="l_f">
							 
									<button class="btn disabled btn-success" id="batch_receive" onclick="checkboxes()"
										>
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
										<th>领料编号</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>领取数量</th>
										<th>领料人</th>
										<th>当前库存</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
										<th>接收任务</th>
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
						<div style="height:300px;overflow-x:hiden;overflow-y:auto; ">						
							<table class="table  table-bordered table-hover"
								id="my-table">
								<thead>
									<tr>
										<th>交付物料</th>
										<th>领料编号</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>领取数量</th>
										<th>领料人</th>
										<th>当前库存</th>
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
					<div style="height:300px;overflow-x:hiden;overflow-y:auto; ">
						<table class="table  table-bordered table-hover">
							<thead>
								<tr>
										<th>领料编号</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>领取数量</th>
										<th>领料人</th>
										<th>当前库存</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
										<th>领料日期</th>
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
							<li><input type="text" placeholder="请输入物料名称..."
								id="sproductionName" /></li>
							<li><input class="laydate-icon" placeholder="=====请选择时间===="
								id="start" style="margin-left: 10px;"></li>
							<li><button onclick="selectpickinglistbyMnameTime()">
									<b class="icon-search"></b>
								</button></li>
						</ul>
						<!--  -->
					<div style="height:500px;overflow-x:hiden;overflow-y:auto; ">
						<table id="huangs-table" class="table  table-bordered table-hover">
							<thead>
								<tr>
									    <th>领料编号</th>
										<th>物料编号</th>
										<th>物料名称</th>
										<th>领取数量</th>
										<th>领料人</th>
										<th>当前库存</th>
										<th>仓库编号</th>
										<th>仓库地址</th>
										<th>领料日期</th>
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
			
				
				<h3>
					<button type="button" onclick="updatesomxxx()"
						style="margin-left: 40px" class="btn btn-info" data-dismiss="modal">修改</button>
				</h3>
			</div>
		</div>
</body>
<script type="text/javascript"
	src="view/system/mywarehouse/receivematerial.js"></script>
</html>