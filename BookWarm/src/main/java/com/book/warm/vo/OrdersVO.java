package com.book.warm.vo;

import java.sql.Timestamp;

public class OrdersVO {
	private String orders_no;
	private String user_id;
	private String orders_payment;
	private int orders_total;
	private String refund_account;
	private String refund_bank;
	private Timestamp orders_date;
	private Timestamp orders_pay_date;
	private String coupon_no;
	private String post_no;
	private int orders_pay_total;
	private int delivery_fee;
	private int discounted_point;
	
	
	// constructor
	public OrdersVO(String orders_no, String user_id, String orders_payment, int orders_total, String refund_account,
			String refund_bank, Timestamp orders_date, Timestamp orders_pay_date, String coupon_no, String post_no,
			int orders_pay_total, int delivery_fee, int discounted_point) {
		super();
		this.orders_no = orders_no;
		this.user_id = user_id;
		this.orders_payment = orders_payment;
		this.orders_total = orders_total;
		this.refund_account = refund_account;
		this.refund_bank = refund_bank;
		this.orders_date = orders_date;
		this.orders_pay_date = orders_pay_date;
		this.coupon_no = coupon_no;
		this.post_no = post_no;
		this.orders_pay_total = orders_pay_total;
		this.delivery_fee = delivery_fee;
		this.discounted_point = discounted_point;
	}
	
	public OrdersVO() {
		super();
	}
	
	
	// getter, setter
	public String getOrders_no() {
		return orders_no;
	}

	public void setOrders_no(String orders_no) {
		this.orders_no = orders_no;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getOrders_payment() {
		return orders_payment;
	}

	public void setOrders_payment(String orders_payment) {
		this.orders_payment = orders_payment;
	}

	public int getOrders_total() {
		return orders_total;
	}

	public void setOrders_total(int orders_total) {
		this.orders_total = orders_total;
	}

	public String getRefund_account() {
		return refund_account;
	}

	public void setRefund_account(String refund_account) {
		this.refund_account = refund_account;
	}

	public String getRefund_bank() {
		return refund_bank;
	}

	public void setRefund_bank(String refund_bank) {
		this.refund_bank = refund_bank;
	}

	public Timestamp getOrders_date() {
		return orders_date;
	}

	public void setOrders_date(Timestamp orders_date) {
		this.orders_date = orders_date;
	}

	public Timestamp getOrders_pay_date() {
		return orders_pay_date;
	}

	public void setOrders_pay_date(Timestamp orders_pay_date) {
		this.orders_pay_date = orders_pay_date;
	}

	public String getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}

	public String getPost_no() {
		return post_no;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	
	public int getOrders_pay_total() {
		return orders_pay_total;
	}

	public void setOrders_pay_total(int orders_pay_total) {
		this.orders_pay_total = orders_pay_total;
	}

	public int getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	public int getDiscounted_point() {
		return discounted_point;
	}

	public void setDiscounted_point(int discounted_point) {
		this.discounted_point = discounted_point;
	}
	
}
