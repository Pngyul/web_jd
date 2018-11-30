package com.pngyul.dao;

import com.pngyul.domain.User;

public interface UserDao extends BaseDao<User> {


	User getByUserCode(String username);

	Integer findUsername(String username);


}
