package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoaradController {
	private static final Logger logger = LoggerFactory.getLogger(BoaradController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET(BoardVO board,Model model) throws Exception{
		logger.info("글쓰기 등록 화면");
		
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(BoardVO board,Model model) throws Exception{
		service.register(board);
		model.addAttribute("result","success");
		return "redirect:/board/listAll";
	}
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(String bno, Model model)throws Exception{
		service.viewcnt(Integer.parseInt(bno));
		model.addAttribute("one_board",service.read(Integer.parseInt(bno)));
	}
	@RequestMapping(value="/listAll",method=RequestMethod.GET)
	public void listAll(Model model,@RequestParam(value="page",defaultValue="1") int page) throws Exception{
		List<BoardVO> list = service.ListAll();
		//총 게시글의 갯수를 넘겨 준다.
		Criteria cri = new Criteria(list.size());
		//현재 요청한 페이지가 몇 페이지 인지 알려 준다.
		cri.setPage(page);
		//페이지의 시작과 끝 그리고 현재 페이지 부분을 넘겨준다.
		model.addAttribute("start_page",cri.start_page());
		model.addAttribute("end_page",cri.end_page());
		model.addAttribute("current_page",page);
		model.addAttribute("last_page",cri.getMaxPage());
		//listpage는 현재 페이지의 게시글을 담은객체
		model.addAttribute("board_list",service.listPage(cri));
		logger.info("show all list...");
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(BoardVO vo,RedirectAttributes rttr)throws Exception{
		service.modify(vo);
		rttr.addFlashAttribute("msg",vo.getBno()+"번째 게시글이 수정 되었습니다.");
		String bno = String.valueOf(vo.getBno());
		return "redirect:/board/read?bno="+bno;
	}
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(String bno, RedirectAttributes rttr)throws Exception{
		service.remove(Integer.parseInt(bno));
		rttr.addFlashAttribute("msg",bno+"번째 게시글이 삭제 되었습니다.");
		return "redirect:/board/listAll";
	}
	
}
