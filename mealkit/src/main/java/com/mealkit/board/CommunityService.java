package com.mealkit.board;

import java.util.List;

public interface CommunityService {

	public void write(CommunityVO community) throws Exception;

	public CommunityVO read(Number cNo) throws Exception;

	public void modify(CommunityVO community) throws Exception;

	public void remove(Number cNo) throws Exception;

	public List<CommunityVO> listAll() throws Exception;

	public List<CommunityVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

	public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
}
