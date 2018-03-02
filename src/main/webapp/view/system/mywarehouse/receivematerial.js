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

function selectpickinglistbyMnameTime() {
	$
			.ajax({
				url : "Statistics/selectPickinglistbyMnameTime.html",
				dataType : "json",
				type : "POST",
				data : {
					"MaterialName" : $("#sproductionName").val(),
					"FinishedTime" : $("#start").val()
				},
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
							var colorn = s.thisMaterialTotal;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.pickersNo + "</td>";
							diplay += "<td>" + s.materialNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.materialId
									+ ")'>"
									+ s.materialName
									+ "</a></td>";

							diplay += "<td>" + s.materialQuantity + "</td>";
							diplay += "<td>" + s.pickers + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.thisMaterialTotal + "</span></td>";
							diplay += "<td>" + s.materialStorehouseNo + "</td>";
							diplay += "<td>" + s.materialStorehouseAddress
									+ "</td>";
							diplay += "<td>" + s.pickingDate + "</td>";
							diplay += "</tr>"
						}
						$("#tbody3").html(diplay);
					}
				},
				error : function(data) {
				}
			});
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
				url : "Inventories/Meterialpickerlist.html",
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
							var colorn = s.thisMaterialTotal;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td><label><input type='checkbox' class='ace'  value='"
									+ s.pickingMaterialId
									+ "'><span class='lbl'></span></label></td>";

							diplay += "<td>" + s.pickersNo + "</td>";
							diplay += "<td>" + s.materialNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.materialId
									+ ")'>"
									+ s.materialName
									+ "</a></td>";

							diplay += "<td>" + s.materialQuantity + "</td>";
							diplay += "<td>" + s.pickers + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.thisMaterialTotal + "</span></td>";
							diplay += "<td>" + s.materialStorehouseNo + "</td>";
							diplay += "<td>" + s.materialStorehouseAddress
									+ "</td>";
							diplay += "<td class='td-manage'>";
							diplay += "<a title='接收任务' onclick='receivetask(\""
									+ s.pickingMaterialId
									+ "\")'  class='btn btn-xs btn-success'><i class='icon-plus bigger-120'></i></a></td>";
							diplay += "</tr>"
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
				url : "Inventories/beingprocessed.html",
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
							var colorn = s.thisMaterialTotal;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							var thisMaterialTotal = s.thisMaterialTotal
									- s.materialQuantity;
							diplay += "<tr><td class='td-manage'><button onclick='finishtask(\""
									+ s.pickingMaterialId
									+ "\",\""
									+ thisMaterialTotal
									+ "\",\""
									+ s.materialInventoriesId
									+ "\")' 'title='完成任务' class='btn btn-xs btn-success'><b>Complete</b></button></td>";
							diplay += "<td>" + s.pickersNo + "</td>";
							diplay += "<td>" + s.materialNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.materialId
									+ ")'>"
									+ s.materialName
									+ "</a></td>";

							diplay += "<td>" + s.materialQuantity + "</td>";
							diplay += "<td>" + s.pickers + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.thisMaterialTotal + "</span></td>";
							diplay += "<td>" + s.materialStorehouseNo + "</td>";
							diplay += "<td>" + s.materialStorehouseAddress
									+ "</td></tr>";
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
				url : "Inventories/finishedpickings.html",
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
							var colorn = s.thisMaterialTotal;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.pickersNo + "</td>";
							diplay += "<td>" + s.materialNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.materialId
									+ ")'>"
									+ s.materialName
									+ "</a></td>";

							diplay += "<td>" + s.materialQuantity + "</td>";
							diplay += "<td>" + s.pickers + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.thisMaterialTotal + "</span></td>";
							diplay += "<td>" + s.materialStorehouseNo + "</td>";
							diplay += "<td>" + s.materialStorehouseAddress
									+ "</td>";
							diplay += "<td>" + s.pickingDate + "</td>";
							diplay += "</tr>"
						}
						$("#tbody2").html(diplay);
					}
				},
				error : function() {
				}
			});
}
function receivetask(pickingMaterialId) {
	$.ajax({
		url : "Inventories/receivepickerlist.html",
		dataType : "text",
		type : "POST",
		data : {
			"pickingMaterialId" : pickingMaterialId
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
function finishtask(pickingMaterialId, thisMaterialTotal, materialInventoriesId) {
	$.ajax({
		url : "Inventories/finishedpickingMateriatask.html",
		dataType : "text",
		type : "POST",
		data : {
			"pickingMaterialId" : pickingMaterialId,
			"thisMaterialTotal" : thisMaterialTotal,
			"materialInventoriesId" : materialInventoriesId
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
		url : "Inventories/getcountpicking.html",
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
		url : "Inventories/receivepickerlist.html",
		dataType : "text",
		type : "POST",
		data : {
			"pickingMaterialId" : checkok
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
				url : "Inventories/pickingMaterialhistory.html",
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
							var colorn = s.thisMaterialTotal;
							if (colorn > 190) {
								clstyle = "label label-success radius";
							} else if (colorn > 98) {
								clstyle = "label label-warning radius";
							} else {
								clstyle = "label label-danger radius";
							}
							diplay += "<tr>";
							diplay += "<td>" + s.pickersNo + "</td>";
							diplay += "<td>" + s.materialNo + "</td>";
							diplay += "<td><a style='cursor: pointer' class='text-primary' onclick='production_show("
									+ s.materialId
									+ ")'>"
									+ s.materialName
									+ "</a></td>";

							diplay += "<td>" + s.materialQuantity + "</td>";
							diplay += "<td>" + s.pickers + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.thisMaterialTotal + "</span></td>";
							diplay += "<td>" + s.materialStorehouseNo + "</td>";
							diplay += "<td>" + s.materialStorehouseAddress
									+ "</td>";
							diplay += "<td>" + s.pickingDate + "</td>";
							diplay += "</tr>"
						}
						$("#tbody3").html(diplay);
					}
				},
				error : function() {
				}
			});
}