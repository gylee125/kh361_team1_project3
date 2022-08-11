package com.mealkit.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.mealkit.mapper.CommunityMapper";

	@Override
	public void write(CommunityVO vo) throws Exception {
		session.insert(namespace + ".write", vo);
	}

	@Override
	public CommunityVO read(Integer cNo) throws Exception {
		return session.selectOne(namespace + ".read", cNo);
	}

	@Override
	public void update(CommunityVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer cNo) throws Exception {
		session.delete(namespace + ".delete", cNo);
	}

	@Override
	public List<CommunityVO> list(SearchCriteria scri) throws Exception {

		return session.selectList(namespace + ".listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return session.selectOne(namespace + ".listCount", scri);
	}

}
