<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/lib/z-tree/css/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
    <script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../resource/lib/z-tree/js/jquery.ztree.core.js" type="text/javascript" charset="utf-8"></script>
    <script src="../resource/lib/z-tree/js/jquery.ztree.excheck.js" type="text/javascript" charset="utf-8"></script>
<%--    <script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins l_ibox">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>编辑</legend>
                </fieldset>
                <form class="layui-form" action="../sysMenu/saveOrUpdate" method="post" id="editForm">
                    <input id="id" name="id" hidden value="${lm.id}">
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">期：</label>
                            <div class="layui-input-block">
                                <input type="text" name="drawid" lay-verify="required"  autocomplete="off" placeholder="请输入期数(必填项)"
                                value="${lm.drawid}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">主推：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic6" lay-verify="required"  autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic6}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">十码：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic5" lay-verify="required"  autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic5}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">1肖：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic4" lay-verify="required"  autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic4}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">2肖：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic3" lay-verify="required"  autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic3}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">6肖：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic" lay-verify="required" autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">4肖：</label>
                            <div class="layui-input-block">
                                <input type="text" name="zodic2" lay-verify="required"  autocomplete="off" placeholder="请输入内容(必填项)"
                                       value="${lm.zodic2}" class="layui-input" >
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>

                    </div>
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button class="layui-btn save-btn" lay-submit="" lay-filter="save">保存</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate', 'table'], function() {
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate;
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

    form.on("submit(save)", function(data) {
    // alert(data);
    //弹出提交内容
    /*layer.alert(JSON.stringify(data.field), {
    title: '最终的提交信息'
    });*/
    //debugger;
    $.ajax({
    type:"POST",
    url:"saveOrUpdate",
    data: data.field,
    dataType:"json",
    success:function(data){
    layer.msg(data.msg, {
    icon: 1, time: 500, end: function () {
    if(data.msg.indexOf('成功') != -1){
    location.reload();
    }
    }
    });
    }
    });
    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
    });



</script>

<script>
    function m(value){

    value = value.replace(/[^\d]/g,'');
    if(''!=value){
    value = parseInt(value);
    }
    return value;
    }
    </script>
</body>

</html>