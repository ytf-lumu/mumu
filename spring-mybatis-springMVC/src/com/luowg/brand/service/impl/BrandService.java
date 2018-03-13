package com.luowg.brand.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.luowg.brand.bo.Brand;
import com.luowg.brand.mapper.BrandMapper;
import com.luowg.brand.service.IBrandService;
import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;



@Service(value="brandService")
public class BrandService implements IBrandService{
	@Autowired
	private BrandMapper brandMapper;
	@Override
	public void save(Brand b) throws Exception {
		
		b.setJoinTime(new Date());		
		b.setId(UUID.randomUUID().toString().replace("-", ""));
		Map<String,Object> m = new HashMap<String,Object>();
		
		m.put("brand", b);
		
		brandMapper.save(b);
		
	}
	public String upload(HttpServletRequest req) throws Exception{
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
	    String n=savePath+"/"+sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
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
	@Override
	public DataTablesOutput<Brand> getDataTables(HttpServletRequest p,DataTablesInput dataTablesInput,Brand b) throws Exception {
        Long count = brandMapper.getCount(b);
        Long  zg=brandMapper.zgCount("中国");
        Long  wg=count-zg;
		p.getSession().setAttribute("gn",wg);
		p.getSession().setAttribute("gw",zg);
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("dataTablesInput", dataTablesInput);
		m.put("brand", b);
		List<Brand> datas = brandMapper.getDataTables(m);
		//System.out.println("--:"+count+"--:"+zg+"--:"+wg);
		DataTablesOutput<Brand> n = new DataTablesOutput<Brand>();
		n.setRecordsFiltered(count);
		n.setRecordsTotal(count);
		n.setData(datas);
		return n;
	}
	@Override
	public Brand getId(String id) throws Exception {
		// TODO Auto-generated method stub
		return brandMapper.getId(id);
	}
	@Override
	public void updateBrand(Brand b) throws Exception {
		 brandMapper.updateBrand(b);
		
	}
	@Override
	public void deleteBrand(Brand b) throws Exception {
		brandMapper.deleteBrand(b);
		
	}

}
