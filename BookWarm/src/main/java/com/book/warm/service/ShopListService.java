package com.book.warm.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.book.warm.vo.ShopListBoardVO;

@Service
public class ShopListService {

	@Inject
	SqlSessionTemplate sqlSession;
	
	//�ҷ�����
	public List<ShopListBoardVO> shoplist() throws Exception{
		System.out.println("��");
		return sqlSession.selectList("shop.shoplist");
	}
}
