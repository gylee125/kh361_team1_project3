package Handler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.CommentListService;
import model.service.ReviewPage;
import model.dao.CommentDao;
import model.dto.CommentDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import model.dto.MemberDTO;
import mvc.command.CommandHandler;

public class CommentModifyHandler implements CommandHandler {

	private static final String FORM_VIEW = "/shop/detail.do?pId=\"+pId";

	private CommentDao commentDao = new CommentDao();
	private CommentListService listService = new CommentListService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private boolean canModify(CommentDTO commentdto, MemberDTO authMember) {
		// troubleshooting
		System.out.println(authMember.getmId() + "and" + commentdto.getmId());
		return authMember.getmId().equals(commentdto.getmId());
	}
	//neverused
	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {

		try {

			
			String crNo = req.getParameter("rNo");
			int no = Integer.parseInt(crNo);
			
//			ReviewPage reviewPage = listService.getReviewPage();
			
			MemberDTO authMember = (MemberDTO) req.getSession().getAttribute("member");
			return null;
		} catch (Exception e) {

			return null;
		}

	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		int pId = Integer.parseInt(session.getAttribute("pId").toString());
//		int pId =Integer.parseInt(req.getParameter("pId").toString()); //NPE/numberformatException
		System.out.println("commentmodifyhandler-pid is : "+ pId);
//		int pId =Integer.parseInt(req.getParameter("pId"));
		
		String crNo = req.getParameter("rNo");

		int no = Integer.parseInt(crNo);
		// CommentDTO commentdto = listService.getCommentDTO(no);

		MemberDTO authMember = (MemberDTO) req.getSession().getAttribute("member");

		Map<String, Boolean> errors = new HashMap<>();

		Date date = new Date();

		CommentDTO commentdto = new CommentDTO(no, authMember.getmId(), req.getParameter("contentmodify"), date);
		req.setAttribute("errors", errors);

		//jsp page에서 error 체크처리후 작성
		/* 
		 * commentdto.validate(errors);
		 * 
		 * if (!errors.isEmpty()) { System.out.println("error"); return FORM_VIEW; }
		 */
		try {
			modifyProcess(commentdto, authMember);
			res.sendRedirect(req.getContextPath()+"/shop/detail.do?pId="+pId);
//			return FORM_VIEW;
			return null;
		} catch (Exception e) {
			System.out.println("exception");
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			e.printStackTrace();
			return null;
		}

	}

	public void modifyProcess(CommentDTO dto, MemberDTO authMember) {
		Connection conn = null;

		try {

			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			CommentDTO commentdto = commentDao.selectById(conn, (int) dto.getrNo());
			if (commentdto == null) {
				throw new RuntimeException();
			}
			if (!canModify(dto, authMember)) {
				throw new RuntimeException();
			}
			modify(conn, dto);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}

	}

	public int modify(Connection conn, CommentDTO dto) throws SQLException {
		
		System.out.println(dto.getContent());
		
		try (PreparedStatement pstmt = conn.prepareStatement("update review set content = ?,regDate = sysdate where rNo = ?")) {
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, (int) dto.getrNo());
			return pstmt.executeUpdate();

		}
	}

}
