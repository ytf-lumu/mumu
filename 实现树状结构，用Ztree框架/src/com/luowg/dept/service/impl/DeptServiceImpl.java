package com.luowg.dept.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.dept.mapper.DeptMapper;
import com.luowg.dept.po.Dept;
import com.luowg.dept.service.IDeptService;

@Service(value="deptService")
public class DeptServiceImpl implements IDeptService{
	@Autowired
	private DeptMapper deptMapper;

	public DataTablesOutput<Dept> findDataTables(
			DataTablesInput dataTablesInput, Dept p) throws Exception {
		Long count = deptMapper.findCount(p);
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("dataTablesInput", dataTablesInput);
		m.put("dept", p);
		List<Dept> datas = deptMapper.findDataTables(m);
		
		DataTablesOutput< Dept> n = new DataTablesOutput< Dept>();
		n.setRecordsFiltered(count);
		n.setRecordsTotal(count);
		n.setData(datas);
		return n;
	}

	@Override
	public Dept getById(String id) throws Exception {
		// TODO Auto-generated method stub
		return deptMapper.getById(id);
	}

	@Override
	public void save(Dept p) throws Exception {
		p.setId(UUID.randomUUID().toString().replace("-", ""));
		deptMapper.save(p);
	}

	

	@Override
	public  Dept login(Dept p) throws Exception {
		// TODO Auto-generated method stub
		return deptMapper.login(p);
	}

	@Override
	public void update(Dept p) throws Exception {
		// TODO Auto-generated method stub
		deptMapper.update(p);
	}

	
	

	
}
