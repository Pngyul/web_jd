package com.pngyul.service;


import com.pngyul.domain.User;

public interface UserService {
    //��½
	User getUserByNamePassword(User user);
	//ע��
	void save(User user);
	//����Ƿ���ڸ��û���
	boolean findUsername(String username);
	
}
