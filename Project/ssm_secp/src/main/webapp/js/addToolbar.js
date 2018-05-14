/**
 * Created with WebStorm && Sublime Text 3
 * Date: 2015/10/29 14:04
 */
window.onload = function() {
    AMap.plugin(["AMap.ToolBar"], function() {
        amap.addControl(new AMap.ToolBar());
    });
    if(location.href.indexOf('&guide=1')!==-1){
        amap.setStatus({scrollWheel:false})
    }
};