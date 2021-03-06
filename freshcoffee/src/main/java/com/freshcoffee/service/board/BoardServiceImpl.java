package com.freshcoffee.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.freshcoffee.domain.board.BoardDTO;
import com.freshcoffee.persistence.board.BoardDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bDao;
	
	@Transactional
	@Override
	public int create(BoardDTO bDto) {
		// 게시글 등록
		// attach 테이블에 첨부파일 이름 추
		int num1 = bDao.create(bDto);
		
		
		String[] files = bDto.getFiles();
		
		log.info(">>>>>>>^^"+files.length);
		
		for (String string : files) {
			System.out.println(string);
		}
		if (files == null) return num1; // 첨부파일 없으면 skip 
		
		for (String name : files) {
			
			log.info(name);
			num1 = bDao.addAttach(name);
			// attach 테이블에 insert
		}
		return num1;
		
	}

	@Override
	public void update(BoardDTO bDto) {
//		DB 가서 수정
		bDao.update(bDto);
	}

	@Override
	public void delete(int bno) {
		bDao.delete(bno);
	}

	@Override
	public BoardDTO read(int bno) {
		return bDao.read(bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		return bDao.listAll(sort_option, search_option, keyword, start, end);
	}
	
	@Transactional
	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		long update_time = 0;
		if (session.getAttribute("update_time_"+bno)!=null) {
//			최근에 조회수를 올린시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		log.info("boardService");
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
		return bDao.countArticle(search_option, keyword);
	}

	@Override
	public void answer(BoardDTO bDto) {
//		비즈니스 로직: 답글 등록
//		1. 답글 달려고하는 게시글의 re_step보다 큰답글들을 re_step + 1
		bDao.updateStep(bDto.getRef(), bDto.getRe_step());
//		2. 답글 테이블에 등록
		bDto.setRe_step(bDto.getRe_step() + 1);
		bDto.setRe_level(bDto.getRe_level() + 1);
		bDao.answer(bDto);
		
	}

	@Override
	public List<String> getAttach(int bno) {
		log.info("BoardServiceImpl getAttach 이동");
		
		return bDao.getAttach(bno);
	}

	

}
