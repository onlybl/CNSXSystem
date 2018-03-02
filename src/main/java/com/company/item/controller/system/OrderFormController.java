package com.company.item.controller.system;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.company.item.model.system.Sale;
import com.company.item.service.system.SaleService;


@Controller
@Scope("prototype")
@RequestMapping("/orderFormController")
public class OrderFormController {
	
	@Resource
	private SaleService saleService;
	
	//查询显示方法
	@RequestMapping(value="list.do",produces ="application/json;charset=utf-8")
	public String list(Sale sale,Model model) {
		
		List<Sale> saleList=saleService.queryAllSale();
		model.addAttribute("saleList", saleList);
		return "view/system/saleManage/finishedorderList2";
	}
	
	//新增销售记录方法
	@RequestMapping(value="orderAdd.do",produces ="application/json;charset=utf-8")
	public String insert(Sale sale) {
		
		saleService.addSale(sale);
		return "redirect:/orderFormController/list.do";
	}
	
	//删除方法
	@RequestMapping(value="delete.do",produces ="application/json;charset=utf-8")
	public String delete(Sale sale, String saleId) {
		
		saleService.deleteSaleBySale(sale);
		return "redirect:/orderFormController/list.do";
	}
	
	//修改回显方法
		@RequestMapping(value="updateView.do",produces ="application/json;charset=utf-8")
		public String updateView(Sale sale,String saleId,Model model) {
			Sale s=saleService.querySaleBySaleId(saleId);
			model.addAttribute("sale", s);
			return "view/system/saleManage/modifyMsg";
		}
	//修改回显方法
		@RequestMapping(value="update.do",produces ="application/json;charset=utf-8")
		public String update(Sale sale,String saleId,Model model) {
			saleService.updateSale(sale);
			return "redirect:/orderFormController/list.do";
		}
}