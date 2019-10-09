/*
 * 这是之前的海量点的那个地图，我这边测试用的
 * 这个js是用来绘制普通用户飞机的飞行轨迹的，所以叫轨迹地图
 * 直接把轨迹地图的脚本全部替换过来
 * */


// 百度地图API功能


var map = new BMap.Map("allmap"); // 创建地图实例
	map.centerAndZoom(new BMap.Point(121.9150776542, 30.8803154881), 12); //测试地点
	map.enableScrollWheelZoom(true);
	var mapType2 = new BMap.MapTypeControl({
		anchor : BMAP_ANCHOR_TOP_LEFT
	});
	map.addControl(mapType2);
	/**var bounds = map.getBounds();
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r) {
		if (this.getStatus() == BMAP_STATUS_SUCCESS) {
			map.centerAndZoom(r.point, 12); // 初始化地图，设置中心点坐标和地图级别  
		} else {
			alert('failed' + this.getStatus());
		}
	}, {
		enableHighAccuracy : true
	});*/
  	
	
	var pointCollection;
    var circleArea = [];
	var polygonArea = []; 
	
	
	var styleOptions = {
		strokeColor : "red", //边线颜色。
		fillColor : "red", //填充颜色。当参数为空时，圆形将没有填充效果。
		strokeWeight : 3, //边线的宽度，以像素为单位。
		strokeOpacity : 0.8, //边线透明度，取值范围0 - 1。
		fillOpacity : 0.6, //填充的透明度，取值范围0 - 1。
		strokeStyle : 'solid' //边线的样式，solid或dashed。
	}
	
	var options = {
		size : BMAP_POINT_SIZE_NORMAL,
		shape : BMAP_POINT_SHAPE_CIRCLE,
		color : '#d340c3'
	}
	/*申凯需要做的：这个函数里面的number就是在禁飞区域内的用户号码，通过这个号码通知用户飞离禁飞区*/
   function  sendWaring(number){
	   //return number;
		$.ajax({
			url:"add_number.do",
			type:"post",
			data:"nofly_number="+number
		});
   }
	


	/*申凯需要做的：普通用户登录成功后，调用这个函数将单个飞机的实时信息绘制在地图上*/
	function addAllPlane(info) {	
		
			 var length=map.getOverlays().length;
			 var overlays=map.getOverlays();   //地图上的覆盖物
			 
			 for(var i=0;i<length;i++){	        //删除覆盖物
	                var type="type"+overlays[i];	
	                if(type!="type[object PointCollection]"&&type!="type[object Circle]"&&type!="type[object Polygon]")	{
					    map.removeOverlay(overlays[i]); 
					   }             
				     }					    
	 var points = [];        // 添加海量点数据			 
	  var arr=new Array();
	  arr=info.split("\n");     	
	  for(var i=0;i<arr.length-1;i++){   //真实测试时减2
			  var oneInfo=arr[i].split(";");
			  points.push(new BMap.Point(oneInfo[4].slice(4), oneInfo[5].slice(4)));			  
       var opts = {
	           position : points[i],    // 指定文本标注所在的地理位置
	           offset   : new BMap.Size(10, -20)    //设置文本偏移量
	           }
	var label = new BMap.Label("高度:"+oneInfo[6].slice(4)+"米", opts);  // 创建文本标注对象
		label.setStyle({
			 color : "black",
			 fontSize : "12px",
			 height : "20px",
			 lineHeight : "20px",
			 fontFamily:"微软雅黑"
		 });	      
	   map.addOverlay(label); 
	   ////////////////////////////判断是否在禁飞区域内
              var result;	   
          for(var j=0;j<circleArea.length;j++){
			  result=BMapLib.GeoUtils.isPointInCircle(points[i],circleArea[j]);
		  }
       if(result!=true){
          for(var j=0;j<polygonArea.length;j++){
			  result=BMapLib.GeoUtils.isPointInPolygon(points[i],polygonArea[j]);
		  }                 
	   }	   
	   if(result==true){
		   sendWaring(oneInfo[0].slice(5));   //在禁飞区域内，发送信息。
	   }
	  }
     //	  BMapLib.GeoUtils.isPointInCircle  //点是否在园内
	      // BMapLib.GeoUtils.isPointInPolygon   //点是否在多边形内
		  
		  
	        if (document.createElement('canvas').getContext) { // 判断当前浏览器是否支持绘制海量点
			if (typeof pointCollection == "undefined") {
				pointCollection = new BMap.PointCollection(points, options); // 初始化PointCollection
			} else {
				pointCollection.setPoints(points);
			}						
			map.addOverlay(pointCollection);           // 添加Overlay	 							
		} else {
			alert('请在chrome、safari、IE8+以上浏览器查看本示例');
		}
	}
	/* 申凯需要做的： 调用这个函数将禁飞区域绘制在地图上*/

	function AddNoFly(info) {
		
		var arr = new Array();
		arr = info.split("\n");
		for (var i = 0; i < arr.length-1; i++) {
			//console.log(arr);
			console.log(arr[i]);
			var oneInfo = arr[i].split(";");
			console.log(oneInfo);
			if (oneInfo[0].slice(5) == "polygon") { //绘制多边形
				makePolygon(oneInfo);
			} else if (oneInfo[0].slice(5) == "circle") { //绘制圆形
				makeCircle(oneInfo);
			}
		}
	}
	//绘制多边形的函数
	function makePolygon(oneInfo) {
		var spoint = [];
		
		for (var i = 0; i < oneInfo[1].slice(9); i++) {
			//
			spoint.push(new BMap.Point(oneInfo[(i + 1) * 2].slice(4), oneInfo[(i + 1) * 2 + 1].slice(4)));
		}
		console.log(spoint);
		var polygon = new BMap.Polygon(spoint, styleOptions); //创建多边形 
		polygonArea.push(polygon);
		map.addOverlay(polygon);
	}
	//绘制圆的函数
	function makeCircle(oneInfo) {
		var circle = new BMap.Circle(new BMap.Point(oneInfo[2].slice(4), oneInfo[3].slice(4)), //圆心位置
			oneInfo[1].slice(7), //圆的半径
			styleOptions); //创建圆
		circleArea.push(circle);
		map.addOverlay(circle);
	}
	function show(){
		console.log("111111111");
	}