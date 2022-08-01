package com.mealkit.member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController{    

    @Autowired
    MemberServiceBackUp memberServiceBackUp;

    @RequestMapping(value="/login")
    public String login() {
        return "login";
    }
    
    @RequestMapping(value="/submitLogin", method=RequestMethod.POST)
    public String submitLogin(HttpSession session, MemberDTO member, HttpServletRequest request) {
           
        MemberDTO loginData;
        loginData = memberServiceBackUp.submitLogin(member);
        if(loginData != null)
            session.setAttribute("member", loginData);
        else {
            request.setAttribute("msg", "로그인 오류! ID와 비밀번호를 확인해주세요~!!");
            request.setAttribute("url", "login"); 
            return "alert";
        }                  
        return "/";
    }
    
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {        
        session.invalidate();
        return "/";
    }
    
    @RequestMapping(value="/signUp")
    public String signUp() {
        return "signUp";
    }
    
    @RequestMapping(value="/submitSignUp")
    public String submitSignUp(MemberDTO member, HttpSession session, HttpServletRequest request) {
        memberServiceBackUp.submitSignUp(member);    
        request.setAttribute("msg", "회원가입되었습니다. 환영합니다~~~~");
        request.setAttribute("url", "/");    
        return "alert";
    }
    
    @RequestMapping(value="/checkUniqueId")
    public String checkUniqueId(String inputedId, HttpServletRequest request) {
        boolean result = memberServiceBackUp.checkUniqueId(inputedId);
        request.setAttribute("result", result);
        return "alert";
    }
 
    @RequestMapping(value="/forgetPassword")
    public String forgetPassword() {
        return "forgetPassword";
    }
    
    @RequestMapping(value="/changePwd")
    public String changePwd() {
        return "changePwd";
    }   
  
}