package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.ShopListBoardVO;

public interface ShopListMapper {
	
	////����Ʈ ������ �ҷ�����
	public List<ShopListBoardVO> shoplist();
	
	//�����(��������)������ �ҷ�����
	public List<ShopListBoardVO> shoplist2();
	
	//å �������� �������� �̵�
	public ShopListBoardVO bookdetail(String isbn);
	
}
