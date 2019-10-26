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
<%--    <link rel="stylesheet" type="text/css" href="../resource/lib/z-tree/css/zTreeStyle/zTreeStyle.css" />--%>
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
    <script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../resource/layui/layui-formSelects-master/dist/formSelects-v4.js"></script>
<%--    <script src="../resource/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="../resource/layui/lay/modules/layer.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="../resource/layui/layui-formSelects-master/dist/formSelects-v4.css"/>
<%--    <script src="../resource/lib/z-tree/js/jquery.ztree.core.js" type="text/javascript" charset="utf-8"></script>--%>
<%--    <script src="../resource/lib/z-tree/js/jquery.ztree.excheck.js" type="text/javascript" charset="utf-8"></script>--%>
<%--    <script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins l_ibox">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>编辑用户信息</legend>
                </fieldset>
                <form class="layui-form" action="../sysUser/saveOrUpdate" method="post" id="editForm">
                    <input id="userId" name="userId" hidden value="${user.userId}">
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" lay-verify="required"  autocomplete="off" placeholder="请输入用户名称"
                                       value="${user.name}" class="layui-input" maxlength="20" >
                                <%--<span style="color:red">(11个字符或者11个中文字)</span>--%>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户账号：</label>
                            <div class="layui-input-block">
                                <input type="text" name="code" lay-verify="required|number" autocomplete="off"
                                       placeholder="请输入用户账号" value="${user.code}"  onkeyup="this.value=this.value.replace(/([\u4E00-\u9FA5])+/,'')" onafterpaste="this.value=this.value.replace(/([\u4E00-\u9FA5])+/,'')" class="layui-input" maxlength="11">
                                <%--<span style="color:red">(11位阿拉伯数字)</span>--%>

                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-block">
                                <input type="text" name="mobile" lay-verify="phone" autocomplete="off" placeholder="请输入正确手机号" value="${user.mobile}" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" class="layui-input" maxlength="11">
                                <%--<span style="color:red">(11位阿拉伯数字)</span>--%>
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">所属角色：</label>
                            <div class="layui-input-block">
<%--                                <input type="text" id="citySel" name="city" lay-verify="required" autocomplete="off" placeholder="请选择角色"  class="layui-input" onclick="if(!$(this).attr('readonly')){showMenu()}">--%>
<%--                                <!--z-tree-->--%>
<%--                                <div id="menuContent" class="menuContent" style="display:none; position: absolute;">--%>
<%--                                    <ul id="treeDemo" class="ztree" style="margin-top:0; width:97%;"></ul>--%>
<%--                                </div>--%>
                                <select name="roleListStr" id="select_base_cityname"  xm-select="select_base_cityname" xm-select-type="1">
                                    <option value=""></option>
                                    <c:forEach items="${roleList}" var="role" begin="0" step="1" varStatus="star">
<%--                                        <option value="4">${role.roleId}</option>--%>
                                        ${role.roleId}<option value="${role.roleId}" <c:forEach items="${userRoleList}" var="userRole" begin="0" step="1" varStatus="star"><c:if test="${role.roleId == userRole.role_id}">selected="selected"</c:if></c:forEach>>${role.roleName}</option>
                                    </c:forEach>
<%--                                    <c:forEach items="${roleList}" var="role" begin="0" step="1" varStatus="star">--%>
<%--                                        <option value="${role.roleId}" <c:if test="${roleId == role.roleId}">selected="selected"</c:if>>${role.roleName}</option>--%>
<%--                                    </c:forEach>--%>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">状态：</label>
                            <div class="layui-input-block">

                                <input type="radio" name="status" value="0" title="正常" <c:if test="${user.status == 0}">checked=""</c:if>>
                                <input type="radio" name="status" value="-1" title="异常"<c:if test="${user.status == -1}">checked=""</c:if>>
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button id="save" type="button" onclick="savefun()" class="layui-btn" >立即提交</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    layui.use(['form', 'layer', 'jquery', 'table', 'laydate', 'element', 'upload', 'flow'], function () {
        var $$ = layui.jquery;
        var form = layui.form,
            layer = parent.layer == undefined ? layui.layer : parent.layer,
            table = layui.table,
            laydate = layui.laydate,
            element = layui.element,
            upload = layui.upload,
            flow = layui.flow;
        form.render();

    });
</script>
<script type="text/javascript">
//编辑保存
    function savefun(){
        $.ajax({
            type:"POST",
            url:"../sysUser/saveOrUpdate",
            data: $('#editForm').serialize(),
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
        //loading
        var index = layer.msg('提交中，请稍候', {
            icon: 16,
            time: false,
            shade: 0.8
        });
        setTimeout(function() {
            layer.close(index);
            //layer.msg("");
        }, 2000);
             /*var flag = 0;
             layer.confirm('确定保存所填内容？', {
                 btn: ['确认', '取消'], //按钮
                 btn1: function (index, layro) {
                     if (flag == 0) {
                         flag++;
                         var sub = $(".layui-btn .layui-layer-btn0");
                         sub.css('border-color', '#666666');
                         sub.css('background-color', '#666666');
                         $("#editForm").submit();
                     }
                 },
                 btn2: function (index, layro) {
                     layer.msg('取消成功', {icon: 1});
                 }
                 , icon: 3
             });*/
    };




//转化正整数
function hh(value){

    value = value.replace(/[^\d]/g,'');
    if(''!=value){
        value = parseInt(value);
    }
    return value;
}
</script>

</body>

</html>