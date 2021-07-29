<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>管理员登录</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/admin/css/matrix-login.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/common/admin/font-awesome/css/font-awesome.min.css"/>

</head>
<body onkeydown="keydown()">
<div id="loginbox">
    <div class="control-group normal_text">
        <h2>书籍服务管理系统登录</h2>
    </div>

    <form class="form-vertical" id="user_info">
        <div class="control-group">
            <label class="control-label">输入账号</label>
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_lg"><i class="fa fa-user"></i></span><input   type="text"
                                                                                       name="name"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">登陆密码</label>
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_ly"><i class="fa fa-key"></i></span><input   type="password"
                                                                                      name="password"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">${msg}</label>
        </div>
        <div class="form-actions">

            <span class="pull-right">
						<input type="button" id="checkBtn" onclick="checkLogin()" class="btn btn-success"
                               value="登&nbsp;&nbsp;录"/>
							
					</span>
        </div>
        <div class="control-group normal_text">
            推荐使用支持HTML5的浏览器，如chrome、IE9+等
        </div>
    </form>

    <form id="recoverform" action="#" class="form-vertical">
        <div class="controls-group">
            <label class="control-label">登陆账号</label>
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_lg"><i class="fa fa-user"></i></span><input type="text"
                                                                                       name="fg_account"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">180字留言（电话、姓名、问题等）</label>
            <div class="controls">
                <div class="main_input_box">
                    <textarea name='fg_message' id="fg_message" placeholder="说点啥吧 ..."></textarea>
                </div>
            </div>
        </div>
        <div class="form-actions">
					<span class="pull-left">
						<a id="to-login" href="#">&laquo; 返回登录</a>
					</span>
            <span class="pull-right">
						<input type="button" id="leaveMsg" class="btn btn-info" value="给管理员留言"/>
					</span>
        </div>
        <div class="control-group normal_text">
            推荐使用支持HTML5的浏览器，如chrome、IE9+等
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/common/admin/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/common/admin/js/matrix.login.js"></script>
</body>
<script>

    /*用户登录*/
    function checkLogin() {
        $.post("${pageContext.request.contextPath}/admin/loginCheck", $("#user_info").serialize(), function (data) {
            if (data == 'OK') {
                window.location.href = "${pageContext.request.contextPath}/admin/goIndex";
            } else {
                alert("用户名或密码输入有误！");
            }
        })
    }
</script>
</html>
