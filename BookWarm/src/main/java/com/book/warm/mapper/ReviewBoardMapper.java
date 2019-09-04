package com.book.warm.mapper;

import java.util.List;

import com.book.warm.vo.BookThumbnailVO;
import com.book.warm.vo.BookVO;
import com.book.warm.vo.Criteria;
import com.book.warm.vo.ReviewBoardVO;
import com.book.warm.vo.ReviewBoardVO2;

public interface ReviewBoardMapper {
	
	public List<ReviewBoardVO2> selectBoardList(String user_id);
	
	public List<ReviewBoardVO> getListPerBook(String isbn, String user_id);
	
	public List<ReviewBoardVO> getListPerBookWithPaging(String isbn, String user_id, Criteria cri);

	public BookThumbnailVO showBookThumbnail(String isbn);

	public ReviewBoardVO selectedReview(int review_no, String user_id);

	public BookVO bookInfo(String isbn);

	public int registerReview(ReviewBoardVO rbVO);

	public int deleteReview(ReviewBoardVO rbVO);

	public int modifyReview(ReviewBoardVO rbVO);
	
	public int getTotalCount(Criteria cri, String isbn, String user_id);
	
}
