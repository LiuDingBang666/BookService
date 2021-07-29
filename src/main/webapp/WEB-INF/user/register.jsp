<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>知门用户注册</title>
</head>
<body>
</body>
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
</head>
<style>
    input {
        margin: 5px;
    }
</style>
<body>

<div class="container">

    <form class="form-signin " id="user_info">

        <h2 class="col-md-10 col-md-offset-1" style="margin-bottom: 50px">
            <img src="${pageContext.request.contextPath}/common/logo.png" height="200"
                 style="border-radius: 5px;">
        </h2>


        <h2 class="form-signin-heading col-md-offset-2">
            知门用户注册
        </h2>

        <label for="inputUser" class="sr-only">用户名</label> <input type="text" id="inputUser"
                                                                  class="form-control" placeholder="用户名" name="name"
                                                                  required autofocus>
        <label for="inputPsw" class="sr-only">密码</label>
        <input type="password" id="inputPsw" class="form-control" placeholder="密码" name="password"
               required autofocus>
        <label for="tel"
               class="sr-only">手机号码</label>
        <input type="tel" id="tel" name="tel" class="form-control" placeholder="手机号码" required autofocus
               pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$" onchange="inputTel()">
        <label for="inputverification" class="sr-only ">验证码</label> <input type="text"
                                                                           id="inputverification" class="form-control"
                                                                           placeholder="验证码" name="code" required>
        <button class="form-control" type="button" onclick="getVCode()" id="btn" name="btn"
                class="btn btn-warning ">点击获取
        </button>


    </form>
    <button class="btn btn-primary btn-block" onclick="userRegister()" style="width: 300px;margin: 0px auto">注册</button>
    <p align="center" id="info" style="font-size: 20px;color: dodgerblue"></p>
</div>
<p style="margin: 2px" align="center">
    <span style="width: 500px;"></span> <a href="${pageContext.request.contextPath}/user/goLogin">已有账号？点我登陆！</a>
</p>
<p align="center">
    <a href="${pageContext.request.contextPath}/user/goIndex">前往首页</a>
</p>


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
        src="https://cdn.jsdelivr.net/npm/@bootcss/v3.bootcss.com@1.0.8/assets/js/ie10-viewport-bug-workaround.js">
</script>
<script src="${pageContext.request.contextPath}/common/user/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/common/user/js/register.js"></script>

</body>
</html>

</html>
