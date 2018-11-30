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
		//��װ���߲�ѯ����
		DetachedCriteria  dc = DetachedCriteria.forClass(Product.class);
		//����service��÷�ҳ���ݣ�PageBean��
		PageBean pb = ps.getPageBean(dc,currentPage,pageSize);
		//��PageBean����request��
		ActionContext.getContext().put("pageBean", pb);
		return "list";
	}

	public String addProductToCart() throws Exception {

		// ���Ҫ�ŵ����ﳵ����Ʒ��product����
		Product p = ps.findProductByPid(product.getPid());
		int buyNum = 1;
		double subtotal = buyNum * p.getShop_price();

		// ��װCartItem
		CartItem item = new CartItem();
		item.setProduct(p);
		item.setBuyNum(buyNum);
		item.setSubtotal(subtotal);

		// ��ù��ﳵ--�ж��Ƿ���session���Ѿ�����Session
		Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
		if (cart == null) {
			cart = new Cart();
		}

		// ��������ŵ�����--key��Pid
		// ���жϹ��ﳵ���Ƿ��ѽ������˹������� ----- �ж�key�Ƿ��Ѿ�����
		// ������ﳵ���Ѿ����ڸ���Ʒ----���������������ԭ�е�����������Ӳ���
		Map<String, CartItem> cartItems = cart.getCartItems();
		if (cartItems.containsKey(product.getPid())) {
			// ��������и���Ʒ
			CartItem cartItem = cartItems.get(product.getPid());
			int newBuyNum = cartItem.getBuyNum() + buyNum;
			cartItem.setBuyNum(newBuyNum);
			cartItem.setSubtotal(newBuyNum * p.getShop_price());
			cartItems.put(product.getPid(), cartItem);
			cart.setCartItems(cartItems);

		} else {
			// �������û�и���Ʒ
			item.setSelected(false);
			cart.getCartItems().put(p.getPid(), item);
		}

		// ��cart������session��
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
