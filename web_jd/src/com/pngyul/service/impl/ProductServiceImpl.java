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
		// ��װһ��Page Bean
		// ����dao����ܼ�¼��
		Integer totalCount = pd.getTotalCount(dc);

		// ����pageBean
		PageBean pageBean = new PageBean(currentPage, totalCount, pageSize);

		// ����dao��ÿͻ��б�
		List<Product> list = pd.getPageList(dc, pageBean.getStart(), pageBean.getPageSize());
		// ��װ��ϣ�����pageBean
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
