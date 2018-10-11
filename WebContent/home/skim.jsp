<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
</head>
<body>

<div style="font-size: 20px; padding-left:50px;color:black;float:left">
  <form action="statistic.name" id = "sta_name"></form> 
  <form action="statistic.from" id = "sta_from"></form> 
  <form action="statistic.to" id = "sta_to"></form> 
    <br><br>
    <a href="javascript:void(0)"  style ="color:black;text-decoration:none" onclick="editUser()"> 1) Get the proportion of goods in the cargo category
    </a><br><br>
    <a href="javascript:void(0)"  style ="color:black;text-decoration:none" onclick="saveUser()">2) Get the proportion of goods from the originating station</a><br><br>
    <a href="javascript:void(0)"  style ="color:black;text-decoration:none" onclick="destroyUser()">3) Get the proportion of goods arriving at the station</a>
  </div>

<div id="container" style="width: 550px; height: 400px; padding-left:100px;float:left"></div>
<script language="JavaScript">
$(document).ready(function() {  
   var chart = {
       plotBackgroundColor: null,
       plotBorderWidth: null,
       plotShadow: false
   };
   var title = {
      text: 'This is a percentage chart of freight information'
   };      
   var tooltip = {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
   };
   var plotOptions = {
      pie: {
         allowPointSelect: true,
         cursor: 'pointer',
         dataLabels: {
            enabled: true,
            format: '<b>{point.name}%</b>: {point.percentage:.1f} %',
            style: {
               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
         }
      }
   };
   var result = '${list}';
   var score = eval('('+result+')');
   var series= [{
      type: 'pie',
      name: 'Browser share',
      data: [
         [score[0].name,   score[0].num],
         [score[1].name,   score[1].num],
         [score[2].name,   score[2].num],
         [score[3].name,   score[3].num],
         [score[4].name,   score[4].num],
         [score[5].name,   score[5].num],
         [score[6].name,   score[6].num],
         [score[7].name,   score[7].num]
      ]
   }];     
   var json = {};   
   json.chart = chart; 
   json.title = title;     
   json.tooltip = tooltip;  
   json.series = series;
   json.plotOptions = plotOptions;
   $('#container').highcharts(json);  
});
</script>

<script type="text/javascript">
    function editUser(){
      $('#sta_name').submit();
    }
    function saveUser(){
        $('#sta_from').submit();
    }
    function destroyUser(){
        $('#sta_to').submit();
    }
</script>
</body>
</html>