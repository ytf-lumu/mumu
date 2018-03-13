package com.luowg.category.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.category.mapper.CategoryMapper;
import com.luowg.category.po.Category;
import com.luowg.category.service.ICategoryService;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.tree.TreeNode;

@Service(value = "categoryService")
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<TreeNode> findDataTables(HttpServletRequest request, Category p)
			throws Exception {
		List<TreeNode> nodes = new ArrayList<TreeNode>();
		List<Category> datas = categoryMapper.findDataTables(p);

		for (Category ca : datas) {
			if (ca.getFater() == null) {
				//System.out.println("yiji:"+ca.getCategoryname());
				TreeNode no = new TreeNode();
				no.setId(ca.getId());
				no.setName(ca.getCategoryname());
				no.setParent(true);
				List<TreeNode> child = new ArrayList<TreeNode>();
				for (Category tr : datas) {
					if(ca.getId().equalsIgnoreCase(tr.getFater())){
					//System.out.println("erji:"+tr.getCategoryname());	
					TreeNode no1 = new TreeNode();
					no1.setId(tr.getId());
					no1.setName(tr.getCategoryname());
					child.add(no1);
					 }
				}
                no.setChildren(child);
				nodes.add(no);
			}

		}
		return nodes;
	}

	@Override
	public void save(Category p) throws Exception {
		p.setId(UUID.randomUUID().toString().replace("-", ""));
		categoryMapper.save(p);
	}

	@Override
	public void update(Category p) throws Exception {
		categoryMapper.update(p);

	}

	@Override
	public void delete(Category p) throws Exception {
		categoryMapper.delete(p);

	}

}
