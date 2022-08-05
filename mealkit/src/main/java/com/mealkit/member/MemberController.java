package com.mealkit.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController{    

    @Autowired
    MemberService memberService;

    @RequestMapping(value="/login.do")
    public String login() {
        return "member/login";
    }
    
    // 코드 정리 필요
    @RequestMapping(value="/submitLogin.do", method=RequestMethod.POST)
    public String submitLogin(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String saveId = request.getParameter("saveId");
        HttpSession session = request.getSession();
        MemberDTO loginData;
        
        loginData = memberService.submitLogin(member);
        if(loginData != null) {            
            session.setAttribute("member", loginData);
            
            // 아이디 저장 기능
            if(saveId != null) {                
                Cookie cookieSaveId = new Cookie("saveId",loginData.getMId());                  
                cookieSaveId.setMaxAge(60*60*24*7); //(초단위 입력 = 7일)
                response.addCookie(cookieSaveId);                    
            }
            
        }else {
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
    
    @RequestMapping(value="/submitSignUp.do", method=RequestMethod.POST)
    public String submitSignUp(MemberDTO member, HttpSession session, Model model) throws Exception {
        memberService.submitSignUp(member);  
        memberService.earnPointForNewMember(member.getMId()); // 3000포인트 증정. 코드 정리 필요(3000변수가 매퍼xml파일에 바로 들어가있음)
        session.setAttribute("member", member); 
        model.addAttribute("msg", "회원가입되었습니다. 환영합니다~신규 가입 프로모션으로 3000포인트 증정!");
        model.addAttribute("url", "/");    
        return "alert";
    }
    
    @RequestMapping(value="/checkUniqueId.do")
    @ResponseBody
    public int checkUniqueId(String mId) throws Exception { 
        return memberService.checkUniqueId(mId);
    }
    
    @RequestMapping(value="/checkUniqueEmail.do")
    @ResponseBody
    public int checkUniqueEmail(String email) throws Exception {        
        return memberService.checkUniqueEmail(email);
    }
 
    @RequestMapping(value="/forgetPwd.do")
    public String forgetPwd() {
        return "member/forgetPwd";
    }
    
    @RequestMapping(value="/myPage.do")
    public String myPage(Model model, String mId) throws Exception {
        PointDTO point = memberService.showPoint(mId);
        model.addAttribute("point", point);        
        return "member/myPage";
    }   
    
    @RequestMapping(value="/confirmDelete.do")
    public String confirmDelete() {
        return "member/confirmDelete";
    }   
    
    @RequestMapping(value="/deleteAccount.do", method=RequestMethod.POST)
    public String deleteAccount(String mId, HttpSession session) throws Exception {        
        memberService.deleteAccount(mId); // 30일 보관내용 어떻게 처리할지 의논하기
        // 관련해서 아이디 삭제시 묶인 내용들(외래키관련) 어떻게 할지?(지금은 외래키 걸려있으면 오류뜸)
        session.invalidate(); // 로그아웃하고 db삭제
        return "member/deleteAccount";
    }  
    
    @RequestMapping(value="/adminPage.do")
    public String adminPage(Model model) throws Exception {
        //List<MemberListDTO> list = memberService.memberList();
        //model.addAttribute("memberList", list);
        return "member/adminPage";
    }   
    
    @RequestMapping(value="/adminProduct.do") // 취합할때 상의하고, 상품쪽으로 이전
    public String adminProduct() {
        return "member/adminProduct";
    }   
    
    @RequestMapping(value="/adminOrder.do")  // 취합할때 상의하고, 주문 쪽으로 이전
    public String adminOrder() {
        return "member/adminOrder";
    }   
    
    @RequestMapping(value="/adminBoard.do") // 취합할때 상의하고, 게시판 쪽으로 이전
    public String adminBoard() {
        return "member/adminBoard";
    }   
    
    @RequestMapping(value="/showMemberDetail.do", method=RequestMethod.POST)
    @ResponseBody
    public MemberDTO showMemberDetail(Model model, String mId) throws Exception {         
        return memberService.showMemberDetail(mId);       
    }
  
}