package com.ljs.board.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ljs.board.board.domain.BoardVO;
import com.ljs.board.board.service.BoardService;


@Controller

public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@Inject
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	//게시판 입력 창
	@RequestMapping(value="/board/boardwrite.do", method=RequestMethod.GET)
	public String openBoardWrite() {
		logger.info("write GET...");
		return "/board/boardWrite";
	}
	
	@RequestMapping(value="/board/insertBoard.do",method=RequestMethod.POST)
	public String insertBoard(BoardVO vo) throws Exception{
		
		boardService.insertBoard(vo);
		return "redirect:/board/boardList.do";
		
	}
	
	@RequestMapping(value="/board/boardList.do")
    public ModelAndView BoardList2() throws Exception{
		
    	ModelAndView mv = new ModelAndView("/board/boardList");
    	return mv;
   }
	
	@ResponseBody
	@RequestMapping(value="/board/boardList2.do")
	
	public Map<String,Object> BoardList(@RequestParam(defaultValue="1") int curPage , String searchWord) throws Exception{

		int count = boardService.BoardCnt(searchWord);
		BoardPager boardPager = new BoardPager(count,curPage);
		int start = boardPager.getPageBegin();	
		int end = boardPager.getPageEnd();
		List<Map<String,Object>> list = boardService.selectBoardList(start,end,searchWord);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("boardPager",boardPager);
		return map;
    } 
	//게시물 읽기
	@RequestMapping(value="/board/boardDetail.do",method=RequestMethod.GET)
	public String boardDetail(@RequestParam(value="IDX",required=false) int IDX,Model model) throws Exception{
		
		logger.info("read...");
		model.addAttribute("board",boardService.selectBoardDetail(IDX));
		return "/board/boardDetail";
		
	}
	
	// 수정 페이지 이동
	@RequestMapping(value = "/board/boardUpdate.do")
	public String openBoardUpdate(@RequestParam(value="IDX",required=false) int IDX,Model model) throws Exception{
		
		logger.info("modifyGet ...");
		model.addAttribute("board", boardService.selectBoardDetail(IDX));
		return "/board/boardUpdate";
	}
	
	//수정 처리
	@RequestMapping(value="/board/updateBoard.do")
	public String modifyPost(BoardVO vo) throws Exception{
		logger.info("modifyPOST ...");
		boardService.update(vo);
		return "redirect:/board/boardList.do";
		
	}
	
	//삭제
	@RequestMapping(value="/board/deleteBoard.do",method=RequestMethod.POST)
	public String deleteBoard(int idx) throws Exception{
		logger.info("remove....");
		boardService.delete(idx);
		return "redirect:/board/boardList.do";
		
	}

	
}
