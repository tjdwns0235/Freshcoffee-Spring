package com.freshcoffee.service.member;

import javax.servlet.http.HttpSession;

import com.freshcoffee.domain.member.MemberDTO;

public interface MemberService {
//	Ajax : Id 중복 체크
	public int idCheck(String id);
//	회원가입
	public int create(MemberDTO mDto);
//	로그인
	public boolean login(MemberDTO mDto, HttpSession session);
//	로그아웃
	public void logout(HttpSession session);
//	회원정보 1건 검색
	public MemberDTO viewMember(HttpSession session);
		
	
	
}
