package com.spring.cjs2108_jdg;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.BoardService;
import com.spring.cjs2108_jdg.service.MybookService;
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

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag = "";
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MybookService mybookService;
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value="/Adminpage", method = RequestMethod.GET)
	public String AdminpageGet() {
		return "admin/Adminpage";
	}
	
	@RequestMapping(value="/ProductInput", method = RequestMethod.GET)
	public String AdminProducttGet() {
		return "admin/ProductInput";
	}
	
	// 상품 DB에 등록
	@RequestMapping(value="ProductInput", method = RequestMethod.POST)
	public String AdminProductPost(MultipartFile file, BooksVO vo) {
		adminService.imgCheck(vo.getBookContent()); 
		
		vo.setBookContent(vo.getBookContent().replace("/data/ckeditor/", "/data/ckeditor/admin/"));
		
		adminService.setProductInput(file, vo);
		
		msgFlag = "ProductOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 상품리스트
	@RequestMapping(value="/ProductList", method = RequestMethod.GET)
	public String ProductListGet(
		@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
		@RequestParam(name="bookType", defaultValue = "전체", required=false) String bookType, 
		@RequestParam(name="bookName", defaultValue = "", required = false) String bookName,
		Model model) {
		
		  int pageSize = 6;
		  int totRecCnt = adminService.totRecCnt(bookType, bookName);
		  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		  int startIndexNo = (pag - 1) * pageSize;
		  int curScrStrarNo = totRecCnt - startIndexNo;
		  int blockSize = 5;		
		  int curBlock = (pag - 1) / blockSize;	
		  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		  List<BooksVO> vos = adminService.getProductList(startIndexNo, pageSize, bookType, bookName);
		  
		  model.addAttribute("vos", vos);
		  model.addAttribute("pag", pag);
		  model.addAttribute("bookType", bookType);
		  model.addAttribute("bookName", bookName);
		  model.addAttribute("totPage", totPage);
		  model.addAttribute("curScrStrarNo", curScrStrarNo);
		  model.addAttribute("blockSize", blockSize);
		  model.addAttribute("curBlock", curBlock);
		  model.addAttribute("lastBlock", lastBlock);
		  model.addAttribute("totRecCnt", totRecCnt);
		  
		  return "admin/ProductList";
	}
	
	// 선택 상품 삭제
	@ResponseBody
	@RequestMapping(value="/ProductList", method = RequestMethod.POST)
	public String ProductListPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setProductDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	// 상품 수정폼
	@RequestMapping(value="/ProductChange", method = RequestMethod.GET)
	public String ProductChangeGet(Model model, int bookIdx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize
			) {
		BooksVO vo = adminService.setIdxCheck(bookIdx);
		
		if(vo.getBookContent().indexOf("src=\"/") != -1) adminService.imgCheckUpdate(vo.getBookContent());
		
		model.addAttribute("vo", vo);
		
		return "admin/ProductChange";
	}
	
	// 상품 수정 처리
	@RequestMapping(value="/ProductChange", method = RequestMethod.POST)
	public String ProductChangePost(BooksVO vo,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
			MultipartFile file ) {
		
		if(vo.getOriContent().indexOf("src=\"/") != -1) adminService.imgDelete(vo.getOriContent());
		
		vo.setBookContent(vo.getBookContent().replace("/data/ckeditor/admin/", "/data/ckeditor/"));
		
		adminService.imgCheck(vo.getBookContent());
		
		vo.setBookContent(vo.getBookContent().replace("/data/ckeditor/", "/data/ckeditor/admin/"));
		adminService.setProductUpdate(file, vo);
		
		msgFlag = "ProductUpdateOk";
		
		return "redirect:/msg/"+msgFlag;
	}
	
	// 회원 리스트
	@RequestMapping(value="/MemberList", method = RequestMethod.GET)
	public String MemberListGet(
		@RequestParam(name="pag", defaultValue="1", required=false) int pag,
		@RequestParam(name="level", defaultValue="99", required=false) int level,
		Model model, String mid) {
	
	    int pageSize = 10;
	    int totRecCnt = adminService.totRecCnt2(level, mid);		
	    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	    int startIndexNo = (pag - 1) * pageSize;
	    int curScrStrarNo = totRecCnt - startIndexNo;
	    int blockSize = 3;		
	    int curBlock = (pag - 1) / blockSize;		
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
	    
	    ArrayList<MemberVO> vos = adminService.getMemberList(startIndexNo, pageSize, level, mid);
	    
	    model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
	    
		return "admin/MemberList";
	}
	
	// 등급 변경
	@ResponseBody
	@RequestMapping(value="/MemberLevel", method = RequestMethod.POST)
	public String MemberLevelPost(int idx, int level) {
		adminService.setLevelUpdate(idx, level);
		return "";
		
	}
	
	// 상품 상세정보
	@RequestMapping(value="/ProductContent", method = RequestMethod.GET)
	public String ProductContentGet(Model model, int bookIdx, HttpSession session) {
		String nickName= (String) session.getAttribute("sNickName");
		
		BooksVO vo = adminService.setIdxCheck(bookIdx);
		model.addAttribute("vo", vo);
		
		// 댓글, 좋아요
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
		
		return "admin/ProductContent";
	}
	
	// 내 서재로 보내기
	@RequestMapping(value="/ProductContent", method = RequestMethod.POST)
	public String ProductContentPost(MyBookVO vo, int bookIdx, HttpSession session) {
	    String nickName = (String) session.getAttribute("sNickName");
	    MyBookVO mVo = adminService.myBookSearch(vo.getBookName(), nickName);
	    
	    // 내 서재에 존재
	    if(mVo != null) {
	    	msgFlag = "alreadyBook$bookIdx="+vo.getBookIdx();
    		return "redirect:/msg/" + msgFlag; 
	    }
	    // 내 서제에 존재 X
	    else {
    		adminService.myBookInput(vo);
    		msgFlag = "myBookInputOk$bookIdx="+vo.getBookIdx();
    		return "redirect:/msg/" + msgFlag;
	    }
	}
	
	// 한줄 리뷰 입력
	@ResponseBody
	@RequestMapping(value="/ReviewInsert", method = RequestMethod.POST)
	public String ReplyInsertPost(BookReviewVO bvo){
		adminService.setReviewInsert(bvo);
		return"";
	}
	
	// 상품 리뷰 삭제
	@ResponseBody
	@RequestMapping(value="/ReviewDelete", method = RequestMethod.POST)
	public String ReviewDeletePost(int reviewIdx) {
		adminService.ReviewDelete(reviewIdx);
		return "";
	}
	
	// 좋아요 처리
	@ResponseBody
	@RequestMapping(value="/GoodCheck", method = RequestMethod.POST)
	public String GoodCheckPost(HttpSession session, int idx, ReviewLikeVO vo) {
		String nickName = (String) session.getAttribute("sNickName");
		vo.setNickName(nickName);
		vo.setReviewIdx(idx);
		
		ReviewLikeVO imsVO = adminService.reviewSearch(vo);
		if(imsVO == null) {
			vo.setLikeSw(-1);
			adminService.likeInsert(vo);
			adminService.likeNumUpdate(vo);
		}
		else {
			adminService.likeUpdate(imsVO);
			adminService.likeNumUpdate(imsVO);
		}
		return "";
	}
	// 댓글 목록 창
	@RequestMapping(value="/ReviewType", method = RequestMethod.GET)
	public String ReviewTypeGet() {
		return "admin/ReviewType";
	}
	
	
	// 도서 한 줄 리뷰 리스트
	@RequestMapping(value="/BookReply", method = RequestMethod.GET)
	public String ReviewListGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize, String nickName
			) {
		
		int totRecCnt = adminService.totReviewCnt(pageSize, nickName);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 5;		
		int curBlock = (pag - 1) / blockSize;	
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<BookReviewVO> vos = adminService.getBookReply(startIndexNo, pageSize, nickName);

	    model.addAttribute("vos", vos);
	    model.addAttribute("pag", pag);
	    model.addAttribute("nickName", nickName);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totPage", totPage);
	    model.addAttribute("curScrStrarNo", curScrStrarNo);
	    model.addAttribute("blockSize", blockSize);
	    model.addAttribute("curBlock", curBlock);
	    model.addAttribute("lastBlock", lastBlock);
	    model.addAttribute("totRecCnt", totRecCnt);
		
		return"admin/BookReply";
	}
	
	// 한줄 리뷰 선택 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/BookReply", method = RequestMethod.POST)
	public String BookReplyPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setReplyDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	
	// 이벤트 댓글
	@RequestMapping(value="/EventReply", method = RequestMethod.GET)
	public String EventReplytGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize, String nickName
			) {
		
		int totRecCnt = adminService.totEventCnt(pageSize, nickName);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 5;		
		int curBlock = (pag - 1) / blockSize;	
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<EventReplyVO> vos = adminService.getEventReply(startIndexNo, pageSize, nickName);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nickName", nickName);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("totRecCnt", totRecCnt);
		
		return"admin/EventReply";
	}
	
	// 이벤트 선택 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/EventReply", method = RequestMethod.POST)
	public String EventReplyPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setEventReplyDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	// 게시판 현황
	@RequestMapping(value="/BoardList", method = RequestMethod.GET)
	public String BoardListGet(
		@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
		@RequestParam(name="pageSize", defaultValue = "10", required=false) int pageSize,
		@RequestParam(name="part", defaultValue = "전체", required=false) String part,
		 String nickName, Model model) {
		
		  int totRecCnt = adminService.btotRecCnt(part, nickName);
		  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		  int startIndexNo = (pag - 1) * pageSize;
		  int curScrStrarNo = totRecCnt - startIndexNo;
		  int blockSize = 5;		
		  int curBlock = (pag - 1) / blockSize;	
		  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		  List<BoardVO> vos = adminService.getBoardList(startIndexNo, pageSize, part, nickName);
		  
		  model.addAttribute("vos", vos);
		  model.addAttribute("pag", pag);
		  model.addAttribute("part", part);
		  model.addAttribute("nickName", nickName);
		  model.addAttribute("totPage", totPage);
		  model.addAttribute("curScrStrarNo", curScrStrarNo);
		  model.addAttribute("blockSize", blockSize);
		  model.addAttribute("curBlock", curBlock);
		  model.addAttribute("lastBlock", lastBlock);
		  model.addAttribute("totRecCnt", totRecCnt);
		  
		  return "admin/BoardList";
	}
	
	// 선택 게시글 삭제
	@ResponseBody
	@RequestMapping(value="/BoardList", method = RequestMethod.POST)
	public String BoardListPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setBoardDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	// 게시물 내용보여주기
	@RequestMapping(value="/ContentShow", method = RequestMethod.GET)
	public String ContentShowGet(int idx, Model model) {
		BoardVO vo = boardService.getBoardContent(idx);
		
		model.addAttribute("vo", vo);
		return"admin/ContentShow";
	}
	
	// 게시판 댓글
	@RequestMapping(value="/BoardReply", method = RequestMethod.GET)
	public String BoardReplytGet(Model model,
		@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
		@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize, String nickName ) {
	
		int totRecCnt = adminService.totBoardCnt(pageSize, nickName);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 5;		
		int curBlock = (pag - 1) / blockSize;	
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<BoardReplyVO> vos = adminService.getBoardReply(startIndexNo, pageSize, nickName);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nickName", nickName);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("totRecCnt", totRecCnt);
		
		return "admin/BoardReply";
	}
	
	@ResponseBody
	@RequestMapping(value="/BoardReply", method = RequestMethod.POST)
	public String BoardReplyPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setBoardReplyDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	// 같은 책을 담은 회원
	@RequestMapping(value="/AddList", method = RequestMethod.GET)
	public String AddListGet(int bookIdx, Model model) {
		
		// 이 책이 담긴 서재 회원 리스트
		List<MyBookVO> vos = adminService.getAddList(bookIdx);
		model.addAttribute("vos", vos);
		
		return "admin/AddList";
	}
	
	// 회원분석(관리자)
	@RequestMapping(value="/Analysis", method = RequestMethod.GET)
	public String AnalysisGet(Model model) {
		
		// 도서 보유량
		List<BooksVO> bVos = adminService.getBookType();
		model.addAttribute("bVos", bVos);
		
		// 분야별 선호도
		List<MyBookVO> mVos = adminService.getPopularType();
		model.addAttribute("mVos", mVos);
		
		// 완독수 TOP 5
		List<MyBookVO> fVos = adminService.getReadRank();
		model.addAttribute("fVos", fVos);
		
		return "admin/Analysis";
	}
	
	// 고객센터 1:1문의
	@RequestMapping(value="/Inquiry", method = RequestMethod.GET)
	public String InquiryGet(
		 @RequestParam(name="pag", defaultValue = "1", required=false) int pag,
		 @RequestParam(name="pageSize", defaultValue = "5", required=false) int pageSize,
		 @RequestParam(name="part", defaultValue = "전체", required=false) String part,
		 String nickName, Model model ) {
		
		 int totRecCnt = adminService.itotRecCnt(part, nickName);
		 int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		 int startIndexNo = (pag - 1) * pageSize;
		 int curScrStrarNo = totRecCnt - startIndexNo;
		 int blockSize = 5;		
		 int curBlock = (pag - 1) / blockSize;	
		 int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		 List<InquiryVO> vos = adminService.getInquiryList(startIndexNo, pageSize, part, nickName);
		 
		 model.addAttribute("vos", vos);
		 model.addAttribute("pag", pag);
		 model.addAttribute("pageSize", pageSize);
		 model.addAttribute("nickName", nickName);
		 model.addAttribute("totPage", totPage);
		 model.addAttribute("curScrStrarNo", curScrStrarNo);
		 model.addAttribute("blockSize", blockSize);
		 model.addAttribute("curBlock", curBlock);
		 model.addAttribute("lastBlock", lastBlock);
		 model.addAttribute("totRecCnt", totRecCnt);
	 
		return "admin/Inquiry";
	}
	
	// 선택 문의 삭제
	@ResponseBody
	@RequestMapping(value="/Inquiry", method = RequestMethod.POST)
	public String InquiryPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			adminService.setInquiryDelete(Integer.parseInt(idx));
		}
		return"";
	}
	
	// 문의 작성
	@RequestMapping(value="/InquiryInput", method = RequestMethod.GET)
	public String InquiryInputGet(int idx, Model model) {
		
		InquiryVO vo = adminService.getInquiryContent(idx);
		model.addAttribute("vo", vo);
		
		return "admin/InquiryInput";
	}
	
	// 답글 작성
	@RequestMapping(value="/InquiryInput", method = RequestMethod.POST)
	public String InquiryInputPost(InquiryReplyVO rvo) {
		
		int levelOrder = 0;
		String strLevelOrder = adminService.maxLevelOrder2(rvo.getInquiryIdx());
		if(strLevelOrder != null) levelOrder = Integer.parseInt(strLevelOrder)+1;
		rvo.setLevelOrder(levelOrder);
		
		adminService.InquiryReplyInsert(rvo);
		adminService.InquiryUpdate(rvo.getInquiryIdx());
		
		msgFlag = "InquiryReplyOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 회원 탈퇴 처리
	@ResponseBody
	@RequestMapping(value="/MemberReset", method = RequestMethod.POST)
	public String MemberResetPost(int idx) {
		adminService.memberOut(idx);
		
		msgFlag ="memberOutOk";
		return"redirect:/msg/" + msgFlag;
	}
	
}
