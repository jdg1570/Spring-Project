package com.spring.cjs2108_jdg;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.MybookService;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.BooksVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

@Controller
@RequestMapping("/mybook")
public class MybookController {
	String msgFlag="";
	
	@Autowired
	MybookService mybookService;
	
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping(value="/myUp", method = RequestMethod.GET)
	public String myUpGet() {
		return "mybook/myUp";
	}
	
	@RequestMapping(value="/myDown", method = RequestMethod.GET)
	public String myDownGet() {
		return "mybook/myDown";
	}
	
	@RequestMapping(value="/Main", method = RequestMethod.GET)
	public String MainGet(Model model, HttpSession session, MyBookVO vo,
			@RequestParam(name="sort", defaultValue = "0", required = false) int sort ) {
		String nickName = (String) session.getAttribute("sNickName");
		List<MyBookVO> vos = mybookService.getMybookList(nickName, sort);
		model.addAttribute("vos", vos);
		
		return "mybook/Main";
	}
	
	// 선택 도서 삭제
	@ResponseBody
	@RequestMapping(value="/Main", method = RequestMethod.POST)
	public String MainPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			mybookService.myBookDelete(Integer.parseInt(idx));
		}
		return "";
	}
	
	
	// 상세정보
	@RequestMapping(value="/MybookContent", method = RequestMethod.GET)
	public String ProductContentGet(Model model, int bookIdx, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		BooksVO vo = adminService.setIdxCheck(bookIdx);
		model.addAttribute("vo", vo);
		
		// 댓글
		List<BookReviewVO> bVos = adminService.getBookReview(bookIdx, nickName); 
		int reviewCnt = adminService.getReviewCnt(bookIdx); 
		model.addAttribute("bVos", bVos);
		model.addAttribute("reviewCnt", reviewCnt);
		
		// 관련 상품
		List<BooksVO> rVos = adminService.getRelevantList(vo.getBookType(),vo.getBookIdx());
		model.addAttribute("rVos", rVos);
		
		// 이책이 담긴 서재
		int mCnt = adminService.getMybookCount(vo.getBookIdx());
		model.addAttribute("mCnt", mCnt);
		
		return "mybook/MybookContent";
	}
	
	// 윈도우창으로 보내주기
	@RequestMapping(value="/MybookContent", method = RequestMethod.POST)
	public String MybookContentPost(MyBookVO vo, String bookName, HttpSession session, Model model, String bookText, int bookIdx) {
		String nickName = (String) session.getAttribute("sNickName");
		vo = adminService.myBookSearch(bookName, nickName);
		model.addAttribute("vo",vo);
		
		return "redirect:/mybook/bookRead?bookIdx="+vo.getBookIdx();
	}
	
	// 책 보기 창
	@RequestMapping(value="/bookRead",method = RequestMethod.GET)

	public String bookReadGet(Model model, MyBookVO vo, String bookText, int bookIdx, HttpSession session, HttpServletRequest request) {
		String nickName = (String) session.getAttribute("sNickName");
		
		// 도서 텍스트
		vo = mybookService.getBookText(bookText, nickName);
		
		// 읽은날짜
		mybookService.updateReadDate(bookIdx, nickName);
		
		session = request.getSession();
		ArrayList<String> readNumIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(readNumIdx == null) {
			readNumIdx = new ArrayList<String>();
			session.setAttribute("sContentIdx", readNumIdx);
		}
		String imsIdx = session.getId() + "readNum" + bookIdx;
		if(!readNumIdx.contains(imsIdx)) {
			mybookService.updateReadNum(bookIdx);
			readNumIdx.add(imsIdx);
		}
		
		vo.setBookIdx(bookIdx);
		model.addAttribute("vo", vo);
		model.addAttribute("bookText", bookText);
		
		return "mybook/bookRead";
	}
	
	// 완독 후 처리
	@RequestMapping(value="/bookRead", method = RequestMethod.POST)
	public String bookReadPost(int bookIdx, String nickName) throws UnsupportedEncodingException {
		MyBookVO vo = mybookService.getBookSearch(bookIdx, nickName);
		
		if(vo.getRead().equals("YES")) {
			// 아래 URLEncoder 사용시 뒤 확장자명이 생략되어 임의로 확장자명을 붙여줌
			msgFlag = "alreadyRead$bookIdx="+vo.getBookIdx()+"&bookText="+java.net.URLEncoder.encode(vo.getBookText(), "UTF-8")+".txt";
			return "redirect:/msg/" + msgFlag;
		}
		else {
			mybookService.ReadBook(bookIdx, nickName);
			return "mybook/bookRead";
		}
	}
	
	// 내 통계
	@RequestMapping(value="/Myanalysis", method = RequestMethod.GET)
	public String analysisGet(HttpSession session, Model model) {
		String nickName = (String) session.getAttribute("sNickName");
		
		// 서재 현황
		List<MyBookVO> items = mybookService.getBookType(nickName);
		model.addAttribute("items", items);
		
		//시간대
		List<MyBookVO> ptimes = mybookService.getPrimeTime(nickName);
		
		int[] pcnts = new int [13];
		int[] ptimetitles = {9,10,11,12,13,14,15,16,17,18,19,20,21};
		for(int i=0; i<pcnts.length; i++) {
			for(MyBookVO vo : ptimes) {
				if( ptimetitles[i] == vo.getPtime()) {
					pcnts[i] = vo.getPcnt();
					break;
				}
			}
		}
		model.addAttribute("ptimes", ptimes);
		model.addAttribute("pcnts", pcnts);
		
		//요일
		List<MyBookVO> bdate = mybookService.getBookDate(nickName);
		model.addAttribute("bdate", bdate);
		
		return "mybook/Myanalysis";
	}
	
}
