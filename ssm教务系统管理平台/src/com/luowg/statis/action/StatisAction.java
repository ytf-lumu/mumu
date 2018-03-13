package com.luowg.statis.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luowg.commons.datatables.DataTablesInput;
import com.luowg.commons.datatables.DataTablesOutput;
import com.luowg.statis.po.statis;
import com.luowg.statis.service.IStatisService;


@Controller
@RequestMapping("/statis")
public class StatisAction {
	@Autowired
	private IStatisService statisService;
	@RequestMapping(value="/idea")
	public void poi(DataTablesInput dataTablesInput,HttpServletRequest request,HttpServletResponse response,statis p) throws Exception{
		 // 1.创建一个workbook，对应一个Excel文件
	      HSSFWorkbook wb = new HSSFWorkbook();
	      // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
	      HSSFSheet sheet = wb.createSheet("教育教师培训统计表");
	      // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
	      HSSFRow row = sheet.createRow((int) 0);
	      // 4.创建单元格，设置值表头，设置表头居中
	      HSSFCellStyle style = wb.createCellStyle();
	      // 居中格式
	      //style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	      CellStyle cellStyle = wb.createCellStyle();  
	        CreationHelper creationHelper = wb.getCreationHelper();  
	        cellStyle.setDataFormat(  
	                creationHelper.createDataFormat().getFormat("yyyy-MM-dd  hh:mm:ss")  
	                );  
	      // 设置表头
	      HSSFCell cell = row.createCell(0);
	      cell.setCellValue("序号");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(1);
	      cell.setCellValue("姓名");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(2);
	      cell.setCellValue("时间");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(3);
	      cell.setCellValue("性别");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(4);
	      cell.setCellValue("职称");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(5);
	      cell.setCellValue("学院");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(6);
	      cell.setCellValue("专业");
	      cell.setCellStyle(style);
	      
	     /* cell = row.createCell(7);
	      cell.setCellValue("email");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(8);
	      cell.setCellValue("qq");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(9);
	      cell.setCellValue("状态");
	      cell.setCellStyle(style);*/
	     
	      /*String s2=request.getParameter("time");
	      
	      p.setName(s2);*/
	      DataTablesOutput<statis> f = statisService.findDataTables(dataTablesInput,p);
		 List<statis> l=f.getData();
		 for (int i = 0; i < l.size(); i++) {
		        row = sheet.createRow((int) i + 1);
		        statis li= l.get(i);
		        // 创建单元格，设置值
		        row.createCell(0).setCellValue(li.getId());
		        row.createCell(1).setCellValue(li.getName());
		        row.createCell(2).setCellValue(li.getTime());
		        row.createCell(3).setCellValue(li.getSex());
		        row.createCell(4).setCellValue(li.getLevel());		     
		        row.createCell(5).setCellValue(li.getSchool());
		        row.createCell(6).setCellValue(li.getDomin());
		       
		        
		      }
		 String fileName = "教育教师培训统计表";
	      ByteArrayOutputStream os = new ByteArrayOutputStream();
	      wb.write(os);
	      byte[] content = os.toByteArray();
	      InputStream is = new ByteArrayInputStream(content);
	      // 设置response参数，可以打开下载页面
	      response.reset();
	      response.setContentType("application/vnd.ms-excel;charset=utf-8");
	      response.setHeader("Content-Disposition", "attachment;filename="
	          + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
	      ServletOutputStream out = response.getOutputStream();
	      BufferedInputStream bis = null;
	      BufferedOutputStream bos = null;
	 
	      try {
	        bis = new BufferedInputStream(is);
	        bos = new BufferedOutputStream(out);
	        byte[] buff = new byte[2048];
	        int bytesRead;
	        // Simple read/write loop.
	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
	          bos.write(buff, 0, bytesRead);
	        }
	      } catch (Exception e) {
	        // TODO: handle exception
	        e.printStackTrace();
	      } finally {
	        if (bis != null)
	          bis.close();
	        if (bos != null)
	          bos.close();
	      }
	}
}
