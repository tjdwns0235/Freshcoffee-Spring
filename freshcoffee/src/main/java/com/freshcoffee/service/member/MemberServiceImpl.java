package com.freshcoffee.service.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.freshcoffee.persistence.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}
	
}
