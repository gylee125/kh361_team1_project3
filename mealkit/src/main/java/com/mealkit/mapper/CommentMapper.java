package com.mealkit.mapper;

import java.util.List;
import java.util.Map;

import com.mealkit.board.CommentCriteria;
import com.mealkit.board.CommentVO;

public interface CommentMapper {
	
	public List<CommentVO> list(Integer pid) throws Exception;
	
	public void create(CommentVO cvo) throws Exception;
	
	public void update(CommentVO cvo) throws Exception;

	public void delete(Integer rno) throws Exception;
	
	public List<CommentVO> listPage(Map<String, Object> paramMap)throws Exception;
	
	public int count(Integer pid) throws Exception;
	
	public int getPid(Integer rno) throws Exception;
	
	
	//testcode
	public void addAttach(String fullName)throws Exception;
	
	public List<String> getAttach(Integer rno) throws Exception;
	
	public void deleteAttach(Integer rno) throws Exception;
	
}
