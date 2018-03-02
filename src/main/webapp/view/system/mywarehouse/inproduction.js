var pageNumb;
$(function() {
	tobehandle(1);
	laydate({
		elem : '#start',
		event : 'focus'
	});
})
function overlay() {
	var e1 = document.getElementById('modal-overlay');
	e1.style.visibility = (e1.style.visibility == "visible") ? "hidden"
			: "visible";
}
function overlay1() {
	var e1 = document.getElementById('modal-overlay1');
	e1.style.visibility = (e1.style.visibility == "visible") ? "hidden"
			: "visible";
}
function overlay2() {
	var e1 = document.getElementById('modal-editbaseinf');
	e1.style.visibility = (e1.style.visibility == "visible") ? "hidden"
			: "visible";
}
function searchproductionin() {
	$
			.ajax({
				url : "Statistics/selectPlanbyPnameTime.html",
				dataType : "json",
				type : "POST",
				data : {
					"ProductionName" : $("#sproductionName").val(),
					"FinishedTime" : $("#start").val()
				},
				success : function(dataList) {
					if (dataList.length < 1) {
						$("#tbody3").empty();
						$("#tbody3")
								.html(
										"<td colspan='11'><div style='text-align:center; color:skyblue'><h4>没 有 匹 配 的 结 果 </h4></div></td>");
						return;
					} else {
						var diplay;
						for (var i = 0; i < dataList.length; i++) {
							var s = dataList[i];
							var clstyle = "";
							var colorn = s.productionQuantity;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.planNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.productId
									+ ")'>"
									+ s.productionNo
									+ "</a></td>";
							diplay += "<td>" + s.productionName + "</td>";
							diplay += "<td>" + s.planActualOutput + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.warehouseNo + "</td>";
							diplay += "<td>" + s.warehouseLocation + "</td>";
							diplay += "<td>" + s.supportHotline + "</td>";
							diplay += "<td>" + s.keepField3 + "</td>";
							diplay += "</tr>";
						}

						$("#tbody3").html(diplay);
					}

				},
				error : function(data) {
				}
			});

}
function updateaddress() {
	$.ajax({
		url : "Inventories/updatewhLocation.html",
		dataType : "text",
		type : "POST",
		data : {
			"warehouseId" : $("#warehouseId").val(),
			"warehouseLocation" : $("#warehouseLocation").val()
		},
		success : function(data) {
			if (data = "SUCCESS") {
				overlay2();
				overlay1();
				tobehandle(1);
			} else {
				alert("!操作失败~")
			}
		},
		error : function() {
		}
	});
}
function sendconfirm(planNo, productionNo, productionName, incount,
		warehouseNo, supportHotline, warehouseLocation, warehouseId) {
	$("#planNo").text(planNo);
	$("#productionNo").text(productionNo);
	$("#productionName").text(productionName);
	$("#incount").text(incount);
	$("#warehouseNo").text(warehouseNo);
	$("#supportHotline").text(supportHotline);
	$("#warehouseLocation").val(warehouseLocation);
	$("#warehouseId").val(warehouseId);
	overlay2();
}
function searchPage(n) {
	tobehandle(n);
}

function tobehandle(pageindex) {
	$("#batch_receive").attr("class", "btn disabled btn-info");
	$("#checkboxchecked").text(0);
	getcount();
	$
			.ajax({
				url : "Inventories/tobehde1.html",
				dataType : "json",
				type : "POST",
				data : {
					"pageNumber" : pageindex
				},
				success : function(data) {
					if (data.dataList.length < 1) {
						$("#tbody").empty();
						$("#tbody")
								.html(
										"<td colspan='11'><div style='text-align:center; color:red'><h4>暂 无 任 务 可 领 取</h4></div></td>");
						return;
					} else {

						var diplay;
						for (var i = 0; i < data.dataList.length; i++) {
							var s = data.dataList[i];
							var clstyle = "";
							var colorn = s.productionQuantity;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td><label><input type='checkbox' class='ace'  value='"
									+ s.planId
									+ "'><span class='lbl'></span></label></td>";
							diplay += "<td>" + s.planNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.productId
									+ ")'>"
									+ s.productionNo
									+ "</a></td>";
							diplay += "<td>" + s.productionName + "</td>";
							diplay += "<td>" + s.planActualOutput + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.warehouseNo + "</td>";
							diplay += "<td>" + s.warehouseLocation + "</td>";
							diplay += "<td>" + s.supportHotline + "</td>";
							diplay += "<td class='td-manage'>";
							diplay += "<a title='接收任务' onclick='receivetask(\""
									+ s.planId
									+ "\")'  class='btn btn-xs btn-success'><i class='icon-plus bigger-120'></i></a></td><td>";
							diplay += "<a title='编辑'  onclick='sendconfirm(\""
									+ s.planNo
									+ "\",\""
									+ s.productionNo
									+ "\",\""
									+ s.productionName
									+ "\",\""
									+ s.planActualOutput
									+ "\",\""
									+ s.warehouseNo
									+ "\",\""
									+ s.supportHotline
									+ "\",\""
									+ s.warehouseLocation
									+ "\",\""
									+ s.warehouseId
									+ "\")' class='btn btn-xs btn-info'><i class='icon-edit bigger-120'></i></a></td></tr>"
						}

						$("#tbody").html(diplay);
						numberchange();
					}
					var pageSize = parseInt(data.pageSize);
					var totalCount = parseInt(data.total);

					var pageNo = pageNumb;

					if (!pageNo) {
						pageNo = pageindex;
					}
					// 总页码totalPages//总数据条数totalCount
					var totalPages = totalCount % pageSize == 0 ? totalCount
							/ pageSize : (parseInt(totalCount / pageSize) + 1);
					jpager.generPageHtml({
						pno : pageNo,
						total : totalPages,
						totalRecords : totalCount,
						mode : 'click',
						click : function(n) {
							this.selectPage(pageNo);
							searchPage(n);
							pageNumb = n;
							return false;
						}
					}, true);
				},
				error : function() {
				}
			});
}
function numberchange() {

	$('table th input:checkbox').on(
			'click',
			function() {
				var that = this;
				$(this).closest('table').find(
						'tr > td:first-child input:checkbox').each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

			});
	$('table input:checkbox').on('click', function() {
		if ($('table tbody input:checkbox').is(':checked')) {
			$("#batch_receive").attr("class", "btn btn-info");
		} else {
			$("#batch_receive").attr("class", "btn disabled btn-info");
		}

		var len = $("table tbody input:checkbox:checked").length;
		$("#checkboxchecked").text(" " + len + " ");
	});
}

function currenttask() {
	getcount();
	$
			.ajax({
				url : "Inventories/currenttask1.html",
				dataType : "json",
				type : "POST",
				data : {},
				success : function(dataList) {
					if (dataList.length < 1) {
						$("#tbody1").empty();
						$("#tbody1")
								.html(
										"<td colspan='11'><div style='text-align:center; color:blue'><h4>当 前 暂 无 任 务</h4></div></td>");
						return;
					} else {
						var diplay;
						for (var i = 0; i < dataList.length; i++) {
							var s = dataList[i];
							var clstyle = "";
							var colorn = s.productionQuantity;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							var changedTotal = s.productionQuantity
									+ s.planActualOutput;
							diplay += "<tr><td class='td-manage'><button onclick='finishtask(\""
									+ s.planId
									+ "\",\""
									+ changedTotal
									+ "\",\""
									+ s.productInventoryId
									+ "\")' 'title='完成任务' class='btn btn-xs btn-success'><b>Complete</b></button></td>";
							diplay += "<td>" + s.planNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.productId
									+ ")'>"
									+ s.productionNo
									+ "</a></td>";
							diplay += "<td>" + s.productionName + "</td>";
							diplay += "<td>" + s.planActualOutput + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.warehouseNo + "</td>";
							diplay += "<td>" + s.warehouseLocation + "</td>";
							diplay += "<td>" + s.supportHotline + "</td>";
							diplay += "</tr>"
						}

						$("#tbody1").html(diplay);
					}
				},
				error : function() {
				}
			});
}
function finishedtoday() {
	getcount();
	$
			.ajax({
				url : "Inventories/finishedMonth.html",
				dataType : "json",
				type : "POST",
				data : {},
				success : function(dataList) {
					if (dataList.length < 1) {
						$("#tbody2").empty();
						$("#tbody2")
								.html(
										"<td colspan='11'><div style='text-align:center; color:green'><h4>今 日 尚 未 完 成 任 何 任 务</h4></div></td>");
						return;
					} else {
						var diplay;
						for (var i = 0; i < dataList.length; i++) {
							var s = dataList[i];
							var clstyle = "";
							var colorn = s.productionQuantity;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.planNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.productId
									+ ")'>"
									+ s.productionNo
									+ "</a></td>";
							diplay += "<td>" + s.productionName + "</td>";
							diplay += "<td>" + s.planActualOutput + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.warehouseNo + "</td>";
							diplay += "<td>" + s.warehouseLocation + "</td>";
							diplay += "<td>" + s.supportHotline + "</td>";
							diplay += "<td>" + s.keepField3 + "</td>";
							diplay += "</tr>";
						}
						$("#tbody2").html(diplay);
					}
				},
				error : function() {
				}
			});
}
function receivetask(planId) {
	$.ajax({
		url : "Inventories/depositoryin.html",
		dataType : "text",
		type : "POST",
		data : {
			"planId" : planId
		},
		success : function(data) {
			if (data = "SUCCESS") {
				overlay();
				tobehandle(pageNumb);
			} else {
				alert("!操作失败~")
			}
		},
		error : function() {
		}
	});
}
function finishtask(planId, changedTotal, productInventoryId) {
	$.ajax({
		url : "Inventories/finishdepotask.html",
		dataType : "text",
		type : "POST",
		data : {
			"planId" : planId,
			"productionQuantity" : changedTotal,
			"InventoryId" : productInventoryId
		},
		success : function(data) {
			if (data = "SUCCESS") {
				overlay1();
				currenttask();
			} else {
				alert("!操作失败~")
			}
		},
		error : function() {
		}
	});
}
function getcount() {
	$.ajax({
		url : "Inventories/warehousingcount.html",
		dataType : "json",
		type : "POST",
		data : {},
		success : function(data) {
			$("#headh1").text(data.one);
			$("#headh2").text(data.two);
			$("#headh3").text(data.three);
			$("#headh4").text(data.four);
		},
		error : function() {
		}
	});
}
function checkboxes() {
	var sta;
	$.each($('table input:checkbox:checked'), function() {
		sta = $(this).val();
		checkok($(this).val());
	});
	if (sta.length > 1) {
		overlay();
	} else {
		return;
	}
}
function checkok(checkok) {
	$.ajax({
		url : "Inventories/depositoryin.html",
		dataType : "text",
		type : "POST",
		data : {
			"planId" : checkok
		},
		success : function(data) {
			if (data = "SUCCESS") {
				tobehandle(pageNumb);
			} else {
				alert("!操作失败~" + checkok)
			}
		},
		error : function() {
		}
	});
}
function finishedhistory() {
	$
			.ajax({
				url : "Inventories/warehosed.html",
				dataType : "json",
				type : "POST",
				data : {},
				success : function(dataList) {
					if (dataList.length < 1) {
						$("#tbody3").empty();
						$("#tbody3")
								.html(
										"<td colspan='11'><div style='text-align:center; color:skyblue'><h4>暂 无 历 史 可 查 询 </h4></div></td>");
						return;
					} else {
						var diplay;
						for (var i = 0; i < dataList.length; i++) {
							var s = dataList[i];
							var clstyle = "";
							var colorn = s.productionQuantity;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.planNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.productId
									+ ")'>"
									+ s.productionNo
									+ "</a></td>";
							diplay += "<td>" + s.productionName + "</td>";
							diplay += "<td>" + s.planActualOutput + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.warehouseNo + "</td>";
							diplay += "<td>" + s.warehouseLocation + "</td>";
							diplay += "<td>" + s.supportHotline + "</td>";
							diplay += "<td>" + s.keepField3 + "</td>";
							diplay += "</tr>";
						}

						$("#tbody3").html(diplay);
					}
				},
				error : function() {
				}
			});
}