package com.luowg.person.service.impl;

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
@Service(value="personService")
public class PersonServiceImpl implements IPersonService{
	@Autowired
	private PersonMapper personMapper;

	@Override
	public DataTablesOutput<Person> findDataTables(
			DataTablesInput dataTablesInput,Person p) throws Exception {
		Long count = personMapper.findCount(p);
		
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("dataTablesInput", dataTablesInput);
		m.put("person", p);
		List<Person> datas = personMapper.findDataTables(m);
		
		DataTablesOutput<Person> n = new DataTablesOutput<Person>();
		n.setRecordsFiltered(count);
		n.setRecordsTotal(count);
		n.setData(datas);
		return n;
	}

	@Override
	public Person getById(String id) throws Exception {
		// TODO Auto-generated method stub
		return personMapper.getById(id);
	}

	@Override
	public void save(Person p) throws Exception {
		//p.setId(UUID.randomUUID().toString().replace("-", ""));
		personMapper.save(p);
	}

	@Override
	public List<Text> ztree() throws Exception {
		 return  personMapper.selectNode();
	}

	@Override
	public Person login(Person p) throws Exception {
		// TODO Auto-generated method stub
		return personMapper.login(p);
	}

	@Override
	public void update(Person p) throws Exception {
		// TODO Auto-generated method stub
		personMapper.update(p);
	}

	@Override
	public void delete(Person p) throws Exception {
		// TODO Auto-generated method stub
		personMapper.delete(p);
	}

	
}
