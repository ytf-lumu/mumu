package com.luowg.category.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 *用户po 
 */
public class Category implements Serializable {
	
	//属性名和数据库表的字段对应
	private String id;
	private String categoryname;//类别
	private String fater;// 父类
	private String sort;// 排序
	private String note;// 备注
	private List<Category> childern =new ArrayList<Category>();
	
	public List<Category> getChildern() {
		return childern;
	}
	public void setChildern(List<Category> childern) {
		this.childern = childern;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getFater() {
		return fater;
	}
	public void setFater(String fater) {
		this.fater = fater;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
	

}
