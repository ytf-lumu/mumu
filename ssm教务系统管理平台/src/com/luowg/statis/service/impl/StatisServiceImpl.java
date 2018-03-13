package com.luowg.statis.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.person.mapper.PersonMapper;
import com.luowg.person.po.Person;
import com.luowg.person.po.Text;
import com.luowg.person.service.IPersonService;
import com.luowg.statis.mapper.StatisMapper;
import com.luowg.statis.po.statis;
import com.luowg.statis.service.IStatisService;
@Service(value="statisService")
public  class StatisServiceImpl implements IStatisService{
	@Autowired
	private StatisMapper statisMapper;

	@Override
	public DataTablesOutput<statis> findDataTables(
			DataTablesInput dataTablesInput,statis s) throws Exception {
		Long count = statisMapper.findCount(s);
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("dataTablesInput", dataTablesInput);
		m.put("statis", s);
		List<statis> datas = statisMapper.findDataTables(m);
		
		DataTablesOutput<statis> n = new DataTablesOutput<statis>();
		n.setRecordsFiltered(count);
		n.setRecordsTotal(count);
		n.setData(datas);
		return n;
	}

	

	
}
