package com.luowg.product.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.product.mapper.ProductMapper;
import com.luowg.product.po.Product;
import com.luowg.product.service.IProductService;

@Service(value="productService")
public class ProductServiceImpl implements IProductService{
	@Autowired
	private ProductMapper productMapper;

	@Override
	public DataTablesOutput<Product> findDataTables(
			DataTablesInput dataTablesInput,Product p) throws Exception {
		Long count = productMapper.findCount(p);
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("dataTablesInput", dataTablesInput);
		m.put("product", p);
		List<Product> datas = productMapper.findDataTables(m);
		
		DataTablesOutput<Product> n = new DataTablesOutput<Product>();
		n.setRecordsFiltered(count);
		n.setRecordsTotal(count);
		n.setData(datas);
		return n;
	}

	@Override
	public Product getById(String id) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.getById(id);
	}

	@Override
	public void save(Product p) throws Exception {
		p.setId(UUID.randomUUID().toString().replace("-", ""));
		p.setJoinTime(new Date());
		productMapper.save(p);
	}

	@Override
	public void update(Product p) throws Exception {
		productMapper.update(p);
		
	}

	@Override
	public void delete(Product p) throws Exception {
		productMapper.delete(p);
		
	}

	
}
