package com.book.warm.vo;

public class Criteria {
	
	private int pageNum;
	private int amount;
	
	//������
	public Criteria() {
		//1������ 10�� ����
		this(1,12);
	}
	
	
	
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	//���ͼ���
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
