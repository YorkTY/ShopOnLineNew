// JavaScript Document

window.onload=function(){
	var code=document.getElementById("code");
	function change(){
		// 验证码组成库
	var arrays=new Array(  
		'1','2','3','4','5','6','7','8','9','0',  
		'a','b','c','d','e','f','g','h','i','j',  
		'k','l','m','n','o','p','q','r','s','t',  
		'u','v','w','x','y','z',  
		'A','B','C','D','E','F','G','H','I','J',  
		'K','L','M','N','O','P','Q','R','S','T',  
		'U','V','W','X','Y','Z'               
            	); 
			// 重新初始化验证码
				codes ='';
				// 随机从数组中获取四个元素组成验证码
				for(var i = 0; i<4; i++){
					// 随机获取一个数组的下标
					var r = parseInt(Math.random()*arrays.length);
					codes += arrays[r];
				}
		// 验证码添加到input里
    code.value = codes;
	}
	  change();//加载显示在页面上
    code.onclick = change;//单击更换验证码

//单击验证
	var check=document.getElementById("check");
	var input=document.getElementById("input");
  check.onclick=function(){
	            var user = username.value;
				var inputCode = input.value.toUpperCase();
				var pass = password.value; 
				if(inputCode.length==0) { //若输入的验证码长度为0
					alert("请输入验证码！"); //则弹出请输入验证码
				}  
				else if(inputCode!=codes.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
					alert("~~~~~~~"); //则弹出验证码输入错误
					change();//刷新验证码
					input.value="";//清空文本框
					return false;
				}       
				else{ //输入正确时
					self.location='index.html'; //弹出输入正确
				} 
			}


}
  $.validator.setDefaults({
    submitHandler: function() {
      alert("提交事件!");
	  
    }
});
$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#signupForm").validate({
	    rules: {
	      login: {
	        required: true,
	        minlength: 3
	      },
	      pass: {
	        required: true,
	        minlength: 6
	      },
	      confirm_password: {
	        required: true,   
	        minlength: 6,
	        equalTo: "#password"
	      },
	      email: {
	        required: true,
	        email: true
	      },
	      "topic[]": {
	        required: "#newsletter:checked",
	        minlength: 2
	      },
	      agree: "required"
	    },
	    messages: {
	    
	      login: {
	        required: "请输入用户名",
	        minlength: "用户名必需由两个字符组成"
	      },
	      pass: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于6个字符"
	      },
	      confirm_password: {
	        required: "请输入密码",
	        minlength: "密码长度不能小于6个字符",
	        equalTo: "两次密码输入不一致"
	      },
	      email: "请输入一个正确的邮箱",
	 
	    }
	});
});
// JavaScript Document