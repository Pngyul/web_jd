package com.pngyul.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.pngyul.dao.UserDao;
import com.pngyul.domain.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public User getByUserCode(String username) {
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("username", username));
		List<User> list = (List<User>) getHibernateTemplate().findByCriteria(dc);

		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Integer findUsername(String username) {
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("username", username));
		dc.setProjection(Projections.rowCount());
		List<Integer> list = (List<Integer>) getHibernateTemplate().findByCriteria(dc);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return -1;
	}
}
