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
	<h3>
		<button style="margin-left: 130px;" class="btn btn-xs btn-link">
			<span style="font-size: 24px;" class="glyphicon glyphicon-plus info"></span>
		</button>
		<b style="margin-left: 10px;" >添加新人员</b>
	</h3>
	<hr />
	<div
		style="margin: auto; border-collapse: 1px; padding-left: 150px; padding-right: 150px">
		<table border="1" class="table table-bordered ">
			<tr>
				<td colspan="2" style="background-color: #3399cc;">
					<div>
						<span class="glyphicon glyphicon-user"
							style="text-align: center; font-size: 24px; margin-left: 20px; color: white;">
							<b> CreateAccount</b>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">用户名</span>
						<input class="form-control" data-toggle="tooltip"  placeholder="" title="2~20个字符，可使用中文、字母、下划线" type="text" id="userName" value="">
					</div></td>
				<td>
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">籍贯</span>
						<input class="form-control" type="text" id="nativePlace" value="">
					</div>

				</td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">账号</span>
						<input class="form-control" data-toggle="tooltip" placeholder="" data-placement="left"  title="3~15个字符，可使用数字、字母、下划线，需要字母开头" type="text" id="loginName" value="">
					</div></td>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">毕业院校</span>
						<input class="form-control" type="text" id="recordSchool"  value="">
					</div></td>
			</tr>
			<tr>
				<td>
					<div class="input-group">
						<span class="input-group-addon"   style="background-color: #F0FFF0">邮件</span>
						<input class="form-control" data-toggle="tooltip" placeholder="" title="6~18个字符，可使用字母、数字、下划线，需以字母开头" type="text" id="email" value="">
					</div>

				</td>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">生日</span>
						<input class="form-control" type="date" min="1980-01-01"
							max="2020-12-31" id="birthday" value="">
					</div></td>
			</tr>
			<tr>
				<td>
					<div class="input-group" id="sex">
						<span class="input-group-addon" style="background-color: #FFF0F5;">性别</span><span
							style="background-color: white;" class="input-group-addon "><input
							type="radio" name="sex" checked="checked" value="保密">保密 </span><span
							class="input-group-addon" style="background-color: white"><input
							type="radio" name="sex" value="男">男 <input
							style="margin-left: 10px;" type="radio" name="sex" value="女">女
						</span>
					</div>
				</td>
				<td>
					<div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC;">角色</span>
						<select class="form-control  selectpicker show-tick"
							name="userRoleId" id="selectRole">
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td><div class="input-group">
						<span class="input-group-addon"  style="background-color: #F0FFF0">密码</span>
						<input class="form-control" data-toggle="tooltip" data-placement="left" title="6~20个字符，不包括空格" id="password" placeholder=""  value="">
					</div></td>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC">权限组</span>
						<select class="form-control selectpicker show-tick"
							name="userAuthorityGroupId" id="selectAuthority">
						</select>
					</div></td>
			</tr>

			<tr>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #F0FFF0">确认密码</span>
						<input class="form-control" type="password" id="passwordre"  value="">
					</div></td>
				<td><div class="input-group">
						<span class="input-group-addon" style="background-color: #FFF8DC">部门</span>
						<select class="form-control selectpicker show-tick "
							name="userDepartMentId" id="selectDepartMent">
						</select>
					</div></td>
			</tr>

			<tr>
				<td colspan="2"><input style="color: white; font-size: 20px;"
					class="btn btn-block btn-info" type="button"
					onclick="createAccount()" value="立    即    创     建"></td>
			</tr>
		</table>
	</div>
	<br />
</body>

</html>