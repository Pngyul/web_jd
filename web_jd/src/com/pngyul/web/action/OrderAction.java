package com.pngyul.web.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pngyul.domain.Cart;
import com.pngyul.domain.CartItem;
import com.pngyul.domain.Order;
import com.pngyul.domain.OrderItem;
import com.pngyul.domain.User;
import com.pngyul.service.OrderService;
import com.pngyul.utils.CommonsUtils;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	private Order order = new Order();

	private OrderService os;

	public String submitOrder() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		// 在继续封装好Order，传递给service层
		Order o = (Order) session.get("order");
		// 该订单的订单号
		String oid = CommonsUtils.getUUID();
		o.setOid(oid);
		// 下单时间
		o.setOrdertime(new Date());

		// 进一步封装OrderItem --oid
		List<OrderItem> orderItems = o.getOrderItems();
		for (int i = 0; i < orderItems.size(); i++) {
			// 订单项的id
			OrderItem item = orderItems.get(i);
			item.setItemid(CommonsUtils.getUUID());
			// 该订单项属于哪个订单
			item.setOrder(o);

			// 将该订单项更新到订单的订单项集合中
			orderItems.set(i, item);
		}

		// order对象封装完毕
		// 传递数据到service层
		os.saveOrder(o);
		session.put("order", o);

		// 页面跳转
//		response.sendRedirect(request.getContextPath() + "/cashier.jsp");
		return "cashier";
	}

	public String packageOrder() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		// 判断用户是否已经登录 未登录下面代码不执行
		User user = (User) session.get("user");
		if (user == null) {
			
			return "toLogin";
		}
		// 判断是否已存在order
		Order o = (Order) session.get("order");
		if (o == null) {
			// 沒有,创建一个
			o = new Order();
		}
		// 先封装一个Order的大部分信息，传递给order.jsp
		// 1、private String oid;//该订单的订单号
		// 2、private Date ordertime;//下单时间
		// 3、private double total;//该订单的总金额
		Cart cart = (Cart) session.get("cart");
		double total = cart.getTotalMon();
		o.setTotal(total);
		// 4、private int state;//订单支付状态 1代表已付款 0代表未付款
		o.setState(0);
		// 5、private String address;//收货地址
		// 6、private String name;//收货人
		// 7、private String telephone;//收货人电话
		// 8、private User user;//该订单属于哪个用户
		o.setUser(user);
		// 9、该订单中有多少订单项private List<OrderItem> orderItems = new
		// ArrayList<OrderItem>();
		// 获得购物车的cartItem集合Map

		Map<String, CartItem> cartItems = cart.getCartItems();
		for (Map.Entry<String, CartItem> entry : cartItems.entrySet()) {
			CartItem cartItem = entry.getValue();
			if (cartItem.isSelected()) {
				// 取出已选选择每一个购物项
				// 创建新的订单项封装到orderItem
				OrderItem orderItem = new OrderItem();
				// 1)private String itemid;//订单项的id
				orderItem.setItemid(null);
				// 2)private int count;//订单项内商品的购买数量
				orderItem.setCount(cartItem.getBuyNum());
				// 3)private double subtotal;//订单项小计
				orderItem.setSubtotal(cartItem.getSubtotal());
				// 4)private Product product;//订单项内部的商品
				orderItem.setProduct(cartItem.getProduct());
				// 5)private Order order;//该订单项属于哪个订单
				orderItem.setOrder(null);

				// 将该订单项添加到订单的订单项集合中
				o.getOrderItems().add(orderItem);
			}
		}
		// order对象初步封装完毕
		session.put("order", o);

		// 页面跳转
//		response.sendRedirect(request.getContextPath() + "/orderInfo.jsp");
		return "orderInfo";
	}
	
	public String saveConsignee() throws Exception {
		Order o = (Order) ActionContext.getContext().getSession().get("order");
		o.setName(order.getName());
		o.setAddress(order.getAddress());
		o.setTelephone(order.getTelephone());
		//ProductService service = new ProductService();
		//service.updateOrderAdrr(order);

		// 使用json的转换工具将对象或集合转成json格式的字符串
		Gson gson = new Gson();
		String json = gson.toJson(o);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}
	
	public String pay() throws Exception {
		Order o = (Order) ActionContext.getContext().getSession().get("order");
		
		//修改订单状态
		
		os.updateOrderState(o);
		// 浏览器重定向
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<h3>付款成功！<span id='time' style='color:red;font-weigth:800;font-size:30px;'> 5 </span>秒后自动跳转到首页</h3>");
		response.getWriter().write("<script>window.onload=function(){"
				+ "var spanTime = document.getElementById('time');var max = 5;var timer = setInterval(function(){"
				+ "max--;spanTime.innerHTML=max;if(max<=0){clearInterval(timer);}}, 1000);}</script>");
		response.setHeader("REFRESH", "5;url=index.jsp"); 
		return null;
	}
	
	public Order getModel() {
		return order;
	}

	public void setOs(OrderService os) {
		this.os = os;
	}

}
