package com.luowg.order.action;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.luowg.order.po.Orders;
import com.luowg.order.service.IOrderService;

@Controller
@RequestMapping("/orders")//注解为控制器指定可以处理哪些 URL 
public class OrdersAction{
	@Autowired
	private IOrderService ordersService;
	//指定可以处理哪些 URL 请求
	//required=false表示不传的话，会给参数赋值为null ,此时如果参数是基本类型,会报错,因为基本类型不能为null
	@RequestMapping("/getOrder")//请求这个方法时,绑定一个唯一路径
	public String getOrder(Map<String,Object> map,@RequestParam(required=true)int id
			,@RequestParam(required=false)String name){
		Orders  od =  ordersService.getById(id);
		map.put("p", od);
		return "order/orders";
	}
	/**
	 * 保存新记录
	 */
	@RequestMapping("/saveOrders")//请求这个方法时,绑定一个唯一路径
	public String save(HttpServletRequest req,Orders u)
	{
		ordersService.save(u);
		return "order/orders";
	}
	
	@RequestMapping(value="/orderCount4BarByMonth")
	public @ResponseBody List orderCount4BarByMonth(HttpServletRequest request) {
		System.out.println(request.getParameter("name"));
		Object[] m1 = {"一月", 200};
		Object[] m2 = {"二月", 1200};
		Object[] m3 = {"三月", 1000};
		Object[] m4 = {"四月", 800};
		
		List n = new ArrayList();
		n.add(m1);
		n.add(m2);
		n.add(m3);
		n.add(m4);
		return n;
	}@RequestMapping(value="/orderCount4BarByMonth4Pie")
	public @ResponseBody List orderCount4BarByMonth4Pie(HttpServletRequest request) {
		System.out.println(request.getParameter("name"));
		Object[] m1 = {"一月", 200};
		Object[] m2 = {"二月", 1200};
		Object[] m3 = {"三月", 1000};
		Object[] m4 = {"四月", 800};
		
		List n = new ArrayList();
		n.add(m1);
		n.add(m2);
		n.add(m3);
		n.add(m4);
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
	public void initBinder(WebDataBinder binder) { 
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		dateFormat.setLenient(true); 
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
	}
}
