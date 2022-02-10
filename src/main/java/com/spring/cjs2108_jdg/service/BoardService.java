package com.spring.cjs2108_jdg.service;

import java.util.List;

import com.spring.cjs2108_jdg.vo.BoardLikeVO;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.LikeVO;

public interface BoardService {

	public void setBoardInput(BoardVO vo);

	public void imgCheck(String content);

	public int totRecCnt(int pageSize, String part, String search, String searchString);

	public List<BoardVO> getBoardList(int startIndexNo, int pageSize, String part, String search, String searchString, int menuSw);

	public BoardVO getBoardContent(int idx);

	public void imgDelete(String content);

	public void setBoardUpdate(BoardVO vo);

	public void imgCheckUpdate(String content);

	public void setBoardDelete(int idx);

	public List<BoardVO> getPreNext(int idx);

	public void addReadNum(int idx);

	public String maxLevelOrder(int boardIdx);

	public void setReplyInsert(BoardReplyVO rvo);

	public List<BoardReplyVO> getBoardReply(int idx);

	public int getReplyCnt(int idx);

	public void ReplyDelete(int replyIdx);

	public void levelOrderUp(BoardReplyVO rvo);

	public void setReplyInsert2(BoardReplyVO rvo);

	public BoardReplyVO ReplyUpdate(int replyIdx);

	public void LikeDown(int idx);

	public LikeVO getLikeCheck(String nickName);

	public int getLikeNum(int idx);

	public BoardLikeVO boardSearch(BoardLikeVO vo);

	public void likeInsert(BoardLikeVO vo);

	public void likeNumUpdate(BoardLikeVO vo);

	public void likeUpdate(BoardLikeVO imsVO);

	public List<BoardLikeVO> getBoardLike(int idx, String nickName);

	public void likeNumList(int idx);

	public void setAdminInput(BoardVO vo);



		
	}



