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
<title>原料信息</title>
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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
				height: 75%;
				margin: auto;
				background-color: white;
				position: relative;
				top: 100px;
				padding-top: 10px; 
				padding-left:40px ; 
				padding-right: 80px;
			}
			
   #insertModel{
                position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background-color: rgba(0, 0, 0, 0.5);
				display: none;
   }		
   
   #insertModelContent{
                width: 35%;
				height: 75%;
				margin: auto;
				background-color: white;
				position: relative;
				top: 100px;
				padding-top: 10px; 
				padding-left:40px ; 
				padding-right: 80px;
   }

</style>

<!-- 修改 -->
<script type="text/javascript">
function showUpdate(manufacturerId){

	$("#updateModel").css("display","block");
	$("#umanufacturerId").val(manufacturerId);
}

function ok(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>ManufacturerController/showManufacturer.do",
	    dataType:"json",
	    data:{
	    	"manufacturerId":manufacturerId
	    },
	    success:function (manufacturer){
	    	
	    	$("#umanufacturerName").val(manufacturer.manufacturerName);
	    	$("#ucontactPhonenumber").val(manufacturer.contactPhonenumber);
	    	$("#umanufacturerAddress").val(manufacturer.manufacturerAddress);
	    	$("#ubankName").val(manufacturer.bankName);
	    	$("#ubankAccount").val(manufacturer.bankAccount);
	    	$("#updateModel").css("display","block");
	    },
	    error:function(){
	    	alert("请求失败!");
	    }
	});
}
function hideUpdate(){
	$("#updateModel").css("display","none");
}
function update(){
	var manufacturerId = $("#umanufacturerId").val();
	var manufacturerName = $("#umanufacturerName").val();
	var contactPhonenumber = $("#ucontactPhonenumber").val();
	var manufacturerAddress = $("#umanufacturerAddress").val();
	var bankName = $("#ubankName").val();
	var bankAccount = $("#ubankAccount").val();
	
	if(manufacturerName.length == 0){
		$("#name").html("姓名不能为空");
	}else if(contactPhonenumber.length == 0){
		$("#phone").html("电话不能为空");
	}else if(manufacturerAddress.length == 0){
		$("#address").html("地址不能为空");
	}else if(bankName.length == 0){
		$("#BName").html("开户银行不能为空");
	}else if(bankAccount.length == 0){
		$("#account").html("银行账号不能为空");
	}else {
		$.ajax({
			type:"post",
			url:"<%=basePath%>ManufacturerController/updateManufacturer.do",
		    dataType:"text",
		    data:{
		    	"manufacturerId":manufacturerId,
		    	"manufacturerName":manufacturerName,
		    	"contactPhonenumber":contactPhonenumber,
		    	"manufacturerAddress":manufacturerAddress,
		    	"bankName":bankName,
		    	"bankAccount":bankAccount
		    },
		    success:function(str){
		    	alert(str);
		    	
	            if(str == "success"){
		    		
		    		initialize ();
		    		pageList ();
		    		pageGroup ();
		    		alert("修改成功！");
		    	}else{
		    		alert("修改失败！");
		    	}
		    },
		    error:function(){
		    	alert("请求失败！");
		    }
		});
	}
	hideUpdate();
}
</script>

<!-- 添加 -->
<script type="text/javascript">
function showInsert(){
	$("#insertModel").css("display","block");
}
function hideInsert(){
	$("#insertModel").css("display","none");
}
function insert(){
	var materialName = $("#materialName").val();
	var materialType = $("#materialType").val();
	var materialDescriptions = $("#materialDescriptions").val();
	var materialSize = $("#materialSize").val();
	var materialUnitPrice = $("#materialUnitPrice").val();
	
	if(materialName.length == 0){
		$("#name").html("姓名不能为空");
	}else if(materialUnitPrice.length == 0){
		$("#unitPrice").html("单价不能为空");
	}else {
		$.ajax({
			type:"post",
			url:"<%=basePath%>MaterialController/insertMaterial.do",
		    dataType:"text",
		    data:{
		    	"materialName":materialName,
		    	"materialType":materialType,
		    	"materialDescriptions":materialDescriptions,
		    	"materialSize":materialSize,
		    	"materialUnitPrice":materialUnitPrice
		    },
		    success:function (str){
		    	if(str=="success"){
		    		
		    		initialize ();
		    		pageList ();
		    		pageGroup ();
		    		alert("添加成功！");
		    		hideInsert();
		    	}else{
		    		alert("添加失败！");
		    	}
		    },
		    error:function(){
		    	alert("请求失败!");
		    }
		});
	}
}

</script>

<!-- 删除 -->
<script type="text/javascript">

function idelete(materialId){
	$.ajax({
		type:"post",
		url:"<%=basePath%>MaterialController/deleteMaterial.do",
	    dataType:"text",
	    data:{
	    	"materialId":materialId
	    },
	    success:function (str){
	    	if(str=="success"){
	    		
	    		initialize ();
	    		pageList ();
	    		pageGroup ();
	    		alert("删除成功！");
	    	}else{
	    		alert("删除失败！");
	    	}
	    },
	    error:function(){
	    	alert("请求失败!");
	    }
	});
}

</script>

<!-- 显示 -->
<script type="text/javascript">
<!-- 当前页面 -->
var nowPage = 1;
<!-- 单个页面显示数 -->
var pageSize = 8;
<!-- 总页面 -->
var allPage = 0;
<!-- 客户总数 -->
var allnum = 0;

<!-- 首页跳转 -->
function firstPage(){
	nowPage = 1;
	pageList ();
	pageGroup ();
}

<!-- 尾页跳转 -->
function finallyPage(){
	nowPage = allPage;
	pageList ();
	pageGroup ();
}
<!-- 上一页跳转 -->
function upPage(){
	nowPage--;
	pageList ();
	pageGroup ();
}
<!-- 下一页跳转 -->
function downPage(){
	nowPage++;
	pageList ();
	pageGroup ();
}
<!-- 页面按钮跳转 -->
function thePage(page){
	nowPage = page;
	pageList ();
	pageGroup ();
}
<!-- 输入跳转 -->
function turnPage(){
	
	var page = $("#inputPage").val();
	
	if(page.length == 0){
		alert("输入的页数不能为空！");
	}else if(page<=0 | page>allPage){
		alert("输入的页数不存在！");
	}else{
		nowPage = page;
		pageList ();
		pageGroup ();
	}
}
<!-- 分页显示页面方法 -->
function pageList (){
	
	$.ajax({
		type:"post",
		url:"<%=basePath%>MaterialController/material.do",
	    dataType:"json",
	    data:{
	    	"nowPage":nowPage,
	    	"pageSize":pageSize
	    },
		success:function(list){
			var inf = " ";
			var a = 0;
			
			for(var i=0 ; i<list.length ; i++){
				a = i+1;
				
				inf += "<tr>";
				inf += "<td>"+a+"</td>";
				inf += "<td>"+list[i].materialName+"</td>";
				inf += "<td>"+list[i].materialType+"</td>";
				inf += "<td>"+list[i].materialDescriptions+"</td>";
				inf += "<td>"+list[i].materialSize+"</td>";
				inf += "<td>"+list[i].materialUnitPrice+"</td>";
				inf += "<td>";
				inf += "<a href='javascript:showUpdate(&quot;"+list[i].materialId+"&quot;)' type='button' class='btn btn-warning btn-sm'>修改</a>";
				inf += "&nbsp&nbsp";
				inf += "<a href='javascript:idelete(&quot;"+list[i].materialId+"&quot;)' type='button' class='btn btn-danger btn-sm'>删除</a>";
				
				inf += "</td>";
				inf += "</tr>";
			}
			
			$("#manInf").html(inf);
			
		},
		error:function(){
			alert("请求失败！");
		}
	});
}

<!-- 得到客户总数和页面总数 -->
function initialize (){
	$.ajax({
		type:"post",
		url:"<%=basePath%>MaterialController/count.do",
	    dataType:"text",
	    async:false,
	    data:{
	    },
	    success:function(count){
	    	
	    	allnum = count;
	    	var a = allnum%pageSize;
	    	var b = allnum/pageSize;
	    	
	    	if(a == 0){
	    		allPage = b;
	    	}else {
	    		for(var i=1 ; (allnum-pageSize) > 0 ; i++){
	    			allnum = allnum-pageSize;
	    		}
	    		allPage = i;
	    	}
	    	var str ="共"+allPage+"页" ;
	    	$("#allPage").html(str);
	    },
	    error:function(){
	    	alert("初始化有误！");
	    }
	});
}

<!-- 分页按钮组 -->
function pageGroup () {
	var inf = " ";
	
	if(nowPage == 1){
		inf += "<li id='firstPage'>";
		inf += "<a href='javascript:firstPage()' class='btn disabled'>首页</a>";
		inf += "</li>";
		inf += "<li id='up'>";
		inf += "<a href='javascript:upPage()' class='btn disabled'>上一页</a>";
		inf += "</li>";
		inf += "<li>";
		inf += "<a href='javascript:thePage(1)' class='btn disabled'>1</a>";
		inf += "</li>";
		for (var i=2 ; i<=allPage ; i++){
			inf += "<li>";
			inf += "<a href='javascript:thePage("+i+")'>"+i+"</a>";
			inf += "</li>";
		}
		inf += "<li id='down'>";
		inf += "<a href='javascript:downPage()'>下一页</a>";
		inf += "</li>";
		inf += "<li id='finallyPage'>";
		inf += "<a href='javascript:finallyPage()'>尾页</a>";
		inf += "</li>";
	}else if(nowPage == allPage){
		inf += "<li id='firstPage'>";
		inf += "<a href='javascript:firstPage()'>首页</a>";
		inf += "</li>";
		inf += "<li id='up'>";
		inf += "<a href='javascript:upPage()'>上一页</a>";
		inf += "</li>";
		for (var i=1 ; i<allPage ; i++){
			inf += "<li>";
			inf += "<a href='javascript:thePage("+i+")'>"+i+"</a>";
			inf += "</li>";
		}
		inf += "<li>";
		inf += "<a href='javascript:thePage(allPage)'  class='btn disabled'>"+allPage+"</a>";
		inf += "</li>";
		inf += "<li id='down'>";
		inf += "<a href='javascript:downPage()'  class='btn disabled'>下一页</a>";
		inf += "</li>";
		inf += "<li id='finallyPage'>";
		inf += "<a href='javascript:finallyPage()' class='btn disabled'>尾页</a>";
		inf += "</li>";
	}else {
		inf += "<li id='firstPage'>";
		inf += "<a href='javascript:firstPage()'>首页</a>";
		inf += "</li>";
		inf += "<li id='up'>";
		inf += "<a href='javascript:upPage()'>上一页</a>";
		inf += "</li>";
		for (var i=1 ; i<=allPage ; i++){
			if(i == nowPage){
				inf += "<li>";
				inf += "<a href='javascript:thePage("+i+")'  class='btn disabled'>"+i+"</a>";
				inf += "</li>";
			}else {
				inf += "<li>";
				inf += "<a href='javascript:thePage("+i+")'>"+i+"</a>";
				inf += "</li>";
			}
		}
		inf += "<li id='down'>";
		inf += "<a href='javascript:downPage()'>下一页</a>";
		inf += "</li>";
		inf += "<li id='finallyPage'>";
		inf += "<a href='javascript:finallyPage()'>尾页</a>";
		inf += "</li>";
	}
	$("#fpage").html(inf);
}

<!-- 初始化 -->
$(document).ready(function(){
	pageList ();
	$.ajax({
		type:"post",
		url:"<%=basePath%>MaterialController/count.do",
	    dataType:"text",
	    async:false,
	    data:{
	    },
	    success:function(count){
	    	
	    	allnum = count;
	    	var a = allnum%pageSize;
	    	var b = allnum/pageSize;
	    	
	    	if(a == 0){
	    		allPage = b;
	    	}else {
	    		for(var i=1 ; (allnum-pageSize) > 0 ; i++){
	    			allnum = allnum-pageSize;
	    		}
	    		allPage = i;
	    	}
	    	var str ="共"+allPage+"页" ;
	    	$("#allPage").html(str);
	    },
	    error:function(){
	    	alert("初始化有误！");
	    }
	});
	pageGroup ();
	
	
});

</script>

<body>
		<div id="">
			<div class="col-md-12 column" style="background: cornflowerblue;">
			  <h1 align="center" class="text-left muted" style=" color: whitesmoke">
				原料信息
			  </h1>
		    </div>
		    <div class="col-md-12 column">
			<table class="table table-bordered table-condensed">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							名称
						</th>
						<th>
							类型
						</th>
						<th>
							描述
						</th>
						<th>
							尺寸
						</th>
						<th>
							单价
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody id="manInf">
				</tbody>
			</table>
			  <div id="pageGroup" style=" width: 1200px; float: left;">
			     <ul class='pagination' id='fpage'>
	
                    
                 </ul>
                 &nbsp&nbsp&nbsp
                 <span id="allPage"></span>
                 &nbsp
                 <input id="inputPage" type="text" style="width:30px;text-align:center;">
                 &nbsp
                 <a href="javascript:turnPage()" type='button' class='btn btn-primary btn-sm'>确定</a>
			     
			  </div>
			  <div>
			      <a href="javascript:showInsert()" type='button' class='btn btn-success'>添加原料</a>
			  </div>
		    </div>
		</div>
		
		<!-- 修改蒙版 -->
		<div id="updateModel">
			<div id="updateModelContent">
				<h3 align="center" style="color: royalblue">修改供应商信息</h3>
				    <input type="hidden" id="umanufacturerId">
				    <label for="umanufacturerName">名称</label>
                    <input type="text" class="form-control" id="umanufacturerName">
                    <span id="uname" style="color: red; font-size: 10px;"></span><br>
                    <label for="ucontactPhonenumber">电话</label>
                    <input type="text" class="form-control" id="ucontactPhonenumber">
                    <span id="uphone" style="color: red; font-size: 10px;"></span><br>
                    <label for="umanufacturerAddress">地址</label>
                    <input type="text" class="form-control" id="umanufacturerAddress">
                    <span id="uaddress" style="color: red; font-size: 10px;"></span>
                    <br>
                    <label for="ubankName">开户银行</label>
                    <input type="text" class="form-control" id="ubankName">
                    <span id="uBName" style="color: red; font-size: 10px;"></span>
                    <br>
                    <label for="ubankAccount">银行账号</label>
                    <input type="text" class="form-control" id="ubankAccount">
                    <span id="uaccount" style="color: red; font-size: 10px;"></span>
                 <br>
				<a type="button" class="btn btn-warning" href="javascript:update();">修改</a>
				<a type="button" class="btn  btn-danger" href="javascript:hideUpdate();">取消</a>
			</div>
			
		</div>
		
		<!-- 添加蒙版 -->
		<div id="insertModel">
			<div id="insertModelContent">
				<h3 align="center" style="color: royalblue">添加原料</h3>
				 
                    <label for="materialName">名称</label>
                    <input type="text" class="form-control" id="materialName">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                    <label for="materialType">类型</label>
                    <input type="text" class="form-control" id="materialType">
                    <span id="type" style="color: red; font-size: 10px;"></span><br>
                    <label for="materialDescriptions">描述</label>
                    <input type="text" class="form-control" id="materialDescriptions">
                    <span id="descriptions" style="color: red; font-size: 10px;"></span>
                    <br>
                    <label for="materialSize">尺寸</label>
                    <input type="text" class="form-control" id="materialSize">
                    <span id="size" style="color: red; font-size: 10px;"></span>
                    <br>
                    <label for="materialUnitPrice">单价</label>
                    <input type="text" class="form-control" id="materialUnitPrice">
                    <span id="unitPrice" style="color: red; font-size: 10px;"></span>
                 <br>
				<a type="button" class="btn btn-success" href="javascript:insert();">添加</a>
				<a type="button" class="btn btn-danger" href="javascript:hideInsert();">取消</a>
			</div>
			
		</div>
</body>

</html>