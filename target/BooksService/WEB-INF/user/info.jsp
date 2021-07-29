<%@ page import="icu.liuwisdom.core.po.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
    User thisUser = (User) request.getSession().getAttribute("USER_SESSION");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel='stylesheet' href='<%=basePath%>common/user/css/swiper.css'>
    <link rel="stylesheet" href="<%=basePath%>common/user/css/style.css">
    <title>个人中心</title>

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

<div class="container">
    <!-- 公告 -->
    <div class="jumbotron col-md-12 col-md-offset-2" style="margin-top: 50px;">
        <h2>系统公告</h2>
        <ol style="font-size: 20px">
            <c:forEach var="notice" items="${Notices}">
                <li>${notice.title}   ${notice.content} </li>
            </c:forEach>
        </ol>


    </div>
    <!-- 个人信息 -->
    <div class="container">
        <div class="col-md-3 ">

            <h2>用户信息</h2>
            <p>${msg}</p>
            <c:if test="<%=thisUser.getImgurl()!=null%>">
                <p style="margin: 20px">
                    <img src="<%=thisUser.getImgurl()%>" id="user_icon">
                </p>
            </c:if>
            <c:if test="<%=thisUser.getImgurl()==null%>">
                <p style="margin: 20px">
                    暂无头像
                    <button class="btn btn-primary" class="btn btn-primary btn-lg" data-keyboard
                            data-toggle="modal" data-target="#signatureUpload">上传头像
                    </button>

                </p>
            </c:if>
            <p style="margin: 20px">

                用户名:<span id="name"><%=thisUser.getName()%></span>
            </p>
            <p style="margin: 20px">
                手机号:<span id="phone"><%=thisUser.getTel()%></span>
            </p>
            <p style="margin: 20px">
                性别:<span id="sex"><%=thisUser.getSex()%></span>
            </p>
            <p style="margin: 20px">
                个性签名:<span id="signature"><%=thisUser.getSignature()%></span>
            </p>
            <p style="margin: 20px">
                默认收货地址:<span id="receiverAddress"><%=thisUser.getReceiverAddress()%></span>
            </p>
            <p style="margin: 20px">
                出生日期:<span><fmt:formatDate
                    value="<%=thisUser.getBirthday()%>" pattern="yyyy-MM-dd"/></span>
            </p>
            <p style="margin: 20px">
                <button class="btn btn-primary btn-mini" data-keyboard
                        data-toggle="modal" data-target="#myModal">修改基本信息
                </button>
                <c:if test="<%=thisUser.getImgurl()!=null%>">
                    <button class="btn btn-primary btn-mini" data-keyboard
                            data-toggle="modal" data-target="#signatureUpload">修改头像
                    </button>
                </c:if>

            </p>
        </div>
        <!-- 订单信息 -->
        <div class="col-md-8 col-xs-10">
            <h2>订单信息</h2>
            <p>您共有:${Orders.size()}笔订单</p>
            <table class="table">
                <tr>
                    <th>订单号</th>
                    <th>收货人</th>
                    <th>订单时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="order" items="${Orders}">
                    <tr>
                        <td>${order.orderid}</td>
                        <td>${order.receiverName}</td>
                        <td><fmt:formatDate
                                value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><c:if test="${order.paystate==0}">未支付</c:if><c:if
                                test="${order.paystate==1}">已支付</c:if></td>
                        <td><a href="<%=basePath%>user/findOrderInfo?id=${order.orderid}">查看</a>&nbsp;&nbsp;&nbsp;<c:if
                                test="${order.paystate==0}">
                            <a href="<%=basePath%>user/delOrdersById?id=${order.orderid}" onclick="return confirm('您确定要删除该订单吗？')">删除</a></td>
                        </c:if>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>

    <%--修改用户信息模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title" id="alterInfo">用户信息修改</h4>
                </div>
                <div class="modal-body">
                    <form id="alter_user">
                        <p class="col-md-offset-3 col-lg-offset-3 col-xl-offset-3">
                            新用户名：<input name="name" class="btn btn-default" type="text" id="username"
                                        value="<%=thisUser.getName()%>"/>
                        </p>
                        <p class="col-md-offset-3 col-lg-offset-3col-xl-offset-3">
                            个性签名：<input class="btn btn-default" type="text" name="Signature"
                                        id="beforetel" value="<%=thisUser.getSignature()%>"/>
                        </p>
                        <p class="col-md-offset-3 col-lg-offset-3col-xl-offset-3">
                            默认收货地址：<input class="btn btn-default" type="text" name="receiverAddress"
                                          id="beforereceiverAddress" value="<%=thisUser.getReceiverAddress()%>"/>
                        </p>
                        <p class="col-md-offset-3 col-lg-offset-3col-xl-offset-3">
                            出生日期：<input class="btn btn-default" type="date"
                                        name="birthday"/>
                        </p>
                        <p class="col-md-offset-3 col-lg-offset-3col-xl-offset-3">
                            性别：
                            <label class="radio-inline">
                                <input
                                <c:if test="${sessionScope.get('USER_SESSION') !=null && sessionScope.get('USER_SESSION').sex=='男'}">
                                        checked
                                </c:if>
                                        type="radio"
                                        name="sex"
                                        id="inlineRadio1" value="男">男
                            </label>
                            <label class="radio-inline">
                                <input
                                <c:if test="${sessionScope.get('USER_SESSION') !=null && sessionScope.get('USER_SESSION').sex=='女'}">
                                        checked
                                </c:if>
                                        type="radio"
                                        name="sex"
                                        id="inlineRadio2" value="女"> 女
                            </label>
                        </p>
                    </form>

                    <button type="button"
                            class="btn btn-success col-md-offset-3 col-lg-offset-3col-xl-offset-3"
                            onclick="alterInfo()"/>
                    确认修改

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <%--头像上传--%>

    <div class="modal fade" id="signatureUpload" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">上传头像</h4>
                </div>
                <div class="modal-body">
                    <form method="post" enctype="multipart/form-data" action="<%=basePath%>/goFileUpload">
                        <div class="form-group">
                            <label for="exampleInputFile">选择头像</label>
                            <input required type="file" id="exampleInputFile" name="file">
                            <input type="text" value="signature" name="type" style="display: none">
                        </div>
                        <div class="form-group">
                            <button type="submit"
                                    class="btn btn-success"
                            >上传
                            </button>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

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

<script src='<%=basePath%>common/user/js/swiper.js'></script>
<script src="<%=basePath%>common/user/js/script.js"></script>
<script src="<%=basePath%>common/user/js/infoalter.js"></script>
<script>
    /*修改用户信息*/
    function alterInfo() {
        $.post("<%=basePath%>user/alterUserInfo", $("#alter_user").serialize()
            , function (data) {
                if (data != "OK") {
                    alert("修改信息失败！请重试")
                } else {
                    window.location.reload();
                }
            })
    }
</script>
</body>
</html>
