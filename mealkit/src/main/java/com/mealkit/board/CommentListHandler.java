package com.mealkit.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mealkit.member.MemberPage;
import com.mealkit.board.CommentListService;
import com.mealkit.board.ReviewPage;
import com.mealkit.board.CommentDTO;
import com.mealkit.main.CommandHandler;

public class CommentListHandler implements CommandHandler{
	
	private CommentListService commentService = new CommentListService();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//neverused
		//ReviewPage reviewPage = commentService.getReviewPage();
		//req.setAttribute("reviewPage", reviewPage); 
		
		return "/WEB-INF/view/shop/productDetail.jsp";
	}
	
}
