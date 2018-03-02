package com.company.item.dao.system;

import java.util.List;

import com.company.item.model.system.Sale;
import com.company.item.model.system.User;

public interface SaleMapper {

	int deleteByPrimaryKey(String saleId);

	int insert(Sale record);

	int insertSelective(Sale record);

	Sale selectByPrimaryKey(String saleId);

	int updateByPrimaryKeySelective(Sale record);

	int updateByPrimaryKey(Sale record);

	List<Sale> queryAllSale();

	void deleteSaleBySale(Sale sale);

}