<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
<meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
<title>百度地图API自定义地图</title>
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>

<body>
  <!--百度地图容器-->
  <div style="width:1800px;height:1000px;border:#ccc solid 1px;" id="dituContent"></div>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.838582,39.920829);//定义一个中心点坐标
        map.centerAndZoom(point,7);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
</script>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <style type="text/css">
        body,html,#container{
            height: 100%;
            margin: 0px;
        }
    </style>
    <style type="text/css">
        #panel {
            position: absolute;
            background-color: white;
            max-height: 80%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 250px;
            border: solid 1px silver;
        }
    </style>
    <title>Map</title>
    <%--<script type="text/javascript"--%>
    <%--src="http://webapi.amap.com/maps?v=1.4.4&key=ea746ccdafcc34560cfdc18e89f79f45&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>--%>
</head>
<body>
	<div >
        <form action="showmap.name" style="float:left">
            <input type="text"  name = "name" value =${hint}>
            <input type="radio" name="pos" value="from_pos" checked/> From
            <input type="radio" name="pos" value="to_pos" /> To
            <input type="submit" class="easyui-linkbutton" value = "Name Inquiry">
        </form>
        <form action="showmap.from" style="float:left">
            <input type="text"  name = "from" value =${hint1}>
            <input type="submit" class="easyui-linkbutton" value = "From Inquiry">
        </form>
        <form action="showmap.to" style="float:left width=300px">
            <input type="text" name = "to" value =${hint2}>
            <input type="submit" class="easyui-linkbutton" value = "To Inquiry">
        </form>
    </div>
<div id="container" tabindex="0"></div>
<div id = "panel"></div>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.4.4&key=ea746ccdafcc34560cfdc18e89f79f45&plugin=AMap.Transfer"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script type="text/javascript">
    var map = new AMap.Map('container',{
        resizeEnable: true,
        zoom: 7,//7
        center: [116.480983, 40.0958]
    });
    function isSupportCanvas() {
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
    if (!isSupportCanvas()) {
        alert('热力图仅对支持canvas的浏览器适用,您所使用的浏览器不能使用热力图功能,请换个浏览器试试~')
    }

    //var marker = new AMap.Marker({
    //   position: [116.480983, 39.989628],//marker所在的位置
    //  map:map//创建时直接赋予map属性
    //});

    var heatmap;
    var result = '${list}';
    var points = eval('('+result+')');
    // var points =[
    //     {"lng":1166.191031,"lat":39.988585,"count":100},
    //     {"lng":116.389275,"lat":39.925818,"count":110},
    //     {"lng":116.287444,"lat":39.810742,"count":120},
    //     {"lng":116.481707,"lat":39.940089,"count":800},
    //     {"lng":116.410588,"lat":39.880172,"count":40},
    //     {"lng":116.394816,"lat":39.91181,"count":60},
    //     {"lng":196.416002,"lat":39.952917,"count":80}
    // ];
    map.plugin(["AMap.Heatmap"],function() {      //加载热力图插件
        heatmap = new AMap.Heatmap(map,{
            // radius: 25, //给定半径
            //opacity: [0, 0.8]
        });    //在地图对象叠加热力图
        heatmap.setDataSet({data:points}); //设置热力图数据集
        // //具体参数见接口文档
    });
    //heatmap.setmap(map);
    //heatmap.show();

    /*
        AMap.plugin(['AMap.ToolBar','AMap.AdvancedInfoWindow'],function(){
            //创建并添加工具条控件
            var toolBar = new AMap.ToolBar();
            map.addControl(toolBar);
            //创建高级信息窗体并在指定位置打开
            var infowindow = new AMap.AdvancedInfoWindow({
                content: '<div class="info-title">高德地图</div><div class="info-content">'+
                '<img src="http://webapi.amap.com/images/amap.jpg">'+
                '高德是中国领先的数字地图内容、导航和位置服务解决方案提供商。<br>'+
                '<a target="_blank" href="http://mobile.amap.com/">点击下载高德地图</a></div>',
                offset: new AMap.Pixel(0, -30)
            });
            //infowindow.open(map,[113.3095084,23.106182800000003]);

        })
        */
    /*
            var transOptions = {
                map: map,
                city: '广州',
                panel: 'panel',
                cityd:'昌吉',
                autoFitView:"true",
                policy: AMap.TransferPolicy.LEAST_FEE

            };
            //构造公交换乘类
            var transfer = new AMap.Transfer(transOptions);
            //根据起、终点坐标查询公交换乘路线
            transfer.search(new AMap.LngLat(113.3095084,23.106182800000003), new AMap.LngLat(87.073618,44.175083),function(status,result){
            });
            */
</script>
</body>
</html>
