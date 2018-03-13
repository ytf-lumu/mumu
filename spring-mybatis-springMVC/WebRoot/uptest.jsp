<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uptest.jsp' starting page</title>
    
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
    <form action="${pageContext.request.contextPath}/brand/uploads" method="post" enctype="multipart/form-data">
        <input type="text" name="ppname" id="ppname"> <br>
        <input type="text" name="bbname" id="bbname"> <br>
        <input type="file" name="file" id="file"> <br>
        <input type="submit" value="提交">
        <img src="E:\tomcat\apache-tomcat-8.0.12\webapps\sms\upload\20180128105438.jpg">
        <img alt="" src="/images/user.png">
        <img alt="" src="E:\tomcat\apache-tomcat-8.0.12\webapps\sms\upload/20180128105743.jpg">
    </form>
    E:\tomcat\apache-tomcat-8.0.12\webapps\sms\upload/
    E:\tomcat\apache-tomcat-8.0.12\webapps\sms\upload\20180128105438.jpg
    E:\tomcat\apache-tomcat-8.0.12\webapps\sms\upload/20180128105743.jpg
  </body>
</html>
