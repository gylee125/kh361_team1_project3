package com.mealkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminInterceptor extends HandlerInterceptorAdapter{	

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		log.trace("관리자 확인 인터셉트 작동!");
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO)session.getAttribute("member");
        if ( member == null || member.getMLevel() != 2 ){ // mLevel 2면 관리자      	
        	log.warn("잘못된 접근 : 관리자 로그인 아님!!");
        	response.sendRedirect(request.getContextPath() + "/");
            return false; 
        }       
        return true;
    } 
}
