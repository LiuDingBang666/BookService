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

    <title>购物车页面 </title>

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
        <a href="<%=basePath%>user/goIndex">首页</a>- 购物车
    </div>

    <%--购物车不为空--%>
    <c:if test="${cart!=null && cart.size()!=0}">
    <%--循环输出商品信息--%>

    <table class="table">
        <tr>
            <th>序号</th>
            <th>商品名称</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
            <th>库存</th>

            <th>取消</th>
        </tr>
        <c:set var="total" value="0"/>
        <c:forEach items="${cart}" var="entry" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${entry.key.name}</td>
                <td><img src="${entry.key.imgurl}" height="70"></td>
                <td>${entry.key.price}</td>
                <td>
                    <button class="btn btn-primary" onclick="sub(${entry.key.bookid})">-</button>
                    <input class="form-control" type="text" value="${entry.value}" id="${entry.key.bookid}"
                           onchange="alterNum(${entry.key.bookid},${entry.key.num})"
                           onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}if (parseInt(this.value)>${entry.key.num}){alert('购买数量超出库存,将为您自动设置为最大库存');this.value=${entry.key.num}}"
                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                    <button onclick="add(${entry.key.bookid},${entry.key.num})"
                            class="btn btn-primary">+
                    </button>
                </td>
                <td>${entry.key.num}</td>
                <td>
                    <button class="btn btn-danger" value="${entry.key.bookid}" onclick="clearCartBook(value)">取消
                    </button>
                </td>
            </tr>
            <c:set value="${total+entry.key.price*entry.value}" var="total"/>
        </c:forEach>
    </table>

    <div class="row col-md-1 pull-right ">
        <a href="<%=basePath%>/user/goSettlement">
            <button class="btn btn-danger" data-toggle="modal" onclick="closeAccount() ">结算</button>
        </a>
    </div>
    <div class="row col-md-2 pull-right ">
        <span style="font-size: 20px;color: red">总计：${total}元</span>
    </div>
    </c:if>
    <%--购物车为空--%>
    <c:if test="${cart==null || cart.size()==0}">
    <div class="col-md-5 col-lg-offset-2">
        <img src="<%=basePath%>common/user/nullcart.gif">
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
        function add(id, max) {
            var num = $("#" + id + "").val();
            if ((parseInt(num) + 1) <= parseInt(max)) {
                $.get("<%=basePath%>user/clearCartBookById?type=add&id=" + id, function (data) {
                    if (data != "OK") {
                        alert("操作有误！")
                    } else {
                        window.location.reload();
                    }
                })
            } else {
                alert("库存不足！")
            }

        }

        /*修改指定商品数量*/
        function alterNum(id, max) {
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
