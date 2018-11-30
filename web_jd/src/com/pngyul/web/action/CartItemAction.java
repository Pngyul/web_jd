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
		// ��ø���Ʒ�Ĺ�������
		Integer buyNum = cartItem.getBuyNum();
		// ���product����
		Product product = cis.findProductByPid(cartItem.getProduct().getPid());
		// ����С��
		double subtotal = product.getShop_price() * buyNum;

		// ���cart---�ж��Ƿ���session���Ѿ�����cart
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
		// ʹ��json��ת�����߽�����򼯺�ת��json��ʽ���ַ���
		Gson gson = new Gson();
		String json = gson.toJson(cart);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}

	public String freshSelectedProductCart() throws Exception {
		String pid = cartItem.getProduct().getPid();
		// ��ø���Ʒ�Ĺ�������
		Integer buyNum = cartItem.getBuyNum();
		// ���product����
		Product product = cis.findProductByPid(pid);
		// ����С��
		double subtotal = product.getShop_price() * buyNum;

		// ���cart---�ж��Ƿ���session���Ѿ�����cart
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart == null) {
			cart = new Cart();
		}
		// �ж��Ƿ��ǵ�һ����ѡ������ǣ������¼����ܶ�0������0
		String firstStr = ServletActionContext.getRequest().getParameter("first");
		int first = Integer.parseInt(firstStr);
		if (first == 0) {
			cart.setTotalMon(0);
			cart.setTotalNum(0);
		}
		// �������������ܽ��
		cart.setTotalNum(cart.getTotalNum() + buyNum);
		cart.setTotalMon(cart.getTotalMon() + subtotal);

		// ʹ��json��ת�����߽�����򼯺�ת��json��ʽ���ַ���
		Gson gson = new Gson();
		String json = gson.toJson(cart);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}

	public String delectProduct() throws Exception {
		// ���Ҫɾ����item��pid
		// ɾ��session�еĹ��ﳵ�еĹ�������е�item
		Map<String, Object> session = ActionContext.getContext().getSession();
		Cart cart = (Cart) session.get("cart");
		if (cart != null) {
			Map<String, CartItem> cartItems = cart.getCartItems();
			// ɾ��
			cartItems.remove(cartItem.getProduct().getPid());
			cart.setTotalNum(0);
			cart.setTotalMon(0);
			cart.setCartItems(cartItems);
		}

		session.put("cart", cart);

		// ��ת��cart.jsp
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
