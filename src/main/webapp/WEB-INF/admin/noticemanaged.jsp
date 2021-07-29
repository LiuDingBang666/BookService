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
        <h1>公告管理</h1>
    </div>
    <div class="container-fluid" style="margin: 5px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addNotice">新增公告</button>

        <div class="pull-right">

            <form action="${pageContext.request.contextPath}/admin/goNotice" method="post">

                <input type="text" name="content" placeholder="请输入公告内容..." value="${selectNotice.content}"/>
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
                        <th>标题</th>
                        <th>内容</th>
                        <th>发布时间</th>
                        <th>发布人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="notice">
                        <tr>
                            <td>${notice.title}</td>
                            <td>${notice.content}</td>
                            <td style="background-color: #f9f9f9;font-weight: normal">
                                <fmt:formatDate
                                        value="${notice.time}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            </td>
                            <td>${notice.admin}</td>
                            <td>
                                <button value="${notice.id}" class="btn btn-primary" style="margin-right: 10px;"
                                        data-toggle="modal" onclick="editNotice(value)"
                                        data-target="#alterNotice">修改
                                </button>
                                <button value="${notice.id}"
                                        class="btn btn-primary" onclick="deleteConfirm(value)">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页插件--%>
                <div class="col-md-12 text-center">
                    <liuwisdom:page url="${pageContext.request.contextPath}/admin/goNotice"/>
                </div>
            </div>
        </div>


    </div>


    <!-- 新增公告 -->
    <!-- Modal -->
    <div class="modal fade" id="addNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">新增公告</h4>
                </div>
                <div class="modal-body">
                    <form id="new_notice_form">
                        <div>
                            <label>标题:</label>
                            <div>
                                <input type="text" name="title" placeholder="标题" value=""/>
                            </div>

                        </div>
                        <div>
                            <label>内容：</label>
                            <div>
                                <input type="text" name="content" placeholder="内容"/>
                            </div>
                        </div>
                        <div>
                            <button type="button" style="margin:10px" class="btn btn-primary" onclick="createNotice()">
                                新增公告
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改公告信息 -->
<!-- Modal -->
<div class="modal fade" id="alterNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">修改公告</h4>
            </div>
            <div class="modal-body">
                <input id="old_tel" style="display: none">
                <form id="edit_notice_form">
                    <input type="text" name="id" id="edit_id" style="display: none">
                    <div>
                        <label>标题:</label>
                        <div>
                            <input type="text" name="title" id="edit_title" placeholder="标题"/>
                        </div>
                    </div>
                    <div>
                        <label>内容:</label>
                        <div>
                            <input type="text" name="content" id="edit_content" placeholder="内容"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="alterNotice()">修改公告信息</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/common/admin/js/customer/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/inputCheck.js"></script>
<script>

    // 新增公告
    function createNotice() {
        var notice = $("#new_notice_form").serialize();
        var res = inputCheck(notice);
        if (res) {
            console.log($("#new_book_form").serialize())
            $.post("<%=basePath%>admin/createNotice",
                $("#new_notice_form").serialize(), function (data) {
                    if (data == "OK") {
                        alert("公告新增成功！");
                    } else {
                        alert("公告新增失败！");
                    }
                    window.location.reload();
                });
        }
    }

    //删除公告
    function deleteConfirm(id) {
        var res = confirm("您确定要删除该公告吗？");
        if (res) {//确认删除
            $.get("<%=basePath%>admin/deleteNotice?id=" + id, function (data) {
                if (data == "OK") {
                    alert("公告删除成功！");
                } else {
                    alert("公告删除失败，请重试！");
                }
                window.location.reload();
            });

        }
    }

    //编辑修改公告
    function editNotice(id) {
        $.get("<%=basePath%>admin/getNoticeById?id=" + id, function (data) {
            //更新图书信息
            $("#edit_title").val(data.title);
            $("#edit_content").val(data.content);
            $("#edit_id").val(id);
        })
    }

    //修改公告信息
    function alterNotice() {
        var notice = $("#edit_notice_form").serialize();
        console.log(notice)
        var res = inputCheck(notice);
        if (res) {
            $.post("<%=basePath%>admin/alterNotice", $("#edit_notice_form").serialize()
                , function (data) {
                    if (data == "OK") {
                        alert("公告修改成功！");
                    } else {
                        alert("修改失败，修改有误！");
                    }
                    window.location.reload();
                }
            )
        }
    }


</script>
</body>


</html>
