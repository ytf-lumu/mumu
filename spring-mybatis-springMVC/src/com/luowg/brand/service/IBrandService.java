package com.luowg.brand.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.luowg.brand.bo.Brand;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.person.po.Person;


public interface IBrandService {
	public DataTablesOutput<Brand> getDataTables(HttpServletRequest q, DataTablesInput dataTablesInput,Brand b) throws Exception;
	public void save(Brand b) throws Exception;
	public Brand getId(String id) throws Exception;
	public void updateBrand(Brand b) throws Exception;
	public void deleteBrand(Brand b) throws Exception;	
}
