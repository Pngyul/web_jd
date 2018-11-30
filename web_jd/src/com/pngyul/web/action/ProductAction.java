package com.pngyul.web.action;

import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pngyul.domain.Cart;
import com.pngyul.domain.CartItem;
import com.pngyul.domain.Product;
import com.pngyul.service.ProductService;
import com.pngyul.utils.PageBean;

public class ProductAction extends ActionSupport implements ModelDriven<Product> {

	private Product product = new Product();

	private ProductService ps;
	
	private Integer currentPage;
	private Integer pageSize;
	
	public String productList() throws Exception {
		//封装离线查询对象
		DetachedCriteria  dc = DetachedCriteria.forClass(Product.class);
		//调用service获得分页数据（PageBean）
		PageBean pb = ps.getPageBean(dc,currentPage,pageSize);
		//将PageBean存入request域
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	public String addProductToCart() throws Exception {

		// 获得要放到购物车的商品的product对象
		Product p = ps.findProductByPid(product.getPid());
		int buyNum = 1;
		double subtotal = buyNum * p.getShop_price();

		// 封装CartItem
		CartItem item = new CartItem();
		item.setProduct(p);
		item.setBuyNum(buyNum);
		item.setSubtotal(subtotal);

		// 获得购物车--判断是否在session中已经存在Session
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart == null) {
			cart = new Cart();
		}

		// 将购物项放到车中--key是Pid
		// 先判断购物车中是否已将包含此购物项了 ----- 判断key是否已经存在
		// 如果购物车中已经存在该商品----将现在买的数量与原有的数量进行相加操作
		Map<String, CartItem> cartItems = cart.getCartItems();
		if (cartItems.containsKey(product.getPid())) {
			// 如果车中有该商品
			CartItem cartItem = cartItems.get(product.getPid());
			int newBuyNum = cartItem.getBuyNum() + buyNum;
			cartItem.setBuyNum(newBuyNum);
			cartItem.setSubtotal(newBuyNum * p.getShop_price());
			cartItems.put(product.getPid(), cartItem);
			cart.setCartItems(cartItems);

		} else {
			// 如果车中没有该商品
			item.setSelected(false);
			cart.getCartItems().put(p.getPid(), item);
		}

		// 将cart保存在session中
		 ActionContext.getContext().getSession().put("cart", cart);

		/*String currentPage = request.getParameter("currentPage");
		response.sendRedirect(request.getContextPath() + "/productList?currentPage=" + currentPage);*/
		return "toList";
	}

	public Product getModel() {
		return product;
	}

	public void setPs(ProductService ps) {
		this.ps = ps;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
