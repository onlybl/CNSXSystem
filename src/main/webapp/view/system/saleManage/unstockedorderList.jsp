<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>未完成订单管理</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
var currentPage =1;
var totalPage =0 ;
//显示第一页teacher的数据
$(document).ready(function(){
	show("xxx");
});
//show方法
function show(flag){
	if(flag=="add"){
		currentPage++;
	}else if(flag=="reduce"){
		currentPage--;
	}else if(flag=="last"){
		currentPage=totalPage;
	}else if(flag=="first"){
		currentPage=1;
	}
	$.ajax({
		type : "post", 
		url : "OrderFormController/getOrdersByPage.do",
		dataType : "json",
		data:{
			"currentPage" :currentPage,
			"processingStatus":-1
		},
		success : function(orderList){
			
			var str =" ";
			for(var i=0;i<orderList.length;i++){
				var order =orderList[i];
				str +="<tr><td>"+order.orderNumber+"</td><td>"+order.orderCreateTime+"</td>";
				str +="<td>"+order.depositoryOutAssign+"</td><td>"+order.productName+"</td>";
				str +="<td>"+order.customerName+"</td><td>"+order.orderQuantity+"</td>";
				str +="<td>"+order.orderTotalPrice+"</td>";
				str +="<td>未出库</td>";
				str +="<td><a class='btn btn-block btn-default' href='javascript:look(\""+order.orderId+"\");'><span class='glyphicon glyphicon-edit' style='color: rgb(0, 0, 145);'></span>查看详情</a></td>";
				str +="<td><a class='btn btn-block btn-default' href="+"<%=basePath%>OrderFormController/ToUpdateOrderForm.do?orderId="+order.orderId+"> <span class='glyphicon glyphicon-edit' style='color: rgb(0, 0, 145);'></span>修改订单</a></td>";
				str +="<td><a class='btn btn-block btn-default' href="+"<%=basePath%>OrderFormController/deleteOrderForm.do?orderId="+order.orderId+"> <span class='glyphicon glyphicon-edit' style='color: rgb(0, 0, 145);'></span>删除订单</a></td>";
				str +="</tr>";
			}
			$("#teacherTbody").html(str); //替换内容
			showButton();
		},
		error : function(msg){
			
		}
	});
}

function showButton(){
	$.ajax({
		type : "post", 
		url : "OrderFormController/getTotalPage.do",
		dataType : "text",
		data : 
		{
			"processingStatus":0
		},
		success : function(total_Page){
		totalPage =	 parseInt(total_Page);//总页数
		var str =" ";
		if(currentPage==0){
			currentPage=1;
		}
		if(currentPage==1 &&currentPage<totalPage){//前不可点，后可点
			str += "<li><a href='#' class='btn btn-default btn-link disabled'>第一页</a></li>";
			str += "<li> <a href='#' class='btn btn-default btn-link disabled'><<</a></li>";
			str += "<li> <a href='#' class='btn btn-default btn-link disabled'>"+currentPage+"</a></li>";
			str += "<li><a href='javascript:show(\"add\")'>>></a></li>";
			str += "<li><a href='javascript:show(\"last\")'>最后一页</a></li>";
		}else if(currentPage==1 && currentPage==totalPage){//前后都不可点
			str += "<li><a href='#' class='btn btn-default btn-link disabled'>第一页</a></li>";
			str += "<li> <a href='#' class='btn btn-default btn-link disabled'><<</a></li>";
			str += "<li> <a href='#' class='btn btn-default btn-link disabled'>"+currentPage+"</a></li>";
			str += "<li><a href='#' class='btn btn-default btn-link disabled'>>></a></li>";
		 	str += "<li><a href='#' class='btn btn-default btn-link disabled'>最后一页</a></li>";
		}else if (currentPage>1 && currentPage==totalPage){//前可点 ，后不可点
			str += "<li><a href='javascript:show(\"first\")' class='btn btn-default btn-link'>第一页</a></li>";
	        str += "<li> <a href='javascript:show(\"reduce\")' class='btn btn-default btn-link'><<</a></li>";
		    str += "<li> <a href='#' class='btn btn-default btn-link disabled'>"+currentPage+"</a></li>";
		   str += "<li><a href='#' class='btn btn-default btn-link disabled'>>></a></li>";
	 	   str += "<li><a href='#' class='btn btn-default btn-link disabled'>最后一页</a></li>";
		}else if(currentPage>1 && currentPage<totalPage) {//前后都可点
	        str += "<li><a href='javascript:show(\"first\")' class='btn btn-default btn-link'>第一页</a></li>";
			str += "<li> <a href='javascript:show(\"reduce\")' class='btn btn-default btn-link'><<</a></li>";
			str += "<li> <a href='#' class='btn btn-default btn-link disabled'>"+currentPage+"</a></li>";
			str += "<li><a href='javascript:show(\"add\")'>>></a></li>";
		 	str += "<li><a href='javascript:show(\"last\")'>最后一页</a></li>";
	 }
		 $("#mypageul").html(str);
		},
        error : function(msg){
			
		}
	});
}


</script>
<script>
function look(orderId) {
	 $('#myModal').modal({
	        keyboard: true
	    });
	 $.ajax({
			type : "post",
			url : "<%=basePath%>OrderFormController/getThisOrder.do",
			dataType : "json",
			data : {"orderId":orderId},
			success : function(order) {
var str = "<h4 class='modal-title' id='myModalLabel'>订单编号为"+order.orderNumber+"的订单信息</h4>";
				
				
				str += "<table class='table table-condensed'>";
				
				str += "<tr>";
				str += "<td>顾客</td>";
				str += "<td>"+order.customerName+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>产品</td>";
				str += "<td>"+order.productName+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>订单状态</td>";
				str += "<td>"+order.processingStatus+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>数量</td>";
				str += "<td>"+order.orderQuantity+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>总价</td>";
				str += "<td>"+order.orderTotalPrice+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>创建时间</td>";
				str += "<td>"+order.orderCreateTime+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>完成时间</td>";
				str += "<td style='color: red;'>送货中</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>运输方式</td>";
				str += "<td>"+order.settlementMethod+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>出库人</td>";
				str += "<td>"+order.depositoryOutAssign+"</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td>出库时间</td>";
				str += "<td>"+order.depositoryOutTime+"</td>";
				str += "</tr>";
				
				str += "</table>";
				
				$(".mainInf").html(str);
				
				
			},
			error : function(i) {
				
			}
		});
}

</script>

</head>
<body>
	<div style="height: 386px; margin: auto">
		<div style="margin: auto;">
			<ul id="navone" class="nav nav-tabs">
				<li><a
					href="<%=basePath%>view/system/saleManage/finishedorderList2.jsp"
					id="one" title="未完成列表">查看已完成订单列表</a></li>
				<li><a
					href="<%=basePath%>view/system/saleManage/stockedorderList.jsp"
					id="one" title="未完成列表">查看已出库订单列表</a></li>
				<li><a
					href="<%=basePath%>view/system/saleManage/orderAdd.jsp"
					id="two" title="添加订单">添加订单</a></li>
			</ul>

			<!-- 这个下面是写动态获取的内容 -->

			<h2>
				<b style="margin-left: 80px;">未出库订单列表</b>
			</h2>
			<hr>
			<div class="tab-pane fade in active" id="view" style="height: 350px">

					<table class="table table-striped table-hover table-condensed">
			
				<thead>
					<tr style="color: white; font-size: 18px; background-color:rgb(28,192,227); font: bold;">
							<td>订单编号：</td>
							<td>创建时间：</td>
							<td>创建人：</td>
							<td>产品名称：</td>
							<td>顾客名字：</td>
							<td>数量：</td>
							<td>总价：</td>
							<td>处理状态：</td>
							<td colspan="3" >操作</td>
						</tr>
				</thead>
				<tbody id="teacherTbody"></tbody>
			</table>
			<ul class='pagination' id="mypageul"></ul>
				</div>
			</div>
		
	</div>
	
	
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                
                <div class="mainInf"></div>
            </div>
            <div class="modal-body">按下 ESC 按钮退出。</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>

