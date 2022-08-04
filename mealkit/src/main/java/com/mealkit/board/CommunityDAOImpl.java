package com.mealkit.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession session;

	@Override
	public void write(CommunityVO vo) throws Exception {
		session.insert("CommnuityMapper.insert", vo);
	}

	@Override
	public CommunityVO read(Number cNo) throws Exception {
		return session.selectOne(namespace + ".read", cNo);
	}

	@Override
	public void update(CommunityVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Number cNo) throws Exception {
		session.delete(namespace + ".delete", cNo);
	}

	@Override
	public List<CommunityVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<CommunityVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<CommunityVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<CommunityVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

}
