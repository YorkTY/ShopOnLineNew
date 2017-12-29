package cn.it.shop.dao;

import cn.it.shop.model.User;

public interface UserDao extends BaseDao<User> {

	public User login(User user);
	public void register(User user);
	public void saveUser(User user,int uid);
	public User getUserByLogin(String login);
}
