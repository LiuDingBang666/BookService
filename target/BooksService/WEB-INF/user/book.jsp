<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
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
    <link rel="icon" href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/jumbotron/">

    <title>图书页面 </title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link
            href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/css/ie10-viewport-bug-workaround.css"
            rel="stylesheet">

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

    <!-- 首页css样式 -->
    <%--    <link href="<%=basePath%>common/user/css/style.css" rel="stylesheet"/>--%>
</head>

<body>

<!-- 书籍顶部 -->
<jsp:include page="/WEB-INF/user/header.jsp"></jsp:include>
<%--书籍导航--%>
<jsp:include page="nav.jsp"></jsp:include>

<!-- 图书展示 -->
<div class="container col-md-offset-3 " style="margin-top: 10px;">

    <div class="row">
        <div class="col-md-3">
            <img src="${Book.imgurl}" width="188" height="260">
        </div>
        <div class="col-md-4">
            <h2>${Book.name} <h5 >商品库存：${Book.num}</h5></h2>
            <p>简介：${Book.description}</p>

            <h3 style="color: red">价格：${Book.price}元<span class="glyphicon glyphicon-usd"></span></h3>
            <button style="margin: 20px 0px;" class="btn btn-primary" onclick="goBuy(${Book.bookid})"><span
                    class="  glyphicon glyphicon-lock" style="margin-right: 10px"></span>立即购买
            </button>

            <button style="margin: 20px 0px;" class="btn btn-primary" onclick="joinCart(${Book.bookid})"><span
                    class=" glyphicon glyphicon-shopping-cart" style="margin-right: 10px"></span>加入购物车
            </button>

        </div>
    </div>

</div>

</div>
<%--猜你喜欢--%>
<div class="container col-md-12" style="margin-left: 20px">
    <p><hr></p>
    <h2><span class="glyphicon glyphicon-heart" style="color: red;margin-right: 10px"></span>猜你喜欢</h2>
    <!-- 图书展示 -->
    <c:forEach items="${otherBook}" var="book">
        <div class="col-md-2 ">
            <p><a href="<%=basePath%>user/goBook?id=${book.bookid}"><img width="80" height="90"
                                                                         src="${book.imgurl}"></a>
            </p>
            <p>《${book.name}》</p>
            <p>价格：${book.price}<span class="glyphicon glyphicon-usd" id="icon"></span></p>
        </div>
    </c:forEach>
</div>


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

<script>
    /*加入购物车*/
    function joinCart(id) {
        $.get("<%=basePath%>user/joinCart?id=" + id, function (data) {
            if (data == "OK") {
                alert("加入购物车成功！")
            } else {
                alert("加入购物车失败！商品库存不足")
            }
        })
    }

    /*立即购买*/
    function goBuy(id) {
        $.get("<%=basePath%>user/joinCart?id=" + id, function (data) {
            if (data == "OK") {
                window.location.href = "<%=basePath%>/user/goCart";
            } else {
                alert("购买失败！商品库存不足")
            }
        })

    }
</script>

</body>
</html>
