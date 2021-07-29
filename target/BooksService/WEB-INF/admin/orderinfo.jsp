<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>订单信息 </title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link
            href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/css/ie10-viewport-bug-workaround.css"
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


<!-- 购物车 -->
<div class="container ">

    <div class="row">
        订单编号：${orderInfo.orderid}
    </div>
    <%--循环输出商品信息--%>
    <%-- ${orderInfo}--%>
    <table class="table">
        <tr>
            <th>序号</th>
            <th>商品名称</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
            <th>库存</th>
            <th>小计</th>
        </tr>
        <c:set var="total" value="0"/>
        <c:forEach items="${orderInfo.orderItems}" var="entry" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${entry.book.name}</td>
                <td><img src="${entry.book.imgurl}" height="70"></td>
                <td>${entry.book.price}</td>
                <td>${entry.buynum}</td>
                <td>${entry.book.num}</td>
                <td>${entry.buynum*entry.book.price}</td>
            </tr>
            <c:set value="${total+entry.buynum*entry.book.price}" var="total"/>
        </c:forEach>
    </table>

    <%--信息填写--%>
    <div class="col-md-6">

        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">收货地址</label>
            <div class="col-sm-10">
                <input disabled value="${orderInfo.receiverAddress}" name="receiverAddress" class="form-control"
                       id="address"
                       rows="3" required
                       placeholder="收货地址..."/>
            </div>
        </div>
        <div class="form-group">
            <label for="man" class="col-sm-2 control-label">收货人</label>
            <div class="col-sm-10">
                <input disabled type="text" value="${orderInfo.receiverName}" class="form-control"
                       name="receiverName" id="man" required placeholder="收货人">
            </div>
        </div>
        <div class="form-group">
            <label for="Inputtel" class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input disabled name="reveicerPhone" type="text" value="${orderInfo.receiverPhone}"
                       class="form-control"
                       id="Inputtel" required placeholder="联系方式">
            </div>
        </div>
    </div>

    <div class="row col-md-2 pull-right ">
        <span style="font-size: 20px;color: red">总计：${total}元</span>
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

</body>
</html>
