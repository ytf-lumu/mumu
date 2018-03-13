package com.luowg.person.action;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.beans.PropertyEditorSupport;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
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
	private int width = 90;//验证码宽度
    private int height = 40;//验证码高度
    private int codeCount = 4;//验证码个数
    private int lineCount = 19;//混淆线个数

    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
    
    @RequestMapping(value = "/code/{time}",method = RequestMethod.GET)
    public void getCode(@PathVariable("time") String time, HttpServletRequest request,
                        HttpServletResponse response) throws IOException{
        //定义随机数类
        Random r = new Random();
        //定义存储验证码的类
        StringBuilder builderCode = new StringBuilder();
        //定义画布
        BufferedImage buffImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //得到画笔
        Graphics g = buffImg.getGraphics();
        //1.设置颜色,画边框
        g.setColor(Color.black);
        g.drawRect(0,0,width,height);
        //2.设置颜色,填充内部
        g.setColor(Color.white);
        g.fillRect(1,1,width-2,height-2);
        //3.设置干扰线
        g.setColor(Color.gray);
        for (int i = 0; i < lineCount; i++) {
            g.drawLine(r.nextInt(width),r.nextInt(width),r.nextInt(width),r.nextInt(width));
        }
        //4.设置验证码
        g.setColor(Color.blue);
        //4.1设置验证码字体
        g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,15));
        for (int i = 0; i < codeCount; i++) {
            char c = codeSequence[r.nextInt(codeSequence.length)];
            builderCode.append(c);
            g.drawString(c+"",15*(i+1),15);
        }
        //5.输出到屏幕
        ServletOutputStream sos = response.getOutputStream();
        ImageIO.write(buffImg,"png",sos);
        //6.保存到session中
        HttpSession session = request.getSession();
        session.setAttribute("codeValidate",builderCode.toString());
        //7.禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/png");
        //8.关闭sos
        sos.close();
    }
	
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
			
			String code=((String) request.getSession().getAttribute("codeValidate")).toLowerCase();
			String code2=p.getCodes().toLowerCase();
			if(code.equalsIgnoreCase(code2)){
			
			if(p1==null){
				n.setSuccess(false);
				}else{
					request.getSession().setAttribute("pid", p1.getId());
					request.getSession().setAttribute("pname", p1.getName());
					request.getSession().setAttribute("pass", p1.getPassword());
					request.setAttribute("person", p);
				}
			}else{
				
				n.setSuccess(false);
			}
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
	
	/**
	 * 报告导出
	 * @return
	 * @throws Exception 
	 * @throws IOException 
	 */
	/*@RequestMapping(value = "index2Exp")
	public ModelAndView index2Exp(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String prdName = request.getParameter("prdName");
		String empName = request.getParameter("empName");
		List lists =empPrdService.getStatistics(prdName,empName);
		 List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();
		 	entity.add(new ExcelExportEntity("序号", "number"));
	        entity.add(new ExcelExportEntity("系统名称", "sourceName"));
	        entity.add(new ExcelExportEntity("产品经理", "proManager"));
	        entity.add(new ExcelExportEntity("运维人员", "operator"));
	        entity.add(new ExcelExportEntity("业务顾问", "busiMaster"));
	        entity.add(new ExcelExportEntity("系统设计", "sysDesi"));
	        entity.add(new ExcelExportEntity("开发人员", "coder"));
	        entity.add(new ExcelExportEntity("系统传输", "sysTran"));
	        entity.add(new ExcelExportEntity("部门主管", "deptLeader"));
	        
	        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	        for (int i = 0; i < lists.size(); i++) {
	        	Object[] ob = (Object[]) lists.get(i);
	        	Map<String, Object> map;
	    		map = new HashMap<String, Object>();
	    		map.put("number",i+1);
	    		map.put("sourceName",ob[1]);
	    		map.put("proManager",ob[2]);
	    		map.put("operator",ob[3]);
	    		map.put("busiMaster",ob[4]);
	    		map.put("sysDesi",ob[5]);
	    		map.put("coder",ob[6]);
	    		map.put("sysTran",ob[7]);
	    		map.put("deptLeader",ob[8]);
	    		
	    		
	    		list.add(map);
			}
	        
	        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("产品角色", "产品角色"), entity,   list);
	       

	        String filename=URLEncoder.encode("产品角色.xls","utf-8"); //解决中文文件名下载后乱码的问题  
	        response.setCharacterEncoding("utf-8");  
	        response.setHeader("Content-Disposition","attachment; filename="+filename+"");  
	 
	        ServletOutputStream  out =response.getOutputStream();  
	        //输出 
	        workbook.write(out);
			return null;
		
	}*/
	
	@RequestMapping(value="/idea")
	public void poi(DataTablesInput dataTablesInput,HttpServletRequest request,HttpServletResponse response,Person p) throws Exception{
		 // 1.创建一个workbook，对应一个Excel文件
	      HSSFWorkbook wb = new HSSFWorkbook();
	      // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
	      HSSFSheet sheet = wb.createSheet("用户信息表");
	      // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
	      HSSFRow row = sheet.createRow((int) 0);
	      // 4.创建单元格，设置值表头，设置表头居中
	      HSSFCellStyle style = wb.createCellStyle();
	      // 居中格式
	      //style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	 
	      // 设置表头
	      HSSFCell cell = row.createCell(0);
	      cell.setCellValue("序号");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(1);
	      cell.setCellValue("姓名");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(2);
	      cell.setCellValue("用户级别");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(3);
	      cell.setCellValue("登录帐号");
	      cell.setCellStyle(style);
	 
	      cell = row.createCell(4);
	      cell.setCellValue("身份证号");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(5);
	      cell.setCellValue("性别");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(6);
	      cell.setCellValue("联系号码");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(7);
	      cell.setCellValue("email");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(8);
	      cell.setCellValue("qq");
	      cell.setCellStyle(style);
	      
	      cell = row.createCell(9);
	      cell.setCellValue("状态");
	      cell.setCellStyle(style);
	      
	      DataTablesOutput<Person> f = personService.findDataTables(dataTablesInput,p);
		 List<Person> l=f.getData();
		 for (int i = 0; i < l.size(); i++) {
		        row = sheet.createRow((int) i + 1);
		        Person li= l.get(i);
		        // 创建单元格，设置值
		        row.createCell(0).setCellValue(li.getId());
		        row.createCell(1).setCellValue(li.getName());
		        row.createCell(2).setCellValue(li.getLevel());
		        row.createCell(3).setCellValue(li.getLoginname());
		        row.createCell(4).setCellValue(li.getUserid());
		        row.createCell(5).setCellValue(li.getSex());
		        row.createCell(6).setCellValue(li.getPhone());
		        row.createCell(7).setCellValue(li.getEmail());
		        row.createCell(8).setCellValue(li.getQq());
		        row.createCell(9).setCellValue(li.getStatus());
		      }
		 String fileName = "用户信息表";
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
