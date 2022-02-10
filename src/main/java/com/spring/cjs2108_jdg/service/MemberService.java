package com.spring.cjs2108_jdg.service;

import java.util.List;

import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryVO;
import com.spring.cjs2108_jdg.vo.MemberVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

public interface MemberService {

	public MemberVO getIdCheck(String mid);

	public MemberVO getNickCheck(String nickName);

	public int setJoin(MemberVO vo);

	public MemberVO getIdSearch(String toMail, String name);

	public MemberVO getPwdSearch(String mid, String toMail);

	public void setPwdChange(String mid, String encode);

	public MemberVO getLoginCheck(String mid);

	public void setVisitUpdate(String mid);

	public Object getNickNameCheck(String nickName);

	public int setMemberUpdate(MemberVO vo);

	public void setMemberOut(String mid);

	public MemberVO getJoinPeriod(String mid);

	public int getMybookCount(String nickName);

	public int getReadCount(String nickName);

	public int getNotCount(String nickName);

	public MemberVO getPoint(String mid);

	public int getIngCount(String nickName);

	public List<MyBookVO> getIngBook(String nickName);

	public List<MyBookVO> getNotYetBook(String nickName);

	public List<MyBookVO> getFinishBook(String nickName);

	public void imgCheck(String content);

	public void setInquiryInput(InquiryVO vo);

	public List<InquiryVO> getMyInquiry(String nickName);

	public InquiryVO getInquiryUpdate(int idx);

	public void imgDelete(String oriContent);

	public void setInquiryUpdate(InquiryVO vo);

	public int getMyBoard(String nickName);

	public int getMyReply(String nickName);

	public int getMyReview(String nickName);

	public List<BoardVO> getMyBoardList(String nickName);

	public List<BoardReplyVO> getMyReplyList(String nickName);

	public List<EventReplyVO> getMyEventReplyList(String nickName);

	public List<BookReviewVO> getMyReviewList(String nickName);

	public List<InquiryReplyVO> getMyAnswer(String nickName);

	public void InquiryDelete(int idx);

	public List<BoardVO> LikeBoardList(String nickName);

	public int getLikeReview(String nickName);

	public List<BookReviewVO> LikeReviewList(String nickName);

	public int getLikeBoard(String nickName);




	
}
