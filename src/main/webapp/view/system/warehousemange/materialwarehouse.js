var pageNumb;
$(function() {
	loadwarehouseId();
	loadproduction(1);
	loadproductionidname();
})

function getanodo(){
	var pid=$("#productionselect option:selected").val();
	if(pid!="all"){
		loadselectproduction(pid);
	}else{
		loadproduction(1);
	}
}

function searchPage(n) {
	loadproduction(n);
}
function refresh(){
	loadproduction(pageNumb);
}

function loadproductionidname() {
	$.ajax({
		url : "Inventories/loadproductionlist.do",
		type : "post",
		dataType : "json",
		data : {},
		success : function(list) {
			var option;
			option += "<option  value='all' selected='selected'>所有产品</option>";
			for (var i = 0; i < list.length; i++) {
				var d = list[i];
				option += "<option  value='" + d.productionId + "'>"
						+ d.productionName + "</option>";
			}
			$("#productionselect").html(option);
		},
		error : function(i) {
		}
	});
}

function loadwarehouseId() {
	$.ajax({
		
		url : "Inventories/loadStorehouse.do",
		type : "post",
		dataType : "json",
		data : {},
		success : function(list) {
			var option;
			for (var i = 0; i < list.length; i++) {
				var d = list[i];
				option += "<option  value='" + d.materialStorehouseId + "'>"
						+ d.materialStorehouseNo + "</option>";
			}
			$("#warehouseselect").html(option);
			$("#warehouseselect option[value='" + list[0].materialStorehouseId + "']")
					.attr("selected", "selected");
		},
		error : function(i) {
		}
	});
}
function modifypw(materialNo, materialName, materialStorehouseAddress,
		materialStorehouseContact, materialInventoriesId, materialStorehouseId, materialStorehouseNo) {
	$("#productionNo").text(materialNo);
	$("#productionName").text(materialName);
	$("#warehouseselect option[value='" + materialStorehouseId + "']").attr("selected",
			"selected");
	$("#storeNo").text(materialStorehouseNo);
	$("#storeaddress").val(materialStorehouseAddress);
	$("#storecall").val(materialStorehouseContact);
	modifylm(materialInventoriesId);
}
function modifylm(materialInventoriesId) {
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
						url : "Inventories/modifyStorehouseAinventories.do",
						type : "post",
						dataType : "text",
						data : {
							'materialInventoriesId' : materialInventoriesId,
							'materialStorehouseId' : $(
									"#warehouseselect option:selected").val(),
							'materialStorehouseAddress' : $("#storeaddress").val(),
							'materialStorehouseContact' : $("#storecall").val()
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
		url : "Inventories/loadmStorehousebyid.do",
		dataType : "json",
		type : "POST",
		data : {
			'materialStorehouseId' : $("#warehouseselect option:selected").val()
		},
		success : function(data) {
			$("#storeaddress").val(data.materialStorehouseAddress);
			$("#storeNo").text(data.materialStorehouseNo);
			$("#storecall").val(data.materialStorehouseContact);
		},
		error : function(data) {
		}
	});
}
function loadproduction(pageindex) {
	$
			.ajax({
				url : "Inventories/loadmeterial.do",
				dataType : "json",
				type : "POST",
				data : {
					"pageNumber" : pageindex,
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
							var colorn = s.thisMaterialTotal;
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
									+ s.thisMaterialTotal + "</span></td>";
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
									+ s.materialInventoriesId
									+ "\",\""
									+ s.materialStorehouseId
									+ "\",\""
									+ s.keepField3
									+ "\")'  class='btn btn-xs btn-success'><i class='icon-edit bigger-120'></i></a></td>";
							diplay += "</tr>";
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
function loadselectproduction(pid){
	$
	.ajax({
		url : "Inventories/loadproductionmaterial.do",
		dataType : "json",
		type : "POST",
		data : {
			"productionId" : pid,
		},
		success : function(data) {
				var diplay;
				
				for (var i = 0; i < data.length; i++) {
					var s = data[i];
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
					diplay += "<td>" + s.keepField1 + "</td>";
					diplay += "<td>" + s.keepField2 + "</td>";
					diplay += "<td><span class='" + clstyle
							+ "' style='width:80px'>"
							+ s.thisMaterialTotal + "</span></td>";
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
							+ s.materialInventoriesId
							+ "\",\""
							+ s.materialStorehouseId
							+ "\",\""
							+ s.keepField3
							+ "\")'  class='btn btn-xs btn-success'><i class='icon-edit bigger-120'></i></a></td>";
					diplay += "</tr>";
				}
				$("#ttabletbody").html(diplay);
				layer.open({
					title : '结果',
					area:['860px','400px']
					,shade:0
					,maxmin:true,
					type : 1,
					btn : [ '确定', '关闭' ],
					content : $("#ttable"),
					yes : function(index) {
						layer.close(index);
						layer.close(index);
					}});
		},
		error : function() {
		}
	});
	
};

