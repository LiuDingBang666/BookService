//审核用户信息修改的js
function altertel() {
		var tel = $("#beforetel").val();
		var nowtel = $("#nowtel").val();
		var username = $("#username").val();
		var pattern = /^1[0-9]\d{9}$/;
		if (!pattern.test(tel) || !pattern.test(nowtel)) {
			alert("手机号有误！");
			return;
		}
		if (tel == nowtel) {
			alert("原手机号不能和新手机号相同！");
			return;
		}
		//异步刷新修改用户密码
	$.post("/lsvvideo/AlterUserServlet",{name:username,phone:nowtel},function(data){
		console.log(data.state);
		if(data.state=="error"){
			alert("修改失败！手机号已存在");
			return
		}
		console.log(data.name);
		console.log(data.phone);
		document.getElementById("name").innerText=data.name;
		document.getElementById("phone").innerText=data.phone;
		document.getElementById("beforetel").value=data.phone;
		
		alert("修改成功！");
		$('#myModal').modal('hide');
	},"json");
	}
	