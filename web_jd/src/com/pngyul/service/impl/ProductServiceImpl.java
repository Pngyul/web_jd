package com.pngyul.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.pngyul.dao.ProductDao;
import com.pngyul.domain.Product;
import com.pngyul.service.ProductService;
import com.pngyul.utils.PageBean;

public class ProductServiceImpl implements ProductService {
	private ProductDao pd;

	@Override
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		// 封装一个Page Bean
		// 调用dao获得总记录数
		Integer totalCount = pd.getTotalCount(dc);

		// 创建pageBean
		PageBean pageBean = new PageBean(currentPage, totalCount, pageSize);

		// 调用dao获得客户列表
		List<Product> list = pd.getPageList(dc, pageBean.getStart(), pageBean.getPageSize());
		// 封装完毕，返回pageBean
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public Product findProductByPid(String pid) {
		
		return pd.getById(pid);
	}

	public void setPd(ProductDao pd) {
		this.pd = pd;
	}
	
	
}
