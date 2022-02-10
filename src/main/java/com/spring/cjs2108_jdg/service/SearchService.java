package com.spring.cjs2108_jdg.service;

import java.util.List;

import com.spring.cjs2108_jdg.vo.BooksVO;

public interface SearchService {

	public int totRecCnt(String sWord, String bookType);

	public List<BooksVO> getProductList(int startIndexNo, int pageSize, String sWord, String bookType);


}
