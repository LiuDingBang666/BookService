<%--
  Created by IntelliJ IDEA.
  User: LDB
  Date: 2021/5/31
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>书籍导航</title>
</head>
<body>
<!-- 书籍导航 -->
<div class="container col-md-offset-1 " id="book-nav">
    <div class="row ">
        <div class="span8">
            <ul class="nav nav-pills">
                <li><a href="<%=basePath%>user/goIndex?category=中国文学">中国文学</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=人物传记">人物传记</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=儿童文学">儿童文学</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=历史">历史</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=哲学">哲学</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=小说">小说</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=心灵鸡汤">心灵鸡汤</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=心理学">心理学</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=成功励志">成功励志</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=教育">教育</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=散文">散文</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=理财">理财</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=管理">管理</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=经典名著">经典名著</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=经济">经济</a></li>
                <li><a href="<%=basePath%>user/goIndex?category=计算机">计算机</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
