package cn.it.shop.serviceImpl;

import org.springframework.stereotype.Service;

import cn.it.shop.model.User;
import cn.it.shop.service.UserService;

/*
 * 模块自身的业务逻辑
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
	   userDao.register(user);
	}

	@Override
	public void saveUser(User user,int uid) {
		// TODO Auto-generated method stub
		userDao.saveUser(user,uid);
	}

	@Override
	public User getUserByLogin(String login) {
		// TODO Auto-generated method stub
		
		return userDao.getUserByLogin(login);
	}


}
