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
		// �ڼ�����װ��Order�����ݸ�service��
		Order o = (Order) session.get("order");
		// �ö����Ķ�����
		String oid = CommonsUtils.getUUID();
		o.setOid(oid);
		// �µ�ʱ��
		o.setOrdertime(new Date());

		// ��һ����װOrderItem --oid
		List<OrderItem> orderItems = o.getOrderItems();
		for (int i = 0; i < orderItems.size(); i++) {
			// �������id
			OrderItem item = orderItems.get(i);
			item.setItemid(CommonsUtils.getUUID());
			// �ö����������ĸ�����
			item.setOrder(o);

			// ���ö�������µ������Ķ��������
			orderItems.set(i, item);
		}

		// order�����װ���
		// �������ݵ�service��
		os.saveOrder(o);
		session.put("order", o);

		// ҳ����ת
//		response.sendRedirect(request.getContextPath() + "/cashier.jsp");
		return "cashier";
	}

	public String packageOrder() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		// �ж��û��Ƿ��Ѿ���¼ δ��¼������벻ִ��
		User user = (User) session.get("user");
		if (user == null) {
			
			return "toLogin";
		}
		// �ж��Ƿ��Ѵ���order
		Order o = (Order) session.get("order");
		if (o == null) {
			// �]��,����һ��
			o = new Order();
		}
		// �ȷ�װһ��Order�Ĵ󲿷���Ϣ�����ݸ�order.jsp
		// 1��private String oid;//�ö����Ķ�����
		// 2��private Date ordertime;//�µ�ʱ��
		// 3��private double total;//�ö������ܽ��
		Cart cart = (Cart) session.get("cart");
		double total = cart.getTotalMon();
		o.setTotal(total);
		// 4��private int state;//����֧��״̬ 1�����Ѹ��� 0����δ����
		o.setState(0);
		// 5��private String address;//�ջ���ַ
		// 6��private String name;//�ջ���
		// 7��private String telephone;//�ջ��˵绰
		// 8��private User user;//�ö��������ĸ��û�
		o.setUser(user);
		// 9���ö������ж��ٶ�����private List<OrderItem> orderItems = new
		// ArrayList<OrderItem>();
		// ��ù��ﳵ��cartItem����Map

		Map<String, CartItem> cartItems = cart.getCartItems();
		for (Map.Entry<String, CartItem> entry : cartItems.entrySet()) {
			CartItem cartItem = entry.getValue();
			if (cartItem.isSelected()) {
				// ȡ����ѡѡ��ÿһ��������
				// �����µĶ������װ��orderItem
				OrderItem orderItem = new OrderItem();
				// 1)private String itemid;//�������id
				orderItem.setItemid(null);
				// 2)private int count;//����������Ʒ�Ĺ�������
				orderItem.setCount(cartItem.getBuyNum());
				// 3)private double subtotal;//������С��
				orderItem.setSubtotal(cartItem.getSubtotal());
				// 4)private Product product;//�������ڲ�����Ʒ
				orderItem.setProduct(cartItem.getProduct());
				// 5)private Order order;//�ö����������ĸ�����
				orderItem.setOrder(null);

				// ���ö�������ӵ������Ķ��������
				o.getOrderItems().add(orderItem);
			}
		}
		// order���������װ���
		session.put("order", o);

		// ҳ����ת
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

		// ʹ��json��ת�����߽�����򼯺�ת��json��ʽ���ַ���
		Gson gson = new Gson();
		String json = gson.toJson(o);
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().write(json);
		return null;
	}
	
	public String pay() throws Exception {
		Order o = (Order) ActionContext.getContext().getSession().get("order");
		
		//�޸Ķ���״̬
		
		os.updateOrderState(o);
		// ������ض���
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<h3>����ɹ���<span id='time' style='color:red;font-weigth:800;font-size:30px;'> 5 </span>����Զ���ת����ҳ</h3>");
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
