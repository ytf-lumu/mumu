package com.luowg.dept.service;

import java.util.List;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.dept.po.Dept;



public interface IDeptService {
	public DataTablesOutput< Dept> findDataTables(DataTablesInput dataTablesInput, Dept p) throws Exception;
	public  Dept getById(String id) throws Exception;
	public void save( Dept p) throws Exception;
	public void update(Dept p) throws Exception;
	public Dept login( Dept p) throws Exception;
 }
