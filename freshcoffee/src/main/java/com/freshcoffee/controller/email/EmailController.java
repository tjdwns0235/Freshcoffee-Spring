package com.freshcoffee.controller.email;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.freshcoffee.domain.email.EmailDTO;
import com.freshcoffee.service.email.EmailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("email/*")
public class EmailController {
	
	@Inject
	EmailService eService;
	
	@RequestMapping("write")
	public String write() {
		return "/email/write";
	}
	
	@RequestMapping("send")
	public String send(@ModelAttribute EmailDTO eDto, Model model) {
		try {
			log.info(eDto.toString());
			eService.sendMail(eDto);
			model.addAttribute("message", "이메일이 발송 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","이메일 발송 실패..");
		}
		return "/email/write";
	}
}
