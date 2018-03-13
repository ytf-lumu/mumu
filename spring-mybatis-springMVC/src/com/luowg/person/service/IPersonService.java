package com.luowg.person.service;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;
import com.luowg.person.po.Person;

public interface IPersonService {
	public DataTablesOutput<Person> findDataTables(DataTablesInput dataTablesInput,Person p) throws Exception;
	public Person getById(String id) throws Exception;
	public void save(Person p) throws Exception;
	public void update(Person p) throws Exception;
	public void delete(Person p) throws Exception;
}
