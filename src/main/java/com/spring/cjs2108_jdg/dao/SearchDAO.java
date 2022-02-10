package com.spring.cjs2108_jdg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs2108_jdg.vo.BooksVO;

import lombok.experimental.PackagePrivate;

public interface SearchDAO {

	public int totRecCnt(@Param("sWord") String sWord, @Param("bookType") String bookType);

	public List<BooksVO> getProductList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("sWord") String sWord, @Param("bookType") String bookType);


}
