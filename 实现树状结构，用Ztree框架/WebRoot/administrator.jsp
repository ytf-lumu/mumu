<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
         <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="js/lrtk.js" type="text/javascript" ></script>
         <script src="assets/layer/layer.js" type="text/javascript"></script>	
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>管理员</title>
</head>

<body>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <form id="form">
    <ul class=" page-content">
    <li><label class="label_name">序号：</label><span class="add_name"><input id="id" name="id"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">姓名：</label><span class="add_name"><input value="" id="name" name="name" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">用户级别：</label><span class="add_name"><input id="level" name="level"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">用户帐号：</label><span class="add_name"><input id="loginname" name="loginname"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">身份证号：</label><span class="add_name"><input id="userid" name="userid"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">性别：</label><span class="add_name"><input id="sex" name="sex"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <!-- <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="sex" id="nan" 	  value="0"  type="radio" 	class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="sex" id="nv" 	  value="1" type="radio" 	class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="sex" id="noidea" value="2" type="radio" 	class="ace"><span class="lbl">保密</span></label>
     </span>
     <div class="prompt r_f"></div>
     </li> -->
     <li><label class="label_name">联系电话：</label><span class="add_name"><input id="phone" name="phone"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input id="email" name="email"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">qq：</label><span class="add_name">   <input id="qq" name="qq" type="text"  class="text_add" style=" width:250px"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状态：</label><span class="add_name"><input id="status" name="status" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">部门：</label><span class="add_name"><input id="dept" name="dept"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      
     
    </ul>
    </form>
 </div>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <div class="search_style">
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">姓名</label><input name="pname" id="pname" type="text"  class="text_add" placeholder=""  style=" width:400px"/></li>
       <li><label class="l_f">帐号</label><input class="inline laydate-icon" id="lname" name="lname" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" id="btn_search" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
      </ul>
    </div>
    <!--操作-->
    <div class="border clearfix">
       <span class="l_f">
       
         <a href="javascript:ovid()" id="padd" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a> 
        <!-- <input type="button" id="peradd" name="peradd" /> -->
        <!-- <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a> -->
       </span>
       <!-- <span class="r_f">共：<b>5</b>人</span> -->
     </div>
     <!--管理员列表-->
   <!--   <div class="clearfix administrator_style" id="administrator"> -->
<!--       <div class="left_style">
      <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">管理员分类列表</h4></div>
         <div class="widget-body">
           <ul class="b_P_Sort_list">
           <li><i class="fa fa-users green"></i> <a href="#">全部管理员（13）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">超级管理员（1）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">普通管理员（5）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">产品编辑管理员（4）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">管理员（1）</a></li>
           </ul>
        </div>
       </div>
      </div>  
      </div>
      </div> -->
      <div class="table_menu_list"  id="testIframe">
           <table class="table table-striped table-bordered table-hover" id="sample_table">		
	<tbody>
     <!-- <tr>
      <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
      <td>1</td>
      <td>admin</td>
      <td>18934334544</td>
      <td>2345454@qq.com</td>
      <td>超级管理员</td>
      <td>2016-6-29 12:34</td>
      <td class="td-status"><span class="label label-success radius">已启用</span></td>
      <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>  
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>       
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
       </td>
     </tr>
       <tr>
      <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
      <td>2</td>
      <td>admin12345</td>
      <td>18934334544</td>
      <td>2345454@qq.com</td>
      <td>管理员</td>
      <td>2016-6-29 12:34</td>
      <td class="td-status"><span class="label label-success radius">已启用</span></td>
      <td class="td-manage">
        <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>   
        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>      
        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
       </td>
     </tr>     -->
    </tbody>
    </table>
      </div>
     <!-- </div> -->
  </div>
</div>
  <!--添加管理员-->
 <!-- <div id="add_administrator_style" class="add_menber" style="display:none">
    <form action="" method="post" id="form-admin-add">
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>管理员：</label>
			<div class="formControls">
				<input type="text" class="input-text" value="" placeholder="" id="user-name" name="user-name" datatype="*2-16" nullmsg="用户名不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls">
			<input type="password" placeholder="密码" name="userpassword" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>确认密码：</label>
			<div class="formControls ">
		<input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error" errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword" id="newpassword2" name="newpassword2">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>性别：</label>
			<div class="formControls  skin-minimal">
		      <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
            <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
            <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>手机：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="" placeholder="" id="user-tel" name="user-tel" datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls ">
				<input type="text" class="input-text" placeholder="@" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label">角色：</label>
			<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="admin-role" size="1">
					<option value="0">超级管理员</option>
					<option value="1">管理员</option>
					<option value="2">栏目主辑</option>
					<option value="3">栏目编辑</option>
				</select>
				</span> </div>
		</div>
		<div class="form-group">
			<label class="form-label">备注：</label>
			<div class="formControls">
				<textarea name="" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"></textarea>
				<span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
			</div>
			<div class="col-4"> </div>
		</div>
		<div> 
        <input class="btn btn-primary radius" type="submit" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
	</form>
   </div> --> 
 </div>
</body>
</html>
<script type="text/javascript">
var oTable1;
var pname;
var lname;
jQuery(function($) {
		 oTable1 = $('#sample_table').DataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		/* "aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
		]  */
		"columns" :[{
			"data" : "id",
			"title" : "序号"
		},{
			"data" : "name",
			"title" : "姓名"
			/* "render":function(data, type, rowObject, meta){
				return  "<u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"member_show('"+rowObject.username+"','${pageContext.request.contextPath}/person/personDetail','"+rowObject.id+"','500','400')\">"+data+"</u>";
			} */
		},{
			"data" : "level",
			"title" : "用户级别"
		},{
			"data" : "loginname",
			"title" : "登录帐号"
		},{
			"data" : "userid",
			"title" : "身份证号"
		},{
			"data" : "sex",
			"title" : "性别"
		},{
			"data" : "phone",
			"title" : "联系电话"
		},{
			"data" : "email",
			"title" : "email"
		},{
			"data" : "qq",
			"title" : "QQ"
		},{
			"data" : "status",
			"title" : "状态"
		},{
			"data" : "dept",
			"title" : "部门"
		},{
			"title" : "处理",
			"orderable": false,
		  	"render": function ( data, type, rowObject, meta ) {
		  		var n = "";
		  		n = "<a title=\"编辑\" onclick='member_edit("+JSON.stringify(rowObject)+")' href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i>编辑</a> "
		  		+ "<a title='删除' href=\"javascript:;\"  onclick='member_del(this,"+JSON.stringify(rowObject) +")' class=\"btn btn-xs btn-warning\" ><i class=\"icon-trash  bigger-120\"></i>删除</a>";
		  		return n;
			}
	         
		}],
		"sort" : "position",
		"rowId" : "id",

		"ajax" : {
			"type" : 'POST',
			"url" : "${pageContext.request.contextPath}/person/getPersons",
			"data" : function(d) {
				d.name=pname;
				d.loginname=lname;
			}
		}
		
		} );
			
		 
		 $("#btn_search").on('click', function(){
			 pname=$("#pname").val();
			lname=$("#lname").val();
			 oTable1.ajax.reload(null,true);
			 
		 });
		 //用户添加
		 $("#padd").on('click', function(){
			alert(888);
			   layer.open({
			       type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
			       title: '添加用户',
					maxmin: true, 
					shadeClose: true, //点击遮罩关闭层
			       area : ['800px' , ''],
			       content:$('#add_menber_style'),
					btn:['提交','取消'],
					yes:function(index,layero){
					 var num=0;
					 var str="";
			    	 $(".add_menber input[type$='text']").each(function(n){
			         if($(this).val()=="")
			         {
			       	   // layer.alert(content, options, yes) - 普通信息框
			       	   // 它的弹出似乎显得有些高调，一般用于对用户造成比较强烈的关注，类似系统alert，但却比alert更灵便。
			       	   // 它的参数是自动向左补齐的。通过第二个参数，可以设定各种你所需要的基础参数，但如果你不需要的话，直接写回调即可
			       	   // layer.alert('只想简单的提示');        
						   // layer.alert('加了个图标', {icon: 1}); 
						   // layer.alert('有了回调', function(index){//这时如果你也还想执行yes回调，可以放在第三个参数中。
							    //do something
							  	//layer.close(index);
						   // });  
						   layer.alert(
								str+=""+$(this).attr("name")+"不能为空！\r\n",{
				                	title: '提示框',				
									icon:0,								
				          		}
							);
						
					    num++;
			           return false;            
			         } 
					 });
					 if(num>0){
						 return false;
					 }	 	
			        else{
			       	  $.ajax({
			       		   type: "POST",
			       		   url:  "${pageContext.request.contextPath}/person/save",
			       		   data:  $("#form").serialize() ,
			       		   success: function(msg){
			       			   if(msg.success==true){
			       				   oTable1.ajax.reload(null,true);
			       				   layer.alert('添加成功！',{
			       		               	title: '提示框',				
			       						icon:1,		
			       					  });
			       					  layer.close(index);	
			       			   }else{
			       				   layer.alert('添加失败！',{
			      		               	title: '提示框',				
			      						icon:1,		
			      					  });
			       			   }
			       		   }
			       		});
						  
					  }		  		     				
					}
			   });
			
		 });
		 
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});

</script>
<script type="text/javascript">
$(function() { 
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 laydate({
    elem: '#start',
    event: 'focus' 
});

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*用户-编辑*/
function member_edit(obj){
	//alert(88);
	//layer_show(title,url,w,h);
	$("#id").val(obj.id);
	$("#name").val(obj.name);
	$("#level").val(obj.level);
	$("#loginname").val(obj.loginname);
	$("#userid").val(obj.userid);
	$("#sex").val(obj.sex);
	$("#phone").val(obj.phone);
	$("#email").val(obj.email);
	$("#qq").val(obj.qq);
	$("#status").val(obj.status);
	$("#dept").val(obj.dept);
	/* $("#add_menber_style input[name=status]").val([obj.status]); */
	 var index = layer.open({
			type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
	        title: '修改用户信息',
			content:$('#add_menber_style'),
	        skin: "",
	     	area : ['800px' , ''],
	        offset : 'auto',
	        btn:['提交','取消','按钮3'],
			yes:function(index,layero){ 				
			 var num=0;
			 var str="";
	    	 $(".add_menber input[type$='text']").each(function(n){
	          if($(this).val()=="")
	          {
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          	   }); 
			    num++;
	            return false; // return 表示退出循环        
	          } 
			 });
			  if(num>0){  return false;}	 	
	          else{
	        	 
	        	  $.ajax({
	       		   type: "POST",
	       		   url:  "${pageContext.request.contextPath}/person/update" ,
	       		   data:  $("#form").serialize(),
	       		
	       		   success: function(msg){
	       			   if(msg.success==true){
	       				   oTable1.ajax.reload(null,true);
	       				   layer.alert('编辑成功！',{
	       		               	title: '提示框',				
	       						icon:1,		
	       					  });
	       					  layer.close(index);	
	       			   }else{
	       				   layer.alert('编辑失败！',{
	      		               	title: '提示框',				
	      						icon:1,		
	      					  });
	       			   }
	       		   }
	       		});
	        	  //alert($("#status").val()); 
	          }	  
			},
			 btn3:function(index, layero){
				layer.alert('点按钮3哦！',{
	              	title: '提示框',				
					icon:1,		
				});
				return false;
			}, 					
	 });
	
	
}

/*用户-删除*/
function member_del(obj,io){
	layer.confirm('确认要删除吗？',function(index){
		/* $(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000}); */		
			$.ajax({
	    		   type: "POST",
	    		   url:  "${pageContext.request.contextPath}/person/delete",
	    		   data: {id:io.id}, //$("#form").serialize() ,
	    		
	    		   success: function(msg){
	    			   if(msg.success==true){
	    				layer.msg('已删除!',{icon:1,time:500});
	    				$(obj).parents("tr").remove();
	    			   }else{
	    				layer.msg('删除失败!',{icon:1,time:500}); 
	    			   }
	    		   }
	    		});
												
	});
}

/*用户-*/
$("#bt").on('click', function(){
	alert(888);
   layer.open({
       type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
       title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
       area : ['800px' , ''],
       content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){
		 var num=0;
		 var str="";
    	 $(".add_menber input[type$='text']").each(function(n){
         if($(this).val()=="")
         {
       	   // layer.alert(content, options, yes) - 普通信息框
       	   // 它的弹出似乎显得有些高调，一般用于对用户造成比较强烈的关注，类似系统alert，但却比alert更灵便。
       	   // 它的参数是自动向左补齐的。通过第二个参数，可以设定各种你所需要的基础参数，但如果你不需要的话，直接写回调即可
       	   // layer.alert('只想简单的提示');        
			   // layer.alert('加了个图标', {icon: 1}); 
			   // layer.alert('有了回调', function(index){//这时如果你也还想执行yes回调，可以放在第三个参数中。
				    //do something
				  	//layer.close(index);
			   // });  
			   layer.alert(
					str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                	title: '提示框',				
						icon:0,								
	          		}
				);
			
		    num++;
           return false;            
         } 
		 });
		 if(num>0){
			 return false;
		 }	 	
        else{
       	  $.ajax({
       		   type: "POST",
       		   url:  "${pageContext.request.contextPath}/person/save",
       		   data:  $("#form").serialize() ,
       		   success: function(msg){
       			   if(msg.success==true){
       				   oTable1.ajax.reload(null,true);
       				   layer.alert('添加成功！',{
       		               	title: '提示框',				
       						icon:1,		
       					  });
       					  layer.close(index);	
       			   }else{
       				   layer.alert('添加失败！',{
      		               	title: '提示框',				
      						icon:1,		
      					  });
       			   }
       		   }
       		});
			  
		  }		  		     				
		}
   });
});

	//表单验证提交
$("#form-admin-add").Validform({
		
		 tiptype:2,
	
		callback:function(data){
		//form[0].submit();
		if(data.status==1){ 
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){ 
                    location.reload();//刷新页面 
                    });   
            } 
            else{ 
                layer.msg(data.info, {icon: data.status,time: 3000}); 
            } 		  
			var index =parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}
		
		
	});	
</script>

