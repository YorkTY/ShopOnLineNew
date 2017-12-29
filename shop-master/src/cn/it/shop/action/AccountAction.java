package cn.it.shop.action;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sun.net.httpserver.Authenticator.Success;

import cn.it.shop.model.Account;

/*
 *ModelDriven 此接口必须要实现getModel（）方法，此方法会把返回的对象，压到值栈中 
 */
@Controller("accountAction")
@Scope("prototype")
public class AccountAction extends BaseAction<Account> {

	public String query(){
		jsonList = accountService.query();
		return "jsonList";
	}
	
	//后台管理员登录
		public String login() {
			// TODO Auto-generated method stub			
			//进行登录验证				
				model = accountService.login(model);
					if(model==null){
						session.put("error1", "登录失败,账户或密码错误");
						request.put("result", "login-false");
						return "backLogin";
					}else {
						//登录成功，则根据情况返回相应的页面						
						request.put("result", "login-success");
						session.put("account",model);
						session.remove("error1");
						return "aindex";
						}
	                
		}
	
		
	public String success() {
	
		return "aindex";
	
	}
	
	public String quit() {
		session.remove("account");
		
		return "index";

	}
}
