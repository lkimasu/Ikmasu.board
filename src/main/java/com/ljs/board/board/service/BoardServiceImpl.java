package com.ljs.board.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ljs.board.board.domain.BoardVO;
import com.ljs.board.board.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	private final BoardDAO boardDAO;

	@Inject
	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public BoardVO selectBoardDetail(int idx) throws Exception {
		boardDAO.updateHitCnt(idx);
		return boardDAO.selectBoardDetail(idx);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		boardDAO.update(vo);
		
	}

	@Override
	public void delete(int idx) throws Exception {
		boardDAO.delete(idx);
		
	}

	@Override
	public List<Map<String, Object>> selectBoardList(int start, int end, String searchWord) throws Exception {
		return boardDAO.selectBoardList(start,end,searchWord);
	}
	@Override
	public int BoardCnt(String searchWord) throws Exception {
		return boardDAO.BoardCnt(searchWord);
	}
}
