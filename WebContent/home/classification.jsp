
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="utf-8"/>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>showMap</title>
    <link type="text/css" href="../css/main1119.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/papaparse.js"></script>
    <script src="../js/jschardet.js"></script>
    <!--[if lte IE 9]>
    <script src="js/base64.js"></script>
    <![endif]-->
    <%--<base href="//webapi.amap.com/ui/1.0/ui/misc/PoiPicker/examples/" />--%>
    <script src="../js/csv2arr.js"></script>
    <script src="http://webapi.amap.com/loca?key=ea746ccdafcc34560cfdc18e89f79f45"></script>
    <script type="text/javascript"
            src="http://webapi.amap.com/maps?v=1.4.4&key=ea746ccdafcc34560cfdc18e89f79f45&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <script src="../js/temp.js"></script>
</head>
<body>
<div>
	<input type="file" name="csvfile" onchange="csv()"/>
	<!-- <input type="button" onclick="csv()" value="绘制"/> -->
	<div id="myPageTop" style="float:right">
	    <label for="tipinput">请输入关键字：</label>
	    <input id="tipinput"/>           
	</div>
</div>
<div  id="tip_pic" style="padding-top:200px" align="center"><img  src="image/cla.png"></div>
<br/>
<div id="container" style="width: 100%; height:100%"></div>
<script>
    var temp_radii = 20000;

    function csv() {
        var tip_p = document.getElementById("tip_pic");
        tip_p.parentNode.removeChild(tip_p);
        $("input[name=csvfile]").csv2arr(function (arr) {
//            console.log(arr);

            //sort the data by cluster number
            arr.sort(function (a, b) {
                return a[1] - b[1];
            });
//            console.log(arr);

            //raw data
            var rawData = arr;
            var rawDataJson = ArrToJson(arr);
//            var array = arr;
//            for (var i = 1; i < array.length; i++) {
//                rawData[i - 1] = {};
//                for (var k = 0; k < array[0].length && k < array[i].length; k++) {
//                    var key = array[0][k];
//                    rawData[i - 1][key] = array[i][k]
//                }
//            }

            //cluster data
            [clusterDataJson, clusterData] = getClusterData(arr);
//            clusterData.push(["Longitude","Latitude","Radius"]);
//            var clusterSet = [];
//            var current_cluster = 0;
//            var clusterNum = 1;
//            for (i = 1; i < array.length; i++) {
//                var clustertemp = array[i][1];
//                if ((current_cluster+"") === clustertemp) {
//                    var temp = array[i];
//                    clusterSet.push(temp);
//                } else {
//                    current_cluster = array[i][1];
//                    clusterData[clusterNum] = getClusterDataSubSet(clusterSet);
//                    clusterSet.splice(0,clusterSet.length);
//                    temp = array[i];
//                    clusterSet.push(temp);
//                    clusterNum++;
//
//                }
//            }

            console.log('rawData',rawData);
            console.log('clusterData'+clusterData);
            console.log('rawDataJson',rawDataJson);
            console.log('clusterDataJson',clusterDataJson);
            showMap(rawDataJson, clusterDataJson,rawData,clusterData);
        });
    }

    function getClusterData(trans_set) {
        var array = trans_set;
        var clusterData = [];
        clusterData.push(["Longitude", "Latitude", "Radii"]);
        var clusterSet = [];
        var current_cluster = 0;
        var clusterNum = 1;
        for (i = 1; i < array.length; i++) {
            var clustertemp = array[i][1];
            if ((current_cluster + "") === clustertemp) {
                var temp = array[i];
                clusterSet.push(temp);
            } else {
                current_cluster = array[i][1];
                clusterData[clusterNum] = getClusterDataSubSet(clusterSet);
                clusterSet.splice(0, clusterSet.length);
                temp = array[i];
                clusterSet.push(temp);
                clusterNum++;
            }
        }

        var clusterRawData = clusterData;
        clusterData = ArrToJson(clusterData);
        return [clusterData, clusterRawData];
    }

    function ArrToJson(trans_set) {
        var rawData = [];
        var array = trans_set;
        for (var i = 1; i < array.length; i++) {
            rawData[i - 1] = {};
            for (var k = 0; k < array[0].length && k < array[i].length; k++) {
                var key = array[0][k];
                rawData[i - 1][key] = array[i][k]
            }
        }
        return rawData;
    }

    function getClusterDataSubSet(clusterSet) {
        [moidlongitude, moidlatitude] = getMoid(clusterSet);
        var distance = [clusterSet.length];
        for (var m = 0; m < clusterSet.length; m++) {
            distance[m] = getDistance(moidlongitude, moidlatitude, parseFloat(clusterSet[m][3]), parseFloat(clusterSet[m][4]));
//            distance[m] = distance[m] + parseFloat(clusterSet[m][2]);
            distance[m] = distance[m] + parseFloat(temp_radii);
        }
        var temp = 0;
        for (var n = 0; n < distance.length; n++) {
            if (temp < distance[n]) {
                temp = distance[n];
            }
        }
        return [moidlongitude, moidlatitude, temp];
    }

    function toRad(d) {
        return d * Math.PI / 180;
    }
    function getDistance(lng1, lat1, lng2, lat2) {
        var dis = 0;
        var radLat1 = toRad(lat1);
        var radLat2 = toRad(lat2);
        var deltaLat = radLat1 - radLat2;
        var deltaLng = toRad(lng1) - toRad(lng2);
        dis = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(deltaLat / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(deltaLng / 2), 2)));
        return dis * 6378137;
    }

    function getMoid(clusterSet) {
        var longitude = 0.0;
        var latitude = 0.0;
        for (var k = 0; k < clusterSet.length; k++) {
            longitude = longitude + parseFloat(clusterSet[k][3]);
            latitude = latitude + parseFloat(clusterSet[k][4]);
        }

        longitude = longitude / k;
        latitude = latitude / k;
        return [longitude, latitude]
    }

    function showMap(rawDataJson,clusterDataJson,rawData, clusterData) {
        var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});

        var amap = new AMap.Map('container', {
            mapStyle: 'amap://styles/sprite',
            zoom: 5,
            center: [107.4976, 32.1697],
            features: ['bg', 'road'],
            fitView: true
        });
       doResearch(amap);
        showEachInfo(amap,rawData, clusterData);

        AMap.plugin(['AMap.ToolBar'],
            function () {
                amap.addControl(new AMap.ToolBar());
            });
        var map = Loca.create(amap);
        var layer2 = Loca.visualLayer({
            container: map,
            type: 'point',
            shape: 'circle'
        });

        layer2.setData(clusterDataJson, {
            lnglat: function (clusterDataJson) {
                var data = clusterDataJson.value;
                return [data.Longitude, data.Latitude];
            }
        });
        layer2.setOptions({
            style: {
                radius: function (clusterDataJson) {
                    return clusterDataJson.value.Radii;
                },
                stroke: 'red',
                lineWidth: 1,
                opacity: 0.6
            },
            unit: 'meter'
        });

        var layer1 = Loca.visualLayer({
            container: map,
            type: 'point',
            shape: 'circle'
        });

        layer1.setData(rawDataJson, {
            lnglat: function (rawDataJson) {
                var data = rawDataJson.value;
                return [data.Longitude, data.Latitude];
            }
        });
        layer1.setOptions({
            style: {
                radius: function (rawDataJson) {
//                    var data = rawDataJson.value.Radii;
                    return temp_radii;
                },
                fill: function (rawDataJson) {
                    var data = rawDataJson.value.Radii;
                    if (data < 100000) {
                        return '#C1FFC1';
                    } else if (data >= 100000 && data < 300000) {
                        return '#54FF9F';
                    } else if (data >= 300000 && data < 500000) {
                        return '#008B45';
                    } else {
                        return '#6E8B3D';
                    }
                },
                stroke: 'gray',
                lineWidth: 1,
                opacity: 0.6
            },
            unit: 'meter'
        });
        layer1.render();
        layer2.render();


        var marker1 = new AMap.Marker({
            position: [0,0],
            map: amap,
            size:new AMap.Size(10,10)
        });
            amap.on('click', function(event) {
                var circle = new AMap.Circle(0,0);
                var flag = true;
                for (var i = 1; i < rawData.length; i++) {
                    circle.setRadius(20000);
                    lnglatXY = [parseFloat(rawData[i][3]),parseFloat(rawData[i][4])];
                    //circle.setCenter(parseFloat(rawData[i][3]),parseFloat(rawData[i][4]))
                    circle.setCenter(lnglatXY);
                    if (circle.contains(event.lnglat)){
                        flag = false;
                        marker1.setPosition([parseFloat(rawData[i][3]),parseFloat(rawData[i][4])]);
                        marker1.content = rawData[i][0] + '市\r\n' +
                            '类别: '+ rawData[i][1]+
                            '吨数: '+ rawData[i][2];
                        marker1.on('click', markerClick);
                        marker1.emit('click', {target: marker1});
                    }
                }
                if  (flag){

                    for (var i = 1,marker; i < clusterData.length; i++) {

                        circle.setRadius(clusterData[i][2]);
                        lnglatXY = [parseFloat(clusterData[i][0]),parseFloat(clusterData[i][1])];
                        circle.setCenter(lnglatXY);
                        if (circle.contains(event.lnglat)) {
                            marker1.setPosition([parseFloat(clusterData[i][0]), parseFloat(clusterData[i][1])]);
                            marker1.content = '半径: ' + clusterData[i][2];
                            marker1.on('click', markerClick);
                            marker1.emit('click', {target: marker});
                        }
                    }
                }

                function markerClick(e) {
                    infoWindow.setContent(e.target.content);
                    infoWindow.open(amap, e.target.getPosition());
                }
        });


    }

    function showEachInfo(map, rawData, clusterData) {
        //var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});

        // for (var i = 1, marker; i < rawData.length; i++) {
        //     marker = new AMap.Marker({
        //         position: [parseFloat(rawData[i][3]),parseFloat(rawData[i][4])],
        //         map: map,
        //         size:new AMap.Size(10,10)
        //     });
        //     marker.content = rawData[i][0] + '市\r\n' +
        //                     '类别: '+ rawData[i][1]+
        //                     '吨数: '+ rawData[i][2];
        //     marker.on('click', markerClick);
        //     marker.emit('click', {target: marker});
        // }
        // for (var i = 1,marker; i < clusterData.length; i++) {
        //     marker = new AMap.Marker({
        //         position: [parseFloat(clusterData[i][0]),parseFloat(clusterData[i][1])],
        //         map: map,
        //         size:new AMap.Size(10,10)
        //     });
        //     marker.content = '半径: '+ clusterData[i][0];
        //     marker.on('click', markerClick);
        //     marker.emit('click', {target: marker});
        // }
        // function markerClick(e) {
        //     infoWindow.setContent(e.target.content);
        //     infoWindow.open(map, e.target.getPosition());
        // }
        //
        // map.setFitView();
    }

    function doResearch(map) {
        //输入提示
        var autoOptions = {
            input: "tipinput"
        };
        var auto = new AMap.Autocomplete(autoOptions);
        var placeSearch = new AMap.PlaceSearch({
            map: map
        });  //构造地点查询类
        AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
        function select(e) {
            placeSearch.setCity(e.poi.adcode);
            placeSearch.search(e.poi.name);  //关键字查询查询
        }
    }

</script>


</body>
</html>