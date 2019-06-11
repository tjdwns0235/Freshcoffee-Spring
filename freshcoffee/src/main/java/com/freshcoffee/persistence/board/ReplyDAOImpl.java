package com.freshcoffee.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.freshcoffee.domain.board.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return sqlSession.selectList("reply.list", bno);
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
