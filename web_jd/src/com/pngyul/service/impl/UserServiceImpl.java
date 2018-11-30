package com.pngyul.service.impl;

import com.pngyul.dao.UserDao;
import com.pngyul.domain.User;
import com.pngyul.service.UserService;
import com.pngyul.utils.MD5Utils;

public class UserServiceImpl implements UserService {
	private UserDao ud;

	@Override
	public User getUserByNamePassword(User u) {
		//1 根据登陆名称查询登陆用户
		User existU = ud.getByUserCode(u.getUsername());
		//2 判断用户是否存在.不存在=>抛出异常,提示用户名不存在
		if(existU==null){
			throw new RuntimeException("用户名不存在!");
		}
		//3 判断用户密码是否正确=>不正确=>抛出异常,提示密码错误
		if(!existU.getPassword().equals(u.getPassword())){
			throw new RuntimeException("密码错误!");
		}
		//4 返回查询到的用户对象
	
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
