package com.mealkit.mapper;

import java.util.List;
import java.util.Map;

import com.mealkit.board.CommunityVO;
import com.mealkit.board.SearchCriteria;

public interface CommunityMapper {

	public void write(CommunityVO vo) throws Exception;

	public CommunityVO read(Integer cNo) throws Exception;

	public void update(CommunityVO vo) throws Exception;

	public void delete(Integer cNo) throws Exception;

	public List<CommunityVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFileList(Integer cNo) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	public void updateFile(Map<String, Object> map) throws Exception;
	
	public List<CommunityVO> adminList(SearchCriteria scri) throws Exception;
	
	public int adminListCount(SearchCriteria scri) throws Exception;
	
}