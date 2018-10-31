package com.ljs.board.board.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ljs.board.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	private static final String namespace ="com.ljs.board.mappers.board.BoardMapper";
	private final SqlSession sqlSession;
	
	@Inject
	public BoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		sqlSession.insert(namespace+".insertBoard",vo);
		
	}

	@Override
	public BoardVO selectBoardDetail(int idx) throws Exception {
		return sqlSession.selectOne(namespace+".selectBoardDetail",idx);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update(namespace+".updateBoard",vo);
		
	}

	@Override
	public void delete(int idx) throws Exception {
		sqlSession.delete(namespace+".deleteBoard",idx);
		
	}

	@Override
	public List<Map<String, Object>> selectBoardList(int start,int end,String searchWord) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchWord", searchWord);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList(namespace+".selectBoardList",map);
	}
	@Override
	public int BoardCnt(String searchWord) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("searchWord", searchWord);
		return sqlSession.selectOne(namespace+".BoardCnt",map);
	}
	@Override
	public void updateHitCnt(int idx) {
		sqlSession.selectOne(namespace+".updateHitCnt",idx);
		
	}

}
