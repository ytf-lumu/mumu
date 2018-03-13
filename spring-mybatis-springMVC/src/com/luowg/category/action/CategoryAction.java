package com.luowg.category.action;
import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.luowg.category.po.Category;
import com.luowg.category.service.ICategoryService;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.commons.tree.TreeNode;



@Controller
@RequestMapping("/category")//注解为控制器指定可以处理哪些 URL 
public class CategoryAction{
	@Autowired
	private ICategoryService categoryService;	
	@RequestMapping(value="/getCate")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody List<TreeNode>  getCate(HttpServletRequest request,Category p) throws Exception{
		List<TreeNode> nodes=categoryService.findDataTables(request, p);
		try {
			
			/*TreeNode n1 = new TreeNode();
			n1.setName("节点1");
			n1.setId("a");
			TreeNode n2 = new TreeNode();
			n2.setName("节点2");
			n2.setId("b");
			TreeNode n3 = new TreeNode();
			n3.setName("节点3");
			n3.setId("c");
			TreeNode n4 = new TreeNode();
			n4.setName("节点4");
			n4.setId("d");
			n4.setParent(true);
			
			TreeNode n5 = new TreeNode();
			n5.setName("节点4的子节点");
			n5.setId("d1");
			
			List<TreeNode> child = new ArrayList<TreeNode>();
			child.add(n5);
			
			n4.setChildren(child);
			nodes.add(n1);
			nodes.add(n2);
			nodes.add(n3);
			nodes.add(n4);*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nodes;
	}
		
	
	@RequestMapping(value="/save")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody AjaxJson  add(HttpServletRequest request,Category p){
		AjaxJson n = new AjaxJson();
		n.setSuccess(true);
		try {
			categoryService.save(p);
			request.setAttribute("Category", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	@RequestMapping(value="/update")
	public @ResponseBody AjaxJson update(HttpServletRequest request,Category p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			categoryService.update(p);
			request.setAttribute("Category", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	@RequestMapping(value="/delete")
	public @ResponseBody AjaxJson delete(HttpServletRequest request,Category p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			categoryService.delete(p);
			request.setAttribute("Category", p);
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
