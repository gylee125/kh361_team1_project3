package com.mealkit.member;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;
	
	@Autowired
    private MailSendService mailService;

	@RequestMapping(value = "/login.do")
	public String login(@CookieValue(value="saveId", required=false)Cookie cookie, Model model) {	
		if (cookie != null) { // 아이디 저장 쿠키 있으면 불러오기
			String saveIdCookie = cookie.getValue();
			model.addAttribute("saveIdCookie", saveIdCookie);
		}		
		return "member/login";
	}
	
	@RequestMapping(value = "/submitLogin.do", method = RequestMethod.POST)
	public String submitLogin(MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		MemberDTO loginData = memberService.submitLogin(member); 			
		if (loginData == null) // 비밀번호 틀리면 null값 들어옴		
			return alertMsgAndGoUrl(request, "로그인 오류! ID와 비밀번호를 확인해주세요~!!", "login.do");	
		if (loginData.getMLevel() == -1) // 회원등급 -1 은 탈퇴한 계정
			return alertMsgAndGoUrl(request, "탈퇴한 계정입니다. 다른 ID로 로그인해주세요~!!", "login.do");	
		HttpSession session = request.getSession();
		session.setAttribute("member", loginData); // 회원가입 완료되면 해당 정보로 로그인도 해주기
		setCookieForSaveId(response, request.getParameter("saveId"), loginData.getMId()); // 아이디저장 체크박스 확인 후, 쿠키 생성
		return "redirect:/";
	}
	
	// 아이디 저장용 쿠키 세팅
	private void setCookieForSaveId(HttpServletResponse response, String saveId, String loginId) {
		if (saveId != null) // 아이디 저장 버튼 눌렀는지 확인하는 역할;			
			addCookie(response, loginId, 60 * 60 * 24 * 7); //(초단위 입력 = 7일)
		else  // 아이디 저장 버튼 해제했으므로, 쿠키 삭제			
			addCookie(response, null, 0); // 수명 0초 쿠키를 등록한다 = 쿠키 없애겠다
	}
	
	private void addCookie(HttpServletResponse response, String id, int setMaxAge) {
		logger.info("쿠키 생성 : {}", id);
		Cookie cookieSaveId = new Cookie("saveId", id);
		cookieSaveId.setMaxAge(setMaxAge);
		response.addCookie(cookieSaveId);
	}
	
	// alert.jsp 연결문 정리
	private String alertMsgAndGoUrl(HttpServletRequest request, String msg, String url) {
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/signUp.do")
	public String signUp() {
		return "member/signUp";
	}

	@RequestMapping(value = "/submitSignUp.do", method = RequestMethod.POST)
	public String submitSignUp(MemberDTO member, HttpServletRequest request) throws Exception {
		memberService.submitSignUp(member);
		memberService.earnPointForNewMember(member.getMId(), 3000); // 신규가입시 3000포인트 증정	
		MemberDTO loginData = memberService.submitLogin(member);
		HttpSession session = request.getSession();
		session.setAttribute("member", loginData); // 가입한 아이디로 로그인도 해주기
		return alertMsgAndGoUrl(request, "회원가입되었습니다. 신규 가입 프로모션으로 3000포인트 증정!", "home");
	}

	@RequestMapping(value = "/checkUniqueId.do")
	@ResponseBody
	public int checkUniqueId(String mId) throws Exception {
	    logger.info("ID 중복 검사: {}", mId);
	    logger.info("ID 중복 검사 결과: {}", memberService.checkUniqueId(mId));
		return memberService.checkUniqueId(mId);
	}

	@RequestMapping(value = "/checkUniqueEmail.do")
	@ResponseBody
	public int checkUniqueEmail(String email) throws Exception {
	    logger.info("이멜 중복 검사: {}", email);
        logger.info("이멜 중복 검사 결과: {}", memberService.checkUniqueEmail(email));
		return memberService.checkUniqueEmail(email);
	}

	@RequestMapping(value = "/checkUniqueEmailForModify.do")
	@ResponseBody
	public int checkUniqueEmailForModify(String email, String mId) throws Exception {
		return memberService.checkUniqueEmailForModify(email, mId);
	}
	
	//회원 상세보기 링크정리 필요
	@RequestMapping(value = "/showMemberDetail.do")
	@ResponseBody
	public MemberDTO showMemberDetail(String mId) throws Exception {
		return memberService.showMemberDetail(mId);
	}

	@RequestMapping(value = "/modifyMemberByAdmin.do") 
	public String modifyMemberByAdmin(Model model, String mId) throws Exception {
		MemberDTO member = memberService.showMemberDetail(mId);
		model.addAttribute("selectMember", member);
		return "member/modifyMemberByAdmin";
	}

	@RequestMapping(value = "/submitModifyMemberByAdmin.do", method = RequestMethod.POST)
	public String submitModifyMemberByAdmin(MemberDTO member) throws Exception {
		memberService.submitModifyMemberByAdmin(member);
		return "redirect:/adminPage.do";
	}

	@RequestMapping(value = "/submitModifyPointByAdmin.do", method = RequestMethod.POST) // 포인트 수정은 따로 관리
	public String submitModifyPointByAdmin(PointDTO pointDTO) throws Exception {
		memberService.modifyPoint(pointDTO.getMId(), pointDTO.getCurrentPoint());
		return "redirect:/adminPage.do";	
	}

	@RequestMapping(value = "/forgetPwd.do", method = RequestMethod.GET)
    public String forgetPwd() {
    	return "member/forgetPwd";
    }

    @RequestMapping(value = "/email.do", method = RequestMethod.GET)
    public String email(@RequestParam("mId") String mId,@RequestParam("email") String email, HttpSession session, HttpServletRequest request) throws Exception {

    	MemberDTO member = memberService.selectMember(mId);

    	if(member == null || !member.getEmail().equals(email)) {
    		return alertMsgAndGoUrl(request, "회원정보를 찾을 수 없습니다. 아이디와 입력값을 확인해주세요.", "forgetPwd.do");
    	} else if(member.getMLevel() == -1) {
    		return alertMsgAndGoUrl(request, "탈퇴한 회원정보입니다.", "forgetPwd.do");
    	} else {
    		String VerificationCode = mailService.setMail(email);
    		session.setAttribute("VerificationCode", VerificationCode);
    		session.setAttribute("mId", mId);
    		return "redirect:/changePwd.do";
    	}
    }

    @RequestMapping(value = "/changePwd.do", method = RequestMethod.GET)
    public String changePwd() {
    	return "member/changePwd";
    }

    @RequestMapping(value = "/changePwd.do", method = RequestMethod.POST)
    public String changePwd(@RequestParam String mId,@RequestParam String pw, HttpServletRequest request) throws Exception {
    	MemberDTO member = memberService.selectMember(mId);
    	member.setPw(pw);
    	memberService.updatePwd(member);
    	return alertMsgAndGoUrl(request, "비밀번호가 변경되었습니다.", "login.do");
    }

	@RequestMapping(value = "/checkPwd.do", method = RequestMethod.GET)
	public String checkPwd() {
		return "member/checkPwd";
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		PointDTO point = memberService.showPoint(member.getMId());
		model.addAttribute("point", point);
		return "member/myPage";
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.POST)
	public String myPage(Model model, MemberDTO member, HttpServletRequest request) throws Exception {
		int result = memberService.checkPwd(member);
		if (result == 1) {
			PointDTO point = memberService.showPoint(member.getMId());
			model.addAttribute("point", point);
			return "member/myPage";
		} else {			
			return alertMsgAndGoUrl(request, "비밀번호가 일치하지 않습니다.", "checkPwd.do");
		}
	}

    @RequestMapping(value="/checkEmail.do", method = RequestMethod.POST)
    @ResponseBody
    public int checkEmail(String email) throws Exception  {
    	return memberService.checkEmail(email);
    }
    
  	@RequestMapping(value = "/sendEmail.do", method = RequestMethod.GET)
  	@ResponseBody
  	public String mailCheck(String email) {
  		return mailService.setMail(email);
  	}
  	
	@RequestMapping(value = "/updateMyInfo.do", method = RequestMethod.POST)
	public String updateMyInfo(MemberDTO member, HttpSession session, HttpServletRequest request) throws Exception {
		memberService.updateMyInfo(member);
		MemberDTO updateMember = memberService.selectMember(member.getMId());
		session.setAttribute("member", updateMember);
		return alertMsgAndGoUrl(request, "수정이 완료되었습니다.", "myPage.do");
	}

	@RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(@RequestParam("pw") String pw, HttpSession session, HttpServletRequest request)
			throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		member.setPw(pw);
		memberService.updatePwd(member);
		MemberDTO updateMember = memberService.selectMember(member.getMId());
		session.setAttribute("member", updateMember);
		return alertMsgAndGoUrl(request, "변경이 완료되었습니다.", "myPage.do");
	}
	
	@RequestMapping(value = "/closeAccountByAdmin.do")
	public String closeAccountByAdmin(String mId) throws Exception {
		memberService.closeAccount(mId); // 일단 삭제는 안 하고 mLevel -1(별도로 '탈퇴상태' 코드 부여)두기.	
		memberService.modifyPoint(mId, 0); // 탈퇴하면 포인트 0됨
		return "redirect:/adminPage.do";
	}
	
	@RequestMapping(value = "/closeAccount.do")
    public String closeAccount(String mId, HttpSession session) throws Exception {
        memberService.closeAccount(mId); 
        memberService.modifyPoint(mId, 0); 
        session.invalidate(); // 탈퇴처리했으니 로그아웃
        return "redirect:/";
    }    

	@RequestMapping(value = "/confirmDelete.do", method = RequestMethod.GET)
	public String confirmDelete() {
		return "member/confirmDelete";
	}

	@RequestMapping(value = "/deleteAccount.do", method = RequestMethod.GET)
	public String deleteAccount() {
		return "member/deleteAccount";
	}
	
	@RequestMapping(value = "/deleteAccount.do", method = RequestMethod.POST)
	public String deleteAccount(String mId, HttpSession session) throws Exception {
		memberService.deleteMember(mId);
		memberService.modifyPoint(mId, 0);
		session.invalidate();
		return "member/deleteAccount";
	}
	
    @RequestMapping(value = "/adminPage.do", method = RequestMethod.GET)
    public String listSearch(@ModelAttribute("cri") MemberCriteria cri, Model model) throws Exception {
        logger.info(cri.toString());

    	model.addAttribute("memberlist", memberService.selectMemberList(cri));
    	MemberPageMaker pageMaker = new MemberPageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(memberService.countPage(cri));
    	model.addAttribute("pageMaker", pageMaker);
    	return "member/adminPage";
    }   

    @RequestMapping(value="/deleteMember.do")
    public String deleteMember(String mId) throws Exception {
    	memberService.deleteMember(mId);
    	return "redirect:adminPage.do";
    }
}
