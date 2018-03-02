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
<title>Insert title here</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style type="text/css">
		#fpage{
			display:inline;
		}
		#updateModel {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.5);
				display: none;
			}
			
		#updateModelContent {
				width: 35%;
				height: 55%;
				margin: auto;
				background-color: white;
				position: relative;
				top: 100px;
				padding-top: 10px; 
				padding-left:40px ; 
				padding-right: 80px;
			}
	</style>
	
	<script type="text/javascript">
		function show(){
			$("#updateModel").css("display","block");
		}
		function hide(){
			$("#updateModel").css("display","none");
		}
	</script>

<body>
		<div class="tabbable" id="tabs-573748">
			<div class="col-md-12 column" style="background: cornflowerblue;">
			  <h1 align="center" class="text-left muted" style=" color: whitesmoke">
				仓库信息
			  </h1>
		    </div>
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-833955" data-toggle="tab">产品仓库</a>
					</li>
					<li style="margin-left: -3px;">
						 <a href="#panel-25620" data-toggle="tab">原料仓库</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-833955">
						<br><br>
						<div class="col-md-12 column">
			<table class="table table-bordered table-condensed">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							管理员
						</th>
						<th>
							地址
						</th>
						<th>
							电话
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a href="javascript:show()" type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					
				</tbody>
			</table>
			<div style=" width: 1100px; float: left;">
			    <ul class="pagination" id="fpage">
				            <li>
					            <a href="#" class="btn disabled">首页</a>
				            </li>
				            <li>
					            <a href="#"class='btn disabled'>上一页</a>
				            </li>
				            <li>
					            <a href="#" class='btn disabled'>1</a>
				            </li>
				            
				            <li>
					            <a href="#">下一页</a>
				            </li>
				            <li>
					            <a href="#">尾页</a>
				            </li>
			    </ul>
			</div>
			<div id="">
				<a type='button' class='btn btn-success'>添加产品仓库</a>
			</div>
		    </div>
		    
					</div>
					<div class="tab-pane" id="panel-25620">
						<br><br>
						<div class="col-md-12 column">
			<table class="table table-bordered table-condensed">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							管理员
						</th>
						<th>
							地址
						</th>
						<th>
							电话
						</th>
						
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a href="javascript:show()" type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					<tr>
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
						
						<td>
							<a type="button" class="btn btn-success btn-sm">增加</a>
							<a type="button" class="btn btn-warning btn-sm">修改</a>
							<a type="button" class="btn btn-danger btn-sm">删除</a>
						</td>
					</tr>
					
				</tbody>
			</table>
			<div style=" width: 1100px; float: left;">
			    <ul class="pagination" id="fpage">
				            <li>
					            <a href="#" class="btn disabled">首页</a>
				            </li>
				            <li>
					            <a href="#"class='btn disabled'>上一页</a>
				            </li>
				            <li>
					            <a href="#" class='btn disabled'>1</a>
				            </li>
				            <li>
					            <a href="#">下一页</a>
				            </li>
				            <li>
					            <a href="#">尾页</a>
				            </li>
			    </ul>
			</div>
			<div id="">
				<a type='button' class='btn btn-success'>添加原料仓库</a>
			</div>
		    </div>
					</div>
				</div>
			</div>
	</body>
</html>