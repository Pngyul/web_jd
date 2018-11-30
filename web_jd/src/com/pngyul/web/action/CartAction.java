package com.pngyul.web.action;

import java.util.Map;
import java.util.Set;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pngyul.domain.Cart;
import com.pngyul.domain.CartItem;

public class CartAction extends ActionSupport{


	public String allNotSelect() throws Exception {
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart != null) {
			Map<String, CartItem> cartItems = cart.getCartItems();
			Set<Map.Entry<String, CartItem>> entrySet = cartItems.entrySet();
			for (Map.Entry<String, CartItem> entry : entrySet) {
				CartItem item = entry.getValue();
				item.setSelected(false);
			}
			cart.setCartItems(cartItems);
			cart.setTotalMon(0);
			cart.setTotalNum(0);
		}
		// 使用json的转换工具将对象或集合转成json格式的字符串
		Gson gson = new Gson();
		String json = gson.toJson(cart);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}
	
	public String clearCart() throws Exception {
		ActionContext.getContext().getSession().remove("cart");
		//跳转回cart.jsp
		
		return "cart";
		/*response.sendRedirect(request.getContextPath()+"/cart.jsp");*/
	}
}


