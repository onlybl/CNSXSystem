package com.company.item.service.system;

import java.util.List;

import com.company.item.model.system.Sale;

public interface SaleService {

	int addSale(Sale sale);

	List<Sale> queryAllSale();

	void deleteSaleBySale(Sale sale);

	Sale querySaleBySaleId(String saleId);
	
	int updateSale(Sale sale);
}
