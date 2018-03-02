var pageNumb;
  $(function () {
    getUsers("");
    $("#one").click(function() {
		getUsers(this.text);
	});
	$("#two").click(function() {
		getUsers(this.text);
	});
	$("#three").click(function() {
		getUsers(this.text);
	});
	$("#four").click(function() {
		getUsers(this.text);
	});
	$("#five").click(function() {
		getUsers(this.text)
	});
	$("#six").click(function() {
		getUsers(this.text)
	});
	$("#seven").click(function() {
		getUsers(this.text)
	});
	$("#eight").click(function() {
		getUsers(this.text)
	});
  });
  
  function getUsers(type){
	  pageNumb=1;
	    var geturl;
		switch(type)
		{
		case "管理有部门人员": geturl="UnassignedUserController/manageAssigned.do";
		break;
		case "管理无角色人员": geturl="UnassignedUserController/manageRoleUnassigned.do";
			break;
		case "管理无部门人员": geturl="UnassignedUserController/listPageUnassignedUser.do";
			break;
		case "管理所有人员":geturl="UnassignedUserController/manageAllRegisted.do";
			break;
		case "管理无权限人员":geturl="UnassignedUserController/manageAuthrityUnassigned.do";
			break;
		case "管理有权限人员":geturl="UnassignedUserController/manageAuthrityAssigned.do";
		break;
		case "管理有角色人员":geturl="UnassignedUserController/manageRolessigned.do";
		break;
		default:geturl="UnassignedUserController/manageAllRegisted.do";		
		}		
		GetExcelTable2(1,geturl)
}

  function deleteuserbyId(userId,geturl){
	  $.ajax({
			type : "post",
			url : "UnassignedUserController/deleteUser.do",
			dataType : "text",
			data : {
				"userId" : userId
			},
			success : function(info) {
				if(info=="SUCCESS"){
					GetExcelTable2(pageNumb,geturl);
					//pageNumb=1;
				}
			},
			error : function(inf) {
			}
		});
	  
  }
  
  // ajax翻页
  function searchPage(n,geturl) {
	  
    GetExcelTable2(n,geturl);
  }
  function GetExcelTable2(pageindex,geturl) {
	    $.ajax({
	      url: geturl,
	      dataType: "json",
	      type: "POST",
	      data: { "pageNumber": pageindex },
	      success: function (data) {
	    	 
	        if (data.dataList.length<1) {
	        $("#tbody").empty();
	         $("#tbody").html("<div style='text-align:center; color:red'><h2>暂无数据</h2></div>");
	        return;
	       }else{
	    	  var diplayuser;
	        for (var i = 0; i < data.dataList.length; i++) {
				var s = data.dataList[i];			
				diplayuser += "<tr>";
				diplayuser += "<td>" + s.userName + "</td>";
				diplayuser += "<td>" + s.loginName + "</td>";
				diplayuser += "<td>" + s.sex + "</td>";
				diplayuser += "<td>" + s.email + "</td>";
				diplayuser += "<td>" + s.intime + "</td>";
				diplayuser += "<td>" + s.nativePlace + "</td>";
				diplayuser += "<td>" + s.recordSchool + "</td>";
				
				diplayuser += "<td style='text-align:center'><form action='UnassignedUserController/toModifyPage.do' method='post'>";
				diplayuser += "<input type='hidden' name='userId' value='"+s.userId+"'>";
				diplayuser +="<button type='submit' class='btn btn-default'><span class='glyphicon glyphicon-edit' style='color: rgb(0, 0, 145);'> 修改</span></button></form>";
				diplayuser +="</td><td style='text-align:center'><button class='btn  btn-default' onclick='deleteuserbyId(\""+s.userId+"\",\""+geturl+"\")'><span class='glyphicon glyphicon-trash' style='color: rgb(255, 108, 21);'> 删除</span></button></td></tr>";
			}
			$("#tbody").html(diplayuser);
	       }
	        var pageSize = parseInt(data.pageSize);
	        var totalCount =parseInt(data.total);
	       
	        var pageNo = pageNumb;
	       
	        if (!pageNo) {
	          pageNo = pageindex;
	        }
	        // 总页码totalPages//总数据条数totalCount
	        var totalPages = totalCount % pageSize == 0 ? totalCount / pageSize : (parseInt(totalCount / pageSize) + 1);    
	        jpager.generPageHtml({
	          pno: pageNo,
	          total: totalPages,        
	          totalRecords: totalCount,
	          mode: 'click',
	          click: function (n) {
	            this.selectPage(pageNo);
	            searchPage(n,geturl);
	            pageNumb=n;
	            return false;
	          }
	        }, true);
	      }, error: function (jqXHR, textStatus, errorThrown) {
	      }
	    });
	  }
	  // init
  function changenav(){
		$("#navone").css("display", "none");
		$("#navtwo").css("display", "block");
	}
	function changenan(){
		$("#navone").css("display", "block");
		$("#navtwo").css("display", "none");
	}