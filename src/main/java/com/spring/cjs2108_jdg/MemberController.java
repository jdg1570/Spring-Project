package com.spring.cjs2108_jdg;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.EventService;
import com.spring.cjs2108_jdg.service.MemberService;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;
import com.spring.cjs2108_jdg.vo.BookReviewVO;
import com.spring.cjs2108_jdg.vo.BooksVO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.EventVO;
import com.spring.cjs2108_jdg.vo.InquiryReplyVO;
import com.spring.cjs2108_jdg.vo.InquiryVO;
import com.spring.cjs2108_jdg.vo.MemberVO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag = "";
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	EventService eventService;
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// 로그인
	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public String LoginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();  
		String mid = "";
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
				break;
			}
		}
		return "member/Login";
	}
	
	// 로그인 처리(메인창에 가져올것들 다 가져오기)
	@RequestMapping(value="/Login", method = RequestMethod.POST)
	public String LoginPost(String mid, String pwd, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model,
		@RequestParam(name="readNum", defaultValue = "0", required=false) int readNum) {
		MemberVO vo = memberService.getLoginCheck(mid);
		
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserDel().equals("NO")) {
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "정회원";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", strLevel);
			session.setAttribute("sBirthday", vo.getBirthday());
			session.setAttribute("sInterest", vo.getInterest());
			
			String idSave = request.getParameter("idSave")==null ? "" : request.getParameter("idSave");
			if(idSave.equals("on")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*3);
				response.addCookie(cookie);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			// 베스트샐러
			List<BooksVO> bestVos = adminService.getBestList(readNum);
			model.addAttribute("bestVos", bestVos);
			
			// 개인 추천
			String interest = vo.getInterest();
			List<BooksVO> perVos = adminService.getRecommendList(interest);
			model.addAttribute("perVos", perVos);
			
			// 이벤트 표시
			List<EventVO> eVos = eventService.getEventshow(); 
			model.addAttribute("eVos", eVos);
			
			// 신간 도서
			List<BooksVO> newVos = adminService.getNewList();
			model.addAttribute("newVos", newVos);
			
			// 가입기간
			MemberVO tVo = memberService.getJoinPeriod(mid);
			model.addAttribute("tVo", tVo);
			
			// 포인트
			MemberVO pVO = memberService.getPoint(mid);
			model.addAttribute("pVO",pVO);
			
			
			memberService.setVisitUpdate(mid);
			
			return "member/Main";
		}
		else {
			msgFlag = "LoginNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/Logout", method = RequestMethod.GET)
	public String LogoutGet() {
		msgFlag = "Logout";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 회원가입 폼
	@RequestMapping(value="/Join", method = RequestMethod.GET)
	public String JoinGet() {
		return "member/Join";
	}
	// 아이디 찾기
	@RequestMapping(value="/IdSearch", method = RequestMethod.GET)
	public String IdSearchGet() {
		return "member/IdSearch";
	}
	// 아이디 찾기 처리
	@RequestMapping(value="/IdSearch", method = RequestMethod.POST)
	public String IdSearchPost(String toMail, String name, Model model) {
		MemberVO vo = memberService.getIdSearch(toMail, name);
		if(vo != null) {
			model.addAttribute("vo", vo);
			return "member/IdResult";
		}
		else {
			msgFlag = "IdSearchNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	// 비밀번호 찾기
	@RequestMapping(value="/PwdSearch", method = RequestMethod.GET)
	public String PwdSearchGet() {
		return "member/PwdSearch";
	}
	
	// 비밀번호 메일 전송
	@RequestMapping(value="/PwdSearch", method = RequestMethod.POST)
	public String PwdSearchPost(String mid, String toMail) {
		MemberVO vo = memberService.getPwdSearch(mid, toMail);
		if(vo != null) {
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			memberService.setPwdChange(mid, passwordEncoder.encode(pwd));
			String content = pwd;
			return "redirect:/mail/pwdSearchSend/"+toMail+"/"+content+"/";
		}
		else {
			msgFlag = "pwdSearchNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	// 회원가입 처리
	@RequestMapping(value="/Join", method = RequestMethod.POST)
	public String JoinPost(@Validated MemberVO vo, BindingResult bindingResult) {
		if(memberService.getIdCheck(vo.getMid()) != null) {
			msgFlag = "IdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		if(memberService.getNickCheck(vo.getNickName()) != null) {
			msgFlag = "NickCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
		
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		int res = memberService.setJoin(vo);
		if(res == 1) msgFlag = "JoinOk";
		else msgFlag = "JoinNo";
		
		return "redirect:/msg/" + msgFlag;
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/IdCheck", method = RequestMethod.POST)
	public String IdCheckPost(String mid) {
		String res = "0";
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null) res = "1";
		return res;
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="/NickCheck", method = RequestMethod.POST)
	public String NickCheckPost(String nickName) {
		String res = "0";
		MemberVO vo = memberService.getNickCheck(nickName);
		if(vo != null) res = "1";
		return res;
	}
	
	//회원정보변경 폼
	@RequestMapping(value="/MemberUpdate", method = RequestMethod.GET)
	public String MemberUpdateGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		System.out.println("vo : " + vo);
		return "member/MemberUpdate";
	}
	
	// 회원 정보 변경하기
	@RequestMapping(value="/MemberUpdate", method = RequestMethod.POST)
	public String memUpdatePost(MemberVO vo, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		// 닉네임 중복체크하기(닉네임이 변경되었으면 새롭게 닉네임을 세션에 등록시켜준다.)
		if(!nickName.equals(vo.getNickName())) {
			if(memberService.getNickCheck(vo.getNickName()) != null) {
				msgFlag = "NickCheckNo";
				return "redirect:/msg/" + msgFlag;
			}
			else {
				session.setAttribute("sNickName", vo.getNickName());
			}
		}
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		System.out.println("convo : " + vo);
		int res = memberService.setMemberUpdate(vo);
		
		if(res == 1) {
			msgFlag = "UpdateOk";
		}
		else {
			msgFlag = "UpdateNo";
		}
		return "redirect:/msg/" + msgFlag;
	}
	
	// 메인 창
	@RequestMapping(value="/Main", method = RequestMethod.GET)
	public String MainGet(Model model, HttpSession session, 
		@RequestParam(name="readNum", defaultValue = "0", required=false) int readNum ) {
		
		// 베스트 샐러
		List<BooksVO> bestVos = adminService.getBestList(readNum);
		model.addAttribute("bestVos", bestVos);
		
		// 개인 추천
		String mid = (String)session.getAttribute("sMid");
		MemberVO vo = memberService.getLoginCheck(mid);
		List<BooksVO> perVos = adminService.getRecommendList(vo.getInterest());
		model.addAttribute("perVos", perVos);
		
		// 이벤트
		List<EventVO> eVos = eventService.getEventshow(); 
		model.addAttribute("eVos", eVos);
		
		// 신간 도서
		List<BooksVO> newVos = adminService.getNewList();
		model.addAttribute("newVos", newVos);
		
		// 가입 기간
		MemberVO tVo = memberService.getJoinPeriod(mid);
		model.addAttribute("tVo", tVo);
		
		// 포인트
		MemberVO pVO = memberService.getPoint(mid);
		model.addAttribute("pVO",pVO);
		
		return "member/Main";
	}
	
	// Mypage 창
	@RequestMapping(value="/Mypage", method = RequestMethod.GET)
	public String MypageGet() {
		return "member/Mypage";
	}
	
	// 회원탈퇴 창
	@RequestMapping(value="/MemberOut", method = RequestMethod.GET)
	public String MemberOutGet() {
		return "member/MemberOut";
	}
	// 회원탈퇴 처리
	@RequestMapping(value="/MemberOut", method = RequestMethod.POST)
	public String MemberOutPost(String pwd, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd())) {
			memberService.setMemberOut(mid);
			msgFlag="MemberOutOk";
			return "redirect:/msg/" + msgFlag;
		}
		else {
			msgFlag = "pwdCheckNo";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	// 비밀번호 폼(정보수정)
	@RequestMapping(value="/MemberPwdCheck", method = RequestMethod.GET)
	public String MemberPwdCheckGet() {
		return "member/MemberPwdCheck";
	}
	
	// 비밀번호 확인
	@RequestMapping(value="/MemberPwdCheck", method = RequestMethod.POST)
	public String memPwdCheckPost(String pwd, HttpSession session, Model model) {
		System.out.println("vo : " );
		String mid = (String) session.getAttribute("sMid");
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo != null && passwordEncoder.matches(pwd, vo.getPwd())) {
			model.addAttribute("vo", vo);
			return "member/MemberUpdate";
		}
		else {
			msgFlag = "pwdCheckNo2";
			return "redirect:/msg/" + msgFlag;
		}
	}
	
	@RequestMapping(value="/MybookInfo", method = RequestMethod.GET)
	public String MybookInfoGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		MemberVO vo = memberService.getIdCheck(mid);
		model.addAttribute("vo", vo);
		
		// 내 서재 도서 수
		int mCnt = memberService.getMybookCount(nickName);
		model.addAttribute("mCnt", mCnt);
		
		// 내 서재 완독한 도서 수
		int fCnt = memberService.getReadCount(nickName);
		model.addAttribute("fCnt", fCnt);
		
		// 읽지 않은 도서 수
		int rCnt = memberService.getNotCount(nickName);
		model.addAttribute("rCnt", rCnt);
		
		// 읽는 중인 도서 수
		int iCnt = memberService.getIngCount(nickName);
		model.addAttribute("iCnt", iCnt);
		
		return "member/MybookInfo";
	}
	
	// 읽는 중인 도서
	@RequestMapping(value="/NotReadBook", method = RequestMethod.GET)
	public String NotReadBookGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<MyBookVO> iVos = memberService.getIngBook(nickName);
		model.addAttribute("iVos", iVos);
		
		return "member/IngBook";
	}
	
	// 읽지 않은 도서
	@RequestMapping(value="/NotYetBook", method = RequestMethod.GET)
	public String NotYetBookGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<MyBookVO> nVos = memberService.getNotYetBook(nickName);
		model.addAttribute("nVos", nVos);
		
		return "member/NotYetBook";
	}
	
	// 완독한 도서
	@RequestMapping(value="/FinishBook", method = RequestMethod.GET)
	public String FinishBookGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<MyBookVO> fVos = memberService.getFinishBook(nickName);
		model.addAttribute("fVos", fVos);
		
		return "member/FinishBook";
	}
	
	// 고객센터
	@RequestMapping(value="/CSservice", method = RequestMethod.GET)
	public String CSserviceGet() {
		return "member/CSservice";
	}
	
	// 1:1문의 폼
	@RequestMapping(value="inquiry", method = RequestMethod.GET)
	public String inquiryGet() {
		return "member/inquiry";
	}
	// 1:1 문의 처리
	@RequestMapping(value="inquiry", method = RequestMethod.POST)
	public String inquiryPost(InquiryVO vo) {
		
		memberService.imgCheck(vo.getContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/inquiry/"));
		memberService.setInquiryInput(vo);
		
		msgFlag = "inquriyInputOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 내 문의 내역
	@RequestMapping(value="inquiryCheck")
	public String inquiryCheckGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<InquiryVO> vos = memberService.getMyInquiry(nickName);
		model.addAttribute("vos", vos);
		
		List<InquiryReplyVO> rvos = memberService.getMyAnswer(nickName);
		model.addAttribute("rvos", rvos);
		
		
		return "member/inquiryCheck";
	}
	
	// 문의내역 수정
	@RequestMapping(value="/inquiryUpdate", method = RequestMethod.GET)
	public String inquiryUpdateGet(Model model, int idx) {
		
		InquiryVO vo = memberService.getInquiryUpdate(idx);
		model.addAttribute("vo", vo);
		
		return "member/inquiryUpdate";
	}
	
	// 문의내역 수정처리
	@RequestMapping(value="/inquiryUpdate", method = RequestMethod.POST)
	public String inquiryUpdatePost(InquiryVO vo) {
		
		if(vo.getOriContent().indexOf("src=\"/") != -1) memberService.imgDelete(vo.getOriContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/inquiry/", "/data/ckeditor/"));
		memberService.imgCheck(vo.getContent());
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/inquiry/"));
		
		memberService.setInquiryUpdate(vo);
		
		msgFlag = "inquiryUpdateOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 내 게시물 호출
	@RequestMapping(value="/MyPosts", method = RequestMethod.GET)
	public String MyPostsGet(Model model, HttpSession session) {
		String nickName= (String) session.getAttribute("sNickName");
		
		// 내가 쓴 게시글
		int bcnt = memberService.getMyBoard(nickName);
		model.addAttribute("bcnt",bcnt);
		
		// 내가 좋아하는 게시글
		int acnt = memberService.getLikeBoard(nickName);
		model.addAttribute("acnt",acnt);
		
		// 내가 쓴 댓글
		int rcnt = memberService.getMyReply(nickName);
		model.addAttribute("rcnt", rcnt);
		
		// 내가 쓴 한 줄 리뷰
		int ocnt = memberService.getMyReview(nickName);
		model.addAttribute("ocnt",ocnt);
		
		// 내가 좋아하는 리뷰
		int ecnt = memberService.getLikeReview(nickName);
		model.addAttribute("ecnt",ecnt);
		
		return "member/MyPosts";
	}
	
	// 내가 쓴 게시물
	@RequestMapping(value="/MyBoardList", method = RequestMethod.GET)
	public String MyBoardListGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<BoardVO> vos = memberService.getMyBoardList(nickName); 
		model.addAttribute("vos", vos);
		
		return "member/MyBoardList";
	}
	// 내가 쓴 댓글
	@RequestMapping(value="/MyReplyList", method = RequestMethod.GET)
	public String MyReplyListGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<BoardReplyVO> vos = memberService.getMyReplyList(nickName); 
		model.addAttribute("vos", vos);
		
		List<EventReplyVO> evos = memberService.getMyEventReplyList(nickName); 
		model.addAttribute("evos", evos);
		
		return "member/MyReplyList";
	}
	
	// 내가 쓴 리뷰
	@RequestMapping(value="/MyReviewList", method = RequestMethod.GET)
	public String MyReviewListGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<BookReviewVO> vos = memberService.getMyReviewList(nickName); 
		model.addAttribute("vos", vos);
		
		return "member/MyReviewList";
	}
	// 좋아하는 게시물
	@RequestMapping(value="/LikeBoardList", method = RequestMethod.GET)
	public String LikeBoardListGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<BoardVO> vos = memberService.LikeBoardList(nickName); 
		model.addAttribute("vos", vos);
		
		return "member/LikeBoardList";
	}
	
	// 좋아하는 리뷰
	@RequestMapping(value="/LikeReviewList", method = RequestMethod.GET)
	public String LikeReviewListGet(Model model, HttpSession session) {
		String nickName = (String) session.getAttribute("sNickName");
		
		List<BookReviewVO> vos = memberService.LikeReviewList(nickName); 
		model.addAttribute("vos", vos);
		
		return "member/LikeReviewList";
	}
	
	// 문의 글 삭제
	@ResponseBody
	@RequestMapping(value="/InquiryDelete", method = RequestMethod.POST)
	public String InquiryDeletePost(int idx) {
		memberService.InquiryDelete(idx);
		return "";
	}
	
	// 이용약관
	@RequestMapping(value="/Terms", method = RequestMethod.GET)
	public String TermsGet() {
		return "member/Terms";
	}
	
	// 구독 시작 
	@ResponseBody
	@RequestMapping(value="/Subscribe", method = RequestMethod.POST)
	public String SubscribeGet(HttpSession session) {
		String nickName= (String) session.getAttribute("sNickName");
		
		return "";
	}
}
