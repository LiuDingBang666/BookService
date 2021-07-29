<%--
  Created by IntelliJ IDEA.
  User: LDB
  Date: 2021/6/10
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息上传</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/goFileUpload" id="new_book_form" method="post"
      enctype="multipart/form-data">
    <div>
        <label>图书名:</label>
        <div>
            <input type="text" name="name" placeholder="图书名" value=""/>
        </div>

    </div>
    <div>
        <label>图书价格：</label>
        <div>
            <input type="number" name="price" placeholder="图书价格"/>
        </div>
    </div>
    <div>
        <label>图书分类：</label>
        <div>
            <input type="text" name="category" placeholder="图书分类"/>
        </div>
    </div>
    <div>
        <label>图书数量</label>
        <div>
            <input type="number" name="num" placeholder="图书数量">
        </div>
    </div>
    <div>
        <label>图书图片链接</label>
        <div>
            <input type="file" name="file">
        </div>
    </div>
    <div>
        <label>描述:</label>
        <div>
            <textarea name="description"></textarea>
        </div>
    </div>
    <div>
        <input type="submit">新增图书</input>
    </div>
</form>
</body>
</html>
