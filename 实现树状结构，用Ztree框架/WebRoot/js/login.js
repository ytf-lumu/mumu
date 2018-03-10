 $(function(){
	    	
			 $("#re-code").click(function(){
				 $("#re-code > img").attr("src","");
				 $("#re-code > img").attr("src","img.shtml?a="+Math.random());
			 });
			 
	    	$("#login-btn").click(function(){
	    		if($("#memberloginid").val()==""){
	    			showMsg("请输入登录帐号");
	    			setTimeout('removeMsg()',5000);
	    			$("#memberloginid").focus();
	    			return;
	    		}
	    		if($("#memberpwd").val()==""){
	    			showMsg("请输入登录密码");
	    			setTimeout('removeMsg()',5000);
	    			$("#memberpwd").focus();
	    			
	    			return;
	    		}
	
	    		if($("#code").val()==""){
	    			showMsg("请输入验证码");
	    			setTimeout('removeMsg()',5000);
	    			$("#code").focus();
	    			return;
	    		}
	    		var btn=$(this).button("loading");
	    		$.post("login!access.php",{a:Math.random()},function(res){
		    		var js = $.parseJSON(res);
		    		if(js.success){
		    				var pwd=getDataStr(js.msg,$("#memberpwd").val());
		    				loginMethod(pwd);
		    			}else{
		    				showMsg(js.msg);
		    				setTimeout('removeMsg()',5000);
		    				btn.button("reset");
		    			}
		    	 });
				function loginMethod(pwd){
		    		var data = {"userInfo.userloginpwd":pwd,"userInfo.userloginid":$("#memberloginid").val(),code:$("#code").val().replace(/\s+/g,""),f:"1"};
		    		$.post("login.shtml",data,function(result){
		    			var js=$.parseJSON(result);
						if(js.success){
							$("#login-msg").hide();
							top.location="desktop.shtml";
						}else{
							showMsg(js.msg);
							setTimeout('removeMsg()',5000);
							btn.button("reset");
							$("#re-code").click();
							$("#code").val("");
						}
		    		});
				}
	    	});
	    	
	    	
	    	 $.ajax({
	       		   type: "POST",
	       		   url:  "${pageContext.request.contextPath}/person/login",
	       		   data:  {loginname:$("#loginname").val(),password:$("#password").val()},
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
	       				   layer.alert('登录失败！用户名或密码错误',{
	      		               	title: '提示框',				
	      						icon:1,		
	      					  });
	       			   }
	       		   }
	       		});
		/*	$.ajax({
				type : "post",
				url : "loginVali!returnClassify.shtml",
				data : {code : $("#code").val()},
				success : function(data, textStatus) {
					try {
						var jsonData = eval("{results:["+data+"]}")[0];
						if(jsonData.value>=0)location="desktop.shtml";
					}catch (e) {
						$("#login-btn").attr({"disabled":false});
						showMsg("请求错误"+e);
					}		
				},
				error : function(XMLHttpRequest, textStatus) {
					$("#login-btn").attr({"disabled":false});
					showMsg("请求错误");
				}
			});*/
	    	
	    	function showMsg(m){
	    		$("#login-null").css("display","none");
	    		$("#login-msg").html(m).removeClass().addClass("alert-danger").show();
	    	}
	    });
 		function removeMsg(){
 			$("#login-msg").hide();
    		$("#login-null").css("display","block").fadeIn();
 		}
	    function replaceNum(s){
			var orgStr={"１":"1","２":"2","３":"3","４":"4","５":"5","６":"6","７":"7","８":"8","９":"9","０":"0"};
			for(var n in orgStr){
				var reg = new RegExp(n,"g");
				s=s.replace(reg,orgStr[n]);
			}
			return s;
		}
	    // 网页内按下回车触发
	    var ShowEnterKey = function(e) 
	    {
	    	var currKey = 0, e = e || event;
	    	currKey = e.keyCode || e.which || e.charCode;

	    	if (currKey == 13) {
	    		$("#login-btn").click();
	    		return false;
	    	}
	    }
	    document.onkeydown = ShowEnterKey; 
	    //Go Parent Location
	    if (top.location !== self.location) {
	    	top.location = self.location;
	    }