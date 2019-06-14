package com.freshcoffee.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.freshcoffee.domain.board.BoardDTO;
import com.freshcoffee.persistence.board.Pager;
import com.freshcoffee.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	// 게시글 전체 리스트 출력
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public ModelAndView list(
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage) {
		log.info(">>> 게시글 목록 출력");
//		레코드 갯수 계산
		int count = service.countArticle(search_option, keyword);
		
//		페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
//		페이지에 출력할 게시글 목록
		List<BoardDTO> list = service.listAll(sort_option, search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView();
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/list");
		mav.addObject("map", map);
		
				
//		model.addAttribute("map", map);
//		return "board/list";
		return mav;
	}
	
	@RequestMapping(value = "view", method=RequestMethod.GET)
	public String view(int bno, Model model, HttpSession session) {
		log.info("상세 게시글 출력");
//		조회수 증가 처리
		service.increaseViewCnt(bno, session);
		log.info("조회수 증가 완료");
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one", bDto);
		
		return "board/view";
	}
	
	@RequestMapping(value = "create", method=RequestMethod.GET)
	public String createView() {
		log.info("게시글 등록 페이지 출력");
		
		return "board/register";
	}
	@RequestMapping(value = "create", method=RequestMethod.POST)
	public String create(BoardDTO bDto,HttpSession session) {
		log.info("게시글 등록 페이지 출력");
		service.create(bDto);
		
		String writer = (String)session.getAttribute("userid");
		bDto.setWriter(writer);
		return "redirect:/board/view?bno=" + bDto.getBno();
	}
	@RequestMapping(value = "delete", method=RequestMethod.GET)
	public void delete(int bno) {
		log.info("delete 게시판 삭제");
		
		service.delete(bno);
	}
	
	@RequestMapping(value = "update", method=RequestMethod.GET)
	public String updateView(int bno, Model model) {
		log.info("update 게시판 수정");
		BoardDTO bDto = service.read(bno);
		
		model.addAttribute("one", bDto);
		
		return "board/modify";
	}
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public String updatePlay(BoardDTO bDto) {
		log.info("update 게시판 수정action");
		service.update(bDto);
		
		return "redirect:/board/list";
	}
}
