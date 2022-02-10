package com.spring.cjs2108_jdg.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.BooksVO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryVO;
import com.spring.cjs2108_jdg.vo.MemberVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;
import com.spring.cjs2108_jdg.vo.ReviewLikeVO;

public interface AdminDAO {

	public void setProductInput(@Param("vo") BooksVO vo);

	public int totRecCnt(@Param("bookType") String bookType, @Param("bookName") String bookName);

	public List<BooksVO> getProductList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("bookType") String bookType, @Param("bookName") String bookName);

	public void setProductDelete(@Param("idx") int idx);

	public BooksVO setIdxCheck(@Param("bookIdx") int bookIdx);

	public void setProductUpdate(@Param("vo") BooksVO vo);

	public int totRecCnt2(@Param("level") int level, @Param("mid") String mid);

	public ArrayList<MemberVO> getMemberList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("level") int level, @Param("mid") String mid);

	public void setLevelUpdate(@Param("idx") int idx, @Param("level") int level);

	public List<BooksVO> getProductList(@Param("readNum")int readNum);

	public List<BooksVO> getBestList(@Param("readNum") int readNum);

	public List<BooksVO> getRecommendList(@Param("interest") String interest);

	public List<BooksVO> getRelevantList(@Param("bookType") String bookType, @Param("bookIdx") int bookIdx);

	public String maxLevelOrder(@Param("bookIdx") int bookIdx);

	public void setReviewInsert(@Param("bvo") BookReviewVO bvo);

	public List<BookReviewVO> getBookReview(@Param("bookIdx") int bookIdx, @Param("nickName") String nickName);

	public int getReviewCnt(@Param("bookIdx") int bookIdx);

	public void ReviewDelete(@Param("reviewIdx") int reviewIdx);

	public void addGood(@Param("reviewIdx") int reviewIdx, @Param("flag") int flag);

	public void setReplyDelete(@Param("idx")int idx);

	public int totReviewCnt(@Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public List<BookReviewVO> getBookReply(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public int totEventCnt(@Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public List<EventReplyVO> getEventReply(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public List<BooksVO> getNewList();

	public MyBookVO myBookSearch(@Param("bookName") String bookName, @Param("nickName") String nickName);

	public void myBookInput(@Param("vo") MyBookVO vo);

	public int btotRecCnt(@Param("part") String part, @Param("nickName") String nickName);

	public List<BoardVO> getBoardList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part, @Param("nickName") String nickName);

	public void setBoardDelete(@Param("idx") int idx);

	public int totBoardCnt(@Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public List<BoardReplyVO> getBoardReply(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("nickName") String nickName);

	public int getMybookCount(@Param("bookIdx") int bookIdx);

	public List<MyBookVO> getAddList(@Param("bookIdx") int bookIdx);

	public List<BooksVO> getBookType();

	public List<MyBookVO> getPopularType();

	public List<MyBookVO> getReadRank();

	public int itotRecCnt(@Param("part") String part, @Param("nickName") String nickName);
	
	public List<InquiryVO> getInquiryList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part, @Param("nickName") String nickName);

	public void setInquiryDelete(@Param("idx") int idx);

	public String maxLevelOrder2(@Param("inquiryIdx") int inquiryIdx);

	public void InquiryReplyInsert(@Param("rvo") InquiryReplyVO rvo);

	public InquiryVO getInquiryContent(@Param("idx") int idx);

	public void InquiryUpdate(@Param("inquiryIdx")int inquiryIdx);

	public ReviewLikeVO reviewSearch(@Param("vo") ReviewLikeVO vo);

	public void likeInsert(@Param("vo") ReviewLikeVO vo);

	public void likeNumUpdate(@Param("vo") ReviewLikeVO vo);

	public void likeUpdate(@Param("vo") ReviewLikeVO vo);

	public void memberOut(@Param("idx") int idx);

	public void setBoardReplyDelete(@Param("idx") int idx);

	public void setEventReplyDelete(@Param("idx") int idx);









}
