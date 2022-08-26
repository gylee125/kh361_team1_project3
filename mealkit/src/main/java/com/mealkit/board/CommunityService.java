package com.mealkit.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommunityService {

  public void write(CommunityVO community, MultipartHttpServletRequest communityRequest) throws Exception;

  public CommunityVO read(Integer cNo) throws Exception;

  public void update(CommunityVO community) throws Exception;

  public void delete(Integer cNo) throws Exception;

  public List<CommunityVO> list(SearchCriteria scri) throws Exception;
  
  public int listCount(SearchCriteria scri) throws Exception;
  
  public List<Map<String, Object>> selectFileList(int cNo) throws Exception;
  
  public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
  
  public void update(CommunityVO community, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
  
  public List<CommunityVO> adminList(SearchCriteria scri) throws Exception;
  
  public int adminListCount(SearchCriteria scri) throws Exception;
}
