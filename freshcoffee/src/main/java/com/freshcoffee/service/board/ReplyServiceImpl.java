package com.freshcoffee.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.freshcoffee.domain.board.ReplyDTO;
import com.freshcoffee.persistence.board.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO rDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ReplyDTO rDto) {
		// TODO Auto-generated method stub
		
	}

}
