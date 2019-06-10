package com.freshcoffee.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.freshcoffee.domain.board.BoardDTO;
import com.freshcoffee.persistence.board.BoardDAO;

public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bDao;

	@Override
	public void create(BoardDTO bDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(BoardDTO bDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDTO read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return bDao.listAll(sort_option, search_option, keyword, start, end);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		// TODO Auto-generated method stub

	}

	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return bDao.countArticle(search_option, keyword);
	}

}
