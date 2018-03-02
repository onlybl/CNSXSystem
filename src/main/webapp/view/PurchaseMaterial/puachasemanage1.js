/**
 * 
 */
$(function() {
	takePurchaselistPage();
	materialSelectList();
	$("#selectMaterial").blur(function() {
		getMaterialbyId($(".selectMaterial option:selected").val());

	});
})

function finishpurchase(materialPurchaseId) {
	$.ajax({
		type : "post",
		url : "Purchase/finishPurchase.do",
		dataType : "json",
		data : {
			"materialPurchaseId" : materialPurchaseId
		},
		success : function(inf) {
			takePurchaselistPage();
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
function deletepurchase() {
	$.ajax({
		type : "post",
		url : "Purchase/deletePurchase.do",
		dataType : "json",
		data : {
			"materialPurchaseId" : MPId
		},
		success : function(inf) {
			if (inf) {
				takePurchaselistPage();
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
function findpurchasebystatus(){
	var myForm = document.createElement("form");
	myForm.method = "post";
	myForm.action = "Purchase/gotoCurrentPurchaseMaterial.html";
	var myInput = document.createElement("input");
	myInput.setAttribute("type", "hidden");
	myInput.setAttribute("name", "id");
	myInput.setAttribute("value", "1");
	myForm.appendChild(myInput);
	document.body.appendChild(myForm);
	myForm.submit();
	document.body.removeChild(myForm);
}
function addnewpurchase() {
	var myForm = document.createElement("form");
	myForm.method = "post";
	myForm.action = "Purchase/addPurchaseMaterial.html";
	var myInput = document.createElement("input");
	myInput.setAttribute("type", "hidden");
	myInput.setAttribute("name", "id");
	myInput.setAttribute("value", PageNum);
	myForm.appendChild(myInput);
	document.body.appendChild(myForm);
	myForm.submit();
	document.body.removeChild(myForm);
}
function modifypurchase() {
	$.ajax({
		type : "post",
		url : "Purchase/updatePurchase.do",
		dataType : "json",
		data : {
			"materialId" : $(".selectMaterial").val(),
			"materialPurchaseId" : MPId,
			"status" : $("#purchaseStatus option:selected").val(),
			"purchaseQuantity" : $("#purchaseQuantity").val(),
			"purchaseAssign" : $('#purchaseAssign').val()
		},
		success : function(inf) {
			if (inf) {
				takePurchaselistPage();
				layer.open({
					content : '<i style="font-size:27px;">修改成功！</i>',
					style : 'background-color:green; color:#fff; border:none;' // 自定风格
					,
					time : 2
				});

			}
		},
		error : function(msg) {
		}
	});

}

function materialSelectList() {
	$.ajax({
		type : "post",
		url : "Purchase/selectMaterialidName.do",
		dataType : "json",
		data : {},
		success : function(inf) {
			var option;
			for (var i = 0; i < inf.length; i++) {
				var d = inf[i];
				option += "<option  value='" + d.materialId + "'>"
						+ d.materialName + "</option>";
			}

			$('#selectMaterial').html(option);
			$('.selectMaterial').searchableSelect();
		},
		error : function(msg) {
		}
	});

}
function getMaterialbyId(MaterialId) {
	$.ajax({
		type : "post",
		url : "Purchase/selectMaterialbyId.do",
		dataType : "json",
		data : {
			"materialId" : MaterialId
		},
		success : function(material) {

			var unp = parseFloat(material.materialUnitPrice).toFixed(2);
			$('#ManufacturerName').val(material.keepField1);
			$('#materialNo').val(material.materialNo);
			$('#materialName').val(material.materialName);
			$('#materialUnitprice').val(unp);
		},
		error : function(msg) {
		}
	});

}
var MPId;
function editpurchase(materialPurchaseId, materialId, purchaseQuantity,
		purchaseAssign, status, materialPurchaseNo) {
	MPId = materialPurchaseId;
	$('#purchaseAssign').val(purchaseAssign);
	$('#purchaseNo').text(materialPurchaseNo);
	$('#purchaseQuantity').val(purchaseQuantity);
	$("#purchaseStatus option[value='" + status + "']").attr("selected",
			"selected");
	getMaterialbyId(materialId);
	$("#selectMaterial option[value='" + materialId + "']").attr("selected",
			"selected");
}
var PageNum = 1;
var TOTALPAGE = 1;
var pageListNum = 6;
function setPagelist() {
	pageListNum = $("#selectPageSize").val();
	PageNum = 1;
	takePurchaselistPage();
}
function takePurchaselistPage() {

	$
			.ajax({
				type : "post",
				url : "Purchase/loadpurchaselistByPage.do",
				dataType : "json",
				data : {
					"pageNum" : PageNum,
					"pageSize" : pageListNum
				},
				success : function(inf) {
					var option;
					TOTALPAGE = inf.totalPages;
					for (var i = 0; i < inf.dataList.length; i++) {
						var p = inf.dataList[i];
						var paymentAmount = parseFloat(p.paymentAmount)
								.toFixed(2);
						var mystatus;
						switch (p.status) {
						case 1:
							mystatus = "已入库";
							break;
						case 2:
							mystatus = "入库中";
							break;
						case 0:
							mystatus = "待入库";
							break;
						default:
							mystatus = false;
							break;
						}
						option += "<tr>";
						option += "<td>" + p.materialPurchaseNo + "</td>";
						option += "<td>" + p.materialNo + "</td>";
						option += "<td>" + p.materialName + "</td>";
						option += "<td>" + p.materialUnitPrice + "</td>";
						option += "<td>" + p.purchaseQuantity + "</td>";
						option += "<td>" + p.purchaseAssign + "</td>";
						option += "<td>" + paymentAmount + "</td>";
						option += "<td>" + p.time + "</td>";

						if (mystatus) {
							option += "<td style='text-align:center'>"
									+ mystatus + "</td>";
						} else {
							option += "<td style='text-align:center'><button class='btn btn-xs btn-success' onclick='finishpurchase(\""
									+ p.materialPurchaseId
									+ "\")'>完成采购</button></td>";
						}
						if (mystatus) {
							option += "<td style='text-align:center' ><button style='color:red;border:1px solid red' data-toggle='modal' href='#newpurchase'  class='btn btn-xs' onclick='niyaoshangtianbu()' ><span class='icon-lock'> 不要点</span></button></td>";
						} else {
							option += "<td style='text-align:center' ><button style='color:red;border:1px solid red' data-toggle='modal' href='#example'  class='btn btn-xs' onclick='editpurchase(\""
									+ p.materialPurchaseId
									+ "\",\""
									+ p.materialId
									+ "\",\""
									+ p.purchaseQuantity
									+ "\",\""
									+ p.purchaseAssign
									+ "\",\""
									+ p.status
									+ "\",\""
									+ p.materialPurchaseNo
									+ "\")' ><i class='icon-edit'> 可编辑</i></button></td>";

						}

						option += "</tr>";
					}
					$("#tbody").html(option);
					$("#currentPage").text(PageNum);
					showbutton();
					$("#totalPage").text(inf.totalPages);
					$("#dataCount").text(inf.totalSize);
				},
				error : function(msg) {
				}
			});
}
function showbutton() {
	if (PageNum <= 1) {
		$("#firstPage").attr("class", " disabled");
		$("#previousPage").attr("class", " disabled");
		$("#lastPage").attr("class", "a");
		$("#nextPage").attr("class", "a");
	} else if (PageNum >= TOTALPAGE) {
		$("#firstPage").attr("class", "a");
		$("#previousPage").attr("class", "a");
		$("#lastPage").attr("class", " disabled");
		$("#nextPage").attr("class", " disabled");
	} else {
		$("#firstPage").attr("class", "a");
		$("#previousPage").attr("class", "a");
		$("#lastPage").attr("class", "a");
		$("#nextPage").attr("class", "a");
	}
}
function nextPage() {
	if (TOTALPAGE > 1 && PageNum < TOTALPAGE) {
		PageNum++;
		takePurchaselistPage();
	}
}

function previousPage() {
	if (PageNum > 1) {
		PageNum--;
		takePurchaselistPage();
	}
}

function firstPage() {
	if (PageNum != 1) {
		PageNum = 1;
		takePurchaselistPage();
	}
}
function lastPage() {
	if (PageNum != TOTALPAGE) {
		PageNum = TOTALPAGE;
		takePurchaselistPage();
	}
}