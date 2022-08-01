package Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberPage;
import model.service.CommentListService;
import model.service.ReviewPage;
import model.dto.CommentDTO;
import mvc.command.CommandHandler;

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
