<%--
  Created by IntelliJ IDEA.
  User: 13548
  Date: 2018/5/14
  Time: 17:33
  To change this template use File | Settings | File Templates.
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
    <title>Map</title>
    <script type="text/javascript"
            src="http://webapi.amap.com/maps?v=1.4.4&key=ea746ccdafcc34560cfdc18e89f79f45&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
</head>
<body>
    <div id="container" tabindex="0"></div>
    <script type="text/javascript"
            src="http://webapi.amap.com/maps?v=1.4.4&key=ea746ccdafcc34560cfdc18e89f79f45&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script type="text/javascript">
        var map = new AMap.Map('container',{
            resizeEnable: true,
            zoom: 10,
            center: [116.480983, 40.0958]
        });
        var marker = new AMap.Marker({
            position: [116.480983, 39.989628],//marker所在的位置
            map:map//创建时直接赋予map属性
        });
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
           // infowindow.open(map,[116.480983, 39.989628]);
        })
    </script>
</body>
</html>
