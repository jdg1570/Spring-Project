package com.spring.cjs2108_jdg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.EventVO;

public interface EventsDAO {

	public int totRecCnt();

	public List<EventVO> getEventList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public void setEventinput(@Param("vo") EventVO vo);

	public EventVO setIdxCheck(@Param("eventIdx") int eventIdx);

	public void setEventUpdate(@Param("vo") EventVO vo);

	public void setEventDelete(@Param("eventIdx") int eventIdx);

	public List<EventVO> getEventshow();

	public EventVO getEventContent(@Param("eventIdx") int eventIdx);

	public String maxLevelOrder(@Param("eventIdx") int eventIdx);

	public void setReplyInsert(@Param("rvo") EventReplyVO rvo);

	public List<EventReplyVO> getEventReply(@Param("eventIdx") int eventIdx);

	public void ReplyDelete(@Param("replyIdx") int replyIdx);

	public void levelOrderUp(@Param("rvo") EventReplyVO rvo);

	public void setReplyInsert2(@Param("rvo") EventReplyVO rvo);

	public int getReplyCnt(@Param("eventIdx") int eventIdx);

	

}
