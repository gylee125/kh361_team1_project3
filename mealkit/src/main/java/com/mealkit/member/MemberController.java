package com.mealkit.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController{    

    @Autowired
    MemberService memberService;

    @RequestMapping(value="/login")
    public String login() {
        return "login";
    }
    
    @RequestMapping(value="/submitLogin", method=RequestMethod.POST)
    public String submitLogin(HttpSession session, MemberDTO member, HttpServletRequest request) throws Exception {
           
        MemberDTO loginData;
        loginData = memberService.submitLogin(member);
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
    public String submitSignUp(MemberDTO member, HttpSession session, HttpServletRequest request) throws Exception {
        memberService.submitSignUp(member);    
        request.setAttribute("msg", "회원가입되었습니다. 환영합니다~~~~");
        request.setAttribute("url", "/");    
        return "alert";
    }
    
    @RequestMapping(value="/checkUniqueId")
    public String checkUniqueId(String inputedId, HttpServletRequest request) throws Exception {
        boolean result = memberService.checkUniqueId(inputedId);
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