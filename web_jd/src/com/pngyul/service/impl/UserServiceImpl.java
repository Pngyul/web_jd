package com.pngyul.service.impl;

import com.pngyul.dao.UserDao;
import com.pngyul.domain.User;
import com.pngyul.service.UserService;
import com.pngyul.utils.MD5Utils;

public class UserServiceImpl implements UserService {
	private UserDao ud;

	@Override
	public User getUserByNamePassword(User u) {
		//1 ���ݵ�½���Ʋ�ѯ��½�û�
		User existU = ud.getByUserCode(u.getUsername());
		//2 �ж��û��Ƿ����.������=>�׳��쳣,��ʾ�û���������
		if(existU==null){
			throw new RuntimeException("�û���������!");
		}
		//3 �ж��û������Ƿ���ȷ=>����ȷ=>�׳��쳣,��ʾ�������
		if(!existU.getPassword().equals(u.getPassword())){
			throw new RuntimeException("�������!");
		}
		//4 ���ز�ѯ�����û�����
	
	return existU;
}

	@Override
	public void save(User user) {
		user.setPassword(user.getPassword());
		ud.save(user);
	}

	@Override
	public boolean findUsername(String username) {
		
		Integer isExist = ud.findUsername(username);

		return isExist > 0 ? true : false;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

}
