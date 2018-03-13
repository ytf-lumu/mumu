<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>       
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/codemirror.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.spring-friendly.js"></script>
		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script> 
        <script src="${pageContext.request.contextPath}/assets/layer/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate5.0.9/laydate.js" type="text/javascript"></script>
       
<title>公告信息</title>
</head>

<body>

<div class="add_menber" id="add_menber_style" style="display:none">
    <form id="form">
    <ul class=" page-content">
 <td>各位教学、学生们，准备开学啦，开心把</td>    
    </ul>
    </form>
 </div>
 <div class="add_menber" id="add_menber_style2" style="display:none">
    <form id="form">
    <ul class=" page-content">
   <td>各位教学、学生们，准备放假啦，放假别忘记写作业哟</td>  
    </ul>
    </form>
 </div>
 <div class="margin clearfix">
   <!-- <div class="border clearfix">
       <span class="l_f">
        <a href="Competence.html" id="Competence_add" class="btn btn-warning" title="添加公告"><i class="fa fa-plus"></i> 添加公告</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
       <span class="r_f">共：<b>5</b>类</span>
     </div> -->
     <div class="compete_list">
       <table id="sample-table-1" class="table table-striped table-bordered table-hover">
		 <thead>
			<tr>			 
			  <th>序号</th>
			  <th>通知公告标题</th>
              <th>发布时间</th>
            			 
             </tr>
		    </thead>
             <tbody>
			  <tr  name="mmsg2" class="mmsg2">				
				<td id="msg1" >1</td>
				<td>放假啦</td>
				<!-- <td class="hidden-480">admin</td> -->
				<td>2017年12月15日</td>
				
				<!-- <td>
                 <a title="编辑" onclick="Competence_modify('560')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>        
                 <a title="删除" href="javascript:;"  onclick="Competence_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
				</td> -->
			   </tr>
               <tr name="mmsg" class="mmsg">				
				<td id="msg2" >2</td>
				<td >开学啦</td>
				<!-- <td class="hidden-480">admin</td> -->
				<td>2018年3月1日</td>								
			   </tr>	
              										
		      </tbody>
	        </table>
     </div>
 </div>
</body>
</html>
<script type="text/javascript">
 $('.mmsg').on('click', function(){
    layer.open({
        type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
        title: '信息详情',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['400px' , '400px'],
        content:$('#add_menber_style'),
	    /* btn:['确认','取消'], */	
		yes:function(index,layero){
		 var num=0;
		 var str="";
     	
		  		     				
		}
    });
});

 $('.mmsg2').on('click', function(){
    layer.open({
        type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
        title: '信息详情',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['400px' , '400px'],
        content:$('#add_menber_style2'),
	    /* btn:['确认','取消'], */	
		yes:function(index,layero){
		 var num=0;
		 var str="";
     	
		  		     				
		}
    });
});

</script>