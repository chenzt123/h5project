<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>角色授权</title>
	<script src="../resource/layui/layui-xtree/layui-xtree.js"></script>
	<link rel="stylesheet" type="text/css" href="../resource/layui/css/layui.css"/>
	<link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
	<link rel="stylesheet" href="../resource/style/css/main.css" media="all">
<%--	<script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>
</head>
<body>

	<form class="layui-form" action="">
		<input id="roleId" name="roleId" hidden value="${roleId}">

		<div id="layui-xtree-demo1" style=" margin:20px;"></div>
<%--		        <input type="button" value="获取全部选中的checkbox" id="btn_getCk" />--%>
	</form>

	<div class="l_three clearfix">
		<div class="layui-form-item">
			<label class="layui-form-label"></label>
			<div class="layui-input-block">
				<button id="save" type="button"  class="layui-btn" >立即提交</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	var json = ${menuJsonArray};
	layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
		var table = layui.table,
				form = layui.form,
				layedit = layui.layedit,
				laydate = layui.laydate,
				laypage = layui.laypage,
				layer = layui.layer;


		//创建tree
		var xtree = new layuiXtree({
			elem: 'layui-xtree-demo1'           //放xtree的容器，id，不要带#号（必填）
			, form: form                       //layui form对象 （必填）
			, data: json                        //服务端地址（必填）
			, isopen: true                     //初次加载时全部展开，默认true
			, color: "#000"                    //图标颜色
			, icon: {                          //图标样式 （必填，不填会出点问题）
				open: "&#xe7a0;"               //节点打开的图标
				, close: "&#xe622;"            //节点关闭的图标
				, end: "&#xe621;"              //末尾节点的图标
			}
		});
		//常规用法
		laydate.render({
			elem: '#date'
		});
		//分页




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

		document.getElementById('save').onclick = function() {

			var oCks = xtree.GetAllCheckBox(); //获取全部选中的末级节点checkbox对象
			var ids = "";
			for(var i = 0; i < oCks.length; i++) {
				ids=oCks[i].value+","+ids;
			}
			ids = ids.substr(0,ids.length-1);
			var params = {
				"ids": ids,
				"roleId":$("input[name=roleId]").val(),
			};
			// httpPost("../sysRole/saveImprove", params);
			layer.confirm('确定保存吗?', {
				icon: 3,
				skin: 'layer-ext-moon',
				btn: ['确认','返回'] ,//按钮
				btn2:function(){
					o.removeClass('layui-btn-disabled');
				}
			}, function() {
				$.ajax({
					type: "POST",
					url: "../sysRole/saveImprove",
					data: params,
					dataType: "json",
					success: function (data) {
						if ((data.msg.indexOf('失败') > -1) || (data.msg.indexOf('异常') > -1)
								|| (data.msg.indexOf('错误') > -1)) {
							layer.msg(data.msg, {icon: 2});
						} else {
							layer.msg(data.msg, {
								time: 800, icon: 1, end: function () {
									location.reload();
								}
							});
						}
					}
				});
			});
		};
	});



</script>
<script type="text/javascript">
	//编辑保存

</script>

</html>
