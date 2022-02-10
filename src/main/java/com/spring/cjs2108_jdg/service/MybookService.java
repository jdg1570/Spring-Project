package com.spring.cjs2108_jdg.service;

import java.util.List;

import com.spring.cjs2108_jdg.vo.MyBookVO;

public interface MybookService {

	public List<MyBookVO> getMybookList(String nickName, int sort);

	public MyBookVO getBookText(String bookText, String nickName);

	public void myBookDelete(int idx);

	public void ReadBook(int bookIdx, String nickName);

	public MyBookVO getBookSearch(int bookIdx, String nickName);

	public void updateReadDate(int bookIdx, String nickName);

	public void updateReadNum(int bookIdx);

	public List<MyBookVO> getBookType(String nickName);

	public List<MyBookVO> getPrimeTime(String nickName);

	public List<MyBookVO> getBookDate(String nickName);





}