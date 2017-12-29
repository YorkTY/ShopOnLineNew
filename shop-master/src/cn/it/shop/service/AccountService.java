package cn.it.shop.service;

import cn.it.shop.model.Account;

public interface AccountService extends BaseService<Account> {
         
	public Account login(Account account);
}
