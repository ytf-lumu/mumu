package com.luowg.person.action;
import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.person.po.Person;
import com.luowg.person.service.IPersonService;

@Controller
@RequestMapping("/person")//注解为控制器指定可以处理哪些 URL 
public class PersonAction{
	@Autowired
	private IPersonService personService;
	@RequestMapping(value="/getPersons",method = RequestMethod.POST)//请求这个方法时,绑定一个唯一路径
	public @ResponseBody DataTablesOutput<Person>  getPersons(HttpServletRequest request,  DataTablesInput dataTablesInput,Person p){
		DataTablesOutput<Person> findDataTables = null;
		try {		
			findDataTables = personService.findDataTables(dataTablesInput,p);
			System.out.println(p.getStartTime()+p.getUsername());
			System.out.println(p.getEndTime());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return findDataTables;
	}
	
	@RequestMapping(value="/personDetail")//请求这个方法时,绑定一个唯一路径
	public String  personDetail(HttpServletRequest request){
		Person p = null;
		try {
			p = personService.getById(request.getParameter("id"));
			request.setAttribute("person", p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "member-show";
	}
	
	@RequestMapping(value="/save")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody AjaxJson  add(HttpServletRequest request,Person p){
		AjaxJson n = new AjaxJson();
		n.setSuccess(true);
		try {
			personService.save(p);
			request.setAttribute("person", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	@RequestMapping(value="/update")
	public @ResponseBody AjaxJson update(HttpServletRequest request,Person p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			personService.update(p);
			request.setAttribute("person", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	@RequestMapping(value="/delete")
	public @ResponseBody AjaxJson delete(HttpServletRequest request,Person p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			personService.delete(p);
			request.setAttribute("person", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	/**
	 * 处理局部异常（任何在Controller内出现的异常都会被该方法处理）,此时全局异常处理会被忽略
	 * 如果不指定,就会被全局异常处理
	 * @param ex
	 * @return
	 */
	@ExceptionHandler
	public ModelAndView exceptionHandler(Exception ex){
		ex.printStackTrace();
	    ModelAndView mv = new ModelAndView("error");
	    mv.addObject("exception", ex);
	    mv.addObject("message", "系统异常,请联系管理员!");
	    System.out.println("in testExceptionHandler");
	    return mv;
	}
	
	/**
	 * @InitBinder 请求参数初始化时如果是日期类型,先转换一下
	 * @param binder
	 */
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(Date.class,
				new PropertyEditorSupport() {
					public void setAsText(String value) {
						try {
							setValue(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(value));
						} catch (ParseException e) {
							if(value != null && !"".equals(value)){
								try {
									setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
								} catch (ParseException e1) {
									e1.printStackTrace();
									setValue(null);
								}
							}
						}
					}

					public String getAsText() {
						return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format((Date) getValue());
					}

				});
	}
}
