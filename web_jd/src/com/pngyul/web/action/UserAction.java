package com.pngyul.web.action;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pngyul.domain.User;
import com.pngyul.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
	private String autoLogin;

	private UserService us;

	public String login() throws Exception {
		// 1.����serviceִ�е�¼����

		User u = us.getUserByNamePassword(user);

/*		// �ж��û��Ƿ�ѡ�Զ���¼
		if (autoLogin != null) {

			// �����Ľ��б���
			String username_code = URLEncoder.encode(user.getUsername(), "UTF-8");
			// %AE4%kfj

			Cookie cookie_username = new Cookie("cookie_username", username_code);
			Cookie cookie_password = new Cookie("cookie_password", user.getPassword());
			// ����cookie�ĳ־û�ʱ��
			cookie_username.setMaxAge(60 * 60 * 1000);
			cookie_password.setMaxAge(60 * 60 * 1000);
			// ����cookie��Я��·��
			cookie_username.setPath(ServletActionContext.getRequest().getContextPath());
			cookie_password.setPath(ServletActionContext.getRequest().getContextPath());
			// ����cookie
			ServletActionContext.getResponse().addCookie(cookie_username);
			ServletActionContext.getResponse().addCookie(cookie_password);
		}*/

		// ����¼���û���user����浽session��
		ActionContext.getContext().getSession().put("user", user);

		// �ض���toHome
		return "toHome";

	}

	public String regist() throws Exception {
		us.save(user);
		// �ض���loginҳ��
		return "toLogin";
	}

	public String CheckUsername() throws Exception {

		boolean isExist = false;
		isExist = us.findUsername(user.getUsername());
		ServletActionContext.getResponse().getWriter().write("{\"isExist\":" + isExist + "}");
		return null;
	}

	public User getModel() {
		return user;
	}

	public void setUs(UserService us) {
		this.us = us;
	}

	public String getAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}

}
