package com.freshcoffee.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.freshcoffee.domain.member.MemberDTO;
import com.freshcoffee.persistence.member.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	@Override
	public int create(MemberDTO mDto) {
		// 비즈니스 로직을 처리하는 부분
//		비즈니스로직 : 회원가입
//		회원가입을 하기위해서는 DB를 사용해야 함
		return mDao.create(mDto);
	}

	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
//		 비즈니스로직
//		 1) DB에 ID와 PW가 매칭되는지 확인
//		 2) Check가 맞으면(로그인 성공)
//			=> session 담음
//		 3) Check가 틀리면 (로그인 실패)
//		 	=> modal창 경고 메세지 출력
//		id -> pw한건으로 출력
		String name = mDao.login(mDto);
		boolean result = false;
		if (name != null) {//로그인 성공
//			session에 로그인 정보를 담아야 함
//			id, name만 담음
//			id => email
			session.removeAttribute("userid");
			session.removeAttribute("name");
			session.setAttribute("userid", mDto.getId());
			session.setAttribute("name", name);
			result = true;
			log.info("session >>>"+ session.getAttribute("name"));
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
//		세션 초기화
		session.invalidate(); // 전체값 초기화 할때 사용함
	}

	
	@Override
	public MemberDTO viewMember(HttpSession session) {
		String id = (String)session.getAttribute("userid");
		MemberDTO mDto = mDao.viewMember(id);
		
		return mDto;
	}

	@Override
	public String pwCheck(MemberDTO mDto) {
//		DB에서 가져온 현재비밀번호와 사용자가 입력한 현재비밀번호가 같은지 체크해서 같으면 1, 틀리면-1를 view단으로 전송
		String name = mDao.login(mDto);
		String result = "-1";
		if (name != null) {
			log.info(name);
			result = "1";
		}
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
//		DB에 있는 비밀번호 수정
//		data: id, pw = > mDto
		mDao.pwUpdate(mDto);
	}

	@Override
	public void update(MemberDTO mDto, HttpSession session) {
		// 비즈니스 로직
//		1) 회원정보 수정
		int result = mDao.update(mDto);
//		2) 회원정보 수정 성공하면
//			-session의 name값을 수정한 이름으로 변경
		if (result > 0) {
			session.removeAttribute("name");
			session.setAttribute("name", mDto.getName());
		}
	}

	@Override
	public void delete(HttpSession session) {
//		비즈니스 로직
//		1) 회원삭제!!
//			ID필요 -> session
		String id = (String)session.getAttribute("userid");
		int result = mDao.delete(id);
		if (result > 0) {
			session.invalidate();
		}
		
	}
	
}
