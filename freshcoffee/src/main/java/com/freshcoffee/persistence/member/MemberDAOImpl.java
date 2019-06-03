package com.freshcoffee.persistence.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		
		return sqlSession.selectOne("idCheck", id);
	}
	
}
