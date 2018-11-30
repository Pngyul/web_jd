package com.pngyul.service;


import com.pngyul.domain.User;

public interface UserService {
    //登陆
	User getUserByNamePassword(User user);
	//注册
	void save(User user);
	//检测是否存在该用户名
	boolean findUsername(String username);
	
}
