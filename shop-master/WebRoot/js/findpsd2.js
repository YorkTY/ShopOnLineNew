// JavaScript Document
window.onload=function(){
    var check=document.getElementById("check");
	var phonenumber=document.getElementById("phonenumber");
	var input=document.getElementById("input");
  check.onclick=function(){
	            var phone = phonenumber.value;
				var inputCode = input.value; 
					//取得输入的验证码并转化为大写      
				if(phone.length==0) { //若输入的验证码长度为0
					alert("请输入手机号码！"); //则弹出请输入验证码
				}  
				else if(inputCode.length==0) { //若输入的验证码长度为0
					alert("请输入验证码！"); //则弹出请输入验证码
				}  
			       
				else if(phone.length!==0 && inputCode.length!==0){ //输入正确时
					self.location='findpsd3.html'; //弹出输入正确
				} 
			}


}
