package com.mealkit.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealkit.mapper.CommunityMapper;
import com.mealkit.util.FileUtils;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private FileUtils fileUtils;

	@Autowired
	private CommunityMapper communityMapper;

	@Override
	public void write(CommunityVO community, MultipartHttpServletRequest communityRequest) throws Exception {
		communityMapper.write(community);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(community, communityRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			communityMapper.insertFile(list.get(i));
		}

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

	@Override
	public List<Map<String, Object>> selectFileList(int cNo) throws Exception {

		return communityMapper.selectFileList(cNo);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {

		return communityMapper.selectFileInfo(map);
	}

	@Override
	public void update(CommunityVO community, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {

		communityMapper.update(community);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(community, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				communityMapper.insertFile(tempMap);
			} else {
				communityMapper.updateFile(tempMap);
			}

		}
	}

	@Override
	public List<CommunityVO> adminList(SearchCriteria scri) throws Exception {
		return communityMapper.adminList(scri);
	}

	@Override
	public int adminListCount(SearchCriteria scri) throws Exception {
		return communityMapper.adminListCount(scri);
	}
	
}