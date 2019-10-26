<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>编辑角色信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/lib/z-tree/css/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
    <script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<%--    <script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins l_ibox">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>编辑角色信息</legend>
                </fieldset>
                <form class="layui-form" action="../sysMenu/saveOrUpdate" method="post" id="editForm">
                    <input id="roleId" name="roleId" hidden value="${role.roleId}">
                    <div class="l_one clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">角色名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="roleName" lay-verify="required"  autocomplete="off"
                                       placeholder="请输入角色名称（必填项）" value="${role.roleName}" class="layui-input" maxlength="11" style="width: 500px"
                                       onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')" onafterpaste="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">
                                <%--<span style="color:red">(11个字符或者11个中文字)</span>--%>
                            </div>
                        </div>
                    </div>
                    <div class="l_one clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注：</label>
                            <div class="layui-input-block">
                            <textarea name="remark"   cols="69"   rows="8"   style="OVERFLOW:   hidden"
                                      placeholder="请填写备注信息">${role.remark}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="l_two clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button class="layui-btn save-btn" lay-submit="" lay-filter="save" OnClientClick="this.disabled=true;return true;" >保存</button>
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
                url:"../sysRole/saveRole",
                data: data.field,
                dataType:"json",
                success:function(data){
                    layer.msg(data.msg, {
                        icon: 1, time: 500, end: function () {
                            if(data.msg.indexOf('成功') != -1){
                                //location.reload();
                                window.location.href = "/sysRole/list";
                            }
                        }
                    });
                }
            });
            //loading
            var index = layer.msg('提交中，请稍候', {
                icon: 16,
                time: false,
                shade: 0.8
            });
            setTimeout(function() {
                layer.close(index);
                //layer.msg("!");
            }, 2000);
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    });
</script>
<script type="text/javascript">

</script>

</body>

</html>