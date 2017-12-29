package cn.it.shop.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Category;
import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;

@Controller
@Scope("prototype")
public class ForderAction extends BaseAction<Forder> {

	@Override
	public Forder getModel() {
		model = (Forder) session.get("forder");
		return model;
	}

	// 实现购物车（订单）与购物项（订单项）级联入库
	public String save() {
		// 把session中的购物项，交给当前的model对象

		model.setUser((User) session.get("user"));
		model.setStatus(new Status(1));
		// 级联入库,需要

		forderService.save(model);
		System.out.print(model.getId());
		// 订单已经生成，删除session中的购物车
		session.put("oldForder", session.remove("forder"));
		session.put("forder", new Forder());
		User user = (User) session.get("user");
		Forder forder = (Forder) session.get("oldForder");
		BigDecimal balance = user.getMoney().subtract(forder.getTotal());
		user.setMoney(balance);
		userService.update(user);

		return "bank";
	}

	public String getForder() {
		// TODO Auto-generated method stub
		User user = (User) session.get("user");
		List<List<Sorder>> sorderList = new ArrayList<List<Sorder>>();
		//List<List<Forder>> forderID = forderService.findID(user.getId());
		
		for (Forder forder : forderService.findID(user.getId())) {
			// 根据热点类别id获取推荐商品信息
			System.out.println("Forder:!!!!+++++++++" + forder.getId());
			sorderList.add(sorderService.getSorder(forder.getId()));

		}
		session.put("sorderList", sorderList);
		
		
		return "getForder";
	}

}
