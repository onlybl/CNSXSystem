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
<title>客户管理</title>
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
				height: 70%;
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
				height: 70%;
				margin: auto;
				background-color: white;
				position: relative;
				top: 100px;
				padding-top: 10px; 
				padding-left:40px ; 
				padding-right: 80px;
   }

</style>

<!-- 修改客户 -->
<script type="text/javascript">
function showUpdate(customerId){
	$("#uCustomerId").val(customerId);
	
	$.ajax({
		type:"post",
		url:"<%=basePath%>CustomerController/showCustomer.do",
	    dataType:"json",
	    data:{
	    	"customerId":customerId
	    },
	    success:function (customer){
	    	
	    	$("#uCustomerName").val(customer.customerName);
	    	$("#uCustomerPhone").val(customer.customerPhone);
	    	$("#uCustomerEmail").val(customer.customerEmail);
	    	$("#uDeliveryAddress").val(customer.deliveryAddress);
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
	var customerId = $("#uCustomerId").val();
	var customerName = $("#uCustomerName").val();
	var customerPhone = $("#uCustomerPhone").val();
	var customerEmail = $("#uCustomerEmail").val();
	var deliveryAddress = $("#uDeliveryAddress").val();
	
	if(customerName.length == 0){
		$("#name").html("姓名不能为空");
	}else if(customerPhone.length == 0){
		$("#phone").html("电话不能为空");
	}else if(deliveryAddress.length == 0){
		$("#address").html("地址不能为空");
	}else{
		$.ajax({
			type:"post",
			url:"<%=basePath%>CustomerController/updateCustomer.do",
		    dataType:"text",
		    data:{
		    	"customerId":customerId,
		    	"customerName":customerName,
		    	"customerPhone":customerPhone,
		    	"customerEmail":customerEmail,
		    	"deliveryAddress":deliveryAddress
		    },
		    success:function(str){
		    	
	            if(str.length == 9){
		    		
		    		initialize ();
		    		pageListCustomer ();
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

<!-- 添加客户 -->
<script type="text/javascript">
function showInsert(){
	$("#insertModel").css("display","block");
}
function hideInsert(){
	$("#insertModel").css("display","none");
}
function insert(){
	var customerName = $("#customerName").val();
	var customerPhone = $("#customerPhone").val();
	var customerEmail = $("#customerEmail").val();
	var deliveryAddress = $("#deliveryAddress").val();
	
	if(customerName.length == 0){
		$("#name").html("姓名不能为空");
	}else if(customerPhone.length == 0){
		$("#phone").html("电话不能为空");
	}else if(deliveryAddress.length == 0){
		$("#address").html("地址不能为空");
	}else{
		$.ajax({
			type:"post",
			url:"<%=basePath%>CustomerController/insertCustomer.do",
		    dataType:"text",
		    data:{
		    	"customerName":customerName,
		    	"customerPhone":customerPhone,
		    	"customerEmail":customerEmail,
		    	"deliveryAddress":deliveryAddress
		    },
		    success:function (str){
		    	if(str.length == 9){
		    		
		    		initialize ();
		    		pageListCustomer ();
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

<!-- 删除客户 -->
<script type="text/javascript">

function idelete(customerId){
	$.ajax({
		type:"post",
		url:"<%=basePath%>CustomerController/deleteCustomer.do",
	    dataType:"text",
	    data:{
	    	"customerId":customerId
	    },
	    success:function (str){
	    	
	    	if(str.length == 9){
	    		
	    		initialize ();
	    		pageListCustomer ();
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

<!-- 显示客户 -->
<script type="text/javascript">
<!-- 当前页面 -->
var nowPage = 1;
<!-- 单个页面显示数 -->
var pageSize = 8;
<!-- 总页面 -->
var allPage = 0;
<!-- 客户总数 -->
var allCustomer = 0;

<!-- 首页跳转 -->
function firstPage(){
	nowPage = 1;
	pageListCustomer ();
	pageGroup ();
}

<!-- 尾页跳转 -->
function finallyPage(){
	nowPage = allPage;
	pageListCustomer ();
	pageGroup ();
}
<!-- 上一页跳转 -->
function upPage(){
	nowPage--;
	pageListCustomer ();
	pageGroup ();
}
<!-- 下一页跳转 -->
function downPage(){
	nowPage++;
	pageListCustomer ();
	pageGroup ();
}
<!-- 页面按钮跳转 -->
function thePage(page){
	nowPage = page;
	pageListCustomer ();
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
		pageListCustomer ();
		pageGroup ();
	}
}
<!-- 分页显示页面方法 -->
function pageListCustomer (){
	
	$.ajax({
		type:"post",
		url:"<%=basePath%>CustomerController/customer.do",
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
				inf += "<td>"+list[i].customerName+"</td>";
				inf += "<td>"+list[i].customerPhone+"</td>";
				inf += "<td>"+list[i].customerEmail+"</td>";
				inf += "<td>"+list[i].deliveryAddress+"</td>";
				inf += "<td>";
				inf += "<a href='javascript:showUpdate("+list[i].customerId+")' type='button' class='btn btn-warning btn-sm'>修改</a>";
				inf += "&nbsp&nbsp";
				inf += "<a href='javascript:idelete("+list[i].customerId+")' type='button' class='btn btn-danger btn-sm'>删除</a>";
				inf += "</td>";
				inf += "</tr>";
			}
			
			$("#cusInf").html(inf);
			
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
		url:"<%=basePath%>CustomerController/count.do",
	    dataType:"text",
	    async:false,
	    data:{
	    },
	    success:function(count){
	    	
	    	allCustomer = count;
	    	var a = allCustomer%pageSize;
	    	var b = allCustomer/pageSize;
	    	
	    	if(a == 0){
	    		allPage = b;
	    	}else {
	    		for(var i=1 ; (allCustomer-pageSize) > 0 ; i++){
	    			allCustomer = allCustomer-pageSize;
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
	pageListCustomer ();
	$.ajax({
		type:"post",
		url:"<%=basePath%>CustomerController/count.do",
	    dataType:"text",
	    async:false,
	    data:{
	    },
	    success:function(count){
	    	
	    	allCustomer = count;
	    	var a = allCustomer%pageSize;
	    	var b = allCustomer/pageSize;
	    	
	    	if(a == 0){
	    		allPage = b;
	    	}else {
	    		for(var i=1 ; (allCustomer-pageSize) > 0 ; i++){
	    			allCustomer = allCustomer-pageSize;
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
				客户信息
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
							姓名
						</th>
						<th>
							电话
						</th>
						<th>
							邮箱
						</th>
						<th>
							地址
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody id="cusInf">
				</tbody>
			</table>
			  <div id="pageGroup" style=" width: 1100px; float: left;">
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
			      <a href="javascript:showInsert()" type='button' class='btn btn-success'>添加客户</a>
			  </div>
		    </div>
		</div>
		
		<!-- 修改客户蒙版 -->
		<div id="updateModel">
			<div id="updateModelContent">
				<h3 align="center" style="color: royalblue">修改客户信息</h3>
				    <input type="hidden" id="uCustomerId" >
                    <label for="uCustomerName">姓名</label>
                    <input type="text" class="form-control" id="uCustomerName">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                    <label for="uCustomerPhone">电话</label>
                    <input type="text" class="form-control" id="uCustomerPhone">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                    <label for="uCustomerEmail">邮箱</label>
                    <input type="text" class="form-control" id="uCustomerEmail">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                    <label for="uDeliveryAddress">地址</label>
                    <input type="text" class="form-control" id="uDeliveryAddress">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                 <br>
				<a type="button" class="btn btn-warning" href="javascript:update();">修改</a>
				<a type="button" class="btn  btn-danger" href="javascript:hideUpdate();">取消</a>
			</div>
			
		</div>
		
		<!-- 添加客户蒙版 -->
		<div id="insertModel">
			<div id="insertModelContent">
				<h3 align="center" style="color: royalblue">添加客户</h3>
				 
                    <label for="customerName">姓名</label>
                    <input type="text" class="form-control" id="customerName">
                    <span id="name" style="color: red; font-size: 10px;"></span><br>
                    <label for="customerPhone">电话</label>
                    <input type="text" class="form-control" id="customerPhone">
                    <span id="phone" style="color: red; font-size: 10px;"></span><br>
                    <label for="customerEmail">邮箱</label>
                    <input type="text" class="form-control" id="customerEmail">
                    <br>
                    <label for="deliveryAddress">地址</label>
                    <input type="text" class="form-control" id="deliveryAddress">
                    <span id="address" style="color: red; font-size: 10px;"></span>
                 <br>
				<a type="button" class="btn btn-success" href="javascript:insert();">添加</a>
				<a type="button" class="btn btn-danger" href="javascript:hideInsert();">取消</a>
			</div>
			
		</div>
</body>

</html>