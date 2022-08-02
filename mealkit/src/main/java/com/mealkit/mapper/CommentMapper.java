package com.mealkit.mapper;

import java.util.List;

import com.mealkit.board.CommentCriteria;
import com.mealkit.board.CommentVO;

public interface CommentMapper {
	
	public List<CommentVO> list(Integer pid) throws Exception;
	
	public void create(CommentVO cvo) throws Exception;
	
	public void update(CommentVO cvo) throws Exception;

	public void delete(Integer rno) throws Exception;
	
	public List<CommentVO> listPage(Integer pid,CommentCriteria cri)throws Exception;
	
	public int count(Integer rno) throws Exception;
	
	public int getPid(Integer rno) throws Exception;
}
