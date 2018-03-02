package com.company.item.service.system.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.item.dao.system.SaleMapper;
import com.company.item.model.system.Sale;
import com.company.item.service.system.SaleService;
import com.framework.utils.PrimaryKeyUtil;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleMapper saleMapper;
	
	public int addSale(Sale sale) {
		// TODO Auto-generated method stub
		sale.setSaleId(PrimaryKeyUtil.getPrimaryKey());
		return saleMapper.insert(sale);
	}

	public List<Sale> queryAllSale() {
		// TODO Auto-generated method stub
		return saleMapper.queryAllSale();
	}

	public void deleteSaleBySale(Sale sale) {
		// TODO Auto-generated method stub
		saleMapper.deleteSaleBySale(sale);
	}

	public Sale querySaleBySaleId(String saleId) {
		// TODO Auto-generated method stub
		return saleMapper.selectByPrimaryKey(saleId);
	}

	public int updateSale(Sale sale) {
		// TODO Auto-generated method stub
		return saleMapper.updateByPrimaryKeySelective(sale);
	}

}
