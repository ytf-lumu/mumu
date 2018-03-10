<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
    <div class="search_style">
    <div class="title_names" style="margin-top: 10px;">搜索查询</div>
      <ul class="search_content clearfix" style="margin-top: 10px;">
       <li><label class="l_f">按名字搜索</label><input name="tname" id="tname" type="text"  class="text_add" placeholder="请输入关键字"  style=" width:200px"/></li>
       
       
       <li style="width:90px;"><button type="button" id="btn_search" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
       
       </span>
       <span class="r_f"><b></b></span>
     </div>
     <!---->
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="main-table">
		
		</table>
   </div>
  </div>
 </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <form id="form">
    <ul class=" page-content">
    <li><label class="label_name">序列号：</label><span class="add_name"><input id="id" name="id"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    <li><label class="label_name">方案名称：</label><span class="add_name"><input id="name" name="name"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">方案时间：</label><span class="add_name"><input id="plantime" name="plantime" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
      <li><label class="label_name">审核时间：</label><span class="add_name"><input id="audittime" name="audittime" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
    
     <li><label class="label_name">提交单位：</label><span class="add_name"><input id="unit" name="unit"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">提交时间：</label><span class="add_name"><input id="submittime" name="submittime" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>     
     <li><label class="label_name">审核&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：</label><span class="add_name">
     <label><input name="status" id="status" 	  value="通过"  type="radio" 	class="ace"><span class="lbl">通过</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="status" id="status" 	  value="不通过" type="radio" 	class="ace"><span class="lbl">不通过</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="status" id="status" value="待审核" type="radio" 	class="ace"><span class="lbl">待审核</span></label>
     </span>
     <div class="prompt r_f"></div>
     </li>     
     <li><label class="label_name">审核人：</label><span class="add_name"><input id="auditer" name="auditer"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">审核意见：</label><span class="add_name"><input id="audit" name="audit"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">课时数</label><span class="add_name"><input value="" id="num" name="num" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">部门名称：</label><span class="add_name"><input id="dept" name="dept"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>     
     <li><label class="label_name">培训组织机构：</label><span class="add_name"><input id="organization" name="organization"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">培训地址：</label><span class="add_name"><input id="address" name="address"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li>
     	<label class="label_name">学时类别：</label>
     	<span class="add_name">
     	<select name="category" id="category" style="margin-left: 11px;">
     		<option value="校外进修学习">校外进修学习</option>
     		<option value="校内进修学习">校内进修学习</option>
     		<option value="校内外进修学习">校内外进修学习</option>
     	</select>
     	</span>
     	<div class="prompt r_f"></div>
     </li>
     
    </ul>
    </form>
 </div>
</body>
</html>
<script>
var oTable1 ;

jQuery(function($) {
	
			oTable1 = $('#main-table').DataTable({
			"autoWidth" : true,
			"processing" : true,
			"serverSide" : true,
			"searable" : false,
			"searching": false,
			"order": [[ 1, "desc" ]],
			"paging" : true,// 是否分页?
			"columns" :[{
				"data" : "id",
				"title" : "序列"
			},{
				"data" : "name",
				"title" : "方案名称"
				/* "render":function(data, type, rowObject, meta){
					return  "<u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"member_show('"+rowObject.username+"','${pageContext.request.contextPath}/person/personDetail','"+rowObject.id+"','500','400')\">"+data+"</u>"; 
				}*/
			},{
				"data" : "plantime",
				"title" : "方案时间"
			},{
				"data" : "num",
				"title" : "课时数"
			},{
				"data" : "unit",
				"title" : "提交人"
			},{
				"data" : "submittime",
				"title" : "提交时间"
			},{
				"data" : "status",
				"title" : "审核状态"
			},{
				"data" : "auditer",
				"title" : "审核人"
			},{
				"data" : "audittime",
				"title" : "审核时间"
			},{
				"data" : "audit",
				"title" : "审核意见"
			},{
				"data" : "category",
				"title" : "学时类别"
			},{
				"data" : "dept",
				"title" : "部门名称"
			},{
				"data" : "organization",
				"title" : "培训组织机构"
			},{
				"data" : "address",
				"title" : "培训地址"
			}/* ,{
				"title" : "处理",
				"orderable": false,
			  	"render": function ( data, type, rowObject, meta ) {
			  		var n = "";
			  		n = "<a title=\"编辑\" onclick='member_edit("+JSON.stringify(rowObject) +")' href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a> "
			  		+ "<a title=\"删除\" href=\"javascript:;\"  onclick=\"member_del(this,'1')\" class=\"btn btn-xs btn-warning\" ><i class=\"icon-trash  bigger-120\"></i></a>";
			  		return n;
				}
		         
			} */],
			"sort" : "position",
			"rowId" : "id",

			"ajax" : {
				"type" : 'POST',
				"url" : "${pageContext.request.contextPath}/training/init",
				"data" : function(d) {
					d.name=$("#tname").val();
				}
			}
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
		
		 $("#btn_search").on('click', function(){
			 oTable1.ajax.reload(null,true);
		 });
})

/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
        title: '审核',
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
        		   url:  "${pageContext.request.contextPath}/training/ins",
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
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'?id='+id,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	// layer.confirm(content, options, yes, cancel) - 询问框
	// 类似系统confirm，但却远胜confirm，另外它不是和系统的confirm一样阻塞你需要把交互的语句放在回调体中。同样的，它的参数也是自动补齐的。
	// layer.confirm('is not?', {icon: 3, title:'提示'}, function(index){ // 点击确定按钮,会执行该回调函数
	//   layer.close(index);
	// });
	// layer.confirm('is not?', function(index){
	//   layer.close(index);
	// }); 
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		
		// layer.msg(content, options, end) - 提示框
		
		// layer.msg('只想弱弱提示');
		// layer.msg('有表情地提示', {icon: 6}); 
		// layer.msg('关闭后想做些什么', function(){
		  	//do something
		// }); 
		
		// layer.msg('同上', {
		  // icon: 1,
		  // time: 2000 //2秒关闭（如果不配置，默认是3秒）
		// }, function(){
		  	//do something
		// }); 
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*用户-编辑*/
function member_edit(obj){
	$("#username").val(obj.username);
	$("input[name='sex']").each(function(i){
		var v = $(this).val();
		if(v == obj.sex){
			$(this).attr("checked","checked");
		}
	});
	// layer.open(options) - 原始核心方法
	// 基本上是露脸率最高的方法，不管是使用哪种方式创建层，都是走layer.open()，创建任何类型的弹层都会返回一个当前层索引，上述的options即是基础参数
	// index是一个重要的凭据，它是诸如layer.close(index)等方法的必传参数。  
	var index = layer.open({
		// 0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
        type: 1,
        // title支持三种类型的值，若你传入的是普通的字符串，如title :'我是标题'，那么只会改变标题文本；
        // 若你还需要自定义标题区域样式，那么你可以title: ['文本', 'font-size:18px;']，数组第二项可以写任意css样式；
        // 如果你不想显示标题栏，你可以title: false
        title: '修改用户信息',
		
       	// content可以是String/DOM/Array，默认：字符串
       	// 如果是页面层  可以：content: $('#id') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
       	// 如果是iframe层(type=2) content: 'http://sentsin.com' 
       	// 这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
       	// 如果是用layer.open执行tips层(type=4) content: ['内容', '#id'] //数组第二项即吸附元素选择器或者DOM
        content:$('#add_menber_style'),
        // skin - 样式类名,类型：String，默认：''
        // skin不仅允许你传入layer内置的样式class名，还可以传入您自定义的class名。
        // 这是一个很好的切入点，意味着你可以借助skin轻松完成不同的风格定制。目前layer内置的skin有：layui-layer-lanlayui-layer-molv
        skin: "",
     	// area - 宽高 ,类型：String/Array，默认：'auto'
		// 在默认状态下，layer是宽高都自适应的，但当你只想定义宽度时，你可以area: '500px'，高度仍然是自适应的。
		// 当你宽高都要定义时，你可以area: ['500px', '300px']
        area : ['800px' , ''],
        // offset - 坐标,类型：String/Array，默认：垂直水平居中('auto')
        // offset默认情况下不用设置。但如果你不想垂直水平居中，你还可以进行以下赋值：
        offset : 'auto',
        // icon - 图标,类型：Number，默认：-1（信息框）/0（加载层）
        // icon:-1,
        
        // btn - 按钮,类型：String/Array，默认：'确认'
        // 信息框模式时，btn默认是一个确认按钮，其它层类型则默认不显示，加载层和tips层则无效。
        // 当您只想自定义一个按钮时，你可以btn: '我知道了'，当你要定义两个按钮时，你可以btn: ['yes', 'no']。
        // 当然，你也可以定义更多按钮，比如：btn: ['按钮1', '按钮2', '按钮3', …]，按钮1的回调是yes，而从按钮2开始，则回调为btn2: function(){}，以此类推
		btn:['提交','取消','按钮3'],
		// yes - 确定按钮回调方法,类型：Function，默认：null
		// 该回调携带两个参数，分别为当前层索引、当前层DOM对象
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
			  layer.alert('添加成功！',{
              	title: '提示框',				
				icon:1,		
			  });
			  layer.close(index);	
		  }		  		     				
		},
		btn3:function(index, layero){
			layer.alert('点按钮3哦！',{
              	title: '提示框',				
				icon:1,		
			});
			return false;
		},
		// cancel - 右上角关闭按钮触发的回调
		// 该回调携带两个参数，分别为：当前层索引参数（index）、当前层的DOM对象（layero），默认会自动触发关闭。如果不想关闭，return false即可
		/* cancel: function(index, layero){
			// layer.confirm(content, options, yes, cancel) - 询问框
			// 类似系统confirm，但却远胜confirm，另外它不是和系统的confirm一样阻塞你需要把交互的语句放在回调体中。同样的，它的参数也是自动补齐的。
			// layer.confirm('is not?', {icon: 3, title:'提示'}, function(index){ // 点击确定按钮,会执行该回调函数
			//   layer.close(index);
			// });
			// layer.confirm('is not?', function(index){
			//   layer.close(index);
			// }); 
			 layer.confirm('确定要关闭吗?', {icon: 3, title:'提示'}, function(index1){// 点击确定按钮,会执行该回调函数
			   	layer.close(index);
			   	layer.close(index1);
			 });
			//if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
				// layer.close(index)
			//}
			return false;// 如果不想关闭，return false即可
		}, */
		// btnAlign - 按钮排列,类型：String，默认：r
		// 你可以快捷定义按钮的排列位置，btnAlign的默认值为r，即右对齐。该参数可支持的赋值如下：'l':左对齐,'c':居中,'r':右对齐
		btnAlign:'r',
		// closeBtn - 关闭按钮,类型：String/Boolean，默认：1
		// layer提供了两种风格的关闭按钮，可通过配置1和2来展示，如果不显示，则closeBtn: 0
		closeBtn: 1,
		// shade - 遮罩,类型：String/Array/Boolean，默认：0.3
		// 即弹层外区域。默认是0.3透明度的黑色背景（'#000'）。如果你想定义别的颜色，可以shade: [0.8, '#393D49']；如果你不想显示遮罩，可以shade: 0
		shade:'0.3',
		// shade - 遮罩 ,类型：Boolean，默认：false
		// 如果你的shade是存在的，那么你可以设定shadeClose来控制点击弹层外区域关闭。
		shadeClose:false,
		// time - 自动关闭所需毫秒,类型：Number，默认：0
		// 默认不会自动关闭。当你想自动关闭时，可以time: 5000，即代表5秒后自动关闭，注意单位是毫秒（1秒=1000毫秒）
		time:0,
		// id - 用于控制弹层唯一标识,类型：String，默认：空字符
		// 设置该值后，不管是什么类型的层，都只允许同时弹出一个。一般用于页面层和iframe层模式
		id:'',
		// anim - 弹出动画,类型：Number，默认：0
		// 我们的出场动画全部采用CSS3。这意味着除了ie6-9，其它所有浏览器都是支持的。
		// 目前anim可支持的动画类型有0-6 如果不想显示动画，设置 anim: -1 即可,另外需要注意的是，3.0之前的版本用的是 shift 参数
		anim: 2,
		// isOutAnim - 关闭动画 （layer 3.0.3新增）,类型：Boolean，默认：true
		// 默认情况下，关闭层时会有一个过度动画。如果你不想开启，设置 isOutAnim: false 即可
		isOutAnim:false,
		// maxmin - 最大最小化,类型：Boolean，默认：false
		// 该参数值对type:1（页面层）,type:2（iframe层）有效。默认不显示最大小化按钮。需要显示配置maxmin: true即可
		maxmin: true, 
		// fixed - 固定,类型：Boolean，默认：true
		// 即鼠标滚动时，层是否固定在可视区域。如果不想，设置fixed: false即可
		fixed:true,
		// resize - 是否允许拉伸,类型：Boolean，默认：true
		// 默认情况下，你可以在弹层右下角拖动来拉伸尺寸。如果对指定的弹层屏蔽该功能，设置 false即可。该参数对loading、tips层无效
		resize:true,
		// resizing - 监听窗口拉伸动作,类型：Function，默认：null
		// 当你拖拽弹层右下角对窗体进行尺寸调整时，如果你设定了该回调，则会执行。回调返回一个参数：当前层的DOM对象
		resizing: function(layero){
			  console.log(layero);
		},
		// scrollbar - 是否允许浏览器出现滚动条,类型：Boolean，默认：true
		// 默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
		scrollbar:true,
		// maxWidth - 最大宽度,类型：Number，默认：360
		// 请注意：只有当area: 'auto'时，maxWidth的设定才有效。
		// maxHeight - 最大高度,类型：Number，默认：无
		// 请注意：只有当高度自适应时，maxHeight的设定才有效。
		
		// zIndex - 层叠顺序
		
		// move - 触发拖动的元素,类型：String/DOM/Boolean，默认：'.layui-layer-title'
		// 默认是触发标题区域拖拽。如果你想单独定义，指向元素的选择器或者DOM即可。如move: '.mine-move'。你还配置设定move: false来禁止拖拽
		move:false,
		// moveOut - 是否允许拖拽到窗口外,类型：Boolean，默认：false
		// 默认只能在窗口内拖拽，如果你想让拖到窗外，那么设定moveOut: true即可
		moveOut:false,
		// moveEnd - 拖动完毕后的回调方法
		// 默认不会触发moveEnd，如果你需要，设定moveEnd: function(layero){}即可。其中layero为当前层的DOM对象
		//moveEnd: function(layero){
		//	console.log(layero);
		//},
		// tips - tips方向和颜色,类型：Number/Array，默认：2
		// tips层的私有参数。支持上右下左四个方向，通过1-4进行方向设定。
		// 如tips: 3则表示在元素的下面出现。有时你还可能会定义一些颜色，可以设定tips: [1, '#c00']
		tips:2,
		// tipsMore - 是否允许多个tips,类型：Boolean，默认：false
		// 允许多个意味着不会销毁之前的tips层。通过tipsMore: true开启
		tipsMore: false,
		// success - 层弹出后的成功回调方法,类型：Function，默认：null
		// 当你需要在层创建完毕时即执行一些语句，可以通过该回调。success会携带两个参数，分别是当前层DOM当前层索引
		success: function(layero, index){
			    console.log(layero, index);
		},
		// end - 层销毁后触发的回调,类型：Function，默认：null
		// 无论是确认还是取消，只要层被销毁了，end都会执行，不携带任何参数。
		end:function(){
			
		}
		// full/min/restore -分别代表最大化、最小化、还原 后触发的回调
		//类型：Function，默认：null
		//携带一个参数，即当前层DOM


		

		
    });
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
//把日期小控件绑定在 start元素上
//执行一个laydate实例
laydate.render({
	// 指定元素,或 elem: document.getElementById('test')、elem: lay('#test') 等
	elem: '#submittime', 
	// type - 控件选择类型,类型：String，默认值：date
	// 用于单独提供不同的选择器类型，可选值:year/month/date/time/datetime
	type:'datetime',
	// range - 开启左右面板范围选择
	// 类型：Boolean/String，默认值：false
	// 如果设置 true，将默认采用 “ - ” 分割。 你也可以直接设置 分割字符。五种选择器类型均支持左右面板的范围选择。
	range: false,
	// format - 自定义格式,类型：String，默认值：yyyy-MM-dd
	// 通过日期时间各自的格式符和长度，来设定一个你所需要的日期格式。
	format:'yyyy-MM-dd HH:mm:ss',
	// value - 初始值,类型：String，默认值：new Date()
	// 支持传入符合format参数设定的日期格式字符，或者 new Date()
	value: new Date()//'2018-08-18 14:20:20' //必须遵循format参数设定的格式
	// min/max - 最小/大范围内的日期时间值
	// 设定有限范围内的日期或时间值，不在范围内的将不可选中
	//,min: '2017-1-1'
	//,max: '2017-12-31'
	// trigger - 自定义弹出控件的事件
	// 类型：String，默认值：focus,如果绑定的元素非输入框，则默认事件为：click
	//,trigger: 'click' //采用click弹出
	
	// show - 默认显示,类型：Boolean，默认值：false
	// 如果设置: true，则控件默认显示在绑定元素的区域。通常用于外部事件调用控件，如：
	,show: false //直接显示
	// position - 定位方式,类型：String，默认值：absolute
	// 用于设定控件的定位方式，有以下三种可选值：abolute/fixed/static
	,position:'fixed'
	// zIndex - 层叠顺序,类型：Number，默认值：66666666
	// 一般用于解决与其它元素的互相被遮掩的问题。如果 position 参数设为 static 时，该参数无效。
	// ,zIndex: 99999999
	
	// showBottom - 是否显示底部栏,类型：Boolean，默认值：true
	// 如果设置 false，将不会显示控件的底部栏区域
	//,showBottom: true
	// btns - 工具按钮,类型：Array，默认值：['clear', 'now', 'confirm']
	// 右下角显示的按钮，会按照数组顺序排列，内置可识别的值有：clear、now、confirm
	//,btns: ['clear', 'confirm']
	// lang - 语言,类型：String，默认值：cn
	// 我们内置了两种语言版本：cn（中文版）、en（国际版，即英文版）
	//,lang: 'en'
	
	// theme - 主题,类型：String，默认值：default
	// 我们内置了多种主题，theme的可选值有：default（默认简约）、molv（墨绿背景）、#颜色值（自定义颜色背景）、grid（格子主题）
	//,theme: 'grid'
	//,theme: '#393D49'
	
	// calendar - 是否显示公历节日,类型：Boolean，默认值：false
	// 我们内置了一些我国通用的公历重要节日，通过设置 true 来开启。国际版不会显示。
	//,calendar: true 
});
laydate.render({
	// 指定元素,或 elem: document.getElementById('test')、elem: lay('#test') 等
	elem: '#plantime', 
	// type - 控件选择类型,类型：String，默认值：date
	// 用于单独提供不同的选择器类型，可选值:year/month/date/time/datetime
	type:'datetime',
	// range - 开启左右面板范围选择
	// 类型：Boolean/String，默认值：false
	// 如果设置 true，将默认采用 “ - ” 分割。 你也可以直接设置 分割字符。五种选择器类型均支持左右面板的范围选择。
	range: false,
	// format - 自定义格式,类型：String，默认值：yyyy-MM-dd
	// 通过日期时间各自的格式符和长度，来设定一个你所需要的日期格式。
	format:'yyyy-MM-dd HH:mm:ss'
	// value - 初始值,类型：String，默认值：new Date()
	// 支持传入符合format参数设定的日期格式字符，或者 new Date()
	//value: new Date()//'2018-08-18 14:20:20' //必须遵循format参数设定的格式
	// show - 默认显示,类型：Boolean，默认值：false
	// 如果设置: true，则控件默认显示在绑定元素的区域。通常用于外部事件调用控件，如：
	,show: false //直接显示
	// position - 定位方式,类型：String，默认值：absolute
	// 用于设定控件的定位方式，有以下三种可选值：abolute/fixed/static
	,position:'fixed'
});

laydate.render({
	// 指定元素,或 elem: document.getElementById('test')、elem: lay('#test') 等
	elem: '#audittime', 
	// type - 控件选择类型,类型：String，默认值：date
	// 用于单独提供不同的选择器类型，可选值:year/month/date/time/datetime
	type:'datetime',
	// range - 开启左右面板范围选择
	// 类型：Boolean/String，默认值：false
	// 如果设置 true，将默认采用 “ - ” 分割。 你也可以直接设置 分割字符。五种选择器类型均支持左右面板的范围选择。
	range: false,
	// format - 自定义格式,类型：String，默认值：yyyy-MM-dd
	// 通过日期时间各自的格式符和长度，来设定一个你所需要的日期格式。
	format:'yyyy-MM-dd HH:mm:ss'
	// value - 初始值,类型：String，默认值：new Date()
	// 支持传入符合format参数设定的日期格式字符，或者 new Date()
	//value: new Date()//'2018-08-18 14:20:20' //必须遵循format参数设定的格式
	// show - 默认显示,类型：Boolean，默认值：false
	// 如果设置: true，则控件默认显示在绑定元素的区域。通常用于外部事件调用控件，如：
	,show: false //直接显示
	// position - 定位方式,类型：String，默认值：absolute
	// 用于设定控件的定位方式，有以下三种可选值：abolute/fixed/static
	,position:'fixed'
});
</script>
