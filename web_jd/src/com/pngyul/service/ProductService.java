package com.pngyul.service;

import org.hibernate.criterion.DetachedCriteria;
import com.pngyul.domain.Product;
import com.pngyul.utils.PageBean;

public interface ProductService {

	PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	Product findProductByPid(String pid);




}
