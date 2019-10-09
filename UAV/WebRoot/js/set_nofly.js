/*
 * 这是管理员划定禁飞区地图
 * */



      console.log("tou");
	var map = new BMap.Map("allmap");       // 创建地图实例
	map.centerAndZoom(new BMap.Point(121.9150776542,30.8803154881), 18);   
    map.enableScrollWheelZoom(true);
   
	var mapType2 = new BMap.MapTypeControl({anchor: BMAP_ANCHOR_TOP_LEFT});
	map.addControl(mapType2);                                       //添加卫星地图
	
	//var bounds=map.getBounds(); 
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){		  
			map.centerAndZoom(r.point, 12);                 // 初始化地图，设置中心点坐标和地图级别  
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true});
	var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
	function sendAreaData(info){
	                           //申凯需要做的:
	         
	     var begintime=$("#begintime").val();
			var endtime=$("#endtime").val();
			console.log(info);
			$.ajax({
				url:"add_no_fly.do",
				type:"post",
				data:"info="+info+"&begintime="+begintime+"&endtime="+endtime
			});
	     
	     //在这个函数里面添加代码，将禁飞区域数据以及禁飞时间上传到服务器
							   //禁飞数据从info中获得
							   //禁飞时间从左边控件（start_time，end_time）中获得
	}
	/*  申凯需要做的：调用这个函数，绘制禁飞区域 */
	function AddNoFly(info){
	  var arr=new Array();
	  arr=info.split("\n");     
	  for(var i=0;i<arr.length;i++){
		  var oneInfo=arr[i].split(";");
		  if(oneInfo[0].slice(5)=="polygon") {  //绘制多边形
		             makePolygon(oneInfo);                
			} 
			else if(oneInfo[0].slice(5)=="circle"){  //绘制圆形
			  makeCircle(oneInfo);
			}
	  }
	}
	//绘制多边形的函数
	function makePolygon(oneInfo){ 	
		var spoint=[];
		for(var i=0;i<oneInfo[1].slice(9);i++){
			spoint.push(new BMap.Point(oneInfo[(i+1)*2].slice(4),oneInfo[(i+1)*2+1].slice(4)));
		}
		var polygon = new BMap.Polygon(spoint,styleOptions);  //创建多边形 
		map.addOverlay(polygon);  
	}
	//绘制圆的函数
	function makeCircle(oneInfo){
		var circle = new BMap.Circle(new BMap.Point(oneInfo[2].slice(4),oneInfo[3].slice(4)),  //圆心位置
		oneInfo[1].slice(7),                                         //圆的半径
		styleOptions); //创建圆
		map.addOverlay(circle);  
	}
	//模拟数据
	var info="Type:circle;Radius:812.2163815235022;Lon:121.882147;Lat:30.910192"+"\n"+
	          "Type:polygon;PointNum:3;Lon:121.898389;Lat:30.909572;Lon:121.898748;Lat:30.899967;Lon:121.908665;Lat:30.912113"+"\n"+
			  "Type:polygon;PointNum:4;Lon:121.383265;Lat:31.002354;Lon:121.468927;Lat:31.002354;Lon:121.468927;Lat:30.949842;Lon:121.383265;Lat:30.949842";
		//AddNoFly(info);	  
 
	var polygoncomplete = function(e, overlay){
	var info="Type:polygon;PointNum:"+(overlay.ia.length-1)+";";
	 for(var i=0;i<overlay.ia.length-1;i++){
	  info=info+"Lon:"+overlay.ia[i].lng+";"+"Lat:"+overlay.ia[i].lat+";";
	 }
	 sendAreaData(info);
		// console.log(overlay);    
        // console.log(info);		  //多边形每个点的数据， 
    };
	var circlecomplete =function(e, overlay){
	var info="Type:circle;Radius:"+overlay.xa+";";
	 //for(var i=0;i<overlay.ia.length-1;i++){
	  info=info+"Lon:"+overlay.point.lng+";"+"Lat:"+overlay.point.lat+";";
	 //}
	 sendAreaData(info);
	   //console.log(overlay.point);   //圆心
	   //console.log(overlay.xa);     //半径
	}
	var rectanglecomplete=function(e,overlay){
		console.log(info);
	var info="Type:polygon;PointNum:"+(overlay.ia.length-1)+";";
	 for(var i=0;i<overlay.ia.length-1;i++){
	  info=info+"Lon:"+overlay.ia[i].lng+";"+"Lat:"+overlay.ia[i].lat+";";
	 }
	 sendAreaData(info);
	 
	   //console.log(overlay);    
	  // console.log(overlay.ia);    //矩形区域数据
	}
    //实例化鼠标绘制工具
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: true, //是否显示工具栏
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
            offset: new BMap.Size(5, 5), //偏离值
        },
        circleOptions: styleOptions, //圆的样式
        polylineOptions: styleOptions, //线的样式
        polygonOptions: styleOptions, //多边形的样式
        rectangleOptions: styleOptions //矩形的样式
    });  
	 //添加鼠标绘制工具监听事件，用于获取绘制结果
   // console.log("jgljfsdffsdfdsfsdf");
    drawingManager.addEventListener('polygoncomplete', polygoncomplete);
	drawingManager.addEventListener('circlecomplete', circlecomplete);
	drawingManager.addEventListener('rectanglecomplete', rectanglecomplete);
//	console.log("jgljfsd");