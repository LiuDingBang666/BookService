<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="liuwisdom" uri="http://liuwisdom.icu/common/" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/jumbotron/">
    <link rel='stylesheet' href='<%=basePath%>/common/user/css/swiper.css'>
    <link rel="stylesheet" href="<%=basePath%>/common/user/css/style.css">
    <title>首页</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/css/ie10-viewport-bug-workaround.css"
          rel="stylesheet">
    <!-- 首页css样式 -->
    <link href="<%=basePath%>common/user/css/index.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/examples/jumbotron/jumbotron.css"
          rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/ie8-responsive-file-warning.js"></script>
    <![endif]-->
    <script
            src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/ie-emulation-modes-warning.js">
    </script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%--头部导航--%>
<jsp:include page="header.jsp"></jsp:include>
<%--书籍导航--%>
<div class="container">
    <jsp:include page="nav.jsp"></jsp:include>
</div>


<div class="container col-md-offset-2">

    <div class="row">
        <!-- 轮播图 -->
        <div class="wrapper col-md-8" style="margin-top:10px;">
            <div class="swiper-container swiper-container">
                <div class="swiper-wrapper">
                     <c:forEach items="${hotBooks}" var="book">
                         <div class="swiper-slide"><a href="<%=basePath%>user/goBook?id=${book.bookid}">
                             <img height="300"  src="${book.imgurl}"
                                 id="carousel" ></a></div>
                     </c:forEach>
                    <<%--div class="swiper-slide"><a href="#"> <img
                            src="<%=basePath%>/common/user/images/1.jpg" alt=""
                            id="carousel"></a></div>
                    <div class="swiper-slide"><a href="#"> <img
                            src="<%=basePath%>/common/user/images/2.jpg" alt=""
                            id="carousel"></a></div>
                    <div class="swiper-slide"><a href="#"> <img
                            src="<%=basePath%>/common/user/images/3.jpg" alt=""
                            id="carousel"></a></div>
                    <div class="swiper-slide"><a href="#"> <img
                            src="<%=basePath%>/common/user/images/4.jpg" alt=""
                            id="carousel"></a></div>--%>
                </div>
                <!-- 追記 -->
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <!-- 图书排行榜 -->
        <div class="col-md-4 col-xs-4  " id="sidebar" style="height: 300px">
            <div class="list-group">
                <a href="#" class="list-group-item active">图书热销榜 <span class="glyphicon glyphicon-fire"
                                                                       aria-hidden="true" id="icon"></span></a>

                <ol>
                    <c:forEach items="${hotBooks}" var="book">
                        <li><a href="<%=basePath%>user/goBook?id=${book.bookid}" class="list-group-item"><img
                                height="30"
                                src="${book.imgurl}" style="margin: 5px">${book.name}&nbsp;&nbsp; 销量:${book.buynum}</a>
                        </li>
                    </c:forEach>
                </ol>
            </div>
        </div>
    </div>

</div>
<div class="container col-md-offset-3" style="margin-top: 100px;padding: 10px">
    <%--未找到图书--%>
    <c:if test="${page.rows.size()==0}">
        <div class="col-md-8 col-md-offset-4">
            <p><img src="<%=basePath%>common/user/error.gif" height="80" width="80"
                    style="border-radius: 100px;margin-left: 130px;"></p>
            <h3 style="color: #337ab7">很抱歉 没有为你找到任何书籍</h3>
        </div>
    </c:if>
    <!-- 图书展示 -->
    <c:forEach items="${page.rows}" var="book">
        <div class="col-md-3">
            <p><a href="<%=basePath%>user/goBook?id=${book.bookid}"><img width="80" height="90"
                                                                         src="${book.imgurl}"></a>
            </p>
            <p>《${book.name}》</p>
            <p>价格：${book.price}<span class="glyphicon glyphicon-usd" id="icon"></span></p>
        </div>
    </c:forEach>


</div>
<c:if test="${page.rows.size()!=0}">
    <%--分页插件--%>
    <div class="col-md-8 col-md-offset-9">
        <liuwisdom:page url="${pageContext.request.contextPath}/user/goIndex"/>
    </div>

</c:if>

<%--底部--%>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous">
</script>
<script>
    window.jQuery || document.write(
        '<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/vendor/jquery.min.js"><\/script>'
    )
</script>
<script src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
        src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/ie10-viewport-bug-workaround.js">
</script>

<script src='<%=basePath%>/common/user/js/swiper.js'></script>
<script src="<%=basePath%>/common/user/js/script.js"></script>

</body>
</html>
