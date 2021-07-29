// 登录js
function loginCheck() {
    var phone = $("#inputTel").val();
    var pattern = /^1[345789]\d{9}$/;
    if (!pattern.test(phone)) {
        alert("手机号有误！");
        return false;
    }
    return true;

}
