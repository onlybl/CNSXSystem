var pageNumb;
$(function() {
	loadwarehouseId();
	loadproduction(1);
})
function searchPage(n) {
	loadproduction(n);
}
function refresh(){
	loadproduction(pageNumb);
}
function loadwarehouseId() {
	$.ajax({
		
		url : "Inventories/loadwarehouse.do",
		type : "post",
		dataType : "json",
		data : {},
		success : function(list) {
			var option;
			for (var i = 0; i < list.length; i++) {
				var d = list[i];
				option += "<option  value='" + d.warehouseId + "'>"
						+ d.warehouseNo + "</option>";
			}
			$("#warehouseselect").html(option);
			$("#warehouseselect option[value='" + list[0].warehouseId + "']")
					.attr("selected", "selected");
		},
		error : function(i) {
		}
	});
}
function modifypw(productionNo, productionName, warehouseLocation,
		supportHotline, productInventoryId, warehouseId, warehouseNo) {
	$("#productionNo").text(productionNo);
	$("#productionName").text(productionName);
	$("#warehouseselect option[value='" + warehouseId + "']").attr("selected",
			"selected");
	$("#storeNo").text(warehouseNo);
	$("#storeaddress").val(warehouseLocation);
	$("#storecall").val(supportHotline);
	modifylm(productInventoryId);
}
function modifylm(productInventoryId) {
	layer.open({
		title : '修改产品仓库',
		type : 1,
		content : $("#displayid"),
		btn : [ '修改', '取消' ],
		yes : function(index) {
			layer.msg('你确定修改么？', {
				time : 0 // 不自动关闭
				,
				btn : [ '确定', '取消' ],
				yes : function(index) {
					$.ajax({
						url : "Inventories/modifywarehouseAinventories.do",
						type : "post",
						dataType : "text",
						data : {
							'productInventoryId' : productInventoryId,
							'warehouseId' : $(
									"#warehouseselect option:selected").val(),
							'warehouseLocation' : $("#storeaddress").val(),
							'supportHotline' : $("#storecall").val()
						},
						success : function(data) {
							refresh();
							if (data == "SUCCESS") {
								layer.alert('修改成功！', {
									title : '提示框',
									icon : 1,
								});
							} else {
								layer.alert("修改失败！\r\n", {
									title : '提示框',
									icon : 0,
								});
							}
						},
						error : function(data) {
							$.messager.alert('error');
						}
						
					});
					
					layer.close(index);
				}
			});
			layer.close(index);
		}
	});
	
}
function confirmWarehouse() {
	$.ajax({
		url : "Inventories/loadwarehousebyid.do",
		dataType : "json",
		type : "POST",
		data : {
			'warehouseId' : $("#warehouseselect option:selected").val()
		},
		success : function(data) {
			$("#storeaddress").val(data.warehouseLocation);
			$("#storeNo").text(data.warehouseNo);
			$("#storecall").val(data.supportHotline);
		},
		error : function(data) {
		}
	});
}
function loadproduction(pageindex) {
	$
			.ajax({
				url : "Inventories/loadproduction.do",
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
										"<td colspan='11'><div style='text-align:center; color:red'><h4>暂 无 数 据</h4></div></td>");
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
							diplay += "<td>" + s.keepField1 + "</td>";
							diplay += "<td>" + s.keepField2 + "</td>";
							diplay += "<td><span class='" + clstyle
									+ "' style='width:80px'>"
									+ s.productionQuantity + "</span></td>";
							diplay += "<td>" + s.keepField3 + "</td>";
							diplay += "<td>" + s.keepField4 + "</td>";
							diplay += "<td>" + s.keepField5 + "</td>";
							diplay += "<td class='td-manage'>";
							diplay += "<a title='修改信息' onclick='modifypw(\""
									+ s.keepField1
									+ "\",\""
									+ s.keepField2
									+ "\",\""
									+ s.keepField4
									+ "\",\""
									+ s.keepField5
									+ "\",\""
									+ s.productInventoryId
									+ "\",\""
									+ s.warehouseId
									+ "\",\""
									+ s.keepField3
									+ "\")'  class='btn btn-xs btn-success'><i class='icon-edit bigger-120'></i></a></td>";
							diplay += "</tr>"
						}

						$("#tbody").html(diplay);
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
