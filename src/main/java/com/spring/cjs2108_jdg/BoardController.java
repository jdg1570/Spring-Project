package com.spring.cjs2108_jdg;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.BoardService;
import com.spring.cjs2108_jdg.vo.BoardLikeVO;
import com.spring.cjs2108_jdg.vo.BoardReplyVO;
import com.spring.cjs2108_jdg.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	String msgFlag = "";
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	AdminService adminService;
	
	
	// 글쓰기 호출
	@RequestMapping(value="/BoardInput", method = RequestMethod.GET)
	public String BoardInputGet() {
		return "board/BoardInput";
	}
	
	//  게시판 글쓰기
	@RequestMapping(value="/BoardInput", method = RequestMethod.POST)
	public String BoardInputPost(BoardVO vo) {
		
		boardService.imgCheck(vo.getContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		if(vo.getNickName().equals("관리자")) {
			boardService.setAdminInput(vo);
		}
		else {
			boardService.setBoardInput(vo);
		}
		
		msgFlag = "boardInputOk";
		return "redirect:/msg/" + msgFlag;
		
	}
	
	// 게시판 리스트
	@RequestMapping(value="/BoardList", method = RequestMethod.GET)
	public String BoardListGet(
		@RequestParam(name="pag", defaultValue="1", required=false) int pag,
		@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
		@RequestParam(name="menuSw", defaultValue="0", required=false) int menuSw,
		Model model, String part, String search, String searchString) {
		
	    int totRecCnt = boardService.totRecCnt(pageSize, part, search, searchString);		
	    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
	    int startIndexNo = (pag - 1) * pageSize;
	    int curScrStrarNo = totRecCnt - startIndexNo;
	    int blockSize = 3;		
	    int curBlock = (pag - 1) / blockSize;		
	    int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
	    List<BoardVO> vos = boardService.getBoardList(startIndexNo, pageSize, part, search, searchString, menuSw);
	    
		model.addAttribute("vos", vos);
		model.addAttribute("pag", pag);
		model.addAttribute("part", part);
		model.addAttribute("search", search);
		model.addAttribute("searchString", searchString);
		model.addAttribute("menuSw", menuSw);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStrarNo", curScrStrarNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		
		return "board/BoardList";
	}
	
	// 게시판 검색
	@RequestMapping(value="/BoardSearch", method = RequestMethod.GET)
	public String BoardSearchGet() {
		
		return "board/BoardSearch";
	}
	
	// 게시판 상세내용
	@RequestMapping(value="/BoardContent", method = RequestMethod.GET)
	public String BoardContentGet(int idx, int pag, int pageSize, Model model, HttpServletRequest request, HttpSession session) {
		String nickName= (String) session.getAttribute("sNickName");
		
		// 내용 가져오기
		BoardVO vo = boardService.getBoardContent(idx);
		
		String bLevel = "";
		if(vo.getLevel()==1) bLevel = "정회원";
		else if(vo.getLevel()==2) bLevel = "우수회원";
		else bLevel= "관리자";
		
		// 조회수 중복 방지
		session = request.getSession();
		ArrayList<String> contentIdx = (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) {
			contentIdx = new ArrayList<String>();
			session.setAttribute("sContentIdx", contentIdx);
		}
		String imsIdx = session.getId() + "board" + idx;
		if(!contentIdx.contains(imsIdx)) {
			boardService.addReadNum(idx);
			contentIdx.add(imsIdx);
		}
		
		// 이전,다음글
		List<BoardVO> pnVos = boardService.getPreNext(idx);
		
		// 댓글
		List<BoardReplyVO> rVos = boardService.getBoardReply(idx);
		int replyCnt = boardService.getReplyCnt(idx);
		
		// 좋아요 수
		List<BoardLikeVO> lVos = boardService.getBoardLike(idx, nickName); 
		int likeNum = boardService.getLikeNum(idx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("bLevel",bLevel);
		model.addAttribute("pnVos",pnVos);
		model.addAttribute("rVos",rVos);
		model.addAttribute("replyCnt",replyCnt);
		model.addAttribute("likeNum",likeNum);
		model.addAttribute("lVos",lVos);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pag",pag);
		
		return "board/BoardContent";
	}
	
	// 게시물 수정 폼
	@RequestMapping(value="/BoardUpdate", method = RequestMethod.GET)
	public String BoardUpdateGet(int idx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			int pageSize, Model model) {
		BoardVO vo = boardService.getBoardContent(idx);
		
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgCheckUpdate(vo.getContent());
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageSize", pageSize);
		
		return "board/BoardUpdate";
	}
	
	// 게시물 수정 처리
	@RequestMapping(value="/BoardUpdate", method = RequestMethod.POST)
	public String BoardUpdatePost(BoardVO vo,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			int pageSize ) {
		
		if(vo.getOriContent().indexOf("src=\"/") != -1) boardService.imgDelete(vo.getOriContent());
		
		vo.setContent(vo.getContent().replace("/data/ckeditor/board/", "/data/ckeditor/"));
		boardService.imgCheck(vo.getContent());
		vo.setContent(vo.getContent().replace("/data/ckeditor/", "/data/ckeditor/board/"));
		
		boardService.setBoardUpdate(vo);
		
		msgFlag = "BoardUpdateOk$idx="+vo.getIdx()+"&pag="+pag+"&pageSize="+pageSize;
		return "redirect:/msg/" + msgFlag;
	}
	
	// 게시글 삭제
	@RequestMapping(value="/BoardDelete")
	public String BoardDeleteGet(int idx, 
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			int pageSize) {
		
		BoardVO vo = boardService.getBoardContent(idx);
		if(vo.getContent().indexOf("src=\"/") != -1) boardService.imgDelete(vo.getContent());
		
		boardService.setBoardDelete(idx);
		
		msgFlag = "boardDeleteOk";
		return "redirect:/msg/" + msgFlag;
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="/ReplyInsert", method =  RequestMethod.POST)
	public String ReplyInsertPost(BoardReplyVO rvo) {
		int levelOrder = 0;
		String strLevelOrder = boardService.maxLevelOrder(rvo.getBoardIdx());
		if(strLevelOrder != null) levelOrder = Integer.parseInt(strLevelOrder)+1;
		rvo.setLevelOrder(levelOrder);
		
		boardService.setReplyInsert(rvo);
		
		return "";
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="/ReplyDelete", method = RequestMethod.POST)
	String ReplyDeletePost(int replyIdx) {
		boardService.ReplyDelete(replyIdx);
		return"";
	}
	
	// 답글 저장
	@ResponseBody
	@RequestMapping(value="/ReplyInsert2", method = RequestMethod.POST)
	String ReplyInsert2Post(BoardReplyVO rvo) {
		boardService.levelOrderUp(rvo);
		rvo.setLevel(rvo.getLevel()+1);
		rvo.setLevelOrder(rvo.getLevelOrder()+1);
		
		boardService.setReplyInsert2(rvo);
		
		return "";
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="/replyUpdateCheck", method = RequestMethod.POST)
	public String replyUpdateCheckPost(BoardReplyVO rvo, int replyIdx) {
		rvo = boardService.ReplyUpdate(replyIdx);
		return "";
	}
	
	
	 // 좋아요 up
	  @ResponseBody
	  @RequestMapping(value="/LikeUp", method = RequestMethod.POST) 
	  public String LikeUpPost(int idx, HttpSession session, BoardLikeVO vo) { 
		  String nickName= (String) session.getAttribute("sNickName");
		  vo.setNickName(nickName);
		  vo.setBoardIdx(idx);
			
		  BoardLikeVO imsVO = boardService.boardSearch(vo);
		  if(imsVO == null) {
	   		  vo.setLikeIdx(-1);
			  boardService.likeInsert(vo);
			  boardService.likeNumUpdate(vo);
		  }
		  else {
			  boardService.likeUpdate(imsVO);
			  boardService.likeNumUpdate(imsVO);
			  boardService.likeNumList(idx);
		  }
		  return "";
	  }
	
	
}
