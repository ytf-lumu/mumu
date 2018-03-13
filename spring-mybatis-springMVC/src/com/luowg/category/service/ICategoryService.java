package com.luowg.category.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.luowg.category.po.Category;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.tree.TreeNode;
import com.luowg.order.po.Orders;
import com.luowg.order.po.User;


public interface ICategoryService {
	public List<TreeNode> findDataTables(HttpServletRequest request,Category p) throws Exception;	
	public void save(Category p) throws Exception;
	public void update(Category p) throws Exception;
	public void delete(Category p) throws Exception;
}
