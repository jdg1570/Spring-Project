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

import com.spring.cjs2108_jdg.dao.MemberDAO;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryVO;
import com.spring.cjs2108_jdg.vo.MemberVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getIdCheck(String mid) {
		return memberDAO.getIdCheck(mid);
	}

	@Override
	public MemberVO getNickCheck(String nickName) {
		return memberDAO.getNickCheck(nickName);
	}

	@Override
	public int setJoin(MemberVO vo) {
		int res = 0;
		memberDAO.setJoin(vo);
		res = 1;
		return res;
	}

	@Override
	public MemberVO getIdSearch(String toMail, String name) {
		return memberDAO.getIdSearch(toMail, name);
	}

	@Override
	public MemberVO getPwdSearch(String mid, String toMail) {
		return memberDAO.getPwdSearch(mid, toMail);
	}

	@Override
	public void setPwdChange(String mid, String pwd) {
		memberDAO.setPwdChange(mid, pwd);
		
	}

	@Override
	public MemberVO getLoginCheck(String mid) {
		return memberDAO.getLoginCheck(mid);
	}

	// 최종 방문일
	@Override
	public void setVisitUpdate(String mid) {
		memberDAO.setVisitUpdate(mid);
	}

	@Override
	public Object getNickNameCheck(String nickName) {
		return memberDAO.getNickNameCheck(nickName);
	}

	@Override
	public int setMemberUpdate(MemberVO vo) {
		int res=0; 
		memberDAO.setMemberUpdate(vo);
		res=1;
		return res;
	}
	// 회원 탈퇴
	@Override
	public void setMemberOut(String mid) {
		memberDAO.setMemberOut(mid);
	}

	@Override
	public MemberVO getJoinPeriod(String mid) {
		return memberDAO.getJoinPeriod(mid);
	}

	@Override
	public int getMybookCount(String nickName) {
		return memberDAO.getMybookCount(nickName);
	}

	@Override
	public int getReadCount(String nickName) {
		return memberDAO.getReadCount(nickName);
	}

	@Override
	public int getNotCount(String nickName) {
		return memberDAO.getNotCount(nickName);
	}

	@Override
	public MemberVO getPoint(String mid) {
		return memberDAO.getPoint(mid);
	}

	@Override
	public int getIngCount(String nickName) {
		return memberDAO.getIngCount(nickName);
	}

	@Override
	public List<MyBookVO> getIngBook(String nickName) {
		return memberDAO.getIngBook(nickName);
	}

	@Override
	public List<MyBookVO> getNotYetBook(String nickName) {
		return memberDAO.getNotYetBook(nickName);
	}

	@Override
	public List<MyBookVO> getFinishBook(String nickName) {
		return memberDAO.getFinishBook(nickName);
	}

	@Override
	public void imgCheck(String content) {
		if(content.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/");	
		
		int position = 28;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	
			
			copyFilePath = uploadPath + "inquiry/" + imgFile;		
			
			fileCopyCheck(oriFilePath, copyFilePath); 
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
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
	public void setInquiryInput(InquiryVO vo) {
		memberDAO.setInquiryInput(vo);
	}

	@Override
	public List<InquiryVO> getMyInquiry(String nickName) {
		return memberDAO.getMyInquiry(nickName);
	}

	@Override
	public InquiryVO getInquiryUpdate(int idx) {
		return memberDAO.getInquiryUpdate(idx);
	}

	@Override
	public void imgDelete(String content) {
		if(content.indexOf("src=\"/") != -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/inquiry/");
		
		int position = 34;
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

	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public void setInquiryUpdate(InquiryVO vo) {
		memberDAO.setInquiryUpdate(vo);
	}

	@Override
	public int getMyBoard(String nickName) {
		return memberDAO.getMyBoard(nickName);
	}

	@Override
	public int getMyReply(String nickName) {
		return memberDAO.getMyReply(nickName);
	}

	@Override
	public int getMyReview(String nickName) {
		return memberDAO.getMyReview(nickName);
	}

	@Override
	public List<BoardVO> getMyBoardList(String nickName) {
		return memberDAO.getMyBoardList(nickName);
	}

	@Override
	public List<BoardReplyVO> getMyReplyList(String nickName) {
		return memberDAO.getMyReplyList(nickName);
	}

	@Override
	public List<EventReplyVO> getMyEventReplyList(String nickName) {
		return memberDAO.getMyEventReplyList(nickName);
	}

	@Override
	public List<BookReviewVO> getMyReviewList(String nickName) {
		return memberDAO.getMyReviewList(nickName);
	}

	@Override
	public List<InquiryReplyVO> getMyAnswer(String nickName) {
		return memberDAO.getMyAnswer(nickName);
	}

	@Override
	public void InquiryDelete(int idx) {
		memberDAO.InquiryDelete(idx);
	}

	@Override
	public List<BoardVO> LikeBoardList(String nickName) {
		return memberDAO.LikeBoardList(nickName);
	}

	@Override
	public int getLikeReview(String nickName) {
		return memberDAO.getLikeReview(nickName);
	}

	@Override
	public List<BookReviewVO> LikeReviewList(String nickName) {
		return memberDAO.LikeReviewList(nickName);
	}

	@Override
	public int getLikeBoard(String nickName) {
		return memberDAO.getLikeBoard(nickName);
	}




}
