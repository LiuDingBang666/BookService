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

    <title>订单结算 </title>

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

<%--头部导航--%>
<jsp:include page="header.jsp"></jsp:include>


<%--书籍导航--%>
<jsp:include page="nav.jsp"></jsp:include>


<!-- 购物车 -->
<div class="container ">
    <div class="row" style="margin: 10px;">
        <a href="<%=basePath%>user/goIndex">首页</a>-订单结算
    </div>
    <%--循环输出商品信息--%>

    <table class="table">
        <tr>
            <th>序号</th>
            <th>商品名称</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
            <th>库存</th>
        </tr>
        <c:set var="total" value="0"/>
        <c:forEach items="${cart}" var="entry" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${entry.key.name}</td>
                <td><img src="${entry.key.imgurl}" height="70"></td>
                <td>${entry.key.price}</td>
                <td>

                        ${entry.value}
                </td>
                <td>${entry.key.num}</td>

            </tr>
            <c:set value="${total+entry.key.price*entry.value}" var="total"/>
        </c:forEach>
    </table>
    <%--购物车不为空--%>
    <c:if test="${cart.size()!=0}">
    <form class="form-horizontal" method="post" action="<%=basePath%>user/submitOrder">
        <div class="row col-md-4 pull-right ">
            <span style="font-size: 20px;color: red">总计：<input name="money" readonly
                                                               style="font-size: 20px;color: red;width: 100px;border: 0px;background-color:white"
                                                               class="form-control" type="text"
                                                               value="${total}"/>元</span>
        </div>
        <div class="col-md-12">
            <hr>
        </div>
            <%--信息填写--%>
        <div class="col-md-6">

            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">收货地址</label>
                <div class="col-sm-10">
                                <textarea name="receiverAddress" class="form-control" id="address" rows="3" required
                                          placeholder="收货地址...">${USER_SESSION.receiverAddress}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="man" class="col-sm-2 control-label">收货人</label>
                <div class="col-sm-10">
                    <input type="text" value="${USER_SESSION.name}" class="form-control"
                           name="receiverName" id="man" required placeholder="收货人">
                </div>
            </div>
            <div class="form-group">
                <label for="Inputtel" class="col-sm-2 control-label">联系方式</label>
                <div class="col-sm-10">
                    <input name="reveicerPhone" type="text" value="${USER_SESSION.tel}"
                           class="form-control"
                           id="Inputtel" required placeholder="联系方式">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="提交订单"/>
                </div>
            </div>
    </form>
</div>

</c:if>


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

<script>

    /*增加商品数量*/
    function add(id) {
        $.get("<%=basePath%>user/clearCartBookById?type=add&id=" + id, function (data) {
            if (data != "OK") {
                alert("操作有误！")
            } else {
                window.location.reload();
            }
        })
    }

    /*修改指定商品数量*/
    function alterNum(id) {
        var num = $("#" + id + "").val();
        $.get("<%=basePath%>user/clearCartBookById?type=alt&id=" + id + "&num=" + parseInt(num), function (data) {
            if (data != "OK") {
                alert("操作有误！")
            } else {
                window.location.reload();
            }
        })
    }

    /*减少商品数量*/
    function sub(id) {
        var num = $("#" + id + "").val();
        if (parseInt(num) - 1 > 0) {
            $.get("<%=basePath%>user/clearCartBookById?type=sub&id=" + id, function (data) {
                if (data != "OK") {
                    alert("操作有误！")
                } else {
                    window.location.reload();
                }
            })
        }

    }

    /*清除购物车中的指定商品*/
    function clearCartBook(id) {
        // console.log(id);
        $.get("<%=basePath%>user/clearCartBookById?type=clear&id=" + id, function (data) {
            if (data != "OK") {
                alert("操作有误！")
            } else {
                window.location.reload();
            }
        })
    }

    /*结算订单*/
    function closeAccount() {
        console.log("订单结算")
    }
</script>

</body>
</html>
