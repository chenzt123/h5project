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
    <link rel="stylesheet" type="text/css" href="../resource/leifeng/lib/layer/theme/default/layer.css">
    <link rel="stylesheet" type="text/css" href="../resource/leifeng/assets/css/layout.css">
    <script type="text/javascript">
    	var baseUrl = "";
    	var rserver = "http://formu-frontendweb.dj789.net/";
    </script>
    <script src="../resource/leifeng/lib/require.js" type="text/javascript"></script>
    <script src="../resource/leifeng/require.config.js" type="text/javascript"></script>
</head>

<body>
    <div id="wrapper" class="wrapper">
		<div class="content">
<%--            <div id="header" class="__html_module" data-tmpl="../jsp/font/leifeng/module/header.html"><%@ include file="module/header.jsp" %></div>--%>
            <div id="header" class="__html_module" ><%@ include file="module/header.jsp" %></div>
<%--            <%@ include file="module/opening.jsp" %>--%>
<%--            <div  class="__html_module" data-tmpl="../resource/leifeng/module/opening.html"></div>--%>
            <div  class="__html_module" ><%@ include file="module/opening.jsp" %></div>

            <div  class="__html_module" ><%@ include file="module/jingjie.jsp" %></div>
<%--            <div  class="__html_module" data-tmpl="../resource/leifeng/module/haoliao.html"></div>--%>
            <div  class="__html_module"><%@ include file="module/haoliao.jsp" %></div>
<%--            <div  class="__html_module" data-tmpl="../resource/leifeng/module/shuju.html"></div>--%>
            <div  class="__html_module"><%@ include file="module/shuju.jsp" %></div>
        </div>
<%--		<div id="footer" class="__html_module" ><%@ include file="module/footer.jsp" %></div>--%>
		<div id="footer" class="__html_module" data-tmpl="../resource/leifeng/module/footer.html"></div>
    </div>
</body>
</html>