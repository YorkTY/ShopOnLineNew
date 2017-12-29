// JavaScript Document

window.onload=function(){
    var check=document.getElementById("check");
	var mm=document.getElementById("mm");
	var input=document.getElementById("input");
  check.onclick=function(){
	            var dd= mm.value;
				var inputCode = input.value; 
					//取得输入的验证码并转化为大写      
				if(dd.length==0) { //若输入的验证码长度为0
					alert("请输入密码！"); //则弹出请输入验证码
				}  
				else if(inputCode.length==0) { //若输入的验证码长度为0
					alert("请输入确认密码！"); //则弹出请输入验证码
				}  
			      else if(dd!==inputCode) { //若输入的验证码长度为0
					alert("两次密码不相同！"); //则弹出请输入验证码
				}  
				else if(dd==inputCode){ //输入正确时
					self.location='findpsd4.html'; //弹出输入正确
				} 
			}


}
