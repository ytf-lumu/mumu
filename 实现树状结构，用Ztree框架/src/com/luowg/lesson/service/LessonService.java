package com.luowg.lesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.lesson.mapper.LessonMapper;
import com.luowg.lesson.po.Lesson;
import com.luowg.person.po.Person;

@Service(value="lessonService")
public class LessonService {
	@Autowired
  LessonMapper lessonMapper;
	
	public DataTablesOutput<Lesson> init(Lesson lesson){
		DataTablesOutput<Lesson> n = new DataTablesOutput<Lesson>();
		try {
			List<Lesson> ls=lessonMapper.init(lesson);
			n.setData(ls);
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return n;
	} 
	
	
	public AjaxJson update(Lesson lesson){
		AjaxJson j=new AjaxJson();		
		try {
			lessonMapper.update(lesson);
			j.setSuccess(true);
		} catch (Exception e) {
			j.setSuccess(false);
			e.printStackTrace();
		}
		return j;
		
	}
}
