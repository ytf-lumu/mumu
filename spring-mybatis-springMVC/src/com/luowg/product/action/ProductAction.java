package com.luowg.product.action;
import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.product.po.Product;
import com.luowg.product.service.IProductService;


@Controller
@RequestMapping("/product")//注解为控制器指定可以处理哪些 URL 
public class ProductAction{
	@Autowired
	private IProductService productService;
	@RequestMapping(value="/getProducts",method = RequestMethod.POST)//请求这个方法时,绑定一个唯一路径
	public @ResponseBody DataTablesOutput<Product>  getProducts(HttpServletRequest request,  DataTablesInput dataTablesInput,Product p){
		DataTablesOutput<Product> findDataTables = null;
		try {		
			findDataTables = productService.findDataTables(dataTablesInput,p);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return findDataTables;
	}
	
	@RequestMapping(value="/productDetail")//请求这个方法时,绑定一个唯一路径
	public String  ProductDetail(HttpServletRequest request){
		Product p = null;
		try {
			p = productService.getById(request.getParameter("id"));
			request.setAttribute("product", p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "member-show";
	}
	@RequestMapping(value="/upload")
	public String upload(HttpServletRequest req){
		try {
	    MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)req;
	    MultipartFile file = mreq.getFile("file");
	    String fileName = file.getOriginalFilename();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    
	    String  savePath = req.getSession().getServletContext().getRealPath("/upload");
	    File filePath = new File(savePath);
	   	 //判断上传文件的保存目录是否存在
	   	 if (!filePath.exists() || !filePath.isDirectory()) {
	   		boolean f = filePath.mkdirs();
	   		filePath.setWritable(true, false);
	   		if(!f){
	   			throw new RuntimeException("文件路径"+savePath+"--创建失败");
	   		}
	   	 }
	   	InputStream in = file.getInputStream();
	    FileOutputStream fos;
		
			fos = new FileOutputStream(savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.')));
		
	   
	    //创建一个缓冲区
        byte buffer[] = new byte[1024];
        //判断输入流中的数据是否已经读完的标识
        int len = 0;
        //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
        while((len=in.read(buffer))>0){
        	fos.write(buffer, 0, len);
        }
	    fos.flush();
	    fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "upload";
	}
	
	@RequestMapping(value="/save")//请求这个方法时,绑定一个唯一路径
	public  @ResponseBody AjaxJson  add(HttpServletRequest request,Product p){
		AjaxJson n = new AjaxJson();
		n.setSuccess(true);
		try {
			productService.save(p);
			request.setAttribute("product", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	
	
	
	@RequestMapping(value="/update")
	public @ResponseBody AjaxJson update(HttpServletRequest request,Product p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			productService.update(p);
			request.setAttribute("product", p);
		} catch (Exception e) {
			e.printStackTrace();
			n.setSuccess(false);
		}
		return n;
	}
	@RequestMapping(value="/delete")
	public @ResponseBody AjaxJson delete(HttpServletRequest request,Product p){
		System.out.println(p.getId());
		AjaxJson n=new AjaxJson();
		n.setSuccess(true);
		try {
			productService.delete(p);
			request.setAttribute("product", p);
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
