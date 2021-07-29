<%--
  Created by IntelliJ IDEA.
  User: LDB
  Date: 2021/5/31
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>头部</title>

</head>
<style>


</style>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" id="header">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=basePath%>user/goIndex">知门</a>
        </div>


        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav">

                <li><a href="<%=basePath%>user/goIndex">首页</a></li>


                <%--用户已登录--%>
                <c:if test="${sessionScope.get('USER_SESSION')!=null}">
                    <li class="dropdown">
                        <a href="<%=basePath%>user/goInfo" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">我的 <span class="caret"></span></a>

                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>user/goCart"><span class="glyphicon glyphicon-shopping-cart"
                            ></span>购物车</a>
                            </li>
                            <li><a href="<%=basePath%>user/goInfo"><span class="glyphicon glyphicon-user"
                            ></span>个人中心</a>
                            </li>
                            <li><a href="<%=basePath%>user/loginOut"><span class="glyphicon glyphicon-off"
                            ></span>退出登录</a>
                            </li>
                        </ul>
                    </li>
                </c:if>

                <li><a href="<%=basePath%>user/goAoubt">关于我们</a></li>

                <%--用户未登录--%>
                <c:if test="${sessionScope.get('USER_SESSION')==null}">
                    <li><a href="<%=basePath%>user/goLogin">登录</a></li>
                </c:if>

            </ul>
            <div id="navbar" class="navbar-collapse collapse">
                <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/user/goIndex">
                    <div class="form-group">
                        <input type="text" name="name" placeholder="搜索图书" class="form-control"
                               value="${selectBook.name}">
                    </div>
                    <button class="btn btn-success">搜索图书</button>
                </form>
            </div>
        </div>
    </div>
</nav>
</body>
</html>
