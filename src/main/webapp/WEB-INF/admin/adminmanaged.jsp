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
        <h1>管理员|用户信息</h1>
    </div>
    <div class="container-fluid" style="margin: 5px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUser">新增管理员|用户</button>

        <div class="pull-right">

            <form action="${pageContext.request.contextPath}/admin/goAdmin" method="post">
                <select name="role" style="width:90px">
                    <option value="">--身份--</option>
                    <option value="管理员" <c:if
                            test="${selectUser.role.equals('管理员')}"> selected</c:if>>管理员
                    </option>
                    <option value="用户" <c:if
                            test="${selectUser.role.equals('用户')}"> selected</c:if>>用户
                    </option>
                </select>
                <select name="sex" style="width:90px">
                    <option value="">--性别--</option>
                    <option value="男" <c:if
                            test="${selectUser.sex.equals('男')}"> selected</c:if>>男
                    </option>
                    <option value="女" <c:if
                            test="${selectUser.sex.equals('女')}"> selected</c:if>>女
                    </option>
                </select>
                <input type="text" name="name" placeholder="输入名字..." value="${selectUser.name}"/>
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

                        <th>名字</th>
                        <th>身份</th>
                        <th>出生日期</th>
                        <th>电话号码</th>
                        <th>默认收货地址</th>
                        <th>密码</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>个性签名</th>
                        <th>头像</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="admin">
                        <tr>

                            <td width="5%">${admin.name}</td>
                            <td>${admin.role}</td>
                            <th style="background-color: #f9f9f9;font-weight: normal"><fmt:formatDate
                                    value="${admin.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            </th>
                            <td>${admin.tel}
                            </td>
                            <td>${admin.receiverAddress}
                            </td>
                            <td>${admin.password}</td>
                            <td class="center">${admin.sex}</td>
                            <td><c:if test="${admin.state==0}">正常</c:if>
                                <c:if test="${admin.state==1}">冻结</c:if></td>
                            <td>${admin.signature}</td>
                            <td>
                                <img src="${admin.imgurl}" height="40" width="40" alt="个人头像-暂无">
                            </td>
                            <td>
                                <button value="${admin.tel}" class="btn btn-primary" style="margin-right: 10px;"
                                        data-toggle="modal" onclick="editUser(value)"
                                        data-target="#alterBook">修改
                                </button>
                                <button value="${admin.tel}"
                                        class="btn btn-primary" onclick="deleteConfirm(value)">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页插件--%>
                <div class="col-md-12 text-center">
                    <liuwisdom:page url="${pageContext.request.contextPath}/admin/goAdmin"/>
                </div>
            </div>
        </div>


    </div>


    <!-- 新增用户|管理员 -->
    <!-- Modal -->
    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">新增管理员|用户</h4>
                </div>
                <div class="modal-body">
                    <form id="new_user_form">
                        <div>
                            <label>用户名:</label>
                            <div>
                                <input required type="text" name="name" placeholder="用户名"/>
                            </div>

                        </div>
                        <div>
                            <label>电话号码：</label>
                            <div>
                                <input required type="tel" name="tel" placeholder="电话号码"/>
                            </div>
                        </div>
                        <div>
                            <label>密码：</label>
                            <div>
                                <input type="password" name="password" placeholder="密码"/>
                            </div>
                        </div>
                        <div>
                            <label>性别：</label>
                            <div>

                                <label>
                                    男<input required type="radio" value="男" name="sex">
                                    女<input required type="radio" value="女" name="sex">
                                </label>
                            </div>
                        </div>
                        <div>
                            <label>身份：</label>
                            <div>
                                <label>
                                    用户<input required type="radio" value="用户" name="role">
                                    管理员<input required type="radio" value="管理员" name="role">
                                </label>
                            </div>
                        </div>
                        <div>
                            <label>签名:</label>
                            <div>
                                <textarea name="signature"></textarea>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary" onclick="createUser()">创建用户</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改用户信息 -->
<!-- Modal -->
<div class="modal fade" id="alterBook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">修改用户|管理员</h4>
            </div>
            <div class="modal-body">
                <input id="old_tel" style="display: none">
                <form id="edit_user_form">
                    <div>
                        <label>用户名:</label>
                        <div>
                            <input type="text" name="name" id="edit_name" placeholder="用户名"/>
                        </div>
                    </div>
                    <div>
                        <label>手机号:</label>
                        <div>
                            <input type="tel" name="tel" id="edit_tel" placeholder="手机号"/>
                        </div>
                    </div>
                    <div>
                        <label>密码：</label>
                        <div>
                            <input type="password" name="password" id="edit_password" placeholder="密码"/>
                        </div>
                    </div>
                    <div id="a_signature">
                        <label>签名:</label>
                        <div>
                            <textarea name="signature" id="edit_signature"></textarea>
                        </div>
                    </div>
                    <div id="a_receiverAddress">
                        <label>默认收货地址:</label>
                        <div>
                            <textarea name="receiverAddress" id="edit_receiverAddress"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="alterUser()">修改信息</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/common/admin/js/customer/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/inputCheck.js"></script>
<script>
    // 创建客户
    function createUser() {
        var user = $("#new_user_form").serialize();
        var res = inputCheck(user);
        if (res) {
            $.post("<%=basePath%>admin/createUser",
                $("#new_user_form").serialize(), function (data) {
                    if (data == "OK") {
                        alert("用户创建成功！");
                    } else {
                        alert("用户创建失败，手机号已被注册！");
                    }
                    window.location.reload();
                });
        }
    }

    //删除客户
    function deleteConfirm(tel) {
        var res = confirm("您确定要删除该用户吗？");
        if (res) {//确认删除
            $.get("<%=basePath%>admin/deleteUser?tel=" + tel, function (data) {
                if (data == "OK") {
                    alert("用户删除成功！");
                } else {
                    alert("用户删除失败，请重试！");
                }
                window.location.reload();
            });

        }
    }

    //编辑修改用户
    function editUser(tel) {
        $.get("<%=basePath%>admin/getUserByTel?tel=" + tel, function (data) {
            //更新信息
            $("#old_tel").val(data.tel);
            $("#edit_name").val(data.name);
            $("#edit_password").val(data.password);
            $("#edit_signature").val(data.signature);
            $("#edit_tel").val(data.tel);
            $("#edit_receiverAddress").val(data.receiverAddress);
            if (data.role === '管理员') {
                $("#a_signature").hide();
                $("#a_receiverAddress").hide();
            } else {
                $("#a_signature").show();
                $("#a_receiverAddress").show();
            }

        })
    }

    //修改用户信息
    function alterUser() {
        var user = $("#edit_user_form").serialize();
        var res = inputCheck(user);
        if (res) {
            $.post("<%=basePath%>admin/alterUser", $("#edit_user_form").serialize()
                , function (data) {
                    if (data == "OK") {
                        alert("用户修改成功！");
                    } else {
                        alert("手机号已存在或修改有误！");
                    }
                    window.location.reload();
                })
        }

    }
</script>
</body>


</html>
