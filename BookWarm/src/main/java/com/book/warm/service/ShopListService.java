package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.vo.BookListVO;
import com.book.warm.vo.BookVO;

@Service
public class ShopListService {

	@Inject
	ShopListMapper shoplistmapper;
	
	//제목순으로 불러오기
	public List<BookListVO> shoptitlelist() throws Exception{
		return shoplistmapper.shoptitlelist();
	}
	
	//가격(저렴한순)으로 불러오기
	public List<BookListVO> bookpricelist() throws Exception{
		return shoplistmapper.bookpricelist();
	}
	
	
	//isbn && writer_name으로 책 상세정보 불러오기
	public List<BookListVO> bookdetail(String isbn) throws Exception{
		return  shoplistmapper.bookdetail(isbn);
	}
	
	//writer_name이 같은 다른 책들 불러오기
	public List<BookListVO> bookwritername(String author) throws Exception{
		return shoplistmapper.bookwritername(author);
	}
	
	/*
	 * 
	 * public int gettotalcount(Criteria criteria) { return
	 * shoplistmapper.gettotalcount(criteria); }
	 */
	
}
