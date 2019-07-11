package com.freshcoffee.persistence.member;

import com.freshcoffee.domain.member.MemberDTO;

public interface MemberDAO {
	public int idCheck(String id);
	public int create(MemberDTO mDto);
	public int update(MemberDTO mDto);
	public int delete(String id);
	public String login(MemberDTO mDto);
	public MemberDTO viewMember(String id);
	public void pwUpdate(MemberDTO mDto);
}
