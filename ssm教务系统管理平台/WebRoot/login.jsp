<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎登录&nbsp;-&nbsp;贵州师范学院教师专业发展平台（管理端）</title>
    <meta name="description" content="贵州师范学院教师专业发展平台（管理端）">
    <meta name="keywords" content="毕业生、档案、轨迹" />
    <meta name="author" content="www.jiudingcheng.com 贵州九鼎成科技有限公司 呐喊" />
	<link rel="shortcut icon" href="img/favicon.ico"/>
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9" />
	<link rel="stylesheet" type="text/css" href="css/login1.css"/>
    <link href="css/bootstrap.css" rel="stylesheet">
	<script src="js/jquery-1.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/rsa.js"></script>
	<script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript"></script>
	<!-- <script src="js/login.js" type="text/javascript"></script> -->
	<!--[if lt IE 9]>
      <script src="http://libs.jiudingcheng.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://libs.jiudingcheng.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="container">
		<div class="row login-title">
			<div class="col-md-3 col-sm-5 col-xs-6">
				<a href="" style="outline:none"><img src="images/logo.png" class="img-responsive"  alt="Logo"/></a>
			</div>
			<div class="col-md-3 col-sm-5 col-xs-6">
				<img src="images/login-icon.png" class="img-responsive"  alt=""/>
			</div>
		</div>
	</div>
	<div class="login-box-main">
		<div class="container">
			<div class="row">
				<div class="col-md-8 hidden-xs hidden-sm">
					<a target="_blank"><img class="img-responsive" style="margin-top:10px;" alt="教师专发展平台" title="教师专发展平台" src="images/login_bg_ad.png"/></a>
				</div>
				<div class="col-md-4 col-sm-12 login-box">
					<form class="form-horizontal">
						<h2>管理员用户登录</h2>
						<div id="login-msg" style="display:none;padding:5px;"></div>
						<div class="input-group margin-top-10">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" class="form-control" placeholder="登录名" id="loginname" name="loginName">
							<!-- <input type="text" maxlength="18" autocomplete="off" class="form-control" placeholder="用户名" id="memberloginid"/> -->
						</div>
						<div class="input-group margin-top-10">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" class="form-control" placeholder="密码" id="password" name="loginPass">
							<!-- <input type="text" maxlength="16" autocomplete="off" class="form-control" placeholder="密码" id="memberpwd"/> -->
						</div>
						
						<div class="row margin-top-10" id="my-vil-code">
								 <div class="col-xs-6 col-sm-6 col-md-6">
									<div class="input-group">
										<span class="input-group-addon"><span class="glyphicon glyphicon-th-large"></span></span>
										                                 
										 <input maxlength="4" type="text" autocomplete="off" class="form-control" placeholder="验证码" id="codes" name="codes"/>	
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									
									<a class="btn btn-link" id="re-code" href="javascript:void(0)" onclick="changeUrl()" style="text-decoration:none">
									<img src="${pageContext.request.contextPath}/person/code/<%=new Date().getTime()%>" class="img-responsive pull-left"/>
									 &nbsp;&nbsp;换一张&nbsp;&nbsp;</a> 
								</div> 
						</div>
						<div class="row margin-top-10 text-center">
							<div class="col-xs-12 col-sm-12 col-md-12 margin-top-10">
							    <input type="button" id="login_btn" value="登录"/>
								<!-- <button type="button"  autocomplete="off" class="btn btn-primary"  id="login-btn" data-loading-text='登录中...' style="width:80%" > 登录 </button> -->
							</div>
						</div>
						<div class="input-group" style="width:100%">
						<a class="btn bnt-link btn-xs pull-left" style="font-size:18px;" target="_blank" href="http://jiaoshi.gznc.edu.cn/%E6%95%99%E5%B8%88%E4%B8%93%E4%B8%9A%E5%8F%91%E5%B1%95%E5%B9%B3%E5%8F%B0%E7%AE%A1%E7%90%86%E7%AB%AF%E6%93%8D%E4%BD%9C%E6%89%8B%E5%86%8C.zip">操作指南</a>

							<!-- <a class="btn bnt-link btn-xs pull-right" href="">密码忘了？我要找回</a> -->
						</div>	
						<div id="login-null" style="padding:17px;"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid foot-shop footer-container hidden-xs hidden-sm">
		<p class="login-visible-lg">&nbsp;</p>
		<p>
		   <a href="//www.gznc.edu.cn/" class="footer-item" rel="noopenernoreferrer" target="_balnk">学校首页</a>
		   <!-- <a href="#" class="footer-item">帮助中心</a>
		   <a href="" class="footer-item" rel="noopenernoreferrer" target="_balnk">关于我们</a>
		   <a href="" class="footer-item last" rel="noopenernoreferrer" target="_balnk">联系我们</a> -->
		</p>
		<p>Copyright&nbsp;©&nbsp;2016-2018  贵州师范学院教师工作处&nbsp;版权所有,并保留所有权利。</p>
		<p>电话：0851-6277577&nbsp;&nbsp;邮箱：jsgzc6277577@126.com</p><!-- 备案号：黔ICP备16000001号 -->
		<p>技术支持：<a href="http://www.jiudingcheng.com" target="_blank"  id="teach-support" style="color:#000;">贵州九鼎成科技有限公司</a></p>
	</div>
  </body>
</html>

<script type="text/javascript">
  function changeUrl(){
  window.location.reload();
  
  }

</script>
<script>

$("#login_btn").on('click', function(){
//alert($("#loginname").val()+$("#password").val());
	     var num=0;
		 var str="";
     	 $("input[type$='text']").each(function(n){
	          if($(this).val()=="")
	          {
	               
				   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
	                title: '提示框',				
					icon:0,								
	          }); 
	          
	          	          
			    num++;
	            return false;            
	          } 	          
		 });
		  if(num>0){  return false;}	 	
          else{
        	  $.ajax({
       		   type: "POST",
       		   url:  "${pageContext.request.contextPath}/person/login",
       		   data:  {loginname:$("#loginname").val(),password:$("#password").val(),codes:$("#codes").val()},
       		   success: function(msg){
       			   if(msg.success==true){
       				  // oTable1.ajax.reload(null,true);
       				   /* layer.alert('登录成功！',{
       		               	title: '提示框',				
       						icon:1,		
       					  }); */
       				    location.href="index.jsp";   			  
       					 // layer.close(index);	
       			   }else{
       				   layer.alert('登录失败！用户名或密码或验证码错误',{
      		               	title: '提示框',				
      						icon:1,		
      					  });
       			   }
       		   }
       		});
			  /* layer.alert('登陆成功！',{
               title: '提示框',				
			   icon:1,		
			  });
	          location.href="index.jsp";
			   layer.close(index); */	
		  }		  		     						
		
	})
	
	
</script>