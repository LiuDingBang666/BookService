<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/signin/">

    <title>知门用户登录</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link
            href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/css/ie10-viewport-bug-workaround.css"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/examples/signin/signin.css"
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
    <style>
        input {
            margin: 5px;
        }
    </style>
</head>

<body>

<div class="container">
    <%--onsubmit="return loginCheck()"--%>
    <form class="form-signin" action="${pageContext.request.contextPath}/user/loginCheck" method="post">
        <h2 class="col-md-10 col-md-offset-1" style="margin-bottom: 50px">
            <img src="${pageContext.request.contextPath}/common/logo.png" height="200"
                 style="border-radius: 5px;">
        </h2>
        <h2 class="form-signin-heading col-md-offset-2 ">知门用户登录</h2>
        <label for="inputTel" class="sr-only">手机号</label>
        <input type="tel" name="tel" id="inputTel" class="form-control" placeholder="手机号" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
        <label for="inputAuthCode" class="sr-only">验证码</label>
        <input type="text" name="authcode" id="inputAuthCode"
               style="width: 200px;height: 44.4px;border: 1px solid #ccc;border-radius: 3px;padding: 10px"
               placeholder="验证码" required>
        <img src="${pageContext.request.contextPath}/CheckServlet"
             onclick="this.src=this.src+'?'+Math.random()">

        <p style="margin: 2px" align="center">${msg}</p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    </form>

</div> <!-- /container -->
<p style="margin: 2px" align="center">
    <span style="width: 500px;"></span> <a
        href="${pageContext.request.contextPath}/user/goRegister">还没注册？点我注册！</a>
</p>
<p align="center">
    <a href="${pageContext.request.contextPath}/user/goIndex">前往首页</a>
</p>


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
        src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/ie10-viewport-bug-workaround.js">
</script>
<script src="${pageContext.request.contextPath}/common/user/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/common/user/js/login.js"></script>
</body>
</html>
