package com.mealkit.board;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mealkit.member.MemberPage;
import com.mealkit.board.CommentSubmitPage;
import com.mealkit.board.CommentWriteService;
import com.mealkit.board.CommentVO;
import com.mealkit.member.MemberDTO;
import com.mealkit.main.CommandHandler;

public class CommentSubmitHandler implements CommandHandler {

	
	private static final String FORM_VIEW = "/shop/detail.do?pId=";
	private CommentWriteService commentWriteService = new CommentWriteService();
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("POST")) {
				return processSubmit(req,res);
		}else if(req.getMethod().equalsIgnoreCase("GET")) {
				return processForm(req,res);
		}else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req,HttpServletResponse res) throws IOException {
		System.out.println("check login session "+ req.getSession().getAttribute("mId"));
		System.out.println("check pId parameter " + req.getParameter("pId"));
		
		int pId =Integer.parseInt(req.getParameter("pId"));
		
		
		System.out.println("pId is "+pId);
		
		Map<String,Boolean> errors = new HashMap<>();
		
		//filtering loginsession
		boolean login = false;
		
		
		if(req.getSession() != null) {
			if(req.getSession().getAttribute("mId") != null) {
				login = true;
			}
		}
		
		if(login != true) {
			res.sendRedirect(req.getContextPath()+"/login.do");//loginpage
			return null;
		}
		
		
		
		req.setAttribute("errors", errors);
		
		MemberDTO member = (MemberDTO)req.getSession(false).getAttribute("member");
		
//		String mId = member.getmId();
//		req.setAttribute("mId", mId);
		System.out.println(member.getmId()+"CommentSubmitHandlerCheck");//troubleshooting1.
		
		CommentVO submitReq = createSubmitRequest(member, req);
		
		submitReq.validate(errors);
		
		//neverused
		int CommentrNo = commentWriteService.submit(submitReq,pId);
		req.setAttribute("CommentrNo", CommentrNo); // 수정삭제용
		
		if(!errors.isEmpty()) {
			res.sendRedirect(req.getContextPath()+FORM_VIEW + pId); return null;
//			return FORM_VIEW + pId;//urlString
		}
		//res.sendRedirect("/aviato/product-single.jsp");
		res.sendRedirect(req.getContextPath()+FORM_VIEW + pId); return null;
//		return FORM_VIEW + pId;//urlString
	}

	private CommentVO createSubmitRequest(MemberDTO memberdto, HttpServletRequest req) {

		Date date = new Date();
		System.out.println(memberdto.getmId()+req.getParameter("reviews")+"createSubmitRequestCheck");//troubleshooting2

		return new CommentVO(memberdto, req.getParameter("reviews"), date);
		
	}

}
