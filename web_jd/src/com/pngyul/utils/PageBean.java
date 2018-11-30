package com.pngyul.utils;

import java.util.List;

public class PageBean {
	//��ǰҳ
	private Integer currentPage;
	//�ܼ�¼��
	private Integer totalCount;
	//ÿҳ����
	private Integer pageSize;
	//��ҳ��
	private Integer totalPage;
	//�ͻ��б�
	private List list;
	public PageBean(Integer currentPage, Integer totalCount, Integer pageSize) {
		
		this.currentPage = currentPage;
		
		this.totalCount = totalCount;
		
		this.pageSize = pageSize;
		
		//�����ǰҳ Ϊ�գ���Ĭ��Ϊ��һҳ
		if(this.currentPage == null){
			this.currentPage = 1;
		}
		//���ÿҳ��ʾ����û��ָ��,Ĭ��ÿҳ��ʾ3��
		if(this.pageSize == null){
			this.pageSize = 10;
		}
		
		//������ҳ��
		this.totalPage = (this.totalCount+this.pageSize)/this.pageSize;
		
		//�ٴ��жϵ�ǰҳ
		if(this.currentPage<1){
			//�����ǰҲС��1����ǰҳ����1
			this.currentPage = 1;
		}
		if(this.currentPage>this.totalPage){
			//�����ǰҲ������ҳ������������ҳ��
			this.currentPage = this.totalPage;
		}
	}
	
	//������ʵ����
	public int getStart() {
		return (this.currentPage-1)*this.pageSize ; 
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
	
	
}
