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
        <h1>用户建议信息管理</h1>
    </div>
    <div class="container-fluid" style="margin: 5px;">


        <div class="pull-right">

            <form action="${pageContext.request.contextPath}/admin/goSuggestManaged" method="post">

                <input type="text" name="content" placeholder="请输入建议内容..." value="${selectContent}"/>
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
                        <th>编号</th>
                        <th>内容</th>
                        <th>发布时间</th>
                        <th>发布人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="suggest">
                        <tr>
                            <td>${suggest.id}</td>
                            <td>${suggest.content}</td>
                            <td style="background-color: #f9f9f9;font-weight: normal">
                                <fmt:formatDate
                                        value="${suggest.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            </td>
                            <td>${suggest.proposer}</td>
                            <td>

                                <button value="${suggest.id}"
                                        class="btn btn-primary" onclick="deleteSuggest(value)">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页插件--%>
                <div class="col-md-12 text-center">
                    <liuwisdom:page url="${pageContext.request.contextPath}/admin/goSuggestManaged"/>
                </div>
            </div>
        </div>


    </div>


    <script src="${pageContext.request.contextPath}/common/admin/js/customer/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/admin/js/inputCheck.js"></script>
    <script>


        //删除建议信息
        function deleteSuggest(id) {
            var res = confirm("您确定要删除该建议吗？");
            if (res) {//确认删除
                $.get("<%=basePath%>admin/deleteSuggestById?id=" + id, function (data) {
                    if (data == "OK") {
                        alert("建议删除成功！");
                    } else {
                        alert("建议删除失败，请重试！");
                    }
                    window.location.reload();
                });

            }
        }

    </script>
</body>


</html>
