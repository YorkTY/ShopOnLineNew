package cn.it.shop.util;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;

/*
 * 设置任务：run方法中用来加载首页商品信息数据
 */
@Component("productTimerTask")
public class ProdoctTimerTask extends TimerTask {

	@Resource
	private ProductService productService = null;
	@Resource
	private CategoryService categoryService = null;

	private ServletContext application = null;

	public void setApplication(ServletContext application) {
		this.application = application;
	}

	@Override
	public void run() {
		System.out.println("----run----");
		System.out.println("Category:" + categoryService);
		List<List<Product>> bigList = new ArrayList<List<Product>>();
		// 首页食物显示
		List<List<Product>> bigList1 = new ArrayList<List<Product>>();
		List<Category> category1 = categoryService.getCategoryId(1);
		bigList1.add(productService.queryByCid(category1.get(0).getId(), 3));
		application.setAttribute("bigList1", bigList1);
		System.out.println("bigList1:!!!!+++++++++" + bigList1);
		
		// 首页饮料显示
		List<List<Product>> bigList2 = new ArrayList<List<Product>>();
		List<Category> category2 = categoryService.getCategoryId(2);
		bigList2.add(productService.queryByCid(category2.get(0).getId(), 4));
		application.setAttribute("bigList2", bigList2);
		System.out.println("bigList2:!!!!+++++++++" + bigList2);
		
		// 首页水果显示
		List<List<Product>> bigList3 = new ArrayList<List<Product>>();
		List<Category> category3 = categoryService.getCategoryId(3);
		bigList3.add(productService.queryByCid(category3.get(0).getId(), 3));
		application.setAttribute("bigList3", bigList3);
		System.out.println("bigList3:!!!!+++++++++" + bigList3);
		
		// 首页饰品1显示
		List<List<Product>> bigList4 = new ArrayList<List<Product>>();
		List<Category> category4 = categoryService.getCategoryId(4);
		bigList4.add(productService.queryByCid(category4.get(0).getId(), 3));
		application.setAttribute("bigList4", bigList4);
		System.out.println("bigList4:!!!!+++++++++" + bigList4);
		
		// 首页饰品2显示
		List<List<Product>> bigList5 = new ArrayList<List<Product>>();
		List<Category> category5 = categoryService.getCategoryId(5);
		bigList5.add(productService.queryByCid(category5.get(0).getId(), 4));
		application.setAttribute("bigList5", bigList5);
		System.out.println("bigList5:!!!!+++++++++" + bigList5);
		
		// 首页饮料显示
		List<List<Product>> bigList6 = new ArrayList<List<Product>>();
		List<Category> category6 = categoryService.getCategoryId(6);
		bigList6.add(productService.queryByCid(category6.get(0).getId(), 3));
		application.setAttribute("bigList6", bigList6);
		System.out.println("bigList6:!!!!+++++++++" + bigList6);
		
		// 查询出热点类别
		for (Category category : categoryService.queryByHot(true)) {
			// 根据热点类别id获取推荐商品信息
			System.out.println("Category:!!!!+++++++++" + category);
			bigList.add(productService.queryByCid(category.getId(), 4));

		}
		// 把查询的bigList交给application内置对象
		application.setAttribute("bigList", bigList);
		System.out.println("Category:----------------" + bigList);
	}

}
