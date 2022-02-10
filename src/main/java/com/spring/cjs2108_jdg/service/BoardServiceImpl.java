package com.spring.cjs2108_jdg.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs2108_jdg.dao.BoardDAO;
import com.spring.cjs2108_jdg.vo.BoardLikeVO;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.LikeVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	@Override
	public void setBoardInput(BoardVO vo) {
		boardDAO.setBoardInput(vo);
	}

	@Override
	public void imgCheck(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/");	
		
		int position = 32;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	
			
			copyFilePath = uploadPath + "board/" + imgFile;		
			
			fileCopyCheck(oriFilePath, copyFilePath); 
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
	}


	

	@Override
	public int totRecCnt(int pageSize,String part, String search, String searchString) {
		return boardDAO.totRecCnt(pageSize, part, search, searchString);
	}

	@Override
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize, String part, String search, String searchString, int menuSw) {
		return boardDAO.getBoardList(startIndexNo, pageSize, part, search, searchString, menuSw);
	}

	@Override
	public BoardVO getBoardContent(int idx) {
		return boardDAO.getBoardContent(idx);
	}



	@Override
	public void setBoardUpdate(BoardVO vo) {
		boardDAO.setBoardUpdate(vo);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void imgCheckUpdate(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/board/");
		
		int position = 38;
		String changeImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = changeImg.substring(0,changeImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;
			String copyFilePath = request.getRealPath("/resources/data/ckeditor/" + imgFile);
			
			fileCopyCheck(oriFilePath, copyFilePath);
			
			if(changeImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				changeImg = changeImg.substring(changeImg.indexOf("src=\"/") + position);
			}
		}
	}
	
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer,0,count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void imgDelete(String content) {
		if(content.indexOf("src=\"/") != -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/board/");
		
		int position = 38;
		String changeImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = changeImg.substring(0,changeImg.indexOf("\""));
			String oriFilePath = uploadPath + imgFile;
			
			fileDelete(oriFilePath);
			
			if(changeImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				changeImg = changeImg.substring(changeImg.indexOf("src=\"/") + position);
			}
		}
	}
	// 원본 삭제
	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public void setBoardDelete(int idx) {
		boardDAO.setBoardDelete(idx);
	}

	@Override
	public List<BoardVO> getPreNext(int idx) {
		return boardDAO.getPreNext(idx);
	}

	@Override
	public void addReadNum(int idx) {
		boardDAO.addReadNum(idx);
	}

	@Override
	public String maxLevelOrder(int boardIdx) {
		return boardDAO.maxLevelOrder(boardIdx);
	}

	@Override
	public void setReplyInsert(BoardReplyVO rvo) {
		boardDAO.setReplyInsert(rvo);
	}

	@Override
	public List<BoardReplyVO> getBoardReply(int idx) {
		return boardDAO.getBoardReply(idx);
	}

	@Override
	public int getReplyCnt(int idx) {
		return boardDAO.getReplyCnt(idx);
	}

	@Override
	public void ReplyDelete(int replyIdx) {
		boardDAO.ReplyDelete(replyIdx);
	}

	@Override
	public void levelOrderUp(BoardReplyVO rvo) {
		boardDAO.levelOrderUp(rvo);
	}

	@Override
	public void setReplyInsert2(BoardReplyVO rvo) {
		boardDAO.setReplyInsert2(rvo);
	}

	@Override
	public BoardReplyVO ReplyUpdate(int replyIdx) {
		return boardDAO.ReplyUpdate(replyIdx);
	}

	@Override
	public void LikeDown(int idx) {
		boardDAO.LikeDown(idx);
	}

	@Override
	public LikeVO getLikeCheck(String nickName) {
		return boardDAO.getLikeCheck(nickName);
	}

	@Override
	public int getLikeNum(int idx) {
		return boardDAO.getLikeNum(idx);
	}

	@Override
	public BoardLikeVO boardSearch(BoardLikeVO vo) {
		return boardDAO.boardSearch(vo);
	}

	@Override
	public void likeInsert(BoardLikeVO vo) {
		boardDAO.likeInsert(vo);
	}

	@Override
	public void likeNumUpdate(BoardLikeVO vo) {
		boardDAO.likeNumUpdate(vo);
	}

	@Override
	public void likeUpdate(BoardLikeVO vo) {
		boardDAO.likeUpdate(vo);
	}

	@Override
	public List<BoardLikeVO> getBoardLike(int idx, String nickName) {
		return boardDAO.getBoardLike(idx, nickName);
	}

	@Override
	public void likeNumList(int idx) {
		boardDAO.likeNumList(idx);
	}

	@Override
	public void setAdminInput(BoardVO vo) {
		boardDAO.setAdminInput(vo);
	}



}
