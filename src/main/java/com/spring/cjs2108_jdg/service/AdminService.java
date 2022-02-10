package com.spring.cjs2108_jdg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs2108_jdg.vo.BoardLikeVO;
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

public interface AdminService {

	public void setProductInput(MultipartFile file, BooksVO vo);
	
	public void imgCheck(String bookContent);

	public int totRecCnt(String bookType, String bookName);

	public List<BooksVO> getProductList(int startIndexNo, int pageSize, String bookType, String bookName);

	public void setProductDelete(int idx);

	public BooksVO setIdxCheck(int bookIdx);

	public void imgDelete(String bookContent);

	public void setProductUpdate(MultipartFile file, BooksVO vo);

	public void imgCheckUpdate(String bookContent);

	public int totRecCnt2(int level, String mid);

	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int levelm, String mid);

	public void setLevelUpdate(int idx, int level);

	public List<BooksVO> getBestList(int readNum);

	public List<BooksVO> getRecommendList(String interest);

	public List<BooksVO> getRelevantList(String bookType, int bookIdx);

	public void setReviewInsert(BookReviewVO bvo);

	public List<BookReviewVO> getBookReview(int bookIdx, String nickName);

	public int getReviewCnt(int bookIdx);

	public void ReviewDelete(int reviewIdx);

	public void addGood(int reviewIdx, int flag);

	public void setReplyDelete(int parseInt);

	public int totReviewCnt(int pageSize, String nickName);

	public List<BookReviewVO> getBookReply(int startIndexNo, int pageSize, String nickName);

	public int totEventCnt(int pageSize, String nickName);

	public List<EventReplyVO> getEventReply(int startIndexNo, int pageSize, String nickName);

	public List<BooksVO> getNewList();

	public MyBookVO myBookSearch(String bookName, String nickName);

	public void myBookInput(MyBookVO vo);

	public int btotRecCnt(String part, String nickName);

	public List<BoardVO> getBoardList(int startIndexNo, int pageSize, String part, String nickName);

	public void setBoardDelete(int parseInt);

	public int totBoardCnt(int pageSize, String nickName);

	public List<BoardReplyVO> getBoardReply(int startIndexNo, int pageSize, String nickName);

	public int getMybookCount(int bookIdx);

	public List<MyBookVO> getAddList(int bookIdx);

	public List<BooksVO> getBookType();

	public List<MyBookVO> getPopularType();

	public List<MyBookVO> getReadRank();

	public int itotRecCnt(String part, String nickName);
	
	public List<InquiryVO> getInquiryList(int startIndexNo, int pageSize, String part, String nickName);

	public void setInquiryDelete(int idx);

	public String maxLevelOrder2(int inquiryIdx);

	public void InquiryReplyInsert(InquiryReplyVO rvo);

	public InquiryVO getInquiryContent(int idx);

	public void InquiryUpdate(int inquiryIdx);

	public ReviewLikeVO reviewSearch(ReviewLikeVO vo);

	public void likeInsert(ReviewLikeVO vo);

	public void likeNumUpdate(ReviewLikeVO vo);

	public void likeUpdate(ReviewLikeVO imsVO);

	public void memberOut(int idx);

	public void setBoardReplyDelete(int parseInt);

	public void setEventReplyDelete(int parseInt);







}
