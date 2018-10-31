package com.ljs.board.board.persistence;

import java.util.List;
import java.util.Map;

import com.ljs.board.board.domain.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO vo) throws Exception;
	BoardVO selectBoardDetail(int idx) throws Exception;
	void update(BoardVO vo) throws Exception;
	void delete(int idx) throws Exception;
	List<Map<String, Object>> selectBoardList(int start,int end,String searchWord) throws Exception;
	int BoardCnt(String searchWord) throws Exception;
	void updateHitCnt(int idx) throws Exception;
}
