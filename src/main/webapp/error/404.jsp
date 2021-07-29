<%--
  Created by IntelliJ IDEA.
  User: LDB
  Date: 2021/6/7
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>该页面不存在-404.life</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/error/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/error/css/h-ui.reset.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/error/css/index.css"/>

</head>
<body>

<div class="system">
    <img src="${pageContext.request.contextPath}/error/picture/404.png"/>
    <div class="title">
        <h2>页面走丢了...</h2>
        <h4>远方的朋友你好！非常抱歉，您所请求的页面不存在！</h4>
        <h4>请仔细检查您输入的网址是否正确。</h4>
        <h5>错误码： <%=request.getAttribute("javax.servlet.error.status_code")%> <br></h5>
        <h5>信息： <%=request.getAttribute("javax.servlet.error.message")%> <br></h5>
        <h5> 异常： <%=request.getAttribute("javax.servlet.error.exception_type")%> <br></h5>
    </div>
</div>

</body>
</html>
