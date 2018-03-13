package com.luowg.lesson.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.lesson.po.Lesson;
import com.luowg.lesson.service.LessonService;
import com.luowg.person.po.Person;

@Controller
@RequestMapping("/lesson")
public class LessonAction {

	@Autowired
	LessonService lessonService;
	
	@RequestMapping(value="/init",method = RequestMethod.POST)
	public @ResponseBody DataTablesOutput<Lesson> init(HttpServletRequest request,  DataTablesInput dataTablesInput,Lesson l){
		DataTablesOutput<Lesson> dataTablesOutput=lessonService.init(l);		
		return dataTablesOutput;
	}
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public @ResponseBody AjaxJson update(HttpServletRequest request,  DataTablesInput dataTablesInput,Lesson l){
		System.out.println(l.getQualified()+"+++++++++++++"+l.getId());
		AjaxJson aj=lessonService.update(l);
		
		return aj;
	}
}
