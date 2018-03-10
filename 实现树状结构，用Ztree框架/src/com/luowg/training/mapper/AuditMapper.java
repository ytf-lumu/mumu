package com.luowg.training.mapper;

import java.util.List;

import com.luowg.training.po.Training;

public interface AuditMapper {

	public List<Training> init(Training training) throws Exception;
	public void insert(Training training) throws Exception;
	
}
