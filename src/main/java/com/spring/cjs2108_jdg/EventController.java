  package com.spring.cjs2108_jdg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.EventService;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.EventVO;

@Controller
@RequestMapping("/event")
public class EventController {
	String msgFlag = "";
	
	@Autowired
	EventService eventService;
	
	@Autowired
	AdminService adminService;
	
	// 이벤트 호출
	@RequestMapping(value="/EventInput", method = RequestMethod.GET)
	public String EventInputGet() {
		return "event/EventInput";
	}
	
	// 이벤트 수정 호출
	@RequestMapping(value="/EventChange", method = RequestMethod.GET)
	public String EventChangeGet(Model model, int eventIdx) {
		
		EventVO vo = eventService.setIdxCheck(eventIdx);
		if(vo.getEventContent().indexOf("src=\"/") != -1) adminService.imgCheckUpdate(vo.getEventContent());
		model.addAttribute("vo", vo);
		return "event/EventChange";
	}
	
	// 이벤트 수정 처리
	@RequestMapping(value="/EventChange", method = RequestMethod.POST)
	public String EventChangePost(MultipartFile fName, EventVO vo)  {
		
		int res = eventService.setEventUpdate(fName, vo);
		
		if(res == 1) {
			msgFlag = "EventUpdateOk";
		}
		else {
			msgFlag = "EventUpdateNo";
		}
		
		return "redirect:/msg/" + msgFlag;
	}
	
	// 이벤트 등록
	@RequestMapping(value="/EventInput", method = RequestMethod.POST)
	public String EventInputPost(MultipartFile fName, EventVO vo) {
		
		int res = eventService.setEventInput(fName, vo);
		if(res == 1) msgFlag = "EventInputOk";
		else msgFlag = "EventInputNo";
				
		return "redirect:/msg/" + msgFlag;
	}
	
	// 이벤트 리스트
	@RequestMapping(value="/EventList", method = RequestMethod.GET)
	String EventListGet(Model model,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag) {
		
		  int totRecCnt = eventService.totRecCnt();		// 전체자료 갯수 검색
		  int pageSize = 3;
		  int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		  int startIndexNo = (pag - 1) * pageSize;
		  int curScrStartNo = totRecCnt - startIndexNo;
		  int blockSize = 3;		// 한블록의 크기를 3개의 Page로 본다.(사용자가 지정한다.)
		  int curBlock = (pag - 1) / blockSize;		// 현재페이지의 블록위치
		  int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		  List<EventVO> eVos = eventService.getEventList(startIndexNo,pageSize);
		  
		  model.addAttribute("eVos", eVos);
	 	  model.addAttribute("pag", pag);
	 	  model.addAttribute("totRecCnt", totRecCnt);
		  model.addAttribute("pageSize", pageSize);
		  model.addAttribute("totPage", totPage);
		  model.addAttribute("curScrStartNo", curScrStartNo);
		  model.addAttribute("blockSize", blockSize);
		  model.addAttribute("curBlock", curBlock);
		  model.addAttribute("lastBlock", lastBlock);
	  
		return "event/EventList";
	}
	
	// 이벤트 삭제
	@ResponseBody
	@RequestMapping(value="/EventList", method = RequestMethod.POST)
	public String EventListPost(String delItems) {
		String[] idxs = delItems.split("/");
		for(String idx : idxs) {
			eventService.setEventDelete(Integer.parseInt(idx));
		}
		return "";
	}
	
	// 이벤트 내용 호출
	@RequestMapping(value="/EventContent", method = RequestMethod.GET)
	public String EventContentGet(int eventIdx, Model model) {
		
		EventVO vo = eventService.getEventContent(eventIdx);
		model.addAttribute("vo", vo);
		
		// 댓글
		List<EventReplyVO> rVos = eventService.getEventReply(eventIdx);
		int replyCnt = eventService.getReplyCnt(eventIdx);
		
		model.addAttribute("rVos",rVos);
		model.addAttribute("replyCnt",replyCnt);
		
		return "event/EventContent";
	}
	
	// 댓글 입력
	@ResponseBody
	@RequestMapping(value="/ReplyInsert", method = RequestMethod.POST)
	String ReplyInsertPost(EventReplyVO rvo) {
		int levelOrder = 0;
		String strLevelOrder = eventService.maxLevelOrder(rvo.getEventIdx());
		if(strLevelOrder != null) levelOrder = Integer.parseInt(strLevelOrder)+1;
		rvo.setLevelOrder(levelOrder);
		
		eventService.setReplyInsert(rvo);
		return"";
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/ReplyDelete", method = RequestMethod.POST)
	String ReplyDeletePost(int replyIdx) {
		eventService.ReplyDelete(replyIdx);
		return"";
	}
	
	// 답글 저장
	@ResponseBody
	@RequestMapping(value="/ReplyInsert2", method = RequestMethod.POST)
	String ReplyInsert2Post(EventReplyVO rvo) {
		eventService.levelOrderUp(rvo);
		rvo.setLevel(rvo.getLevel()+1);
		rvo.setLevelOrder(rvo.getLevelOrder()+1);
		
		eventService.setReplyInsert2(rvo);
		return "";
	}
	
}
