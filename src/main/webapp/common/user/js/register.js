//注册js
var btn = document.getElementById("btn");
var interval = null;
btn.disabled = "disabled";

function inputTel() {
    var phone = document.getElementById('tel').value;
    // console.log(phone);
    var pattern = /^1[345789]\d{9}$/;
    if (pattern.test(phone)) {
        btn.disabled = "";
    } else {
        alert("手机号有误！");
        btn.disabled = "disabled";
    }
}

function getVCode() {
    var tel = $("#tel").val();
    //AJAX 发送请求给服务，服务商发送验证码短信,第三个参数是一个回函数，在请求完成之后，服务端给出了响应，响应成功之后，这个层续断会自动调用
    $.post("sendMsg", {"tel": tel}, function (data) {
        console.log(data);
        if (data != "OK") {
            alert("验证码发送失败！");
        }
        f();
    });
}

//验证码倒计时
function f() {
    $("#btn").attr('disabled', true);
    var n = 60;
    $("#btn").text((--n) + "s");
    var t = setInterval(function () {
        if (n <= 0) {
            clearInterval(t);
            $("#btn").text("重新获取");
            $("#btn").attr('disabled', false);
        } else {
            $("#btn").text((--n) + "s");
        }
    }, 1000);

}

//用户注册
function userRegister() {
    $.post("/BookService/user/registerCheck", $("#user_info").serialize(), function (data) {
        console.log(data)
        if (data === "Null") {
            alert("请先填写所有必填信息！")
        } else if (data === "HasUser") {
            alert("该手机号已被注册!")
        } else if (data === "AuthFail") {
            alert("验证码有误，请重试！");
        } else {
            var n = 3;
            $("#info").text((--n) + "秒后将为你自动跳转到首页...");
            var t = setInterval(function () {
                if (n <= 0) {
                    window.location.href = "/BookService/user/goIndex";
                    clearInterval(t);
                } else {
                    $("#info").text((n--) + "秒后将为你自动跳转到首页...");
                }
            }, 1000);

        }

    })
}