package com.book.warm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.service.ShopBoardService;
import com.book.warm.vo.CartVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Inject
	ShopBoardService service;
	
	@RequestMapping(path="/cart")
	public String cart(HttpServletRequest req, Model model) {
		System.out.println("cart()");
		// url에서 user_id를 받아온다.
		String user_id = req.getParameter("user_id");
		String isbn = req.getParameter("isbn");
		String pageWithLogin = req.getParameter("pageWithLogin");
		
		
		// 삭제하려는 cart_no가 넘어온 경우 : 삭제 -> 새로 뿌려주기
		if(isbn != null) 
			service.removeCart(user_id, isbn);
		
		// 로그인을 통해서 들어온 url에 한해서만 장바구니 페이지 보여주기
		if(pageWithLogin.equals("true")) {
			List<CartVO> list = service.cartList(user_id);
			model.addAttribute("list", list);
		}
		return "/shop-cart";
	}
	
	@RequestMapping("/cntUp")
	public String cntUp(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"))+1;
		String cart_no = req.getParameter("cart_no");
		String user_id = req.getParameter("user_id");
		
		service.updateCnt(cart_cnt, cart_no);
		
		return "redirect:cart?user_id="+user_id;
	}
	
	@RequestMapping("/cntDown")
	public String cntDown(HttpServletRequest req, Model model) {
		int cart_cnt = Integer.parseInt(req.getParameter("cart_cnt"));
		String user_id = req.getParameter("user_id");
		
		// 수량이 0 이상(1,2,3,...)일 경우에만 줄일 수 있다.
		if(cart_cnt>0) {
			cart_cnt -= 1;
			String cart_no = req.getParameter("cart_no");
			service.updateCnt(cart_cnt, cart_no);
		}
		
		return "redirect:cart?user_id="+user_id;
	}
	
	@RequestMapping("/charge")
	public String charge(HttpServletRequest req, Model model) {
		String subTotal = req.getParameter("subTotal");
		String delivery = req.getParameter("delivery");
		String cart_no[] = req.getParameterValues("cart_no");
		
		List<CartVO> list = new ArrayList<CartVO>();
		CartVO cartVO;
		
		for(int i=0; i<cart_no.length; i++) {
			// 선택한 카트에 맞는 정보 가져오기.
			cartVO = service.getCartOne(cart_no[i]);
			// list에 붙인다.
			list.add(cartVO);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("subTotal", subTotal);
		model.addAttribute("delivery", delivery);
		
		return "/shop-charge";
	}
	
	
}
