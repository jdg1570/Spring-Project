package com.spring.cjs2108_jdg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import com.spring.cjs2108_jdg.service.MybookService;
import com.spring.cjs2108_jdg.vo.MyBookVO;

public interface MybookDAO {

	public List<MyBookVO> getMybookList(@Param("nickName") String nickName, @Param("sort") int sort);

	public MyBookVO getBookText(@Param("bookText") String bookText, @Param("nickName") String nickName);

	public void myBookDelete(@Param("idx") int idx);

	public void ReadBook(@Param("bookIdx") int bookIdx, @Param("nickName") String nickName);

	public MyBookVO getBookSearch(@Param("bookIdx") int bookIdx, @Param("nickName") String nickName);

	public void updateReadDate(@Param("bookIdx") int bookIdx, @Param("nickName") String nickName);

	public void updateReadNum(@Param("bookIdx") int bookIdx);

	public List<MyBookVO> getBookType(@Param("nickName") String nickName);

	public List<MyBookVO> getPrimeTime(@Param("nickName") String nickName);

	public List<MyBookVO> getBookDate(@Param("nickName") String nickName);




}
