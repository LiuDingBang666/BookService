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
        <h1>书籍安全库存管理</h1>
    </div>
    <div class="container-fluid" style="margin: 5px;">


        <div class="pull-right">

            <form action="${pageContext.request.contextPath}/admin/goSafetyStockManaged" method="post">
                <select name="category" style="width:120px">
                    <option value="">--图书类型--</option>
                    <c:forEach var="category" items="${categorys}">
                        <option value="${category}" <c:if
                                test="${category.equals(selectBook.category)}"> selected</c:if>>
                                ${category}
                        </option>
                    </c:forEach>


                </select>

                <input type="text" name="name" placeholder="请输入图书名..." value="${selectBook.name}"/>
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
                        <th>图书编号</th>
                        <th>图书名</th>
                        <th>价格</th>
                        <th>分类</th>
                        <th>库存</th>
                        <th>图片</th>
                        <th>描述</th>
                        <th>添加时间</th>
                        <th>购买数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.rows}" var="book">
                        <tr>

                            <td width="3%">${book.bookid}</td>
                            <td width="10%">${book.name}</td>

                            <td width="8%">${book.price}元
                            </td>
                            <td width="10%">${book.category}</td>
                            <td width="5%">${book.num}本</td>
                            <td width="5%"><img height="80" width="60" src="${book.imgurl}" alt="图片无效"></td>
                            <td width="25%">${book.description}</td>
                            <td width="10%" style="background-color: #f9f9f9;font-weight: normal">
                                <fmt:formatDate
                                        value="${book.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/> 

                            </td>
                            <td width="5%">${book.buynum}本</td>
                            <td width="15%">
                                <button value="${book.bookid}" class="btn btn-primary" style="margin-right: 10px;"
                                        data-toggle="modal" onclick="editBook(value)"
                                        data-target="#alterBook">新增库存
                                </button>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--分页插件--%>
                <div class="col-md-12 text-center">
                    <liuwisdom:page url="${pageContext.request.contextPath}/admin/goBook"/>
                </div>
            </div>
        </div>


    </div>


    <!-- 新增库存 -->
    <!-- Modal -->
    <div class="modal fade" id="alterBook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">添加库存</h4>
                </div>
                <div class="modal-body">
                    <input id="old_tel" style="display: none">
                    <form id="edit_book_form">
                        <input type="text" name="bookid" id="edit_bookid" style="display: none">
                        <div>
                            <label>图书名:</label>
                            <div>
                                <input type="text" name="name" id="edit_name" placeholder="图书名"/>
                            </div>
                        </div>
                        <div>
                            <label>价格:</label>
                            <div>
                                <input type="number" name="price" id="edit_price" placeholder="价格"/>
                            </div>
                        </div>
                        <div>
                            <label>分类：</label>
                            <div>
                                <input type="text" name="category" id="edit_category" placeholder="分类"/>
                            </div>
                        </div>
                        <div>
                            <label>图书库存:</label>
                            <div>
                                <button type="button" onclick="addNum()" class="btn btn-primary">+</button>
                                <input type="number" name="num" id="edit_num"/>
                                <button type="button" onclick="subNum()" class="btn btn-primary">-</button>
                            </div>
                        </div>
                        <div>
                            <label>图片地址：</label>
                            <div>
                                <input style="width: 500px" type="text" name="imgurl" id="edit_imgurl"
                                       placeholder="图书图片地址"/>
                            </div>
                        </div>
                        <div>
                            <label>图书描述：</label>
                            <div>
                            <textarea rows="10" cols="60" name="description" id="edit_description"
                                      placeholder="图书描述"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="alterBook()">修改图书信息</button>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/common/admin/js/customer/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/admin/js/bootstrap.min.js"></script>
    <%--导入输入验证js--%>
    <script src="${pageContext.request.contextPath}/common/admin/js/inputCheck.js"></script>

    <script>
        //判断指定类型是否为负数
        function isCheckPass(value, type) {
            if (isNaN(value)) {
                alert(type + "输入不能为数字！");
                return false;
            }
            if (parseInt(value) < 0) {
                alert(type + "输入不能为负数!")
                return false;
            }
            return true;

        }

        //编辑修改库存
        function editBook(id) {
            $.get("<%=basePath%>admin/getBookById?id=" + id, function (data) {
                //更新图书信息
                $("#edit_name").val(data.name);
                $("#edit_price").val(data.price);
                $("#edit_category").val(data.category);
                $("#edit_num").val(data.num);
                $("#edit_imgurl").val(data.imgurl);
                $("#edit_description").val(data.description);
                $("#edit_bookid").val(id);
            })
        }

        //修改图书信息
        function alterBook() {

            var book = $("#edit_book_form").serialize();
            var res = inputCheck(book);
            if (res && isCheckPass($("#edit_num").val(), '库存') && isCheckPass($("#edit_price").val(), '价格')) {
                $.post("<%=basePath%>admin/alterBook", $("#edit_book_form").serialize()
                    , function (data) {
                        if (data == "OK") {
                            alert("图书信息修改成功！");
                        } else {
                            alert("修改失败，修改有误！");
                        }
                        window.location.reload();
                    }
                )
            }
        }


        //增加图书库存
        function addNum() {
            var num = $("#edit_num").val();

            $("#edit_num").val(Number.parseInt(num) + 1);
        }

        //减少图书库存
        function subNum() {
            var num = $("#edit_num").val();
            if (Number.parseInt(num) - 1 > 0) {
                $("#edit_num").val(Number.parseInt(num) - 1);
            }

        }
    </script>
</body>


</html>
