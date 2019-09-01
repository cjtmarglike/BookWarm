package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.book.warm.mapper.ShopListMapper;
import com.book.warm.vo.ShopListBoardVO;

@Service
public class ShopListService {

	@Inject
	ShopListMapper shoplistmapper;
	
	//����Ʈ ������ �ҷ�����
	public List<ShopListBoardVO> shoplist() throws Exception{
		System.out.println("ShopList ����Ʈ������ �ҷ�����");

		return shoplistmapper.shoplist();
	}
	
	//�����(��������)������ �ҷ�����
	public List<ShopListBoardVO> shoplist2() throws Exception{
		System.out.println("shoplist2 ��������� �ҷ�����");
		return shoplistmapper.shoplist2();
	}
	
	//å ������ �ҷ�����
	public ShopListBoardVO bookdetail(String isbn) throws Exception{
		System.out.println("å ������ ��������");
		return shoplistmapper.bookdetail(isbn);
	}
}
