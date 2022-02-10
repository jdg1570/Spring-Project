package com.spring.cjs2108_jdg.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs2108_jdg.dao.EventsDAO;
import com.spring.cjs2108_jdg.vo.EventReplyVO;
import com.spring.cjs2108_jdg.vo.EventVO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventsDAO eventsDAO;

	
	@Override
	public int setEventInput(MultipartFile fName, EventVO vo) {
		int res = 0;
		try {
			String oriFileName = fName.getOriginalFilename();
			if(oriFileName != "" && oriFileName != null) {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oriFileName;
				writeFile(fName, saveFileName);
				vo.setEventImage(saveFileName);
			}
			eventsDAO.setEventinput(vo);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}

	private void writeFile(MultipartFile fName, String saveFileName) throws IOException {
		byte[] data = fName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/event/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public int totRecCnt() {
		return eventsDAO.totRecCnt();
	}

	@Override
	public List<EventVO> getEventList(int startIndexNo, int pageSize) {
		return eventsDAO.getEventList(startIndexNo,pageSize );
	}

	@Override
	public EventVO setIdxCheck(int eventIdx) {
		return eventsDAO.setIdxCheck(eventIdx);
	}

	// 이벤트 수정
	@Override
	public int setEventUpdate(MultipartFile fName, EventVO vo) {
		int res = 0;
		try {
			String oFileName = fName.getOriginalFilename();
			if(oFileName != "" && oFileName != null) {
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/event/");
				if(!vo.getEventImage().equals("")) {
					new File(uploadPath + vo.getEventImage()).delete();
				}	
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				writeFile(fName, saveFileName);
				vo.setEventImage(saveFileName);
			}
			eventsDAO.setEventUpdate(vo);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		return res;	
	}

	@Override
	public void setEventDelete(int eventIdx) {
		eventsDAO.setEventDelete(eventIdx);
	}

	@Override
	public List<EventVO> getEventshow() {
		return eventsDAO.getEventshow();
	}

	@Override
	public EventVO getEventContent(int eventIdx) {
		return eventsDAO.getEventContent(eventIdx);
	}

	@Override
	public String maxLevelOrder(int eventIdx) {
		return eventsDAO.maxLevelOrder(eventIdx);
	}

	@Override
	public void setReplyInsert(EventReplyVO rvo) {
		eventsDAO.setReplyInsert(rvo);
	}

	@Override
	public List<EventReplyVO> getEventReply(int eventIdx) {
		return eventsDAO.getEventReply(eventIdx);
	}

	@Override
	public void ReplyDelete(int replyIdx) {
		eventsDAO.ReplyDelete(replyIdx);
	}

	@Override
	public void levelOrderUp(EventReplyVO rvo) {
		eventsDAO.levelOrderUp(rvo);
	}

	@Override
	public void setReplyInsert2(EventReplyVO rvo) {
		eventsDAO.setReplyInsert2(rvo);
	}

	@Override
	public int getReplyCnt(int eventIdx) {
		return eventsDAO.getReplyCnt(eventIdx);
	}

}
