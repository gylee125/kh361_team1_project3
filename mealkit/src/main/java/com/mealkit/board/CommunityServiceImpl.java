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
	public CommunityVO read(Integer cNo) throws Exception {
		return dao.read(cNo);
	}

	@Override
	public void update(CommunityVO community) throws Exception {
		dao.update(community);
	}

	@Override
	public void delete(Integer cNo) throws Exception {
		dao.delete(cNo);
	}

	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}

}
