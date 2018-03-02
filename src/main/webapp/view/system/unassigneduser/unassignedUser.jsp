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
<title>Manage Staff</title>
<%-- 分页相关 --%>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/kkpager/jpager.css">
<style type="text/css">
#navone {
	display: block;
}

#navtwo {
	display: none;
}
</style>
<script type="text/javascript">

</script>

</head>
<body>
 <div style="height: 386px;margin: auto">
 <div style="height:8px; width: 100%"></div>
	<div style="margin: auto;padding-left: 20px;padding-right: 20px">
	
		<ul id="navone" class="nav nav-tabs" style="font-size: 18px;font-weight: bold;">
			<li><a href="#view" data-toggle="tab" id="one" title="注册过的所有人员">管理所有人员</a>
			</li>
			<li><a href="#view" data-toggle="tab" id="two" title="未分配角色">管理无角色人员</a>
			</li>
			<li><a href="#view" data-toggle="tab" id="three" title="未分配部门">管理无部门人员</a>
			</li>
			<li><a href="#view" data-toggle="tab" id="four" title="未分配权限组">管理无权限人员</a></li>
			<li><button style="outline: none;" class="btn btn-link" onclick="changenav()" ><span class="glyphicon glyphicon-eye-close" style="color: rgb(0, 83, 145);font-size:24px;margin-left:14px"></span></button></li>
		</ul>
		
		<ul id="navtwo" class="nav nav-tabs" style="font-size: 18px;font-weight: bold;">
			<li><a href="#view" data-toggle="tab" id="five" title="部门信息正常">管理有部门人员</a></li>
			<li><a href="#view" data-toggle="tab" id="six" title="权限信息正常">管理有权限人员</a></li>
			<li><a href="#view" data-toggle="tab" id="seven" title="角色信息正常">管理有角色人员</a></li>
			<li><a href="#view" data-toggle="tab" id="eight"
				title="注册过的所有人员">管理所有人员</a></li>
		<li><button style="outline: none;" class="btn btn-link" onclick="changenan()" ><span class="glyphicon glyphicon-eye-close" style="color: rgb(0, 83, 145);font-size:24px;margin-left:14px"></span></button></li>
		</ul>
		
		<div style="height:12px; width: 100%"></div>
		
		  <div class="tab-content">
			<div class="tab-pane fade in active" id="view" style="height:350px ">
				
					<table class="table table-bordered table-hover">
						<tr style="text-align: center;color: white; font-size: 18px; background-color:#3399cc; font: bold;">
							<td style="border: 0px">用户名</td>
							<td style="border: 0px">账号</td>
							<td style="border: 0px">性别</td>
							<td style="border: 0px">邮箱</td>
							<td style="border: 0px">部门</td>
							<td style="border: 0px">角色</td>
							<td style="border: 0px">权限</td>
							<td colspan="2" style="border: 0px">操作</td>
						</tr>
						<tbody id="tbody">
						</tbody>
					</table>
				</div>
				<div id="jpager" style="margin-left:50px"></div>
			</div>
		 
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<%=basePath%>view/system/unassigneduser/listPage.js"></script>
</html>