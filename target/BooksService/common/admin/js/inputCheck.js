//输入必填校验
function inputCheck(data) {
    var types = data.split('&');
    for (var i = 0; i < types.length; i++) {
        if ((types[i].indexOf("=") + 1) == types[i].length) {
            alert("请填写所有必填信息！")
            return false;
        }
    }
    return true;
}