package com.mealkit.board;

import java.util.List;

public interface CommunityService {

  public void write(CommunityVO community) throws Exception;

  public CommunityVO read(Integer cNo) throws Exception;

  public void update(CommunityVO community) throws Exception;

  public void delete(Integer cNo) throws Exception;

  public List<CommunityVO> list(SearchCriteria scri) throws Exception;
  
  public int listCount(SearchCriteria scri) throws Exception;
  
}
