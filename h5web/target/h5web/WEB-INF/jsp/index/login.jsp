<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="resource/style/css/login.css" media="all">
    <script src="resource/js/jquery.min.js"></script>
    <script type="text/javascript">

        if(top!=self){
            if(top.location != self.location)
                top.location=self.location;
        }

        //生成验证码
        function veilCode(){
            var rand = Math.round(Math.random()*100000);
            // $("#authcode").attr("src","authcode.jsp?_=" + rand)  ;
            $("#authcode").attr("src","toAuthcode?rand=" + rand)  ;

        }
        $(function(){
            veilCode();
        });
        function showInfo(message){
            $("#icon").html("");
            $("#icon").html(message);
            $("#icon").show();
            return;
        }
    </script>
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>体育资讯后台管理</h2>
            <p></p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <a href="javascript:veilCode();" class="sx">
                                <img id="authcode" class="layadmin-user-login-codeimg" src="toAuthcode" alt="" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="layui-form-item" style="margin-bottom: 20px;">--%>
            <%--<input type="checkbox" name="remember" lay-skin="primary" title="记住密码">--%>
            <%--<a href="javascript:;" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>--%>
            <%--</div>--%>
            <div class="layui-form-item">
                <button id="submit" class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
            </div>
        </div>
    </div>

    <div class="layui-trans layadmin-user-login-footer">

        <p>© 2019 <a href="javascript:;" target="_blank">招盈资讯</a></p>
    </div>


</div>

<script src="resource/layui/layui.js"></script>
<script>
    layui.config({
        base: 'resource/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user', 'form' ,'element'], function(){
        var $ = layui.$
            ,setter = layui.setter
            ,admin = layui.admin
            ,form = layui.form
            ,router = layui.router()
            ,search = router.search;

        form.render();

        //提交
        // form.on('submit(LAY-user-login-submit)', function(obj){
        //     datas = "";
        //     var u=  $("#LAY-user-login-username").val();
        //     var p= $("#LAY-user-login-password").val();
        //     var authcode = $("#LAY-user-login-vercode").val();
        //     var now = new Date(), month=now.getMonth()+1, date=now.getDate();
        //     var d = ""+now.getFullYear()+"-"+(month>9?month:("0"+month))+"-"+(date<10?("0"+date):date);
        //     $.ajax({
        //         url:'loginUser',
        //         type:"post",
        //         data:{"loginName":u, "loginPwd":p,"clientDate":d,"authcode":authcode,"v":new Date().getTime()},
        //         async:false,
        //         success:function(data){
        //             if(data.success){
        //                 num=1;
        //                 window.location.href = "index";
        //             }else{
        //                 datas = data.msg;
        //                 layer.msg(datas, {
        //                         offset: '15px'
        //                         ,icon: 1
        //                         ,time: 1000
        //                     })
        //             }
        //         }
        //
        //     });
        //
        //
        //
        //
        //     // layer.msg('登入成功', {
        //     //     offset: '15px'
        //     //     ,icon: 1
        //     //     ,time: 1000
        //     // }, function(){
        //     //     location.href = 'index.html'; //后台主页
        //     // });
        //     //请求登入接口
        //     // admin.req({
        //     //   url: layui.setter.base + 'json/user/login.js' //实际使用请改成服务端真实接口
        //     //   ,data: obj.field
        //     //   ,done: function(res){
        //     //
        //     //     //请求成功后，写入 access_token
        //     //     // layui.data(setter.tableName, {
        //     //     //   key: setter.request.tokenName
        //     //     //   ,value: res.data.access_token
        //     //     // });
        //     //
        //     //     //登入成功的提示与跳转
        //     //     layer.msg('登入成功', {
        //     //       offset: '15px'
        //     //       ,icon: 1
        //     //       ,time: 1000
        //     //     }, function(){
        //     //       location.href = 'index.html'; //后台主页
        //     //     });
        //     //   }
        //     // });
        //
        // });


        //实际使用时记得删除该代码
        // layer.msg('为了方便演示，用户名密码可随意输入', {
        //   offset: '15px'
        //   ,icon: 1
        // });

    });

    $("#submit").click(function(){
        datas = "";
        var u=  $("#LAY-user-login-username").val();
        var p= $("#LAY-user-login-password").val();
        var authcode = $("#LAY-user-login-vercode").val();
        var now = new Date(), month=now.getMonth()+1, date=now.getDate();
        var d = ""+now.getFullYear()+"-"+(month>9?month:("0"+month))+"-"+(date<10?("0"+date):date);
        $.ajax({
            url:'loginUser',
            type:"post",
            data:{"code":u, "password":p,"clientDate":d,"authcode":authcode,"v":new Date().getTime()},
            async:false,
            success:function(data){
                if(data.success){
                    num=1;
                    window.location.href = "index";
                }else{
                    datas = data.msg;
                    layer.msg(datas, {icon: 2});
                    // layer.msg(datas, {
                    //     offset: '15px'
                    //     ,icon: 2
                    //     ,time: 1000
                    // })
                }
            }

        });



    });

    $("body").keydown(function() {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $("#submit").click();
        }
    });
</script>
</body>
</html>


