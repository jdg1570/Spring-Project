package com.spring.cjs2108_jdg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cjs2108_jdg.service.AdminService;
import com.spring.cjs2108_jdg.service.MybookService;
import com.spring.cjs2108_jdg.service.SearchService;
import com.spring.cjs2108_jdg.vo.BooksVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchService searchService;
	
	
	@RequestMapping(value="/BookList", method = RequestMethod.GET)
	public String BOokListGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required=false) int pag,
			@RequestParam(name="sWord", defaultValue = "", required=false) String sWord,
			@RequestParam(name="bookType", defaultValue = "", required=false) String bookType) 	{
		
		int pageSize = 15;
		int totRecCnt = searchService.totRecCnt(sWord, bookType);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (totRecCnt/pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStrarNo = totRecCnt - startIndexNo;
		int blockSize = 5;		
		int curBlock = (pag - 1) / blockSize;	
		int lastBlock = (totPage % blockSize)==0 ? ((totPage / blockSize) - 1) : (totPage / blockSize);
		
		List<BooksVO> vos = searchService.getProductList(startIndexNo, pageSize, sWord, bookType);
		
		model.addAttribute("vos", vos);
	    model.addAttribute("pag", pag);
	    model.addAttribute("sWord", sWord);
	    model.addAttribute("bookType", bookType);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totPage", totPage);
	    model.addAttribute("curScrStrarNo", curScrStrarNo);
	    model.addAttribute("blockSize", blockSize);
	    model.addAttribute("curBlock", curBlock);
	    model.addAttribute("lastBlock", lastBlock);
	    model.addAttribute("totRecCnt", totRecCnt);
		
		return "search/BookList";
	}
}
