package com.mealkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
		logger.info("관리자 확인 인터셉트 작동!");
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO)session.getAttribute("member");
        if ( member == null || member.getMLevel() != 2 ){ // mLevel 2면 관리자      	
        	logger.info("인터셉트: 관리자 로그인 아님");
        	response.sendRedirect(request.getContextPath() + "/");
            return false; 
        }       
        return true;
    } 
}
