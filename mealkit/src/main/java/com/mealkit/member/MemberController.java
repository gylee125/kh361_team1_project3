package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dto.MemberDTO;
import model.service.MemberService;

public class MemberController extends HttpServlet{    

    private static final long serialVersionUID = 1L;
    
    MemberService memberService;

    public void init(ServletConfig config) throws ServletException{
        
    	memberService = MemberService.getInstance();     
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }
 
    
    private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      
        String fromPath = request.getRequestURI().substring(request.getContextPath().length());
        String toPath = null;
        
        if(fromPath.equals("/login.do")) {            
            toPath = "WEB-INF/view/login.jsp";
            
        }else if(fromPath.equals("/submitLogin.do")){	
	    	
	    	MemberDTO member = new MemberDTO();
	    	HttpSession session = request.getSession();
	    	
	    	String id = request.getParameter("mId");
	    	String pw = request.getParameter("pw");    
	    	
	    	member = memberService.submitLogin(id, pw);	    	
	    	if(member != null) {	    		
	    		session.setAttribute("member", member);		    	
		    	toPath = "WEB-INF/view/index.jsp";
	    	}else{
	    		request.setAttribute("msg", "로그인 오류!! 아디와 비번 확인해주세요~!");
                request.setAttribute("url", "login.do");               
	    		toPath = "WEB-INF/view/alert.jsp";
	    	}	  	
	    	
	    }else if(fromPath.equals("/logout.do")) {
	    	HttpSession session = request.getSession();
    		session.invalidate();
            toPath = "WEB-INF/view/index.jsp";   
            
	    }else if(fromPath.equals("/signUp.do")) {
            toPath = "WEB-INF/view/signUp.jsp";   
            
	    }else if(fromPath.equals("/submitSignUp.do")) {
	    	
	    	MemberDTO member = new MemberDTO();
	    	
	    	member.setmId(request.getParameter("mId"));
	    	member.setPw(request.getParameter("pw"));
	    	member.setmName(request.getParameter("mName"));
	    	member.setEmail(request.getParameter("email"));
	    	member.setPhone(request.getParameter("phone"));
	    	member.setAddress(request.getParameter("address"));
	    	
	    	memberService.submitSignUp(member);
	    	
	    	request.setAttribute("msg", "회원가입되었습니다. 환영합니다~~~~");
            request.setAttribute("url", "home");    
            
            // 회원가입됬으면 로그인도 해주자.
    		toPath = "WEB-INF/view/alert.jsp";
            
	    }else if(fromPath.equals("/checkUniqueId.do")) {
	    	
	    	String inputedId = request.getParameter("mId");
	    	boolean result = memberService.checkUniqueId(inputedId);
	    	
	    	//System.out.println("결과 나왔니 : " + result);
	    	request.setAttribute("result", result);
	    	
	    }else if(fromPath.equals("/forget-password.do")) {
            toPath = "WEB-INF/view/forget-password.jsp";   
            
	    }else if(fromPath.equals("/changePwd.do")) {
            toPath = "WEB-INF/view/changePwd.jsp";   
            
	    }else {
            toPath = "WEB-INF/view/error.jsp";
        }
                
        RequestDispatcher dispatcher = request.getRequestDispatcher(toPath);
        dispatcher.forward(request, response);
    }    
}