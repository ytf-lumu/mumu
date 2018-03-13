package com.luowg.statis.service;

import java.util.List;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;
import com.luowg.person.po.Person;
import com.luowg.person.po.Text;
import com.luowg.statis.po.statis;

public interface IStatisService {
	public DataTablesOutput<statis> findDataTables(DataTablesInput dataTablesInput,statis p) throws Exception;	
 }
