package com.luowg.dept.mapper;

import java.util.List;
import java.util.Map;

import com.luowg.dept.po.Dept;

public interface DeptMapper {
	public Long findCount(Dept p) throws Exception;
	public List<Dept> findDataTables(Map<String,Object> m) throws Exception;
	public Dept getById(String id) throws Exception;
	public void save(Dept p) throws Exception;		
	public Dept login(Dept p) throws Exception;
	public void update(Dept p) throws Exception;	
}
