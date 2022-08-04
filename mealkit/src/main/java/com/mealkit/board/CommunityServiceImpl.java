package com.mealkit.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO dao;
	
	@Override
	public void write(CommunityVO community) throws Exception {
		
		dao.write(community);
	}

	@Override
	public CommunityVO read(Number cNo) throws Exception {
		
		return dao.read(cNo);
	}

	@Override
	public void modify(CommunityVO community) throws Exception {
		
		dao.update(community);
	}

	@Override
	public void remove(Number cNo) throws Exception {
		
		dao.delete(cNo);
	}

	@Override
	public List<CommunityVO> listAll() throws Exception {
		
		return dao.listAll();
	}

	@Override
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}

	@Override
	public List<CommunityVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

}
