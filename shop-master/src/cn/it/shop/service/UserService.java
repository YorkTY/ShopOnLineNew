package cn.it.shop.service;

import cn.it.shop.model.User;

public interface UserService extends BaseService<User> {

	public User login(User user);
	public void register(User user);
    public  void saveUser(User user,int uid);
    public User getUserByLogin(String login);
   
  
}
