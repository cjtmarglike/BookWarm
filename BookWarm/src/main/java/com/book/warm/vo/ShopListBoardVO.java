package com.book.warm.vo;

//å����, �̹���, ����, ����, ���ǻ�, ���� ������ VO
//�����ؼ� ������� ������ �ϴ� class
public class ShopListBoardVO {
	
	private int book_list;
	private String book_img;
	private String book_title;
	private String writer_name;
	private String publisher_name;
	private int book_price_for_sale;
	
	//���� ����
	public int getBook_list() {
		return book_list;
	}
	public void setBook_list(int book_list) {
		this.book_list = book_list;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public int getBook_price_for_sale() {
		return book_price_for_sale;
	}
	public void setBook_price_for_sale(int book_price_for_sale) {
		this.book_price_for_sale = book_price_for_sale;
	}
	
	
	
}
