package cn.it.shop.action;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.model.Pager;
import cn.it.shop.model.Product;

/*
 *ModelDriven 此接口必须要实现getModel（）方法，此方法会把返回的对象，压到值栈中 
 */
@Controller("categoryAction")
@Scope("prototype")
public class CategoryAction extends BaseAction<Category> {
	
	public String queryJoinAccount(){
		//用来存储分页的数据
		pageMap = new HashMap<String, Object>();
		//根据关键字和分页的参数查询相应的数据
		List<Category> categoryList = categoryService.queryJoinAccount(model.getType(), page, rows);
		pageMap.put("rows", categoryList);
		pageMap.put("total", categoryService.getCount(model.getType()));
		System.out.println(pageMap);
		return "jsonMap";
	}
	
	public String deleteByIds(){
		
		categoryService.deleteByIds(ids);
		// 以流的形式
		inputStream = new ByteArrayInputStream("true".getBytes());
		
		return "stream";
	}
	
	public void save(){
		
		model.setAccount((Account) session.get("account"));		
		categoryService.save(model);
		System.out.println(model.getAccount().getLogin()+"!!!!!!!");
	}
	
	public void update(){
		categoryService.update(model);
	}
	
	public String query(){
		jsonList = categoryService.query();
		return "jsonList";
	}
	
	public String listProduct(){
		
		if(model.getId()==null) {
			int i = (int) session.get("cid");
			HttpServletRequest request = ServletActionContext.getRequest();
			Pager<Product> result = categoryService.findProduct(1, 7,i,Integer.valueOf(request.getParameter("min_price")),Integer.valueOf(request.getParameter("max_price")));
			System.out.print(Integer.valueOf(request.getParameter("min_price"))+"!!"+Integer.valueOf(request.getParameter("max_price")));
			session.put("result", result);
			return "listByOneCategory";	
		}else {
		HttpServletRequest request = ServletActionContext.getRequest();
		Pager<Product> result = categoryService.findProduct(1, 7,model.getId(),Integer.valueOf(request.getParameter("min_price")),Integer.valueOf(request.getParameter("max_price")));
		System.out.print(Integer.valueOf(request.getParameter("min_price"))+"!!"+Integer.valueOf(request.getParameter("max_price")));
		session.put("result", result);
		session.put("cid", model.getId());
		return "listByOneCategory";
		}
		
		
		
	}
	public String listProduct2(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		Pager<Product> result = categoryService.findProduct(pageNum, 16,cid,Integer.valueOf(request.getParameter("min_price")),Integer.valueOf(request.getParameter("max_price")));
		session.put("result", result);
		return "listByOneCategory";
		
	}
}
