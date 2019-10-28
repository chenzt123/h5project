<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="applicable-device" content="mobile">
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>六合论坛</title>
    <base href="">
    <link rel="stylesheet" type="text/css" href="../resource/leifeng/assets/css/reset.css">
<link rel="stylesheet" type="text/css" href="../resource/leifeng/assets/css/model.css">
    <link rel="stylesheet" type="text/css" href="../resource/lib/layer/theme/default/layer.css">
    <link rel="stylesheet" type="text/css" href="../resource/leifeng/assets/css/layout.css">
    <script type="text/javascript">
        var baseUrl = "";
        var rserver = "http://formu-frontendweb.dj789.net/";
    </script>
    <script src="lib/require.js" type="text/javascript"></script>
    <script src="require.config.js" type="text/javascript"></script>
</head>

<body>
    <div id="wrapper" class="wrapper">
		<div class="content">            
            <div id="header" class="__html_module" data-tmpl="module/header.html"></div>
            <div class="yearlist">
                <script type="text/javascript"> 
                var year = new Date().getFullYear();
                var reg = new RegExp("(^|&)year=([^&]*)(&|$)", "i"); 
                var r = window.location.search.substr(1).match(reg); 
                if (r != null) year = isNaN(parseInt(unescape(r[2])))?0:parseInt(unescape(r[2]));
                </script>
                <h2>
                    <span id="thisyear">你正在查看紧：<strong><script type="text/javascript">document.write(year);</script></strong></span> 年开奖记录
                    <span class="more">查看更多：<select name="moreyear" id="moreyear">
                        <script type="text/javascript">
                            var thisyear = new Date().getFullYear();
                            for(var i=0;i<=20;i++){
                                document.write('<option value="'+(thisyear-i)+'">'+(thisyear-i)+'</option>');
                            }
                        </script>                        
                    </select></span>
                </h2>              
            </div>
            <!-- 游戏列表 -->
            <div id="gamedraw_list"></div>
            <script type="text/javascript"> 
            require(['jquery','tmpl','lib/jquery.tmpl.ext'],function($){
                $(document).ready(function(){ 
                    $("#moreyear").change(function(event){
                        var selectYear = $(this).val();
                        $("#thisyear strong").text(selectYear);
                        $("#gamedraw_list").html("");
                        getDrawListByTmpl('src/gamedraw/list.html',{year:selectYear});
                    });               
                    function getDrawListByTmpl(urlpath,reqOptions){
                        $("#gamedraw_list").loadTmpl({path:urlpath,id:'tmpl_gamedrawList',divid:'#gamedraw_list'},function(options){
                            var reqData = reqOptions?reqOptions:{};
                            var gamedrawListFunction = {
                                htmlGameResultItem:function(listItem){
                                    var resultHtml="";
                                    var gameDateReset = commonFunction.dateToString(listItem.gameDate,"yyyy年MM月dd日");
                                    var gameShortId = listItem.comp_id.drawId.substr(4);
                                    resultHtml +="<p>六合彩开奖直播 "+gameDateReset+" 第"+gameShortId+"期</p>";
                                    //游戏结果
                                    var gameResultArray = listItem.result.split(",");
                                    //五行
                                    var gameResulFivetArray = listItem.resultFive.split(",");
                                    //家禽
                                    var gameResulHometArray = listItem.resultHome.split(",");
                                    //波色
                                    var gameResultWaveArray = listItem.resultWave.split(",");
                                    //生肖
                                    var gameResultZodiacArray = listItem.resultZodiac.split(",");
                                    resultHtml += '<div class="resultDetail">';
                                    resultHtml += '<p class="result_first">';
                                    for(var i=0;i<gameResultArray.length;i++){
                                        var colorTagIndex = parseInt(gameResultWaveArray[i]);
                                        var colorTag = commonFunction.str_wave_color[colorTagIndex]
                                        resultHtml+='<a href="javascript:void(0);" class="'+colorTag+'"><span>'+gameResultArray[i]+'</span></a>';
                                        if(i==5){
                                            resultHtml+='<a href="javascript:void(0);" class="plugin"><span>'+"+"+'</span></a>';
                                        }
                                    }
                                    resultHtml += '</p>';
                                    resultHtml += '<p class="result_sec">';
                                    resultHtml += "<div class='clearfix'>"
                                    for(var i=0;i<gameResultArray.length;i++){
                                        var zodiacIndex = parseInt(gameResultZodiacArray[i]);
                                        var fiveIndex = parseInt(gameResulFivetArray[i]);
                                        resultHtml+='<a href="javascript:void(0);"><span>'+commonFunction.str_zodiac[zodiacIndex]+'&nbsp;/&nbsp;'+commonFunction.str_five[fiveIndex]+'</span></a>';
                                        if(i==5){
                                            resultHtml+='<a href="javascript:void(0);" class="plugin"><span>&nbsp;</span></a>';
                                        }
                                    }
                                    resultHtml += '</p>';
                                    resultHtml += '</div>';
                                    resultHtml += '</div>';
                                    return resultHtml;
                                }
                            };
                            var extFun = $.extend({},commonFunction,gamedrawListFunction);
                            $.ajax({
                                url:rserver+"history/list",
                                data:reqData,
                                dataType:"jsonp",
                                success:function(respData, textStatus, jqXHR){
                                    var resetData = {data:respData};
                                    $("script#"+options.id).tmpl(resetData,extFun).appendTo(options.divid);
                                },
                                error:function(XMLHttpRequest, textStatus, errorThrown){},
                                complete:function(XMLHttpRequest, textStatus){}
                            });
                        });
                    }

                    getDrawListByTmpl('src/gamedraw/list.html',{});
                });
            });
        </script>
        </div>
		<div id="footer" class="__html_module" data-tmpl="module/footer.html"></div>
    </div>      
</body>
</html>