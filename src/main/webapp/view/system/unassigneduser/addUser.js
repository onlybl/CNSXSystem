    $(function () { $("[data-toggle='tooltip']").tooltip(); });
	function overlay() {
		var e1 = document.getElementById('modal-overlay');
		//e1.style.visibility="visible";
		e1.style.visibility = (e1.style.visibility == "visible") ? "hidden"
				: "visible";
	}
	function alerta() {
		history.go(-1);
	}
	$(function() {
		loaddepartment();
		loadAuthority();
		loadRoles();
	})
	function loaddepartment() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/toModifyPage3.do",
			dataType : "json",
			data : {},
			success : function(list) {
				var option;
				var selected = list[3];
				for (var i = 0; i < list.length; i++) {
					var department = list[i];
					option += "<option  value='"+department.departmentId+"'>"
							+ department.departmentName + "</option>";
				}
				$("#selectDepartMent").html(option);
				$(
						"#selectDepartMent option[value='"
								+ selected.departmentId + "']").attr(
						"selected", "selected");
			},
			error : function(i) {
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
				var selected = list[6];
				for (var i = 0; i < list.length; i++) {
					var Authority = list[i];
					option += "<option value='"+Authority.groupId+"'>"
							+ Authority.groupName + "</option>";
				}
				$("#selectAuthority").html(option);
				$("#selectAuthority option[value='" + selected.groupId + "']")
						.attr("selected", "selected");
			},
			error : function(i) {
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
				var selected = list[2];
				for (var i = 0; i < list.length; i++) {
					var Role = list[i];
					option += "<option value='"+Role.roleId+"'>"
							+ Role.roleName + "</option>";
				}
				$("#selectRole").html(option);
				$("#selectRole option[value='" + selected.roleId + "']").attr(
						"selected", "selected");
			},
			error : function(i) {
			}
		});
	}
	function createAccount() {
		$.ajax({
			type : "post",
			url : "UnassignedUserController/createUser.do",
			dataType : "text",
			data : {
				"userName" : $("#userName").val(),
				"userAuthorityGroupId" : $("#selectAuthority option:selected")
						.val(),
				"userDepartMentId" : $("#selectDepartMent option:selected")
						.val(),
				"userRoleId" : $("#selectRole option:selected").val(),
				"userName" : $("#userName").val(),
				"loginName" : $("#loginName").val(),
				"password" : $("#passwordre").val(),
				"email" : $("#email").val(),
				"sex" : $("input[type='radio']:checked").val(),
				"birthday" : $("#birthday").val(),
				//"intime" : $("#intime").val(),
				"nativePlace" : $("#nativePlace").val(),
				"recordSchool" : $("#recordSchool").val(),
			//"creattime"
			//"userId"
			},
			success : function(list) {
				switch(list){
				case "SUCCESS":
					overlay();
					break;
				case "userName":
					$("#userName").val("");
					$("#userName").attr("placeholder","用户名要求2-20位，可输入字母、数字和汉字");
					break;
				case "loginName":
					$("#loginName").val("");
					$("#loginName").attr("placeholder","3-15位，可使用数字字母和下滑线，需要以字母开头");
					break;
				case "email":
					$("#email").val("");
					$("#email").attr("placeholder","数字或者字母下划线开头");
					break;
				case "password":
					$("#password").val("")
					$("#passwordre").val("")
					$("#password").attr("placeholder","6到20位，字母数字下划线的组合，可包含@、%、^、*、_、+、-、=、.等字符");
					break;
				default:
					alert("error!");
				
				}
					 
					//alert(list);
					//history.go(-1);
					//window.navigate("view/system/unassigneduser/unassignedUser.jsp");
					//window.open ("", "newwindow", "height=100, width=400, toolbar =no, menubar=no,scrollbars=no, resizable=no, location=no, status=no")
					//window.open= "view/system/unassigneduser/unassignedUser.jsp";
				
			},
			error : function(inf) {
			}
		});
	}
