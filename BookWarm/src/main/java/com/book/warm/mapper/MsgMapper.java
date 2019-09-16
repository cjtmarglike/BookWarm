package com.book.warm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.book.warm.page.Criteria;
import com.book.warm.vo.MsgTableVO;

public interface MsgMapper {
	//�����ҷ�����
	public List<MsgTableVO> msglist();

	//�����ۼ�;
	public int msginsert(MsgTableVO msgvo);
	
	//������ȸ(�ʿ����)
	public MsgTableVO msgread(int msg_no);
	
	//��������
	public int msgdelete(int msg_no);
	
	//����¡ ó��
	public List<MsgTableVO> msgpaging(
			@Param("cri") Criteria cri,
			@Param("msg_no") int msg_no);
	
}
