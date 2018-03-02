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
<title>修改用户信息</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="view/system/unassigneduser/model.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap/js/bootstrap.js"></script>
<style type="text/css">
body {
	position: relative;
	z-index: 0;
	margin-top: 0px;
}

.huangsmodel {
	width: 100%;
	height: 100%;
	background-color: rgba(200, 240, 255, 0.1);
	position: absolute;
	z-index: 2;
	margin-top: 0px;
	margin-bottom: 0px;
	display: none;
}

.huangsmodel  div {
	top: 45%;
	left: 38%;
	color: forestgreen;
	font-family: serif;
	font-weight: bolder;
	font-size: 36px;
	position: fixed;
	box-shadow: 0px 0px 8px 8px rgba(255, 128, 80, 0.6);
	padding-left: 20px;
	padding-right: 10px;
}

.huangsmodel div span {
	color: rgb(0, 144, 60);
}
</style>
</head>
<script type="text/javascript">
var Auth="业务组";
var Dep="业务组";
var Rol="业务";
	$(function() {
		$(".huangsmodel").click(function() {
			$(this).hide();
			history.go(-1);
		});
		$('.dropdown-menu').on("click", "[data-stopPropagation]", (function(e) {
			e.stopPropagation();
		}));	
		loadDAR();
	})
	function loadDAR() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/getDAR.do",
			dataType : "json",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(dar) {
				 Auth=dar.recordSchool;
				 Dep=dar.intime;
				 Rol=dar.nativePlace;
				    loaddepartment();
					loadAuthority();
					loadRoles();
			},
			error : function(inf) {
			}
		});

	}
 function closehodesu(){
	 $("#hodesu").hide();
 }
	function loaddepartment() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/toModifyPage3.do",
			dataType : "json",
			data : {},
			success : function(list) {
				var option;
				//var selected = list[3];
				for (var i = 0; i < list.length; i++) {
					var department = list[i];
					option += "<option  value='"+department.departmentId+"'>"
							+ department.departmentName + "</option>";
				}
				$("#selectDepartMent").html(option);
				$("#selectDepartMent option[value='" + Dep + "']").attr("selected", "selected");
				//$("#selectDepartMent option[value='"+ selected.departmentId + "']").attr("selected", "selected");
				//var o=$("#selectDepartMent option:selected").val();
				//$("#alert").text(o);
			},
			error : function(inf) {
				alert("default");
			}
		});
	}
	function loadAuthority() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/toModifyPage2.do",
			dataType : "json",
			data : {},
			success : function(list) {
				var option;
				for (var i = 0; i < list.length; i++) {
					var Authority = list[i];
					option += "<option value='"+Authority.groupId+"'>"
							+ Authority.groupName + "</option>";
				}
				$("#selectAuthority").html(option);
				$("#selectAuthority option[value='" + Auth + "']").attr("selected", "selected");
			},
			error : function(inf) {
				alert("default");
			}
		});
	}
	function loadRoles() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/toModifyPage1.do",
			dataType : "json",
			data : {},
			success : function(list) {
				var option;
				//var selected = list[2];
				for (var i = 0; i < list.length; i++) {
					var Role = list[i];
					option += "<option value='"+Role.roleId+"'>"
							+ Role.roleName + "</option>";
				}
				$("#selectRole").html(option);
				$("#selectRole option[value='" + Rol + "']").attr("selected", "selected");
				//$("#selectRole option[value='" + selected.roleId + "']").attr("selected", "selected");
				//var o=$("#selectRole option:selected").val();
				//$("#alert2").text(o);	
			},
			error : function(inf) {
				alert("default");
			}
		});
	}
	function updateUser() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/updateUnassignedUser.do",
			dataType : "text",
			data : {
				"userId" : $("#userId").val(),
				"userAuthorityGroupId" : $("#selectAuthority option:selected")
						.val(),
				"userDepartMentId" : $("#selectDepartMent option:selected")
						.val(),
				"userRoleId" : $("#selectRole option:selected").val()

			},
			success : function(list) {
				if (list == ("SUCCESS")) {
					$(".huangsmodel").show();
					//$(".huangsmodel").delay(4000).fadeOut();

					//window.navigate("view/system/unassigneduser/unassignedUser.jsp");
					//window.open ("", "newwindow", "height=100, width=400, toolbar =no, menubar=no,scrollbars=no, resizable=no, location=no, status=no")
					//window.open= "view/system/unassigneduser/unassignedUser.jsp";
				} else
					alert("ERROR!");

			},
			error : function(inf) {
				alert("default");
			}
		});
	}

	function updateUserInfomation() {

		$.ajax({
			type : "post",
			url : "UnassignedUserController/updateUser.do",
			dataType : "text",
			data : {
				"userId" : $("#userId").val(),
				"userName" : $("#userNameu").val(),
				"loginName" : $("#loginNameu ").val(),
				"password" : $("#passwordu").val(),
				"email" : $("#emailu").val(),
				"sex" : $("#sexu").val(),
				//"sex" : $("#sexu option:selected").val(),
				//"birthday" : $("#birthdayu  option:selected").val(),
				"birthday" : $("#birthdayu").val(),
				"intime" : $("#intimeu").val(),
				"nativePlace" : $("#nativePlaceu").val(),
				"recordSchool" : $("#recordSchoolu").val(),
				"createTime" : $("#createTimeu").val(),
			},
			success : function(list) {
				
				switch(list){
				case "SUCCESS":
					$("#hodesu").show();
					break;
				case "userName":
					$("#userNameu").val("");
					$("#userNameu").attr("placeholder","用户名要求2-20位，可输入字母、数字和汉字");
					break;
				case "loginName":
					$("#loginNameu").val("");
					$("#loginNameu").attr("placeholder","3-15位，可使用数字字母和下滑线，需要以字母开头");
					break;
				case "email":
					$("#emailu").val("");
					$("#emailu").attr("placeholder","6-18位、数字或者字母下划线开头");
					break;
				case "password":
					$("#passwordu").val("")
					$("#passwordu").attr("placeholder","6到20位，字母数字下划线的组合，可包含@、%、^、*、_、+、-、=、.等字符");
					break;
				default:
					alert("error!");
				
				}


			},
			error : function(inf) {
				alert("default");
			}
		});
	}
</script>
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
		<b style="margin-left: 80px;">修改<span style="color: purple;">
				${userdar.userName }</span> 的信息
		</b>
	</h3>
	<hr>
	<div class="huangsmodel">
		<div>
			<span class="glyphicon glyphicon-ok"> 修改成功！</span>
		</div>
	</div>
	<!-- 
	<div class="usermodel">
		<div>
			<div>
				
			</div>
		</div>
	</div>  -->
	<div
		style="margin: auto; border-collapse: 1px; padding-left: 150px; padding-right: 150px">

		<input type="hidden" class="form-control" name="userId" id="userId"
			value="${userdar.userId }" />
		<table border="1" class="table table-bordered ">
			<tr>
				<td>姓名:</td>
				<td>
					<div class="input-group">
						<input readonly="readonly" class="form-control" type="text"
							name="userName" id="userName" value="${userdar.userName }">
						<div class="input-group-btn">

							<button type="button"
								class="btn btn-default 
                        dropdown-toggle"
								data-toggle="dropdown" tabindex="-1">
								<span class="glyphicon glyphicon-user"></span> 个人详细 <span
									class="caret"></span> <span class="sr-only">切换详细信息</span>
							</button>
							<ul class="dropdown-menu pull-right">
								<li data-stopPropagation="true">
									<div style="width: 600px;">
										<form>
											<table class="table table-bordered">
												<tr>
													<th colspan="2"><span
														style="color: rgb(28, 192, 227); font-size: 24px; margin-left: 5px;">个人详细信息</span>
														<button style="margin-left: 280px" type="button"
															onclick="updateUserInfomation()" class=" btn btn-info">提交</button>
														<button style="margin-left: 30px" type="reset"
															class=" btn btn-default">重置</button></th>
												</tr>
												<tr>
													<td><div class="input-group">
															<span class="input-group-addon">用户名</span> <input
																class="form-control" type="text" title="用户名要求2-20位，可输入字母、数字和汉字" id="userNameu"
															 placeholder=""	value="${userdar.userName }">
														</div></td>
													<td><div class="input-group">
															<span class="input-group-addon">账号</span> <input
																class="form-control" type="text" id="loginNameu"
															 placeholder="" title="3-15位，可使用数字字母和下滑线，需要以字母开头"	value="${userdar.loginName }">
														</div></td>

												</tr>
												<tr>
													<td><div class="input-group">
															<span class="input-group-addon">籍贯</span> <input
																class="form-control" type="text" id="nativePlaceu"
															 placeholder=""	value="${userdar.nativePlace }">
														</div></td>
													<td><div class="input-group">
															<span class="input-group-addon">生日</span> <input
																class="form-control" type="text" id="birthdayu"
																value="${userdar.birthday }">
														</div></td>
												</tr>
												<tr>
													<td>
														<div class="input-group">
															<span class="input-group-addon">邮件</span> <input
																class="form-control" type="text" id="emailu"
															placeholder="" title="6-18位、数字或者字母下划线开头" value="${userdar.email }">
														</div>
													</td>
													<td>
														<div class="input-group">
															<span class="input-group-addon input-group-success">密码</span>
															<input class="form-control" type="text" id="passwordu"
															 placeholder="" title="6到20位，字母数字下划线的组合，可包含@、%、^、*、_、+、-、=、.等字符"	value="${userdar.password }">
														</div>
													</td>
												</tr>
												<tr>
													<td><div class="input-group">
															<span class="input-group-addon">毕业院校</span> <input
																class="form-control" type="text" id="recordSchoolu"
																value="${userdar.recordSchool }">
														</div></td>
													<td><div class="input-group">
															<span class="input-group-addon">入职时间</span> <input
																class="form-control" type="text" id="intimeu"
																value="${userdar.intime }">
														</div></td>
												</tr>
												<tr>
													<td><div class="input-group">
															<span class="input-group-addon">性别</span> <input
																class="form-control" type="text" name="sex" id="sexu"
																value="${userdar.sex }">

														</div></td>
													<td>

														<div class="input-group">
															<span class="input-group-addon">创建时间</span> <input
																class="form-control" type="text" id="createTimeu"
																value="${userdar.createTime }">
														</div>
													</td>
												</tr>
												
											</table>
										</form>
										<div id="hodesu" style="display: none">
													
														<div class="warning">
															<div class="input-group">
																<span class="glyphicon glyphicon-ok"
																	style="text-align: center; font-size: 33px; margin-left: 20px; color: green;">
																	修改成功！</span>  <button class="btn btn-xs btn-success" onclick="closehodesu()">确认</button>
															</div>
														</div>
													
												</div>
									</div>
								</li>
							</ul>
							
						</div>
						<!-- /btn-group -->
					</div>
				</td>
			</tr>
			<tr>
				<td>账号:</td>
				<td><input readonly="readonly" class="form-control" type="text"
					name="userLoginName" id="userLoginName"
					value="${userdar.loginName }"></td>
			</tr>
			<tr>
				<td>权限组:</td>
				<td align="center"><select
					class="form-control selectpicker show-tick"
					name="userAuthorityGroupId" id="selectAuthority">
				</select></td>
			</tr>

			<tr>
				<td>部门:</td>
				<td align="center">
					<form role="form">
						<select class="form-control selectpicker show-tick "
							name="userDepartMentId" id="selectDepartMent">
						</select>
					</form>
				</td>
			</tr>
			<tr>
				<td>角色:</td>
				<td align="center"><select
					class="form-control  selectpicker show-tick" name="userRoleId"
					id="selectRole">
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input class="btn btn-block btn-info"
					type="button" onclick="updateUser()" value="提交"></td>
			</tr>
		</table>
	</div>
</body >

</html>