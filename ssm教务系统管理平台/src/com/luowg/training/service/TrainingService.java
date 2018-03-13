package com.luowg.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.training.mapper.AuditMapper;
import com.luowg.training.po.Training;

@Service(value="trainingService")
public class TrainingService { 
  @Autowired
  AuditMapper auditMapper;
  
  public DataTablesOutput<Training> init(Training t){
	  DataTablesOutput<Training> d = new  DataTablesOutput<Training>();
	  try {
		List<Training> ls=auditMapper.init(t);
		d.setData(ls);
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return d;
  }
	
  public AjaxJson insert(Training t){
	  AjaxJson aj=new AjaxJson();	  
	  try {
		  aj.setSuccess(true);
		  auditMapper.insert(t);
		  
	} catch (Exception e) {
		aj.setSuccess(false);
		e.printStackTrace();
	}	  
	  return aj;
  }
	
}
