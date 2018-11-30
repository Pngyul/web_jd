package com.pngyul.web.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pngyul.domain.Cart;
import com.pngyul.domain.CartItem;
import com.pngyul.domain.Product;
import com.pngyul.service.CartItemService;

public class CartItemAction extends ActionSupport implements ModelDriven<CartItem> {

	private CartItem cartItem = new CartItem();

	private CartItemService cis;

	public String selectProductToOrder() throws Exception {
		// 获得该商品的购买数量
		Integer buyNum = cartItem.getBuyNum();
		// 获得product对象
		Product product = cis.findProductByPid(cartItem.getProduct().getPid());
		// 计算小计
		double subtotal = product.getShop_price() * buyNum;

		// 获得cart---判断是否在session中已经存在cart
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart == null) {
			cart = new Cart();
		}

		String flagStr = ServletActionContext.getRequest().getParameter("flag");
		if (flagStr != null) {
			if ("1".equals(flagStr)) {
				cart.setTotalMon(0);
				cart.setTotalNum(0);
			}
		}
		Map<String, CartItem> cartItems = cart.getCartItems();
		CartItem item = cartItems.get(cartItem.getProduct().getPid());
		boolean isSelectBox = cartItem.isSelected();
		if (isSelectBox == true) {
			cart.setTotalNum(cart.getTotalNum() + buyNum);
			cart.setTotalMon(cart.getTotalMon() + subtotal);
			item.setSelected(true);
		} else {
			cart.setTotalNum(cart.getTotalNum() - buyNum);
			cart.setTotalMon(cart.getTotalMon() - subtotal);
			item.setSelected(false);
		}

		cartItems.put(cartItem.getProduct().getPid(), item);
		cart.setCartItems(cartItems);
		// 使用json的转换工具将对象或集合转成json格式的字符串
		Gson gson = new Gson();
		String json = gson.toJson(cart);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}

	public String freshSelectedProductCart() throws Exception {
		String pid = cartItem.getProduct().getPid();
		// 获得该商品的购买数量
		Integer buyNum = cartItem.getBuyNum();
		// 获得product对象
		Product product = cis.findProductByPid(pid);
		// 计算小计
		double subtotal = product.getShop_price() * buyNum;

		// 获得cart---判断是否在session中已经存在cart
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart == null) {
			cart = new Cart();
		}
		// 判断是否是第一个已选择，如果是，则重新计算总额0总数量0
		String firstStr = ServletActionContext.getRequest().getParameter("first");
		int first = Integer.parseInt(firstStr);
		if (first == 0) {
			cart.setTotalMon(0);
			cart.setTotalNum(0);
		}
		// 计算总数量、总金额
		cart.setTotalNum(cart.getTotalNum() + buyNum);
		cart.setTotalMon(cart.getTotalMon() + subtotal);

		// 使用json的转换工具将对象或集合转成json格式的字符串
		Gson gson = new Gson();
		String json = gson.toJson(cart);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}

	public String delectProduct() throws Exception {
		// 获得要删除的item的pid
		// 删除session中的购物车中的购物项集合中的item
		Map<String, Object> session = ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		if (cart != null) {
			Map<String, CartItem> cartItems = cart.getCartItems();
			// 删除
			cartItems.remove(cartItem.getProduct().getPid());
			cart.setTotalNum(0);
			cart.setTotalMon(0);
			cart.setCartItems(cartItems);
		}

		session.put("cart", cart);

		// 跳转回cart.jsp
//		response.sendRedirect(request.getContextPath() + "/cart.jsp");
		return "cart";
	}

	public CartItem getModel() {
		return cartItem;
	}

	public void setCis(CartItemService cis) {
		this.cis = cis;
	}

}
