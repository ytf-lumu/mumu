<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatee.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/login1.css"/>
<style type="text/css">
  .aa{
  height:400px;
  width: 400px;
  border:black solid 1px;
  position: absolute;
  left:300px;
  top: 20px;
  } 
  .er{
  height: 200px;
  width: 200px;
 /*  background-color: #C0C0C0; */
  position: relative;
  left:220px;
  top:200px;
  margin-top: -110px;
  margin-left: -110px;
  border: black solid 1px;
  border-style: none;
  }
  #a{
  font-size: 20px;
  
  }
  #bb{
  font-size: 20px;
  }
</style>
  </head>
  
  <body>
  <div class="aa">
  <form action="${pageContext.request.contextPath}/statis/idea">
  <div class="er">
   <div id="select" class="bb">
       年份：<select name="time" id="time">
   <!-- <input type="text" id="name" name="name" value=""></br> -->
   <option value="">清选择</option>
   <option value="2018">2018</option>
   <option value="2017">2017</option>
   <option value="2016">2016</option>
   <option value="2015">2015</option>
    </select></br>
    </div ></br>
    <div id="submit" class="cc">
    <input type="submit" id="a" value="教育教师培训统计表导出">
    </div>
    </div>
  </form>
  </div>
  </body>
</html>
