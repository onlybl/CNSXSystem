/**
 * 
 */
$(function() {
	findpurchasebystatus()

})
function findpurchasebystatus() {
	$
			.ajax({
				type : "post",
				url : "Purchase/findpurchasebystatus.do",
				dataType : "json",
				data : {},
				success : function(list) {
					var option;
					for (var i = 0; i < list.length; i++) {
						var p = list[i];
						var paymentAmount = parseFloat(p.paymentAmount)
						.toFixed(2);
						option += "<tr>";
						option += "<td>" + p.materialPurchaseNo + "</td>";
						option += "<td>" + p.materialNo + "</td>";
						option += "<td>" + p.materialName + "</td>";
						option += "<td>" + p.materialUnitPrice + "</td>";
						option += "<td>" + p.purchaseQuantity + "</td>";
						option += "<td>" + p.purchaseAssign + "</td>";
						option += "<td>" + paymentAmount + "</td>";
						option += "<td>" + p.time + "</td>";
						option += "<td style='text-align:center'><button class='btn btn-xs btn-success' onclick='finishpurchase(\""
								+ p.materialPurchaseId
								+ "\")'>完成采购</button></td>";
						option += "<td style='text-align:center'><button class='btn btn-xs btn-warning' onclick=' deletepurchase(\""
								+ p.materialPurchaseId
								+ "\")'>删除</button></td>";

						option += "</tr>";
					}
					$("#tbody").html(option);
				},
				error : function(msg) {
				}
			});
}
function finishpurchase(materialPurchaseId) {
	$.ajax({
		type : "post",
		url : "Purchase/finishPurchase.do",
		dataType : "json",
		data : {
			"materialPurchaseId" : materialPurchaseId
		},
		success : function(inf) {
			findpurchasebystatus();
			if (inf) {
				layer.open({
					content : '<i style="font-size:27px;">Finished！</i>',
					style : 'background-color:green; color:#fff; border:none;',
					time : 1
				});

			} else {
				layer.open({
					content : '<i style="font-size:27px;">系统错误</i>',
					style : 'background-color:red; color:#fff; border:none;',
					time : 1
				});
			}
		},
		error : function(msg) {
		}
	});
}
function deletepurchase(MPId) {
	$.ajax({
		type : "post",
		url : "Purchase/deletePurchase.do",
		dataType : "json",
		data : {
			"materialPurchaseId" : MPId
		},
		success : function(inf) {
			if (inf) {
				findpurchasebystatus();
				layer.open({
					content : '<i style="font-size:27px;">删除成功！</i>',
					style : 'background-color:green; color:#fff; border:none;',
					time : 2
				});
			}
		},
		error : function(msg) {
		}
	});

}