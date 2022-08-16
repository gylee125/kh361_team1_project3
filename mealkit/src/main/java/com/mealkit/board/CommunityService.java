package com.mealkit.board;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommunityService {

  public void write(CommunityVO community, MultipartHttpServletRequest communityRequest) throws Exception;

  public CommunityVO read(Integer cNo) throws Exception;

  public void update(CommunityVO community) throws Exception;

  public void delete(Integer cNo) throws Exception;

  public List<CommunityVO> list(SearchCriteria scri) throws Exception;
  
  public int listCount(SearchCriteria scri) throws Exception;
  
}
