package com.freshcoffee.persistence.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.freshcoffee.domain.board.BoardDTO;

public interface BoardDAO {
	public void create(BoardDTO bDto);//게시글  등록
	public void update(BoardDTO bDto); //게시글 수정
	public void delete(int bno); // 게시글 삭제
	public BoardDTO read(int bno); // 상세 게시글
	public List<BoardDTO>	listAll(String sort_option, String search_option, String keyword, int start, int end);//게시글 목록
//	조회수 증가 처리
	public void increaseViewCnt(int bno, HttpSession session);
//	레코드 갯수 계산
	public int countArticle(String search_option, String keyword);
}
