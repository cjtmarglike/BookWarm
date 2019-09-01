package com.book.warm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.warm.service.ShopListService;

@Controller
public class ShopListController {
	
	@Inject
	ShopListService shopslistservice;
	
	//å ��� �ҷ�����
	@RequestMapping(value = "/shop_list", method = RequestMethod.GET)
	public String shop_list(Model model) throws Exception {
		
		System.out.println("å ����Ʈ");
		model.addAttribute("list", shopslistservice.shoplist());
		model.addAttribute("list_title", shopslistservice.shoplist2());
		return "shop_list";
	}
	
	//å �������� �̵�
	@RequestMapping(value = "/shop_product", method = RequestMethod.GET)
	public String shop_product(HttpServletRequest req, Model model) throws Exception {
		System.out.println("å ��������");
		String isbn = req.getParameter("isbn");
		model.addAttribute("shop_product", shopslistservice.bookdetail(isbn));
		return "shop_product";
	}
	
}
