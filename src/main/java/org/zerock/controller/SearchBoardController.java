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
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void listAll(Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception{
		List<BoardVO> list = service.ListAll();
		//총 게시글의 갯수를 넘겨 준다.
		//현재 요청한 페이지가 몇 페이지 인지 알려 준다.
		cri.setAll_page_num(list.size());
		//페이지의 시작과 끝 그리고 현재 페이지 부분을 넘겨준다.
		model.addAttribute("cri",cri);
		model.addAttribute("start_page",cri.start_page());
		model.addAttribute("end_page",cri.end_page());
		model.addAttribute("current_page",cri.getPage());
		model.addAttribute("last_page",cri.getMaxPage());
		//listpage는 현재 페이지의 게시글을 담은객체
		model.addAttribute("board_list",service.listPage(cri));
		logger.info("show all list...");
	}
}
