package com.luowg.person.service;

import java.util.List;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;
import com.luowg.person.po.Person;
import com.luowg.person.po.Text;

public interface IPersonService {
	public DataTablesOutput<Person> findDataTables(DataTablesInput dataTablesInput,Person p) throws Exception;
	public Person getById(String id) throws Exception;
	public void save(Person p) throws Exception;
	public List<Text> ztree() throws Exception ;
	public Person login(Person p) throws Exception;
	public void update(Person p) throws Exception;
	public void delete(Person p) throws Exception;
 }
