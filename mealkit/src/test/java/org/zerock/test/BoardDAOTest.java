package org.zerock.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.mealkit.board.CommunityDAO;
import com.mealkit.board.CommunityVO;
import com.mealkit.board.Criteria;
import com.mealkit.board.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private CommunityDAO dao;

	private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	//@Test
	public void testCreate() throws Exception {

		CommunityVO community = new CommunityVO();
		community.setmLevel(1);
		community.setmId("김우석");
		community.setTitle("새로운 글을 넣습니다. ");
		community.setContent("새로운 글을 넣습니다. ");
		dao.create(community);
	}

	@Test
	public void testRead() throws Exception {

		logger.info(dao.read(2).toString());
	}

	//@Test
	public void testUpdate() throws Exception {

		CommunityVO community = new CommunityVO();
		community.setTitle("새로운 글을 넣습니다. 1");
		community.setContent("새로운 글을 넣습니다. 1");
		dao.update(community);
	}

	//@Test
	public void testDelete() throws Exception {

		dao.delete(1);
	}

	//@Test
	public void testListAll() throws Exception {

		logger.info(dao.listAll().toString());

	}

	//@Test
	public void testListPage() throws Exception {

		int page = 3;

		List<CommunityVO> list = dao.listPage(page);

		for (CommunityVO communityVO : list) {
			logger.info(communityVO.getcNo() + ":" + communityVO.getTitle());
		}
	}

	//@Test
	public void testListCriteria() throws Exception {

		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);

		List<CommunityVO> list = dao.listCriteria(cri);

		for (CommunityVO communityVO : list) {
			logger.info(communityVO.getcNo() + ":" + communityVO.getTitle());
		}
	}

	//@Test
	public void testURI() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build();

		logger.info("/board/read?cno=12&perPageNum=20");
		logger.info(uriComponents.toString());

	}

	//@Test
	public void testURI2() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/{module}/{page}").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build().expand("board", "read").encode();

		logger.info("/board/read?cno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}

	//@Test
	public void testDynamic1() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("글");
		cri.setSearchType("t");

		logger.info("=====================================");

		List<CommunityVO> list = dao.listSearch(cri);

		for (CommunityVO communityVO : list) {
			logger.info(communityVO.getcNo() + ": " + communityVO.getTitle());
		}

		logger.info("=====================================");

		logger.info("COUNT: " + dao.listSearchCount(cri));
	}

}
