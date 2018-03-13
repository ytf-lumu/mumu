package com.luowg.product.service;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;
import com.luowg.product.po.Product;


public interface IProductService {
	public DataTablesOutput<Product> findDataTables(DataTablesInput dataTablesInput,Product p) throws Exception;
	public Product getById(String id) throws Exception;
	public void save(Product p) throws Exception;
	public void update(Product p) throws Exception;
	public void delete(Product p) throws Exception;
}
