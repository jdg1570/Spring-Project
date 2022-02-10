package com.spring.cjs2108_jdg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryVO;
import com.spring.cjs2108_jdg.vo.MemberVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

public interface MemberDAO {

	public MemberVO getIdCheck(@Param("mid") String mid);

	public MemberVO getNickCheck(@Param("nickName") String nickName);

	public void setJoin(@Param("vo") MemberVO vo);

	public MemberVO getIdSearch(@Param("toMail") String toMail, @Param("name") String name);

	public MemberVO getPwdSearch(@Param("mid") String mid, @Param("toMail") String toMail);

	public void setPwdChange(@Param("mid") String mid, @Param("pwd") String pwd);

	public MemberVO getLoginCheck(@Param("mid") String mid);

	public void setVisitUpdate(@Param("mid") String mid);

	public Object getNickNameCheck(@Param("nickName") String nickName);

	public void setMemberUpdate(@Param("vo") MemberVO vo);

	public void setMemberOut(@Param("mid") String mid);

	public MemberVO getJoinPeriod(@Param("mid") String mid);

	public int getMybookCount(@Param("nickName") String nickName);

	public int getReadCount(@Param("nickName") String nickName);

	public int getNotCount(@Param("nickName") String nickName);

	public MemberVO getPoint(@Param("mid") String mid);

	public int getIngCount(@Param("nickName") String nickName);

	public List<MyBookVO> getIngBook(@Param("nickName") String nickName);

	public List<MyBookVO> getNotYetBook(@Param("nickName") String nickName);

	public List<MyBookVO> getFinishBook(@Param("nickName") String nickName);

	public void setInquiryInput(@Param("vo") InquiryVO vo);

	public List<InquiryVO> getMyInquiry(@Param("nickName") String nickName);

	public InquiryVO getInquiryUpdate(@Param("idx") int idx);

	public void setInquiryUpdate(@Param("vo") InquiryVO vo);

	public int getMyBoard(@Param("nickName") String nickName);

	public int getMyReply(@Param("nickName") String nickName);

	public int getMyReview(@Param("nickName") String nickName);

	public List<BoardVO> getMyBoardList(@Param("nickName") String nickName);

	public List<BoardReplyVO> getMyReplyList(@Param("nickName") String nickName);

	public List<EventReplyVO> getMyEventReplyList(@Param("nickName") String nickName);

	public List<BookReviewVO> getMyReviewList(@Param("nickName") String nickName);

	public List<InquiryReplyVO> getMyAnswer(@Param("nickName") String nickName);

	public void InquiryDelete(@Param("idx") int idx);

	public List<BoardVO> LikeBoardList(@Param("nickName") String nickName);

	public int getLikeReview(@Param("nickName") String nickName);

	public List<BookReviewVO> LikeReviewList(@Param("nickName") String nickName);

	public int getLikeBoard(@Param("nickName") String nickName);








}
