package com.freshcoffee.persistence.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.freshcoffee.domain.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		
		return sqlSession.selectOne("idCheck", id);
	}

	@Override
	public int create(MemberDTO mDto) {
		return sqlSession.insert("member.create", mDto);
	}

	@Override
	public String login(MemberDTO mDto) {
		return sqlSession.selectOne("member.login", mDto);
	}

	@Override
	public MemberDTO viewMember(String id) {
		return sqlSession.selectOne("member.viewMember", id);
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		sqlSession.update("member.pwUpdate", mDto);
		
	}

	@Override
	public int update(MemberDTO mDto) {
		return sqlSession.update("member.update", mDto);
		
	}

	@Override
	public int delete(String id) {
		return sqlSession.delete("member.delete", id);
	}
	
}
