package cn.it.shop.daoImpl;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.AccountDao;
import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.model.User;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;

/*
 * 模块自身的业务逻辑
 */
@Repository("accountDao")
public class AccountDaoImpl extends BaseDaoImpl<Account> implements AccountDao {

	@Override
	public Account login(Account account) {
		// TODO Auto-generated method stub
		String hql = "FROM Account a WHERE a.login=:login AND a.pass=:pass";
		return (Account)getSession().createQuery(hql)
				.setString("login", account.getLogin())
				.setString("pass", account.getPass())
				.uniqueResult();
		
	}
	
}
