    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>

        <html>

        <head>
        <meta charset="utf-8">
        <title>LM2平特计划管理</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,
        user-scalable=0">
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
        <legend>LM2平特计划管理</legend>
        </fieldset>
        <form class="layui-form" action="../sysMenu/list" id="query" method="post">
        <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <button type="button" class="layui-btn layui-btn-normal" style="float:right;margin-right: 20px;" onclick="add()">新增</button>
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
        <col width="50px">
        <col width="10%">
        <col width="30%">
        <col width="20%">
        <col>
        <col width="165px">
        </colgroup>
        <thead>
        <tr>
        <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox"></th>
        <th>期号</th>
        <th>三肖</th>
        <th>开奖</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty pageInfo.list}">
            <c:forEach items="${pageInfo.list}" var="memu" begin="0" step="1" varStatus="star">
                <tr>
                <td><input type="checkbox" name="" lay-skin="primary" class="l_table_checkbox"></td>
                <td>${memu.drawid}</td>
                <td>${memu.zodic}</td>
                <td>${memu.opgame}</td>
                <td>
                <a class="layui-btn layui-btn-xs redact" onclick="edit('${memu.id}')">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs delete" onclick="del('${memu.id}')">删除</a>
                </td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty pageInfo.list}">
            <tr>
            <td colspan="6"
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
        <%--<script src="../resource/style/js/formCheck.js"></script>--%>
        <script>
        layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
        var table = layui.table,
        form = layui.form,
        layedit = layui.layedit,
        laydate = layui.laydate,
        laypage = layui.laypage,
        layer = layui.layer;

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
        "name": $("input[name=name]").val(),
        "grade": $("select[name=grade]").val()
        };

        httpPost("../lm2/list", params);
        }
        }
        });
        //自定义验证规则
        form.verify({
        title: function(value) {
        if(value.length < 5) {
        return '标题至少得5个字符啊';
        }
        },
        pass: [/(.+){6,12}$/, '密码必须6到12位'],
        content: function(value) {
        layedit.sync(editIndex);
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
        // test.reload("idTest");
        })
        //indexs调整或关闭iframe窗口的时候需要
        var indexs;


        //新增
        $("#add-btn").click(function() {
        //iframe窗
        layer.open({
        type: 2,
        title: '商家信息新增',
        shadeClose: true,
        shade: false,
        fixed: false,
        resize: false,
        maxmin: false, //开启最大化最小化按钮
        area: ['100%', '100%'],
        content: '../component/form/group.html',
        success: function(layero, index) {
        indexs = index;
        layer.full(index);
        $(".layui-layer-iframe").css("overflow", "hidden");
        }
        });
        });
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
        $(document).ready(function() {
        // 查看
        $('.m_table .examine').click(function() {
        layer.open({
        type: 2,
        title: '商家信息详情',
        shadeClose: true,
        shade: false,
        fixed: false,
        resize: false,
        maxmin: false, //开启最大化最小化按钮
        area: ['100%', '100%'],
        content: '../component/form/detail.html',
        success: function(layero, index) {
        indexs = index;
        layer.full(index);
        $(".layui-layer-iframe").css("overflow", "hidden");
        }
        });
        })
        });

        function add(){
        $.post('../lm2/add', function (str) {
        //console.log(str)
        layer.open({
        type: 1,
        title: '新增LM2平特计划数据',
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

        //查询按钮操作
        function queryInfo() {
        if(formvalide['forminitInput'].validate("query")) {
        $("#query").submit();
        }
        }


        //删除
        function del(id){
        layer.confirm('确定删除该行吗？', function(index) {
        layer.close(index);
        $.ajax({
        type:"POST",
        url:"../lm2/delete",
        data: {"id":id},
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


        function edit(id){
        $.post('../lm2/addEdit', {"id":id}, function (str) {
        //console.log(str)
        layer.open({
        type: 1,
        title: '编辑LM2平特计划数据',
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

        //回车查询
        document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
        queryInfo();
        }
        };
        </script>
        </body>

        </html>