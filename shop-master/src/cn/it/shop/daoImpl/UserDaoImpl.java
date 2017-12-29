package cn.it.shop.daoImpl;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.UserDao;
import cn.it.shop.model.User;
import cn.it.shop.service.UserService;

/*
 * 模块自身的业务逻辑
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public User login(User user) {
		String hql = "FROM User u WHERE u.login=:login AND u.pass=:pass";
		return (User)getSession().createQuery(hql)
				.setString("login", user.getLogin())
				.setString("pass", user.getPass())
				.uniqueResult();
	}

	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(user);
	
		
	}

	@Override
	public void saveUser(User user,int uid) {
		// TODO Auto-generated method stub
		String hql = "Update User u SET u.sex=:sex WHERE u.id=uid";
	     getSession().createQuery(hql)
				/*.setInteger("uid",uid)*/
				.setString("sex", user.getSex());
	                
		
	}

	@Override
	public User getUserByLogin(String login) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.login=:login";		
		return (User) getSession().createQuery(hql)
				.setString("login", login)
				.uniqueResult()
				;
	}

	


}
