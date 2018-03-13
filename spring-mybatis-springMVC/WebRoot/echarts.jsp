<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<!-- 移动设备有限 -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/dist/echarts-all.js"></script>

  </head>
  
  <body>
    <div class="container-fluid" style="margin-top: 50px;">
      <div class="row">
        <div class="col-md-2 sidebar">
        </div>
        <div class="col-md-8">
          <h2 class="page-header">饼图</h2>
          <div class="row placeholders">
            <div class="col-md-12 placeholder">
              <div  id="placePie" style="width: 100%;height: 200px;"></div>
            </div>
          </div>

          <h2 class="page-header">柱状-趋势</h2>
          <div id="main" style="height:400px;"></div>
        </div>
      </div>
    </div>
  </body>
  <script type="text/javascript">
	  jQuery(function($) {
		  // ===================== 柱形图 / 折线图 ==========================//
		  
		  // 初始化图形,macarons 主题，有很多主题，可自己选择
		  var myChart = echarts.init(document.getElementById('main'),'macarons');
		  // 设置图形的初始配置
	      var option = {
	              tooltip: { // 提示框，鼠标悬浮交互时的信息提示
	                  show: true
	              },
	              toolbox: {
	                  show : true,// 是否显示工具箱
	                  feature : {
	                      dataView : {show: true, readOnly: false},// 是否显示数据视图按钮
	                      magicType : {show: true, type: ['line', 'bar']},// 是否显示图形切换按钮
	                      restore : {show: true},//是否显示还原原始数据按钮
	                      saveAsImage : {show: true}//是否显示保存为图片的按钮
	                  }
	              },
	              legend: { // 图例
	                  data:["订单量"]
	              },
	              xAxis :{
	                      data : [''],
		  	              axisLabel :{  // 坐标轴文本标签
							    rotate:45   // 45度角显示
						  } 
	              },
	              yAxis : [
	                  {
	                      type : 'value'
	                  }
	              ],
	              series : [
	                  {
	                      "name":"订单量",// 此处名字,必须和legend.data中的值对应
	                      /* 图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示。可选为：
	                      'line'（折线图） | 'bar'（柱状图） | 'scatter'（散点图） | 'k'（K线图）
	                      'pie'（饼图） | 'radar'（雷达图） | 'chord'（和弦图） | 'force'（力导向布局图） | 'map'（地图） */
	                      "type":"bar",
	                      "data":['']
	                  }
	              ]
	          };
	      	  
	          // 配置对象绑定图形对象
	          myChart.setOption(option); 
	          
	          // 动态获取图形数据
	          function showBar(){
	        	  $.ajax({
	        		   type: "POST",
	        		   url: "${pageContext.request.contextPath}/orders/orderCount4BarByMonth",
	        		   data: {name:"haha"},
	        		   success: function(result){
	        			   // var data = [];
	  						var xAxis_data = [];
	  						var series_data = [];
	  					    $.each(result,function(index,item){
 						      xAxis_data.push(item[0]);
 							  series_data.push(item[1]);
	  									
	  					    })
	  					   myChart.clear();
	  				       option.series[0].data = series_data;
	  				       option.xAxis.data = xAxis_data;
	  				       
	  				       myChart.setOption(option);
	        		   },
	        		   dataType: "json"
	        	  });
	          }
	          
	          showBar();
	       // ===================== 柱形图 / 折线图 end ==========================//
	       
	       // ===================== 饼图  ==========================//
	       var optionPie = {
			    title : {
			        text: '各月份订单比较',
			        subtext: '纯属虚构',
			        x:'center'//位于x中间
			    },
			    tooltip : {//提示
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)" // a（系列名称），b（数据项名称），c（数值）, d（饼图：百分比 | 雷达图：指标名称）
			    },
			    legend: {
			        orient : 'vertical',//垂直显示
			        x : 'left',
			        data:['']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}//是否显示保存图片
			        }
			    },
			    series : [
			        {
			            name:'订单量',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:0, name:'无数据'}
			            ]
			        }
			    ]
			};                                                                   //macarons 主题
	        var myPieChart = echarts.init(document.getElementById('placePie'),'macarons');
	       // 配置对象绑定图形对象
	        myPieChart.setOption(optionPie);
	       // 动态获取图形数据
           function showBar4Pie(){
        	  $.ajax({
        		   type: "POST",
        		   url: "${pageContext.request.contextPath}/orders/orderCount4BarByMonth4Pie",
        		   data: {name:"haha"},
        		   success: function(result){
        			    var data = [];
						var data2 = [];
						$.each(result,function(index,item){
					       data.push({'name':item[0],'value':item[1]});
					       data2.push(item[0]);
					    })
					    if(data.length ==0){
					  		data.push({'name':'无数据','value':0});
					    }
					    myPieChart.clear();
					    optionPie.series[0].data = data;
					    optionPie.legend.data = data2;
					    myPieChart.setOption(optionPie);
        		   },
        		   dataType: "json"
        	  });
          }
           showBar4Pie();
	       // ===================== 饼图 end ==========================//
	  });
	   
  </script>
</html>
