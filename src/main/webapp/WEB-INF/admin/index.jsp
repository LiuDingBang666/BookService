<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>书籍服务后台管理模板</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/matrix-style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/matrix-media.css"/>
    <link href="${pageContext.request.contextPath}/common/admin/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
</head>
<body>
<!--Header-part-->
<div id="header">
    <h1>书籍服务管理系统</h1>
</div>
<!--close-Header-part-->

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">
        <li class="dropdown" id="profile-messages">
            <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
                <i class="fa fa-user"></i>&nbsp;
                <span class="text">欢迎你，${ADMIN_SESSION.name}</span>&nbsp;

            </a>
        </li>

        <li class=""><a title="" href="${pageContext.request.contextPath}/admin/loginOut" onclick="return affirm()"><i
                class="fa fa-power-off"></i>
            <span class="text">&nbsp;退出系统</span></a></li>
    </ul>
</div>
<!--close-top-Header-menu-->

<!--start-top-serch-->

<!--close-top-serch-->

<!--sidebar-menu-->
<div id="sidebar" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
    <ul>
        <li class="submenu ">
            <a class="menu_a" link="${pageContext.request.contextPath}/admin/goOrderManaged?state=-1">
                <i class="fa fa-cog"></i>
                <span class="menu1_name">用户订单管理</span>
            </a>
        </li>
        <li class="submenu active">
            <a class="menu_a" link="${pageContext.request.contextPath}/admin/goBook">
                <i class="fa fa-cog"></i>
                <span class="menu1_name">书籍管理</span>
                <span class="label label-important">1</span>
            </a>
            <ul>
                <li><a class="menu_a" link="<%=basePath%>admin/goSafetyStockManaged"><i class="fa fa-caret-right"></i>书籍安全库存管理</a>
                </li>
            </ul>
        </li>

        <li class="submenu ">
            <a class="menu_a" link="${pageContext.request.contextPath}/admin/goAdmin">
                <i class="fa fa-cog"></i>
                <span class="menu1_name">管理员|用户管理</span>

            </a>

        </li>
        <li class="submenu ">
            <a class="menu_a" link="${pageContext.request.contextPath}/admin/goNotice">
                <i class="fa fa-cog"></i>
                <span class="menu1_name">公告管理</span>
            </a>
        </li>
        <li class="submenu ">
            <a class="menu_a" link="${pageContext.request.contextPath}/admin/goSuggestManaged">
                <i class="fa fa-cog"></i>
                <span class="menu1_name">用户建议管理</span>
            </a>
        </li>

    </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
    <!--breadcrumbs-->
    <div id="content-header">
        <div id="breadcrumb">
            <a href="${pageContext.request.contextPath}/admin/goIndex" title="回首页" class="tip-bottom"><i
                    class="fa fa-home"></i> 系统</a>
            <a href="<%=basePath%>admin/goIndex" class="tip-bottom"> 首页</a>
        </div>
    </div>
    <!--End-breadcrumbs-->
    <iframe src="${pageContext.request.contextPath}/admin/goBook" id="iframe-main" frameborder='0'
            style="width:100%;"></iframe>
</div>
<!--end-main-container-part-->

<script src="${pageContext.request.contextPath}/common/admin/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/jquery.ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/matrix.js"></script>
<!-- 确认js -->
<script src="${pageContext.request.contextPath}/common/admin/js/customer/affirm.js"></script>
</body>
</html>
