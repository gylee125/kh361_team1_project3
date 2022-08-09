package com.mealkit.board;

import java.util.List;

public interface CommunityDAO {

	public void write(CommunityVO vo) throws Exception;

	public CommunityVO read(Integer cNo) throws Exception;

	public void update(CommunityVO vo) throws Exception;

	public void delete(Integer cNo) throws Exception;

	public List<CommunityVO> list(Criteria cri) throws Exception;
	
	public int listCount() throws Exception;
}
