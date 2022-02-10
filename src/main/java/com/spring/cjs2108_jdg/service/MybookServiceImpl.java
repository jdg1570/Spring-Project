package com.spring.cjs2108_jdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_jdg.dao.MybookDAO;
import com.spring.cjs2108_jdg.vo.MyBookVO;

@Service
public class MybookServiceImpl implements MybookService {
	@Autowired
	MybookDAO mybookDAO;

	@Override
	public List<MyBookVO> getMybookList(String nickName, int sort) {
		return mybookDAO.getMybookList(nickName, sort);
	}

	@Override
	public MyBookVO getBookText(String bookText, String nickName) {
		return mybookDAO.getBookText(bookText, nickName);
	}

	@Override
	public void myBookDelete(int idx) {
		mybookDAO.myBookDelete(idx);
	}

	@Override
	public void ReadBook(int bookIdx, String nickName) {
		mybookDAO.ReadBook(bookIdx, nickName);
	}

	@Override
	public MyBookVO getBookSearch(int bookIdx, String nickName) {
		return mybookDAO.getBookSearch(bookIdx,nickName);
	}

	@Override
	public void updateReadDate(int bookIdx, String nickName) {
		mybookDAO.updateReadDate(bookIdx, nickName);
	}

	@Override
	public void updateReadNum(int bookIdx) {
		mybookDAO.updateReadNum(bookIdx);
	}

	@Override
	public List<MyBookVO> getBookType(String nickName) {
		return mybookDAO.getBookType(nickName);
	}

	@Override
	public List<MyBookVO> getPrimeTime(String nickName) {
		return mybookDAO.getPrimeTime(nickName);
	}

	@Override
	public List<MyBookVO> getBookDate(String nickName) {
		return mybookDAO.getBookDate(nickName);
	}





}
