<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="liuwisdom" uri="http://liuwisdom.icu/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Matrix Admin</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/customer/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/uniform.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/select2.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/matrix-iframe.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/matrix-media.css"/>
    <link href="${pageContext.request.contextPath}/common/admin/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
</head>
<body>

<div id="content">
    <div id="content-header">
        <h1>用户订单信息</h1>
    </div>
    <div class="container-fluid" style="margin: 5px;">


        <div class="pull-right">

            <form action="${pageContext.request.contextPath}/admin/goOrderManaged" method="post">
                <select name="state" style="width:90px">
                    <option value="-1">订单状态</option>
                    <option value="0" <c:if
                            test="${state==0}"> selected</c:if>>未支付
                    </option>
                    <option value="1" <c:if
                            test="${state==1}"> selected</c:if>>已支付
                    </option>
                </select>
                <input type="text" name="name" placeholder="输入用户名查找订单..." value="${name}"/>
                <button type="submit" class="btn btn-primary" title="Search" style="margin-top: -10px"><i
                        class="fa fa-search fa-white"></i></button>
            </form>

        </div>

    </div>
    <div class="container-fluid">

        <div class="widget-box">

            <div class="widget-content nopadding">
                <table class="table table-bordered table-striped with-check">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>用户名</th>
                        <th>订单总金额</th>
                        <th>收货地址</th>
                        <th>收货手机号</th>
                        <th>收货人</th>
                        <th>支付状态</th>
                        <th>订单时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="order">
                        <tr>

                            <td width="3%">${order.orderid}</td>
                            <td width="10%">${order.user.name}</td>

                            <td width="8%">${order.money}元
                            </td>
                            <td width="10%">${order.receiverAddress}</td>
                            <td width="5%">${order.receiverPhone}</td>
                            <td width="5%">${order.receiverName}</td>
                            <td width="5%"><c:if test="${order.paystate==1}">已支付</c:if><c:if
                                    test="${order.paystate==0}">未支付</c:if></td>
                            <td width="10%" style="background-color: #f9f9f9;font-weight: normal">
                                <fmt:formatDate
                                        value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            </td>
                            <td width="20%">
                                <a href="<%=basePath%>/admin/findOrderInfo?id=${order.orderid}">
                                    <button type="submit" class="btn btn-primary">查看订单</button>
                                </a>
                                <c:if test="${order.paystate==0}">
                                    <button class="btn btn-primary" value="${order.orderid}"
                                            onclick="delOrderById(value)">删除订单
                                    </button>
                                </c:if>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页插件--%>
                <div class="col-md-12 text-center">
                    <liuwisdom:page url="${pageContext.request.contextPath}/admin/goOrderManaged"/>
                </div>
            </div>
        </div>


    </div>


    <script src="${pageContext.request.contextPath}/common/admin/js/customer/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>


    <script>

        //删除订单
        function delOrderById(id) {
            if (confirm("您确认要删除此订单吗?")) {
                $.post("<%=basePath%>admin/delOrdersById", {"id": id}, function (data) {
                    if (data == "OK") {
                        alert("订单删除成功！");
                        window.location.reload();
                    } else {
                        alert("订单删除失败！");
                    }
                })
            }
        }
    </script>
</body>


</html>
