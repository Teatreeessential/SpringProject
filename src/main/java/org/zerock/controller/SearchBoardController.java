package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class SearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception{
		//총 게시글의 갯수를 넘겨 준다.
		cri.setAll_page_num(service.listSearchCount(cri));
		//조건을 만족하는 게시물을 페이징 처리하여 값을 가져온다.
		List<BoardVO> list = service.listSearch(cri);
		//페이지의 시작과 끝 그리고 현재 페이지 부분을 넘겨준다.
		//이는 하단의 페이지 번호를 표현하고 현재 페이지 값을 통해 클릭 시 색깔이 변하게끔 만든다.
		model.addAttribute("cri",cri);
		model.addAttribute("start_page",cri.start_page());
		model.addAttribute("end_page",cri.end_page());
		model.addAttribute("current_page",cri.getPage());
		model.addAttribute("last_page",cri.getMaxPage());
		//list는 현재 페이지에서 찾은 결과값을 의미한다.
		model.addAttribute("board_list",list);
		logger.info("show all list...");
	}
}
