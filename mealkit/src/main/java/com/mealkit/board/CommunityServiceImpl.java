package com.mealkit.board;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealkit.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityMapper communityMapper;

	@Override
	public void write(CommunityVO community) throws Exception {
		communityMapper.write(community);
	}

	@Override
	public CommunityVO read(Integer cNo) throws Exception {
		return communityMapper.read(cNo);
	}

	@Override
	public void update(CommunityVO community) throws Exception {
		communityMapper.update(community);
	}

	@Override
	public void delete(Integer cNo) throws Exception {
		communityMapper.delete(cNo);
	}

	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {
		return communityMapper.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return communityMapper.listCount(scri);
	}

}
