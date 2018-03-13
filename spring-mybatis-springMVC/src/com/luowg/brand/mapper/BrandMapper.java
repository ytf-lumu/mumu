package com.luowg.brand.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.luowg.brand.bo.Brand;
import com.luowg.person.po.Person;




public interface BrandMapper {
	public List<Brand> getDataTables(Map<String,Object> m) throws Exception;
	public void save(Brand p) throws Exception;
	public Long getCount(Brand p) throws Exception;
	public Brand getId(String id) throws Exception;
	public void updateBrand(Brand b) throws Exception;
	public void deleteBrand(Brand b) throws Exception;	
	public Long zgCount(String p) throws Exception;
}
