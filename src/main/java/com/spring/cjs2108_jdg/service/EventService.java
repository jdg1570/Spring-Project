package com.spring.cjs2108_jdg.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.EventVO;

public interface EventService {

	public int setEventInput(MultipartFile fName, EventVO vo);

	public int totRecCnt();

	public List<EventVO> getEventList(int startIndexNo, int pageSize);

	public EventVO setIdxCheck(int eventIdx);

	public int setEventUpdate(MultipartFile fName, EventVO vo);

	public void setEventDelete(int eventIdx);

	public List<EventVO> getEventshow();

	public EventVO getEventContent(int eventIdx);

	public String maxLevelOrder(int eventIdx);

	public void setReplyInsert(EventReplyVO rvo);

	public List<EventReplyVO> getEventReply(int eventIdx);

	public void ReplyDelete(int replyIdx);

	public void levelOrderUp(EventReplyVO rvo);

	public void setReplyInsert2(EventReplyVO rvo);

	public int getReplyCnt(int eventIdx);


}
