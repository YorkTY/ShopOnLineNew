package cn.it.shop.daoImpl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import cn.it.shop.dao.ForderDao;
import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.ForderService;

/*
 * 模块自身的业务逻辑
 */
@Repository("forderDao")
public class ForderDaoImpl extends BaseDaoImpl<Forder> implements ForderDao {

	@Override
	public void updateStatusById(int id, int sid) {
		String hql = "UPDATE Forder f SET f.status.id=:sid WHERE f.id=:id";
		getSession().createQuery(hql)
					.setInteger("sid", sid)
					.setInteger("id", id)
					.executeUpdate();
	}

	@Override
	public List<Forder> fingID(int uid) {
		// TODO Auto-generated method stub
            String hql ="FROM Forder f JOIN FETCH f.user WHERE f.user.id = :uid"; 		
		return getSession().createQuery(hql)
				.setInteger("uid", uid)
				.list();
	}

	

}
