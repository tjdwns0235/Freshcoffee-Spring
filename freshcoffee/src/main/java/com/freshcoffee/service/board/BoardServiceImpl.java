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

	}

	@Override
	public void delete(int bno) {

	}

	@Override
	public BoardDTO read(int bno) {
		return bDao.read(bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		return bDao.listAll(sort_option, search_option, keyword, start, end);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		long update_time = 0;
		if (session.getAttribute("update_time_"+bno)!=null) {
//			최근에 조회수를 올린시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		
//		일정 시간이 경과 한 후 조회수 증가 처리
		if (current_time - update_time > 24*60*60*1000) {
//			조회수 증가 처리
			bDao.increaseViewCnt(bno);
			
//			조회수를 올린 시간저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		// TODO Auto-generated method stub
		return bDao.countArticle(search_option, keyword);
	}

	

}
