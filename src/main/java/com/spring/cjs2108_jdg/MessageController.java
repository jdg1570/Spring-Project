package com.spring.cjs2108_jdg;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@RequestMapping(value="/msg/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model, HttpSession session) {
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
		String strLevel = session.getAttribute("sStrLevel")==null ? "" : (String) session.getAttribute("sStrLevel");
		
		if(msgFlag.equals("IdCheckNo")) {
			model.addAttribute("msg", "아이디가 이미 존재합니다.");
			model.addAttribute("url", "member/Join");
		}
		else if(msgFlag.equals("NickCheckNo")) {
			model.addAttribute("msg", "이미 사용중인 닉네임입니다");
			model.addAttribute("url", "member/Join");
		}
		else if(msgFlag.equals("JoinOk")) {
			model.addAttribute("msg", "회원가입을 환영합니다");
			model.addAttribute("url", "member/Login");
		}
		else if(msgFlag.equals("IdSearchNo")) {
			model.addAttribute("msg", "일치하는 아이디가 없습니다.");
			model.addAttribute("url", "member/IdSearch");
		}
		else if(msgFlag.equals("pwdSearchOk")) {
			model.addAttribute("msg", "입력하신 메일로 비밀번호를 발송하였습니다.");
			model.addAttribute("url", "member/PwdSearch");
		}
		else if(msgFlag.equals("LoginNo")) {
			model.addAttribute("msg", "로그인 실패");
			model.addAttribute("url", "member/Login");
		}
		else if(msgFlag.equals("Logout")) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("url", "member/Login");
		}
		else if(msgFlag.equals("UpdateOk")) {
			model.addAttribute("msg", "정보가 변경되었습니다.");
			model.addAttribute("url", "member/MemberUpdate");
		}
		else if(msgFlag.equals("UpdateNo")) {
			model.addAttribute("msg", "정보변경 실패");
			model.addAttribute("url", "member/Main");
		}
		else if(msgFlag.equals("ProductOk")) {
			model.addAttribute("msg", "상품 등록 완료");
			model.addAttribute("url", "admin/ProductInput");
		}
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "로그인후 사용하세요");
			model.addAttribute("url", "member/Login");
		}
		else if(msgFlag.equals("ProductUpdateOk")) {
			model.addAttribute("msg", "상품 수정 완료");
			model.addAttribute("url", "admin/ProductList");
		}	
		else if(msgFlag.equals("MemberOutOk")) {
			model.addAttribute("msg", "회원 탈퇴 완료");
			model.addAttribute("url", "member/Login");
		}	
		else if(msgFlag.equals("pwdCheckNo")) {
			model.addAttribute("msg", "비밀번호를 확인하세요.");
			model.addAttribute("url", "member/MemberOut");
		}	
		else if(msgFlag.equals("pwdCheckNo2")) {
			model.addAttribute("msg", "비밀번호를 확인하세요.");
			model.addAttribute("url", "member/MemberPwdCheck");
		}	
		else if(msgFlag.equals("EventInputOk")) {
			model.addAttribute("msg", "이벤트가 등록되었습니다.");
			model.addAttribute("url", "admin/Adminpage");
		}	
		else if(msgFlag.equals("EventInputNo")) {
			model.addAttribute("msg", "이벤트가 등록 실패");
			model.addAttribute("url", "admin/Adminpage");
		}	
		else if(msgFlag.equals("EventUpdateOk")) {
			model.addAttribute("msg", "이벤트가 수정되었습니다.");
			model.addAttribute("url", "event/EventList");
		}	
		else if(msgFlag.equals("EventUpdateNo")) {
			model.addAttribute("msg", "이벤트 수정 실패");
			model.addAttribute("url", "event/EventList");
		}
		else if(msgFlag.equals("boardInputOk")) {
			model.addAttribute("msg", "게시물이 등록되었습니다.");
			model.addAttribute("url", "board/BoardList");
		}
		else if(msgFlag.equals("boardDeleteOk")) {
			model.addAttribute("msg", "게시물이 삭제되었습니다.");
			model.addAttribute("url", "board/BoardList");
		}
		else if(msgFlag.equals("inquriyInputOk")) {
			model.addAttribute("msg", "문의글이 등록되었습니다.");
			model.addAttribute("url", "member/inquiry");
		}
		else if(msgFlag.equals("inquiryUpdateOk")) {
			model.addAttribute("msg", "문의글이 수정되었습니다.");
			model.addAttribute("url", "member/inquiryCheck");
		}
		else if(msgFlag.equals("InquiryReplyOk")) {
			model.addAttribute("msg", "답글이 등록되었습니다.");
			model.addAttribute("url", "admin/Inquiry");
		}
		else if(msgFlag.equals("memberOutOk")) {
			model.addAttribute("msg", "탈퇴가 처리되었습니다.");
			model.addAttribute("url", "admin/MemberList");
		}
		
		
		
		else if(msgFlag.substring(0,11).equals("alreadyRead")) {
			model.addAttribute("msg", "이미 완독한 도서입니다.");
			model.addAttribute("url", "mybook/bookRead?"+msgFlag.substring(12));
		}
		else if(msgFlag.substring(0,13).equals("BoardUpdateOk")) {
			model.addAttribute("msg", "게시물이 수정되었습니다.");
			model.addAttribute("url", "board/BoardContent?"+msgFlag.substring(14));
		}
		else if(msgFlag.substring(0,13).equals("myBookInputOk")) {
			model.addAttribute("msg", "내 서제에 담겼습니다.");
			model.addAttribute("url", "admin/ProductContent?"+msgFlag.substring(14));
		}	
		else if(msgFlag.substring(0,11).equals("alreadyBook")) {
			model.addAttribute("msg", "이미 서재에 있는 책입니다.");
			model.addAttribute("url", "admin/ProductContent?"+msgFlag.substring(12));
		}	
		
		return "include/message";
	}
	
}
