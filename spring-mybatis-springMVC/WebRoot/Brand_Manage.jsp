<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>       
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
        <link href="${pageContext.request.contextPath}/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
	    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>
      	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.spring-friendly.js"></script>		
		<!-- page specific plugin scripts -->
		<%-- <script src="${pageContext.request.contextPath}/assets/layer/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate5.0.9/laydate.js" type="text/javascript"></script> --%>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script> 
        <script src="${pageContext.request.contextPath}/assets/layer/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate5.0.9/laydate.js" type="text/javascript"></script>
         <script src="${pageContext.request.contextPath}/assets/dist/echarts.js"></script>
         <script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript"></script>
<title>品牌管理</title>
</head>

<body>
<div class="page-content clearfix">
  <div id="brand_style">
    <div class="search_style">
      <div class="title_names">搜索查询</div>
      <ul class="search_content clearfix">
       <li><label class="l_f">品牌名称</label><input name="uname" id="uname" type="text"  class="text_add" placeholder="输入品牌名称"  style=" width:250px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li><select name="region" id="region" class="text_add"><option  value="1">国内品牌</option><option value="2">国外品牌</option></select></li>
       <li style="width:90px;"><button type="button" id="btn_search" name="btn_search" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
     <div class="border clearfix">
       <span class="l_f">
        <a href="Add_Brand.jsp"  title="添加品牌" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加品牌</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
        <a href="javascript:ovid()" id="gn" class="btn btn-info">国内品牌</a>
        <a href="javascript:ovid()" id="gw" class="btn btn-success">国外品牌</a>
       </span>
       <span class="r_f">共：<b>234</b>个品牌</span>
     </div>
    <!--品牌展示-->
     <div class="brand_list clearfix" id="category">
     <div class="show_btn" id="rightArrow"><span></span></div>
     <div class="chart_style side_content">
     <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div id="main" style="height:300px;" class="side_list"></div>
     </div>
     <!--品牌列表-->
      <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">

        
        </table>
        </div>
     </div>
    
  </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <form id="form">
    <ul class=" page-content">
     <li><label class="label_name">排序：</label><span class="add_name"><input value="" id="sorting" name="sorting" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">品牌logo：</label><span class="add_name" ><input id="logo" name="logo"   type="text"  class="text_add"/></span>
     <div class="prompt r_f"></div>
     </li>    
     <li><label class="label_name">品牌名称：</label><span class="add_name"><input id="brandname" name="brandname"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>     
     <li>
     	<label class="label_name">所属地区：</label><input id="region" name="region"   type="text"  class="text_add"/></span><div class="prompt r_f"></div>
     	<!-- <span class="add_name">
     	<select name="region" id="region" style="margin-left: 11px;">
     		<option value="a">中国</option>
     		<option value="b">外国</option>
     		<option value="c">银牌会员</option>
     		<option value="d">金牌会员</option>
     		<option value="e">钻石会员</option>
     		<option value="f">黄钻会员</option>
     		<option value="g">红钻会员</option>
     	</select>
     	</span>   -->   	
     </li>
     <li><label class="label_name">描述：</label><span class="add_name"><input id="details" name="details"   type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">加入时间：</label><span class="add_name"><input id="joinTime" name="joinTime" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="status" id="status" type="radio" value="0" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="status" id="status" type="radio" value="1" class="ace"><span class="lbl">关闭</span></label></span><div class="prompt r_f"></div></li>
     <li><span class="add_name"><input id="id" name="id"   type="hidden"  class="text_add"/></span><div class="prompt r_f"></div></li>
    </ul>
    </form>
 </div>
</body>
</html>
<script>
var oTable1;
var brandname;
var region;
jQuery(function($) {
		 oTable1 = $('#sample-table').DataTable( {
			/* "autoWidth" : true,
			"processing" : true,
			"serverSide" : true,
			"searable" : false,
			"searching": false,
			"order": [[ 1, "desc" ]], */
		"paging" : true,　// 是否分页?	//columns
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		/* "aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,3,4,5,6,8,9]}// 制定列不参与排序
		]  */
			"columns" :[{
				"data" : "id",
				"title" : "ID"
			},{
				"data" : "sorting",
				"title" : "排序"
			},{
				"data" : "logo",
				"title" : "品牌logo",
				"render":function(data, type, rowObject, meta){
					return  "<img alt=\"\" src=\""+data+"\">";
				}
			},{
				"data" : "brandname",
				"title" : "品牌名称",
				"render":function(data, type, rowObject, meta){
					return  "<u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"member_show('"+rowObject.brandname+"','${pageContext.request.contextPath}/person/personDetail','"+rowObject.id+"','500','400')\">"+data+"</u>";
				}
			},{
				"data" : "region",
				"title" : "所属地区/国家"
			},{
				"data" : "details",
				"title" : "描述"
			},{
				"data" : "joinTime",
				"title" : "加入时间"
			},{
				"data" : "status",
				"title" : "状态"
			},{
				"title" : "操作",
				"orderable": false,
			  	"render": function ( data, type, rowObject, meta ) {
			  		var n = "";//JSON.stringify(rowObject) onclick="member_edit('编辑','member-add.html','4','','510')"
			  		n = "<a title=\"编辑\" onclick='member_edit("+JSON.stringify(rowObject)+")' href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a> "
			  		+ "<a title=\"删除\" href=\"javascript:;\"  onclick='member_del(this,"+JSON.stringify(rowObject) +")' class=\"btn btn-xs btn-warning\" ><i class=\"icon-trash  bigger-120\"></i></a>";
			  		return n;
				}
		         
			}],
			"sort" : "position",
			"rowId" : "id",

			"ajax" : {
				"type" : 'POST',
				"url" : "${pageContext.request.contextPath}/brand/getBrands",
				"data" : function(d) {
					 
					  d.region=region;
					  d.brandname=brandname;
					/*d.startTime=startTime;
					d.endTime=endTime; */
				}
			}
		
		} );
				
				
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
					
		      		 brandname=$("#uname").val();
		      		 if($("#region").val()==1){
		      		 region="中国";
		      		 }else{region="外国";}
		      		 alert(region);
					/* startTime=$("#startTime").val();
					endTime=$("#endTime").val(); */
					 oTable1.ajax.reload(null,true);
				 });
				
				$("#gn").on('click', function(){					
					region="中国";			      		
					 oTable1.ajax.reload(null,true);
				 });
				$("#gw").on('click', function(){					
					region="外国";		      		 	      		 
					 oTable1.ajax.reload(null,true);
				 });
				
				/* $(function(){
					 $.ajax({
			       		   type: "POST",
			       		   url:  "${pageContext.request.contextPath}/brand/updateBrand" 			       		   
					 });
				}); */
			});


//初始化宽度、高度  
 $(".chart_style").height($(window).height()-215);
  $(".table_menu_list").height($(window).height()-215);
  $(".table_menu_list ").width($(window).width()-440);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	 $(".chart_style").height($(window).height()-215);
	 $(".table_menu_list").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-440);
	});	
	//图层隐藏限时参数		 
$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		stylewidth:'400',
		spacingw:30,//设置隐藏时的距离
	    spacingh:440,//设置显示时间距
	});
});
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,.brond_name').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').jsp();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').jsp(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
function generateOrders(id){
	window.location.href = "Brand_detailed.jsp?="+id;
};
/*品牌-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*品牌-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").jsp('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}


/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").jsp('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*品牌-编辑*/
function member_edit(obj){
	//layer_show(title,url,w,h);
	$("#id").val(obj.id);
	$("#brandname").val(obj.brandname);
	$("#details").val(obj.details);
	$("#region").val(obj.region);
	$("#logo").val(obj.logo);
	$("#joinTime").val(obj.joinTime);
	$("#sorting").val(obj.sorting);
	$("#add_menber_style input[name=status]").val([obj.status]);
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
	       		   url:  "${pageContext.request.contextPath}/brand/updateBrand" ,
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
	        	  alert($("#status").val()); 
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




/*品牌-删除*/
function member_del(obj,io){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
    		   type: "POST",
    		   url:  "${pageContext.request.contextPath}/brand/deleteBrand",
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
laydate({
    elem: '#start',
    type:'datetime',
	range: false,
    format:'yyyy-MM-dd HH:mm:ss',
    value: new Date(),
	show: false,
	position:'fixed'
    //event: 'focus' 
}); 
//绑定日期控件
laydate.render({	
	elem: '#start', 	
	type:'datetime',
	range: false,
    format:'yyyy-MM-dd HH:mm:ss',
   // value: new Date(),
	show: false,
	position:'fixed'	
});

</script>
 <script type="text/javascript">
 var gn=0;
 var gw=0;
        require.config({
            paths: {
                echarts: './assets/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/pie',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/funnel'
            ],
            function (ec) {
                var myChart = ec.init(document.getElementById('main'));
			
			option = {
    title : {
        text: '国内国外品牌比例',
        subtext: '',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['国内品牌','国外品牌']
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: false},
            dataView : {show: false, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 545
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'品牌数量',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:gn, name:'国内品牌'},
                {value:gw, name:'国外品牌'},

            ]
        }
    ]
};
   myChart.setOption(option);
			}
);
</script>