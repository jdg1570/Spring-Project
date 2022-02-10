package com.spring.cjs2108_jdg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs2108_jdg.dao.SearchDAO;
import com.spring.cjs2108_jdg.vo.BooksVO;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchDAO searchDAO;

	@Override
	public int totRecCnt(String sWord, String bookType) {
		return searchDAO.totRecCnt(sWord, bookType);
	}

	@Override
	public List<BooksVO> getProductList(int startIndexNo, int pageSize, String sWord, String bookType) {
		return searchDAO.getProductList(startIndexNo, pageSize, sWord, bookType);
	}

}
