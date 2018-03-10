package com.luowg.training.action;

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
import com.luowg.training.po.Training;
import com.luowg.training.service.TrainingService;

@Controller
@RequestMapping(value="/training")
public class TrainingAction {
	@Autowired
	TrainingService trainingService;
	@RequestMapping(value="/init" , method=RequestMethod.POST)
	public @ResponseBody DataTablesOutput<Training> init(HttpServletRequest request,  DataTablesInput dataTablesInput,Training t){
		DataTablesOutput<Training> dt=trainingService.init(t);
		return dt;
		
	}
	
	@RequestMapping(value="/ins")
	public @ResponseBody AjaxJson ins(HttpServletRequest request,Training t){
		//System.out.println(l.getQualified()+"+++++++++++++"+l.getId());
		AjaxJson aj=trainingService.insert(t);		
		return aj;
	}

}

