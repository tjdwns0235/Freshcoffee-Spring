package com.freshcoffee.service.member;

import javax.servlet.http.HttpSession;

import com.freshcoffee.domain.member.MemberDTO;

//추상메서드는 중가로가 없다!
public interface MemberService {
//	Ajax : Id 중복 체크
	public int idCheck(String id);
//	회원가입
	public int create(MemberDTO mDto);
//	회원수정
	public void update(MemberDTO mDto, HttpSession session);
//	회원 탈퇴
	public void delete(HttpSession session);
//	로그인
	public boolean login(MemberDTO mDto, HttpSession session);
//	로그아웃
	public void logout(HttpSession session);
//	회원정보 1건 검색
	public MemberDTO viewMember(HttpSession session);
//	현재 비밀번호 체크
	public String pwCheck(MemberDTO mDto);
//	비밀번호 수정
	public void pwUpdate(MemberDTO mDto);


	
	
}
