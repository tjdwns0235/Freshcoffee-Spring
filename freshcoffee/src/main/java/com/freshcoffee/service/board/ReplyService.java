package com.freshcoffee.service.board;

import java.util.List;

import com.freshcoffee.domain.board.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno); //댓글 목록
	public void create(ReplyDTO rDto); // 댓글 등록
	public void delete(ReplyDTO rDto); //	댓글 삭제
}
