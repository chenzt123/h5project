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
                    <legend>编辑菜单信息</legend>
                </fieldset>
                <form class="layui-form" action="../sysMenu/saveOrUpdate" method="post" id="editForm">
                    <input id="menuId" name="menuId" hidden value="${menuId}">
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" lay-verify="required"  autocomplete="off" placeholder="请输入菜单名称(必填项)"
                                value="${menu.name}" class="layui-input"  maxlength="11"
                                onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"
                                onafterpaste="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,''">
                                <%--<span style="color:red">(11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单URL：</label>
                            <div class="layui-input-block">
                                <input type="text" name="url" lay-verify="required" autocomplete="off" placeholder="请输入菜单url(必填项)" value="${menu.url}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">菜单图标：</label>
                            <div class="layui-input-block">
                                <input type="text" name="icon"  autocomplete="off" placeholder="请输入菜单图标" value="${menu.icon}" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                         <div class="layui-form-item">
                            <label class="layui-form-label">菜单排序：</label>
                            <div class="layui-input-block">
                                 <input type="text" name="orderNum" lay-verify="number" autocomplete="off" placeholder="请输入菜单排序(必填项)"
                                value="${menu.orderNum}" class="layui-input" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')">
                                 <%--<span style="color:red">(必须为正整数)</span>--%>
                                 <%--onkeyup="value=m(${menu.orderNum})"--%>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">父级菜单：</label>
                            <div class="layui-input-block">
                                <select name="parentId" id="roleId" lay-filter="aihao" lay-verify="required">
                                        <option value="">请选择(必选项)</option>
                                        <c:forEach items="${firstMenuList}" var="menus" begin="0" step="1" varStatus="star">
                                        <option value="${menus.menuId}" <c:if test="${parMenuId == menus.menuId}">selected="selected"</c:if>>${menus.name}</option>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
<%--                            <div class="layui-form-item">--%>
<%--                            <label class="layui-form-label">菜单类型：</label>--%>
<%--                                <div class="layui-input-block">--%>
<%--                                    <input type="text" id="nickname" name="nickname" value="${menu.type}"  placeholder="请输入会员昵称" validateType="mal=50&notSpecial" class="layui-input">--%>
<%--                                </div>--%>
<%--                            </div>--%>


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
    url:"../sysMenu/saveOrUpdate",
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