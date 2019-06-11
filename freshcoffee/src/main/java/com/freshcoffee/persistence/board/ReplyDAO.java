package com.freshcoffee.persistence.board;

import java.util.List;

import com.freshcoffee.domain.board.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno); //댓글
	public void create(ReplyDTO rDto); // 댓글 등록
	public void delete(ReplyDTO rDto); // 댓글 삭제
}
