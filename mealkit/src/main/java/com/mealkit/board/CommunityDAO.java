package com.mealkit.board;

import java.util.List;

public interface CommunityDAO {
	public void write(CommunityVO vo) throws Exception;

	public CommunityVO read(Number cNo) throws Exception;

	public void update(CommunityVO vo) throws Exception;

	public void delete(Number cNo) throws Exception;

	public List<CommunityVO> listAll() throws Exception;

	public List<CommunityVO> listPage(int page) throws Exception;

	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	// use for dynamic sql
	public List<CommunityVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
