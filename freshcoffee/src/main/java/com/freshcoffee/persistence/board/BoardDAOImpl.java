package com.freshcoffee.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.freshcoffee.domain.board.BoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public int create(BoardDTO bDto) {
		return sqlSession.insert("board.create", bDto);
		
	}

	@Override
	public void update(BoardDTO bDto) {
		sqlSession.update("board.update", bDto);
		
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete("board.delete", bno);
		
	}

	@Override
	public BoardDTO read(int bno) {
		return sqlSession.selectOne("board.read", bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll" , map);
	}

	@Override
	public void increaseViewCnt(int bno) {
		sqlSession.update("board.increaseViewCnt", bno);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>(); // Map<String, String> 키, 벨류 페어라고 한다
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		log.info("검색옵션"+ map.get("search_option"));
		log.info("검색단어"+ map.get("keyword"));
		
		return sqlSession.selectOne("board.countArticle",map);
	}

	@Override
	public void updateReplyCnt(HashMap<String, Object> map) {
		sqlSession.update("board.updateReplyCnt", map);
	}

	@Override
	public void updateStep(int ref, int re_step) {
		Map<String, Integer> map = new HashMap<>();
		map.put("ref", ref);
		map.put("re_step", re_step);
		sqlSession.update("board.updateStep" , map);
	}

	@Override
	public void answer(BoardDTO bDto) {
		sqlSession.insert("board.answer", bDto);
	}

}
