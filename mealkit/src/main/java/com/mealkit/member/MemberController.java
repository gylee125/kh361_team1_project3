package com.mealkit.member;

import java.util.List;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;
	//EmailService emailService;

	@RequestMapping(value = "/login.do")
	public String login() {
		return "member/login";
	}
	
	// 코드 정리 필요
	@RequestMapping(value = "/submitLogin.do", method = RequestMethod.POST)
	public String submitLogin(MemberDTO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String saveId = request.getParameter("saveId");
		HttpSession session = request.getSession();
		MemberDTO loginData = memberService.submitLogin(member);

		if (loginData != null) {
			session.setAttribute("member", loginData);

			// 아이디 저장 기능
			if (saveId != null) {
				Cookie cookieSaveId = new Cookie("saveId", loginData.getMId());
				cookieSaveId.setMaxAge(60 * 60 * 24 * 7); // (초단위 입력 = 7일)
				response.addCookie(cookieSaveId);
			}

		} else {
			request.setAttribute("msg", "로그인 오류! ID와 비밀번호를 확인해주세요~!!");
			request.setAttribute("url", "login.do");
			return "alert";
		}
		return "redirect:/";
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
		request.setAttribute("msg", "회원가입되었습니다. 환영합니다~신규 가입 프로모션으로 3000포인트 증정!");
		request.setAttribute("url", "home");
		return "alert";
	}

	@RequestMapping(value = "/checkUniqueId.do")
	@ResponseBody
	public int checkUniqueId(String mId) throws Exception {
		return memberService.checkUniqueId(mId);
	}

	@RequestMapping(value = "/checkUniqueEmail.do")
	@ResponseBody
	public int checkUniqueEmail(String email) throws Exception {
		return memberService.checkUniqueEmail(email);
	}

	@RequestMapping(value = "/checkUniqueEmailForModify.do")
	@ResponseBody
	public int checkUniqueEmailForModify(String email, String mId) throws Exception {
		return memberService.checkUniqueEmailForModify(email, mId);
	}

	@RequestMapping(value = "/forgetPwd.do", method = RequestMethod.GET)
	public String forgetPwd() {
		return "member/forgetPwd";
	}

	@RequestMapping(value = "/changePwd.do", method = RequestMethod.GET)
	public String changePwd() {
		return "member/changePwd";
	}

	@RequestMapping(value = "/changePwd.do", method = RequestMethod.POST)
	public String changePwd(@RequestParam String mId, @RequestParam String pw, HttpServletRequest request)
			throws Exception {
		MemberDTO member = memberService.selectMember(mId);
		member.setPw(pw);
		memberService.updatePwd(member);
		request.setAttribute("msg", "비밀번호가 변경되었습니다.");
		request.setAttribute("url", "login.do");
		return "alert";
	}

	@RequestMapping(value = "/checkPwd.do", method = RequestMethod.GET)
	public String checkPwd() {
		return "member/checkPwd";
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Model model, String MId) throws Exception {
		PointDTO point = memberService.showPoint(MId);
		model.addAttribute("point", point);
		return "member/myPage";
	}

	@RequestMapping(value = "/myPage.do", method = RequestMethod.POST)
	public String myPage(MemberDTO member, HttpServletRequest request) throws Exception {
		int result = memberService.checkPwd(member);
		if (result == 1) {
			return "member/myPage";
		} else {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "checkPwd.do");
			return "alert";
		}
	}

	@RequestMapping(value = "/updateMyInfo.do", method = RequestMethod.POST)
	public String updateMyInfo(MemberDTO member, HttpSession session, HttpServletRequest request) throws Exception {
		memberService.updateMyInfo(member);

		MemberDTO updateMember = memberService.selectMember(member.getMId());
		session.setAttribute("member", updateMember);
		request.setAttribute("msg", "수정이 완료되었습니다.");
		request.setAttribute("url", "myPage.do");
		return "alert";
	}

	@RequestMapping(value = "updatePwd", method = RequestMethod.POST)
	public String updatePwd(@RequestParam("pw") String pw, HttpSession session, HttpServletRequest request)
			throws Exception {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		member.setPw(pw);
		memberService.updatePwd(member);

		MemberDTO updateMember = memberService.selectMember(member.getMId());
		session.setAttribute("member", updateMember);
		request.setAttribute("msg", "수정이 완료되었습니다.");
		request.setAttribute("url", "myPage.do");
		return "alert";
	}

	@RequestMapping(value = "/adminPage.do")
	public String adminPage(Model model) throws Exception {
		// List<MemberListDTO> list = memberService.memberList();
		// model.addAttribute("memberList", list);
		return "member/adminPage";
	}

	@RequestMapping(value = "/adminProduct.do") // 취합할때 상의하고, 상품쪽으로 이전
	public String adminProduct() {
		return "member/adminProduct";
	}

	@RequestMapping(value = "/adminOrder.do") // 취합할때 상의하고, 주문 쪽으로 이전
	public String adminOrder() {
		return "member/adminOrder";
	}

	@RequestMapping(value = "/adminBoard.do") // 취합할때 상의하고, 게시판 쪽으로 이전
	public String adminBoard() {
		return "member/adminBoard";
	}

	@RequestMapping(value = "/showMemberDetail.do")
	@ResponseBody
	public MemberDTO showMemberDetail(Model model, String mId) throws Exception {
		return memberService.showMemberDetail(mId);
	}

	@RequestMapping(value = "/modifyMemberByAdmin.do") // 취합할때 상의하고, 게시판 쪽으로 이전
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
		memberService.submitModifyPointByAdmin(pointDTO);
		return "redirect:/adminPage.do";
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
		memberService.deleteAccount(mId); // 일단 삭제는 안 하고 mLevel -1(별도로 '탈퇴상태' 코드 부여)두기.
		session.invalidate(); // 탈퇴처리하고 로그아웃
		return "member/deleteAccount";
	}

}
