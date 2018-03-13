<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎光临暖暖宠物用品店</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
*{ margin:0; padding:0; border:0;}
.STYLE1 {font-size: 14px}
.STYLE2 {color: #FFFFFF}ssss
.STYLE3 {font-size: 12px}
.STYLE4 {
	color:#3F0A0B;
	font-weight: bold;
}
.STYLE4 a {
	color:#3F0A0B;
	font-weight: bold; text-decoration:none;
}
.red,.red a{ color:#3F0A0B; text-decoration:none; font-weight: bold;}
.bai,.bai a{ color:#fff; text-decoration:none; font-weight: bold;}
.main{ width:960px; margin:0px auto; background:url("images/bg1.jpg") repeat-y top left; padding:0px 14px;}
-->
</style>
  </head>
  
  <body style="background:#daf8f0;">
   <!-- Copyright � 2005. Spidersoft Ltd -->
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>
<!-- /Copyright � 2005. Spidersoft Ltd -->
<div class="main" style="background:#fff;">
	<table width="959" border="0" cellspacing="0" cellpadding="0" >
  <tr >
    <td width="959" height="132" align="center" valign="middle" background="images/top_bg.jpg" ><table width="960" border="0" cellspacing="0" cellpadding="0" style="padding-top:90PX;">
      <tr class="STYLE1 STYLE4">
        <td height="43" align="center" valign="middle" class="bai"><a href="index1.jsp" >网站首页</a></td>
        <td align="center" valign="middle" class="bai" style="background:url(../images/meun.png) no-repeat center center; color:#fff;"><a href="html/chanpin_list1.jsp" >宠物零食</a></td>
        <!-- <td align="center" valign="middle" class="bai"><a href="html/chanpin_list2.html" >日常用品</a></td> -->
        <td align="center" valign="middle" class="bai"><a href="html/chanpin_list3.jsp" >清洁用品</a></td>
       <!--  <td align="center" valign="middle" class="bai"><a href="html/chanpin_list4.html" >营养保健</a></td>
        <td align="center" valign="middle" class="bai"><a href="html/pinglun.html" >用户评论</a></td> -->
        <td align="center" valign="middle" class="bai"><a href="html/zhanghu.jsp" >我的帐户</a></td>
        <!-- <td align="center" valign="middle" class="bai"><a href="html/zhuce.html" >用户注册</a></td> -->
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/bg2.jpg" alt="" width="966" height="281"/></td>
  </tr>
  <tr>
    <td>
    	<table width="960" border="0" cellspacing="0" cellpadding="0" style="background:#fff;">
  <!-- <tr>
    <td height="64" colspan="6"><img src="file:///D|/Documents/暖暖/images/untitled.jpg" width="950" height="116"  /></td>
    </tr>
  <tr> -->
    <td width="160" align="center" valign="middle"><img src="images/untitled4.jpg" width="158" height="248" /></td>
    <td width="160" align="center" valign="middle"><img src="images/untitled5.jpg" width="149" height="241" /></td>
    <td width="160" align="center" valign="middle"><img src="images/untitled6.jpg" width="130" height="241" /></td>
    <!-- <td width="160" align="center" valign="middle"><img src="images/untitled7.jpg" width="142" height="250" /></td>
    <td width="160" align="center" valign="middle"><img src="images/untitled8.jpg" width="170" height="246" /></td>
    <td width="160" align="center" valign="middle"><img src="images/untitled9.jpg" width="129" height="237" /></td>
   --></tr>
  <tr>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><a href="html/chanpin1.jsp" >宠物清洁预约</a></td>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><a href="html/chanpin2.jsp" >进口商品预约</a></td>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><a href="html/chanpin3.jsp" >宠物零食预约</a></td>
    <!-- <td height="30" align="center" valign="middle" class="STYLE3 STYLE4">牛油果贵宾狗粮</td>
    <td align="center" valign="middle" class="STYLE3 STYLE4">天然亮毛配方狗粮</td>
    <td align="center" valign="middle" class="STYLE3 STYLE4"><a href="html/chanpin3.html" >天然膳食健康狗粮</a></td>
   --></tr>
  <!-- <tr>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price">¥39.90 / 1.5kg</strong></td>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price2">¥109.00 / 10kg</strong></td>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price3">¥198.00 / 20kg</strong></td>
    <td height="30" align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price4">¥49.9 / 1.5kg</strong></td>
    <td align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price5">¥59.9 / 2kg*2</strong></td>
    <td align="center" valign="middle" class="STYLE3 STYLE4"><strong id="d_price6">¥218.00 / 20kg</strong></td>
  </tr> -->
        </table>

    </td>
  </tr>
  <tr>
    <td><table width="960" border="0" cellspacing="0" cellpadding="0" style="padding-top:90PX;">
  <!-- <tr>
    <td height="60" colspan="4"><img src="images/untitled14.png" width="669" height="101" /></td>
    <td width="454"><p><img src="images/untitled17.png" alt="" width="264" height="81" align="middle" /></p>
      <p>&nbsp;</p></td>
    </tr>
   <tr>
    <td width="166" height="129" align="center" valign="middle"><img src="images/untitled10.jpg" width="138" height="147" /></td>
    <td width="211" align="left" valign="top" class=" STYLE3" style="line-height:20px;"><b>皇家</b><br />法国皇家狗粮成立于1967年，坐落于法国南部城市蒙彼利埃附近的埃玛哥上的一个小村落，正处在塞伯尼的低丘陵地带，远处地平线上可以看见地中海曲折的海岸线。</td>
    --><!-- <td width="143" align="center" valign="middle"><img src="images/untitled11.jpg" width="110" height="135" /></td>
     <td width="238" align="left" valign="top" class=" STYLE3" style="line-height:20px; padding-right:10px;"><b>宝路
</b><br />
宝路是国际宠物食品制造商玛氏公司的核心宠物品牌。宝路的销售遍布全球一百多个国家，受到世界各地爱犬人士的喜爱和信赖。</td>
    <td rowspan="3" align="left" valign="top"><div style="padding:10px;"><table width="220" border="0" cellspacing="0" cellpadding="0">
   --><!--<tr>
    <td width="27" height="90" align="left" valign="top"  class="STYLE3 STYLE4">01</td>
    <td width="66" align="left" valign="top"><img src="images/untitled1.jpg" width="80" height="76"  /></td>
    <td width="127" align="left" valign="top" class=" STYLE3" style="line-height:20px; padding-right:10px;"><b>疯狂的小狗 狗粮 泰迪</b><br />
¥39.90
</td>
  </tr>
  <tr>
     <td width="27" height="89" align="left" valign="top"  class="STYLE3 STYLE4">02</td>
    <td width="66" align="left" valign="top"><img src="images/untitled2.jpg" width="76" height="86" /></td>
    <td width="127" align="left" valign="top" class=" STYLE3" style="line-height:20px; padding-right:10px;"><b>
新宠之康宠物羊奶粉 
</b><br />
¥39.90
</td>
  </tr>
  <tr>
     <td width="27" height="86" align="left" valign="top"  class="STYLE3 STYLE4">03</td>
    <td width="66" align="left" valign="top"><img src="images/untitled3.jpg" width="78" height="82" /></td>
    <td width="127" align="left" valign="top" class=" STYLE3" style="line-height:20px; padding-right:10px;"><p><b>
      宠物消毒液除臭剂
      
      </b><br />
      ¥35.00
 </p></td>
  </tr>
</table>
</div></td>
    </tr>
  <tr>
    <td align="center" valign="middle">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td align="center" valign="middle"><img src="images/untitled12.jpg" width="123" height="132" /></td>
    <td width="211" align="left" valign="top" class=" STYLE3" style="line-height:20px;"><b>蓝氏</b><br />
      <span class=" STYLE3" style="line-height:20px;">LEGENDSANDY自2009年6月登陆中国至今，以四大功效为己任，以会员制理念为服务宗旨，全方位呵护您的爱犬，为您和爱犬的快乐人生保驾护航！</span></td>
    <td align="center" valign="middle"><img src="images/untitled13.jpg" width="114" height="142" /></td>
    <td width="238" align="left" valign="top" class=" STYLE3" style="line-height:20px;"><b>伯纳天纯</b><br />
      伯纳天纯，美国创为生物技术有限公司旗下品牌。依托美国创为多年的科研积累，伯纳天纯致力于为全球爱宠人士提供满足爱宠健康、情感需求的产品。</td>
    </tr>
</table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr> 
  <tr>
    <td><div style="background:url(images/footer.jpg) no-repeat left center; padding-top:50px; text-align:center; line-height:30px; font-size:12px; color:#fff; padding-bottom:15px;"></div></td>
  </tr>-->
</table>


</div>
   
  </body>
</html>
