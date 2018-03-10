package com.luowg.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 自定义拦截器
 * @author luowenguan
 *
 */
public class MyInterceptor implements HandlerInterceptor {

	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("完全处理完请求后被调用,可用于清理资源等");

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		if(arg3==null){
			arg3 = new ModelAndView();
			arg3.addObject("age",34);//等于是request.setAttribute("age",34);
		}
		 System.out.println("业务处理器处理请求执行完成后,生成视图(也就是jsp)之前执行.");
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		System.out.println("业务处理器处理请求之前被调用");
		//做一下验证,比如登陆,如果不成功则跳转到login.jsp,并且return false;
		if(arg0.getSession().getAttribute("loginname")!=null){
			return true;
		}else {
			arg1.sendRedirect("login.jsp");
			return false;
			
		}
		
	}

}
