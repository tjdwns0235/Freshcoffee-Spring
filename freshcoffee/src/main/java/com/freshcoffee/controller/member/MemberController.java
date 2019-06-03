package com.freshcoffee.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.freshcoffee.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/constract", method = RequestMethod.GET)
	public String constract() {
		log.info(">>> 회원가입 동의");
		return "member/constract";
	}
	@ResponseBody // 화면단으로 돌아가는것이 아니라 순수한 데이터로 인식해서 가지고 간다
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idCheck(String id) {
		log.info("AJAX:ID 중복 체크");
		return service.idCheck(id);
	}
		
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String create() {
		log.info(">>> 회원가입 페이지 출력");
		return "member/member_join";
	}
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update() {
		log.info(">>> 회원수정");
		return "";
	}
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete() {
		log.info(">>> 회원삭제");
		return "";
	}

}
