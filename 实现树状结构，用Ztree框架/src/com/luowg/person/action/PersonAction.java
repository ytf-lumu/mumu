package com.luowg.person.action;
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

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.person.po.Person;
import com.luowg.person.po.Text;
import com.luowg.person.po.TreeNode;
import com.luowg.person.service.IPersonService;


@Controller
@RequestMapping("/person")//注解为控制器指定可以处理哪些 URL 
public class PersonAction{
	@Autowired
	private IPersonService personService;
	/*
	 * 获取用户信息，以及用户查询
	 */
	@RequestMapping(value="/getPersons",method = RequestMethod.POST)//请求这个方法时,绑定一个唯一路径
	public @ResponseBody DataTablesOutput<Person>  getPersons(HttpServletRequest request,  DataTablesInput dataTablesInput,Person p){
		DataTablesOutput<Person> findDataTables = null;
		try {
			findDataTables = personService.findDataTables(dataTablesInput,p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return findDataTables;
	}
	/*
	 * 验证登录
	 */
	@RequestMapping(value="/login")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody AjaxJson login(HttpServletRequest request,Person p){
		Person p1 = null;
		AjaxJson n = new AjaxJson();
		n.setSuccess(true);
		try {
			p1 = personService.login(p);
			request.getSession().setAttribute("pid", p1.getId());
			request.getSession().setAttribute("pname", p1.getName());
			request.getSession().setAttribute("pass", p1.getPassword());
			request.setAttribute("person", p);
			if(p1.getLoginname()==null){n.setSuccess(false);}
		} catch (Exception e) {
			n.setSuccess(false);
			e.printStackTrace();
		}
		return n;
	}
	//跳转到个人信息页面
	@RequestMapping(value="/pp")//请求这个方法时,绑定一个唯一路径
	public String  pea(HttpServletRequest request){
		if(request.getSession().getAttribute("pname")!=null){
			return "admin_info";
		}else{return "login";}
		
	}
	@RequestMapping(value="/personDetail")//请求这个方法时,绑定一个唯一路径
	public String  personDetail(HttpServletRequest request){
		Person p = null;
		try {
			p = personService.getById(request.getParameter("id"));
			request.setAttribute("person", p);
		} catch (Exception e) {
			
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
	//修改用户信息
	@RequestMapping(value="/update")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody AjaxJson  update(HttpServletRequest request,Person p){
		AjaxJson n = new AjaxJson();
		n.setSuccess(true);
		System.out.println(p.getId());
		request.getParameter("p");
		try {
			personService.update(p);
			request.setAttribute("person", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	//删除用户
		@RequestMapping(value="/delete")//请求这个方法时,绑定一个唯一路径
		public  @ResponseBody AjaxJson  delete(HttpServletRequest request,Person p){
			AjaxJson n = new AjaxJson();
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
	@RequestMapping(value="/getCate")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody List<TreeNode>  getCate(HttpServletRequest request){
		List<TreeNode> nodes = new ArrayList<TreeNode>();
		
		try {
			List<Text> tx= personService.ztree();
			
			for(int i=0;i<tx.size();i++){					
				if(tx.get(i).getPid()==null||tx.get(i).getPid()==""){	
				TreeNode n = new TreeNode();
				n.setName("节点"+tx.get(i).getName());
				n.setId(tx.get(i).getId());
				n.setParent(true);
				List<TreeNode> child = new ArrayList<TreeNode>();
				for(int j=0;j<tx.size();j++){
					if(tx.get(i).getId().equalsIgnoreCase(tx.get(j).getPid())){
						TreeNode nChild = new TreeNode();	
						nChild.setName("节点"+tx.get(j).getName());
						nChild.setId(tx.get(j).getId());
						System.out.println("节点"+tx.get(j).getName());
						
						child.add(nChild);
						n.setChildren(child);
					}
				}
				nodes.add(n);
			
				}
				
			}
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
			nodes.add(n4);
			*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nodes;
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
