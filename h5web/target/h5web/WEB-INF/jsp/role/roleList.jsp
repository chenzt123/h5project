<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>layuiAdmin 控制台主页一</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/main.css" media="all">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12 m_col-sm-12">
            <div class="ibox float-e-margins m_userinfo">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>角色信息</legend>
                </fieldset>
                <form class="layui-form" action="../sysRole/list" id="query" method="post">
                    <div class="search-three m_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">角色名称：</label>
                            <div class="layui-input-block">
                                <input type="text" id="code" name="roleName" value="${roleName}" name="code" lay-verify="required|title" autocomplete="off" placeholder="请输入角色名称" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button type="button" class="layui-btn" onclick="queryInfo()">查询</button>
                        <button type="button" class="layui-btn layui-btn-normal" onclick="edit('${role.roleId}')">新增</button>
                        <button type="button" class="layui-btn layui-btn-warm" id="modify">重置</button>
<%--                        <button type="button" class="layui-btn layui-btn-danger" id="del">删除</button>--%>
<%--                        <button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button>--%>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="layui-fluid">
    <div class="layui-form">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <table class="layui-table m_table" lay-filter="demo">
                            <colgroup>
                                <col width="80px">
<%--                                <col width="20%">--%>
                                <col width="50%">
                                <col>
                                <col width="250px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox"></th>
                                <th>角色名称</th>
                                <th>创建时间</th>
<%--                                <th>状态</th>--%>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty pageInfo.list}">
                            <c:forEach items="${pageInfo.list}" var="role" begin="0" step="1" varStatus="star">
                            <tr>
                                <td><input type="checkbox" name="" lay-skin="primary" class="l_table_checkbox"></td>
                                <td>${role.roleName}</td>
                                <td>${role.createTime}</td>
<%--                                <td>${role.delFlag}</td>--%>
                                <td>
                                    <a class="layui-btn layui-btn-primary layui-btn-xs examine" onclick="auth('${role.roleId}')">角色授权</a>
                                    <a class="layui-btn layui-btn-xs redact" onclick="edit('${role.roleId}')">编辑</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs delete" onclick="del('${role.roleId}')">删除</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty pageInfo.list}">
                                <tr>
                                    <td colspan="4"
                                        style="text-align:center;font:700 14px/25px 'Microsoft Yahei';color:red;">
                                        系统没有查找到合适的数据！
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <div id="demo7"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="../resource/layui/layui.js"></script>
<script src="../resource/js/formSubmitWithPost.js"></script>
<script src="../resource/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../resource/js/formCheck.js"></script>
<%--<script src="../resource/style/js/formSubmitWithPost.js"></script>--%>
<script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="../resource/layui/layui-xtree/layui-xtree.js"></script>--%>
<%--<script src="../resource/style/js/formCheck.js"></script>--%>
<script>
    //tree数据结构
    <%--var json = ${menuJsonArray};--%>
    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate,
            laypage = layui.laypage,
            layer = layui.layer;


        // //创建tree
        // var xtree = new layuiXtree({
        //     elem: 'layui-xtree-demo1'           //放xtree的容器，id，不要带#号（必填）
        //     , form: form                       //layui form对象 （必填）
        //     , data: json                        //服务端地址（必填）
        //     , isopen: true                     //初次加载时全部展开，默认true
        //     , color: "#000"                    //图标颜色
        //     , icon: {                          //图标样式 （必填，不填会出点问题）
        //         open: "&#xe7a0;"               //节点打开的图标
        //         , close: "&#xe622;"            //节点关闭的图标
        //         , end: "&#xe621;"              //末尾节点的图标
        //     }
        // });
        //常规用法
        laydate.render({
            elem: '#date'
        });
        //分页
        laypage.render({
            elem: 'demo7',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    var params = {
                        "pageNum": obj.curr,
                        "roleName": $("input[name=roleName]").val(),
                    };

                    httpPost("../sysRole/list", params);
                    // window.location.href="getMemberList?pageNo="+obj.curr;
                }
                // console.log(obj.curr)
            }
        });

        form.on('checkbox(allChoose)', function(data) {
            var child = $(data.elem).parents('.layui-form').find('tbody input[type="checkbox"]');
            child.each(function(index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

        var $ = layui.$,
            active = {
                getCheckData: function() { //获取选中数据
                    var checkStatus = table.checkStatus('idTest'),
                        data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                },
                getCheckLength: function() { //获取选中数目
                    var checkStatus = table.checkStatus('idTest'),
                        data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                },
                isAll: function() { //验证是否全选
                    var checkStatus = table.checkStatus('idTest');
                    layer.msg(checkStatus.isAll ? '全选' : '未全选')
                }
            };

        $('.demoTable .layui-btn').on('click', function() {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $("#del").click(function() {
//				test.reload("idTest");
        })
        //indexs调整或关闭iframe窗口的时候需要
        var indexs;
        //重置
        $("#modify").click(function() {
            //iframe窗
            window.location.href = "list"
        });
        $(window).resize(function() {
            if($(".layui-layer-iframe").hasClass("layui-layer-iframe")) {
                layer.full(indexs);
            }
        });
    });
</script>
<script>
    function edit(roleId){
        $.post('../sysRole/addOrUpdate', {"roleId":roleId}, function (str) {
            //console.log(str)
            layer.open({
                type: 1,
                title: '编辑角色',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['30%', '30%'],
                content: str,
                success: function (layero, index) {

                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "auto");
                    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
                        var table = layui.table,
                            form = layui.form,
                            layedit = layui.layedit,
                            laydate = layui.laydate,
                            laypage = layui.laypage,
                            layer = layui.layer;
                        form.render();
                    })

                },
                end: function () {
                    location.reload();
                }
            });
        })
    }

    //查询按钮操作
    function queryInfo() {
        if(formvalide['forminitInput'].validate("query")) {
            $("#query").submit();
        }
    }
    //删除
    //删除
    function del(roleId){

        layer.confirm('确定删除该行吗？', function(index) {
            layer.close(index);
            $.ajax({
                type:"POST",
                url:"../sysRole/deleteRole",
                data: {"roleId":roleId},
                dataType:"json",
                success:function(data){
                    if ((data.msg.indexOf('失败') > -1) || (data.msg.indexOf('异常')>-1)
                        || (data.msg.indexOf('错误')>-1)){
                        layer.msg(data.msg, {icon: 2});
                    }else{
                        layer.msg(data.msg, {time: 800,icon: 1,end: function () {
                                window.location.reload();
                            }});

                    }
                }
            });
        });
    }


    //树菜单

    //修改密码
    function auth(roleId){

        $.post('../sysRole/roleAuth', {"roleId":roleId}, function (str) {
            //console.log(str)
            layer.open({
                type: 1,
                title: '角色授权',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: str,
                success: function (layero, index) {

                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "auto");
                    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
                        var table = layui.table,
                            form = layui.form,
                            layedit = layui.layedit,
                            laydate = layui.laydate,
                            laypage = layui.laypage,
                            layer = layui.layer;
                        form.render();
                    })

                },
                end: function () {
                    location.reload();
                }
            });
        })
    }
</script>
</body>

</html>