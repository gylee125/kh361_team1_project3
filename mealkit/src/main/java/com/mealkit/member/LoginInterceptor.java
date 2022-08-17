package com.mealkit.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	        throws Exception {
	 	log.info("로그인 확인 인터셉트 작동!");
	    HttpSession session = request.getSession();
	    Object obj = session.getAttribute("member");
	    if ( obj == null ){     
	    	log.warn("잘못된 접근 : 로그인 필요");
	        response.sendRedirect(request.getContextPath() + "/");
	        return false; 
	    }       
	    return true;
	} 
}
