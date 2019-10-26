<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/26 0026
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="utf-8">
    <title>资讯后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="resource/style/css/admin.css" media="all">
    <script src="resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="resource/js/formCheck.js"></script>
    <script src="resource/js/ajaxToLogin.js"></script>

    <script>
        $(function() {
            // alert(11111);
            getTree();
        });

        function getTree(){
            // alert(1111);
            $.ajax({
                url:'getMenuForRoleCode',
                async:false,
                success:function(data){
                    var datas = eval('data');
                    //alert(datas);
                    $("#LAY-system-side-menu").html(datas);
                }
            });
        }


        //修改密码
        function changePwd(){
            layer.open({
                type: 1,
                btnAlign: 'c',
                area: ['500px', '350px'],
                title: '修改密码',
                resize:false,
                content: $("#changePwd"),
                btn:['确认','取消'],
                yes: function(index, layero){
                    var lastPwd = $("#lastPwd").val();
                    var repNewPwd = $("#repNewPwd").val();
                    var loginPwd = $("#loginPwd").val();
                    if(formvalide['form'].validate('fromChangePwd')){
                        if(loginPwd == '' || loginPwd.length == 0){
                            formvalide['showMsg'].validate(true, $("#loginPwd")[0],"旧密码不能为空");
                            return false;
                        }else if(loginPwd.length > 16){
                            formvalide['showMsg'].validate(true, $("#loginPwd")[0],"此信息最多为16个字符");
                            return false;
                        }else if(loginPwd.length < 6){
                            formvalide['showMsg'].validate(true, $("#loginPwd")[0],"此信息最至少6个字符");
                            return false;
                        }
                        if(lastPwd == '' || lastPwd.length == 0){
                            formvalide['showMsg'].validate(true, $("#lastPwd")[0],"新密码不能为空");
                            return false;
                        }else if(lastPwd.length > 16 && lastPwd.length < 6){
                            formvalide['showMsg'].validate(true, $("#lastPwd")[0],"此信息最多为16个字符");
                            return false;
                        }else if(lastPwd.length < 6){
                            formvalide['showMsg'].validate(true, $("#lastPwd")[0],"此信息最至少6个字符");
                            return false;
                        }else if(lastPwd == "123456"){
                            formvalide['showMsg'].validate(true, $("#lastPwd")[0], "新密码不能与初始化密码一样");
                            return false;
                        }
                        if(lastPwd != repNewPwd){
                            formvalide['showMsg'].validate(true, $("#repNewPwd")[0],"两次密码不一致");
                            return false;
                        }
                        if(/^\s+$/g.test(lastPwd)){
                            formvalide['showMsg'].validate(true, $("#lastPwd")[0],"不能输入空格或空");
                            return false;
                        }
                        $.ajax({
                            url:"/updatePassword",
                            data:$("#fromChangePwd").serialize(),
                            type:"POST",
                            dataType : "json",
                            success : function(data){
                                if(data.success){
                                    layer.close(index);
                                    layer.msg(data.msg,{icon: 1,time:1000},function(){
                                       // location.href ="logOff";登出
                                    });
                                }else{
                                    layer.msg(data.msg,{icon: 2});
                                }
                            }
                        });
                    }
                },
                btn2: function(index, layero){
                    layer.closeAll();
                },
                cancel: function(){
                    layer.closeAll();
                }
            });
        }


        //退出系统
        function outSys(){
            layer.confirm('是否确认退出系统？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                location.href ="logOut";
            }, function(){
            });
        }
    </script>
</head>

<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="http://www.layui.com/admin/" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a lay-href="javascript:;" layadmin-event="message" lay-text="消息中心">
                        <i class="layui-icon layui-icon-notice"></i>

                        <!-- 如果有新消息，则显示小圆点 -->
                        <span class="layui-badge-dot"></span>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>
                            ${userName}
                        </cite>
                    </a>
                    <dl class="layui-nav-child">
<%--                        <dd>--%>
<%--                            <a lay-href="set/user/info.html">基本资料</a>--%>
<%--                        </dd>--%>
                        <dd>
                            <a href="javascript:changePwd();">修改密码</a>
                        </dd>
                        <hr>
                        <dd style="text-align: center;">
                            <a href="javascript:outSys();">退出</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->

        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="home/console.html">
                    <span>六合咨询管理系统</span>

                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">

                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>demo</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;">公共</a>
                                <dl class="layui-nav-child">
                                    <dd><a lay-href="/index">公共</a></dd>
                                </dl>
                            </dd>
                            <dd>
                                <a href="javascript:;">曾道人</a>
                                <dl class="layui-nav-child">
                                    <dd><a lay-href="${ctx}/web/module/zdr/zm1.do?_action=edit">主打</a></dd>
                                    <dd><a lay-href="${ctx}/web/module/zdr/zm4.do">平特一肖</a></dd>
                                    <dd><a lay-href="${ctx}/web/module/zdr/gaoshou.do?_action=list">高手资料区</a></dd>
                                </dl>
                            </dd>
                            <dd>
                                <a href="javascript:;">管家婆</a>
                                <dl class="layui-nav-child">
                                    <dd><a lay-href="${ctx}/web/module/zdr/zm1.do?_action=edit">主打</a></dd>
                                    <dd><a lay-href="${ctx}/web/module/zdr/zm4.do">平特一肖</a></dd>
                                </dl>
                            </dd>
                        </dl>
                    </li>

                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs">
                                <a href="javascript:;">关闭当前标签页</a>
                            </dd>
                            <dd layadmin-event="closeOtherTabs">
                                <a href="javascript:;">关闭其它标签页</a>
                            </dd>
                            <dd layadmin-event="closeAllTabs">
                                <a href="javascript:;">关闭全部标签页</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>

<%--        修改密码--%>
        <div style="display: none;" id="changePwd" class="change-pas-box">
            <form id="fromChangePwd" action="" class="layui-form">
                <div class="layui-fluid">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <div class="layui-card">

                                <div class="layui-card-body" pad15>
                                    <div class="layui-form" lay-filter="">
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">当前密码</label>
                                            <div class="layui-input-inline">
                                                <input type="password" id="loginPwd" name="loginPwd" lay-verify="required" lay-verType="tips" onkeyup="formvalide['input'].validate(this)" onblur="formvalide['input'].validate(this)" class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">新密码</label>
                                            <div class="layui-input-inline">
                                                <input type="password" id="lastPwd" name="lastPwd" lay-verify="pass" lay-verType="tips" autocomplete="off" onkeyup="formvalide['input'].validate(this)" onblur="formvalide['input'].validate(this)"   class="layui-input">
                                            </div>
                                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">确认新密码</label>
                                            <div class="layui-input-inline">
                                                <input type="password" id="repNewPwd" name="repNewPwd" lay-verify="repass" lay-verType="tips" autocomplete="off" onkeyup="formvalide['input'].validate(this)" onblur="formvalide['input'].validate(this)" class="layui-input">
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>



        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <%-- <iframe src="${ctx}/web/dashboard.do" frameborder="0" class="layadmin-iframe"></iframe> --%>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="resource/layui/layui.js"></script>
<script>
    layui.config({
        base: 'resource/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>
</body>

</html>