package cn.it.shop.action;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.xml.soap.Detail;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.annotations.Until;
import com.opensymphony.xwork2.ActionContext;
import com.sun.swing.internal.plaf.metal.resources.metal_zh_TW;

import antlr.DiagnosticCodeGenerator;
import cn.it.shop.model.User;
import cn.it.shop.service.UserService;
import cn.it.shop.util.DigestUtil;
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {

	public String login() throws NoSuchAlgorithmException, UnsupportedEncodingException{
		//进行登录验证
		System.out.print(session.get("goURL")+"!!!!!!!!!!!!!!!!!!!");
		
			DigestUtil util = new DigestUtil();
			model.setPass(util.EncoderByMd5(model.getPass()));
		    model = userService.login(model);
		
		if(model==null){
			session.put("error", "登录失败,账户或密码错误");
			request.put("result", "login-false");
		
			return "login_false";
		}else {
			//登录成功，则根据情况返回相应的页面
			model.setName("风一样的少年");
			request.put("result", "login-success");
			session.put("user", model);
			session.remove("error");
			//根据session中goURL是否有值而决定页面的跳转
			/*if(session.get("goURL")==null){
				return "index";
			}else{
				return "goURL";
			}*/
			
			return "login_success";
		}
		
	}
	
	
	
	
	public String register() throws NoSuchAlgorithmException, UnsupportedEncodingException {
		ActionContext aa = ActionContext.getContext();
		request = (Map<String, Object>) aa.get("request");
		User user = userService.getUserByLogin(model.getLogin());
		if(user==null) {
			
			DigestUtil util = new DigestUtil();
			model.setPass(util.EncoderByMd5(model.getPass()));
			
			userService.save(model);
		
			return "register_success";	
		 
		}else {
			request.put("result", "register-false");
			return "register_false";
		}
	
	}
	
	public String quit() {
		session.clear();
		return "quit";		
		
	}
	public String saveUser() {	
		/*User user = (User) session.get("user");
		int uid = user.getId();
		userService.saveUser(model,uid);
		System.out.print(uid+"usermessage!!!!!!!!!!");*/
		User user = (User) session.get("user");
		model.setId(user.getId());
		model.setPass(user.getPass());
		model.setLogin(user.getLogin());
		model.setMoney(user.getMoney());
		userService.update(model);
		System.out.print("~~~~~~~~~~"+model.getPass());
		return "saveUser";
	
	}
	
	public String detail(){
		User user = (User) session.get("user");
		model = userService.login(user);
		session.put("user", model);
		return "user_detail";	
	}
	

	
}
