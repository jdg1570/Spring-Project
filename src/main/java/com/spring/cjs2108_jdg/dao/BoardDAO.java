package com.spring.cjs2108_jdg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_jdg.vo.BoardLikeVO;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.LikeVO;

public interface BoardDAO {

	public void setBoardInput(@Param("vo") BoardVO vo);

	public int totRecCnt(@Param("pageSize") int pageSize, @Param("part") String part, @Param("search") String search, @Param("searchString") String searchString);

	public List<BoardVO> getBoardList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part, @Param("search") String search, @Param("searchString") String searchString, @Param("menuSw") int menuSw);

	public BoardVO getBoardContent(@Param("idx") int idx);

	public void setBoardUpdate(@Param("vo") BoardVO vo);

	public void setBoardDelete(@Param("idx") int idx);

	public List<BoardVO> getPreNext(@Param("idx") int idx);

	public void addReadNum(@Param("idx") int idx);

	public String maxLevelOrder(@Param("boardIdx") int boardIdx);

	public void setReplyInsert(@Param("rvo") BoardReplyVO rvo);

	public List<BoardReplyVO> getBoardReply(@Param("idx") int idx);

	public int getReplyCnt(@Param("idx") int idx);

	public void ReplyDelete(@Param("replyIdx") int replyIdx);

	public void levelOrderUp(@Param("rvo") BoardReplyVO rvo);

	public void setReplyInsert2(@Param("rvo") BoardReplyVO rvo);

	public BoardReplyVO ReplyUpdate(@Param("replyIdx") int replyIdx);

	public void LikeDown(@Param("idx") int idx);

	public LikeVO getLikeCheck(@Param("nickName") String nickName);

	public int getLikeNum(@Param("idx") int idx);

	public BoardLikeVO boardSearch(@Param("vo") BoardLikeVO vo);

	public void likeInsert(@Param("vo") BoardLikeVO vo);

	public void likeNumUpdate(@Param("vo") BoardLikeVO vo);

	public void likeUpdate(@Param("vo") BoardLikeVO vo);

	public List<BoardLikeVO> getBoardLike(@Param("idx") int idx, @Param("nickName") String nickName);

	public void likeNumList(@Param("idx") int idx);

	public void setAdminInput(@Param("vo") BoardVO vo);
	




}
