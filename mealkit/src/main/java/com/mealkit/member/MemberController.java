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

    @RequestMapping(value="/login.do")
    public String login() {
        return "member/login";
    }
    
    @RequestMapping(value="/submitLogin.do", method=RequestMethod.POST)
    public String submitLogin(HttpSession session, MemberDTO member, HttpServletRequest request) throws Exception {
           
        MemberDTO loginData;
        loginData = memberService.submitLogin(member);
        if(loginData != null)         	
            session.setAttribute("member", loginData);        
        else {
            request.setAttribute("msg", "로그인 오류! ID와 비밀번호를 확인해주세요~!!");
            request.setAttribute("url", "login.do"); 
            return "alert";
        }                  
        return "redirect:/";
    }
    
    @RequestMapping(value="/logout.do")
    public String logout(HttpSession session) {        
        session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping(value="/signUp.do")
    public String signUp() {
        return "member/signUp";
    }
    
    @RequestMapping(value="/submitSignUp.do")
    public String submitSignUp(MemberDTO member, HttpSession session, HttpServletRequest request) throws Exception {
        memberService.submitSignUp(member);    
        request.setAttribute("msg", "회원가입되었습니다. 환영합니다~~~~");
        request.setAttribute("url", "/");    
        return "alert";
    }
    
    @RequestMapping(value="/checkUniqueId.do")
    public String checkUniqueId(String inputedId, HttpServletRequest request) throws Exception {
        boolean result = memberService.checkUniqueId(inputedId);
        request.setAttribute("result", result);
        return "member/alert";
    }
 
    @RequestMapping(value="/forgetPwd.do")
    public String forgetPwd() {
        return "member/forgetPwd";
    }
    
    @RequestMapping(value="/myPage.do")
    public String myPage() {
        return "member/myPage";
    }   
    
    @RequestMapping(value="/confirmDelete.do")
    public String confirmDelete() {
        return "member/confirmDelete";
    }   
  
}