package com.freshcoffee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

//		메인액션 실행 되기전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		session 체크, 값이 있으면 통과,
//		없으면 돌려보냄(원래페이지로 가서 모달창키고 에러메세지
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userid") == null) {
			log.info("로그인 해주세요!!!");
			String referer = request.getHeader("referer");//referer의 역할은 이전 페이지 를 알려준다
//			response.sendRedirect(referer + "?message=nologin");
			String uri = request.getRequestURI();
			
			int index = referer.lastIndexOf("/"); // 6
			int length = referer.length(); //전체 길이
			String url = referer.substring(index, length);
			log.info("수정된 URL: " + url);
			
			if (url.equals("/create")) {
				response.sendRedirect(request.getContextPath() + "/board/list");
				return false;
			}
			
//			Login 페이지로 이동
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "nologin");
			flashMap.put("uri", uri);
			log.info("URI>>> "+ uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false;
		} else {
			log.info("통과하세요~~");
			return true;
		}

//		return false; => 못들어감 돌아가게 만듬
//		return true; => 통과! 매인액션 실행
	}

//	메인액션 실행 된 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
