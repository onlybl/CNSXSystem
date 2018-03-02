var currentPage =1;
var totalPage =0 ;
//显示第一页teacher的数据
$(document).ready(function(){
	alert("gogogo!!!");
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
		url : "getOrdersByPage.do",
		dataType : "json",
		data:{
			"currentPage" :currentPage
		},
		success : function(orderList){
			var str =" ";
			for(var i=0;i<orderList.length;i++){
				var order =orderList[i];
				str +='<tr><td>"+order.orderId+"</td><td>"+order.orderNumber+"</td><td>"+order.orderTotalPrice+"</td></tr>';
			}
			$("#teacherTbody").html(); //替换内容
			showButton();
		},
		error : function(msg){
			
		}
	});
}

function showButton(){
	$.ajax({
		type : "post", 
		url : "getTotalPage.do",
		dataType : "text",
		data : 
		{
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
