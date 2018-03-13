package com.luowg.brand.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luowg.brand.bo.Brand;
import com.luowg.brand.service.IBrandService;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.commons.json.AjaxJson;
import com.luowg.person.po.Person;

@Controller
@RequestMapping("/brand")
public class BrandAction {
@Autowired	
private IBrandService brandService;
@RequestMapping(value="/getBrands",method = RequestMethod.POST)//请求这个方法时,绑定一个唯一路径
public @ResponseBody DataTablesOutput<Brand>  getBrands(HttpServletRequest request,  DataTablesInput dataTablesInput,Brand b){
	DataTablesOutput<Brand> findDataTables = null;
	try {		
		findDataTables = brandService.getDataTables(request,dataTablesInput, b);
		
		//request.getSession().setAttribute("", "");
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return findDataTables;
}

@RequestMapping(value="/brandDetail")//请求这个方法时,绑定一个唯一路径
public String  brandDetail(HttpServletRequest request){
	Brand b = null;
	try {
		b = brandService.getId(request.getParameter("id"));
		request.setAttribute("brand", b);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "Brand_Manage";
}
@RequestMapping(value="/save")//请求这个方法时,绑定一个唯一路径
public  String  add(HttpServletRequest request,HttpServletResponse s,Brand b){
	AjaxJson n = new AjaxJson();
	n.setSuccess(true);
	try {
		
		 MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)request;
		    MultipartFile file = mreq.getFile("file");
		    String fileName = file.getOriginalFilename();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		    // request.getSession().getServletContext().getRealPath("/upload")
		    String  savePath = "E:\\java课件\\spring-mybatis-springMVC\\WebRoot\\upload";
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
		   	System.out.println(savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.')));
		    String nb=savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
		   	FileOutputStream fos = new FileOutputStream(savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.')));
		   
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
		
		
		b.setLogo(nb);
		brandService.save(b);
		request.setAttribute("brand", b);
		
	} catch (Exception e) {
		e.printStackTrace();
		n.setSuccess(false);
	}
	return "Add_Brand";
}
//@RequestMapping(value="/uploads",method = RequestMethod.POST)
public String upload(HttpServletRequest req) throws Exception{
	String n;
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
   	System.out.println(savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.')));
    n=sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
   	FileOutputStream fos = new FileOutputStream(savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.')));
   
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
     
    return n;
}

@RequestMapping(value="/updateBrand")//请求这个方法时,绑定一个唯一路径
public  @ResponseBody AjaxJson  updateBrand(HttpServletRequest request,Brand b){
	AjaxJson n = new AjaxJson();
	n.setSuccess(true);
	try {
		brandService.updateBrand(b);
		request.setAttribute("brand", b);
	} catch (Exception e) {
		e.printStackTrace();
		n.setSuccess(false);
	}
	return n;
}
@RequestMapping(value="/deleteBrand")//请求这个方法时,绑定一个唯一路径
public  @ResponseBody AjaxJson  deleteBrand(HttpServletRequest request,Brand b){
	AjaxJson n = new AjaxJson();
	n.setSuccess(true);
	try {
		brandService.deleteBrand(b);
		request.setAttribute("brand", b);
	} catch (Exception e) {
		e.printStackTrace();
		n.setSuccess(false);
	}
	return n;
}
}
