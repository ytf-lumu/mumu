package com.luowg.commons.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
/**
 * 全局异常
 * @author luowenguan
 * Spring可以使用@ ControllerAdvice来捕获controller中的异常
 */
//@ControllerAdvice
public class GlobalException {
	@ExceptionHandler
    public ModelAndView exceptionHandler(Exception ex){
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("message", ex.getMessage());
        System.out.println("in testControllerAdvice");
        return mv;
    }
}
