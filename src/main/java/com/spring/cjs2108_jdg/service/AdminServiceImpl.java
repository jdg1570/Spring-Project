package com.spring.cjs2108_jdg.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_jdg.dao.AdminDAO;
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

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	// ckeditor 그림을 admin 폴더로 복사
	@Override
	public void imgCheck(String bookContent) {
		if(bookContent.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/");	
		
		int position = 32;
		String nextImg = bookContent.substring(bookContent.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	
			
			copyFilePath = uploadPath + "admin/" + imgFile;		
			
			fileCopyCheck(oriFilePath, copyFilePath); 
			
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
			}
		}
	}
	// 파일을 admin 폴더로 복사
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
	
	// 도서 텍스트 추가
	@Override
	public void setProductInput(MultipartFile bookText, BooksVO vo) {
		try {
			String oFileName = bookText.getOriginalFilename();
			if(oFileName != "" && oFileName != null) {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				
				writeFile(bookText, saveFileName);
				vo.setBookText(saveFileName);
			}
			else {
				
			}
			adminDAO.setProductInput(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private void writeFile(MultipartFile bookText, String saveFileName) throws IOException {
		byte[] data = bookText.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/text/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);  
		
		fos.close();
	}
	
	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
	}
	
	@Override
	public int totRecCnt(String bookType, String bookName) {
		return adminDAO.totRecCnt(bookType,bookName);
	}
	@Override
	public List<BooksVO> getProductList(int startIndexNo, int pageSize, String bookType, String bookName) {
		return adminDAO.getProductList(startIndexNo,pageSize,bookType,bookName);
	}
	@Override
	public void setProductDelete(int idx) {
		adminDAO.setProductDelete(idx);
	}
	@Override
	public BooksVO setIdxCheck(int bookIdx) {
		return adminDAO.setIdxCheck(bookIdx);
	}
	
	// 수정전 원본파일 복사
	@Override
	public void imgCheckUpdate(String bookContent) {
		if(bookContent.indexOf("src=\"/") == -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/admin/");
		
		int position = 38;
		String changeImg = bookContent.substring(bookContent.indexOf("src=\"/") + position);
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
	
	@Override
	public void imgDelete(String bookContent) {
	//		  	   0         1         2       2 3   3     4         5
	//             012345678901234567890123456789012345678901234567890
	// <img alt="" src="/cjs2108_jdg/data/ckeditor/211229124318_4.jpg"
	// <img alt="" src="/cjs2108_jdg/data/ckeditor/board/211229124318_4.jpg"
	// 34번째부터가 ckeditor주소 시작
		if(bookContent.indexOf("src=\"/") != -1) return;
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getRealPath("/resources/data/ckeditor/admin/");
		
		int position = 38;
		String changeImg = bookContent.substring(bookContent.indexOf("src=\"/") + position);
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
	
	// 원본 삭제처리
	private void fileDelete(String oriFilePath) {
		File delFile = new File(oriFilePath);
		if(delFile.exists()) delFile.delete();
	}
	
	// 도서 텍스트 수정
	@Override
	public void setProductUpdate(MultipartFile bookText, BooksVO vo) {
		try {
			String oFileName = bookText.getOriginalFilename();
			vo.setBookText(oFileName);
			if(!oFileName.equals("") || oFileName != null) {
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/text/");
				if(vo.getBookText().equals(oFileName)) {
					new File(uploadPath + vo.getBookText()).delete();
				}
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				writeFile(bookText, saveFileName);
				vo.setBookText(saveFileName);
			}
			adminDAO.setProductUpdate(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int totRecCnt2(int level, String mid) {
		return adminDAO.totRecCnt2(level, mid);
	}
	@Override
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level, String mid) {
		return adminDAO.getMemberList(startIndexNo,pageSize,level,mid);
	}
	@Override
	public void setLevelUpdate(int idx, int level) {
		adminDAO.setLevelUpdate(idx, level);
	}
	@Override
	public List<BooksVO> getBestList(int readNum) {
		return adminDAO.getBestList(readNum);
	}
	@Override
	public List<BooksVO> getRecommendList(String interest) {
		return adminDAO.getRecommendList(interest);
	}
	@Override
	public List<BooksVO> getRelevantList(String bookType, int bookIdx) {
		return adminDAO.getRelevantList(bookType, bookIdx);
	}
	@Override
	public void setReviewInsert(BookReviewVO bvo) {
		adminDAO.setReviewInsert(bvo);
	}
	@Override
	public List<BookReviewVO> getBookReview(int bookIdx, String nickName) {
		return adminDAO.getBookReview(bookIdx, nickName);
	}
	@Override
	public int getReviewCnt(int bookIdx) {
		return adminDAO.getReviewCnt(bookIdx);
	}
	@Override
	public void ReviewDelete(int reviewIdx) {
		adminDAO.ReviewDelete(reviewIdx);
	}
	@Override
	public void addGood(int reviewIdx, int flag) {
		adminDAO.addGood(reviewIdx, flag);
	}
	@Override
	public void setReplyDelete(int idx) {
		adminDAO.setReplyDelete(idx);
	}
	@Override
	public int totReviewCnt(int pageSize, String nickName) {
		return adminDAO.totReviewCnt(pageSize, nickName);
	}
	@Override
	public List<BookReviewVO> getBookReply(int startIndexNo, int pageSize, String nickName) {
		return adminDAO.getBookReply(startIndexNo, pageSize, nickName);
	}
	@Override
	public int totEventCnt(int pageSize, String nickName) {
		return adminDAO.totEventCnt(pageSize, nickName);
	}
	@Override
	public List<EventReplyVO> getEventReply(int startIndexNo, int pageSize, String nickName) {
		return adminDAO.getEventReply(startIndexNo,pageSize,nickName);
	}
	@Override
	public List<BooksVO> getNewList() {
		return adminDAO.getNewList();
	}
	@Override
	public MyBookVO myBookSearch(String bookName, String nickName) {
		return adminDAO.myBookSearch(bookName, nickName);
	}
	@Override
	public void myBookInput(MyBookVO vo) {
		adminDAO.myBookInput(vo);
	}
	@Override
	public int btotRecCnt(String part, String nickName) {
		return adminDAO.btotRecCnt(part,nickName);
	}
	@Override
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize, String part, String nickName) {
		return adminDAO.getBoardList(startIndexNo,pageSize,part,nickName);
	}
	@Override
	public void setBoardDelete(int idx) {
		adminDAO.setBoardDelete(idx);
	}
	@Override
	public int totBoardCnt(int pageSize, String nickName) {
		return adminDAO.totBoardCnt(pageSize, nickName);
	}
	@Override
	public List<BoardReplyVO> getBoardReply(int startIndexNo, int pageSize, String nickName) {
		return adminDAO.getBoardReply(startIndexNo,pageSize,nickName);
	}
	@Override
	public int getMybookCount(int bookIdx) {
		return adminDAO.getMybookCount(bookIdx);
	}
	@Override
	public List<MyBookVO> getAddList(int bookIdx) {
		return adminDAO.getAddList(bookIdx);
	}
	@Override
	public List<BooksVO> getBookType() {
		return adminDAO.getBookType();
	}
	@Override
	public List<MyBookVO> getPopularType() {
		return adminDAO.getPopularType();
	}
	@Override
	public List<MyBookVO> getReadRank() {
		return adminDAO.getReadRank();
	}
	@Override
	public int itotRecCnt(String part, String nickName) {
		return adminDAO.itotRecCnt(part,nickName);
	}
	@Override
	public List<InquiryVO> getInquiryList(int startIndexNo, int pageSize, String part, String nickName) {
		return adminDAO.getInquiryList(startIndexNo,pageSize,part,nickName);
	}
	@Override
	public void setInquiryDelete(int idx) {
		adminDAO.setInquiryDelete(idx);
	}
	@Override
	public String maxLevelOrder2(int inquiryIdx) {
		return adminDAO.maxLevelOrder2(inquiryIdx);
	}
	@Override
	public void InquiryReplyInsert(InquiryReplyVO rvo) {
		System.out.println("rvo : " + rvo);
		adminDAO.InquiryReplyInsert(rvo);
	}
	@Override
	public InquiryVO getInquiryContent(int idx) {
		return adminDAO.getInquiryContent(idx);
	}
	@Override
	public void InquiryUpdate(int inquiryIdx) {
		adminDAO.InquiryUpdate(inquiryIdx);
	}
	@Override
	public ReviewLikeVO reviewSearch(ReviewLikeVO vo) {
		return adminDAO.reviewSearch(vo);
	}
	@Override
	public void likeInsert(ReviewLikeVO vo) {
		adminDAO.likeInsert(vo);
	}
	@Override
	public void likeNumUpdate(ReviewLikeVO vo) {
		adminDAO.likeNumUpdate(vo);
	}
	@Override
	public void likeUpdate(ReviewLikeVO vo) {
		adminDAO.likeUpdate(vo);
	}
	@Override
	public void memberOut(int idx) {
		adminDAO.memberOut(idx);
	}
	@Override
	public void setBoardReplyDelete(int idx) {
		adminDAO.setBoardReplyDelete(idx);
	}
	@Override
	public void setEventReplyDelete(int idx) {
		adminDAO.setEventReplyDelete(idx);
	}
}
