<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
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
    <link rel="stylesheet" href="<%=basePath%>common/user/css/style.css">
    <title>关于我们 </title>

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


<div class="container col-md-offset-3">
    <!-- Begin page content -->
    <div class="container col-md-12">
        <div class="page-header">


            <h1><img src="${pageContext.request.contextPath}/common/logo2.png" height="150"></h1>
            <h1>知门书籍</h1>
            <h4>开发者：刘定邦、刘石衡、曹嘉欣</h4>
        </div>
        <p class="lead">本平台主要为用户提供优质书籍购买服务，如果你有什么好的建议，请写在下面：</p>
        <p><textarea class="form-control" style="width: 500px" rows="5" id="user_msg"></textarea></p>
        <p>
            <button class="btn btn-primary" onclick="sendMsg()">发送</button>
        </p>
    </div>

</div>
<div class="container col-md-offset-3" id="msg">
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
<script src="<%=basePath%>common/user/js/jquery.js"></script>
<script>
    /*发送建议*/
    function sendMsg() {
        var content = $("#user_msg").val();
        if (content.trim() != "") {
            $.post("${pageContext.request.contextPath}/user/addSuggest", {"content": content}, function (data) {
                if (data == "OK") {
                    $("#msg").append("<h2>" + content + "</h2>")
                    alert("发送成功！")
                    $("#user_msg").val("");
                } else {
                    alert("发送失败！请重试")
                }
            })
        } else {
            alert("建议信息不能为空！");
        }
    }
</script>
</body>
</html>
