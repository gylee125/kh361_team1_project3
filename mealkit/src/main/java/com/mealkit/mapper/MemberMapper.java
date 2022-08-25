package com.mealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mealkit.member.MemberCriteria;
import com.mealkit.member.MemberDTO;
import com.mealkit.member.MemberListDTO;
import com.mealkit.member.PointDTO;

public interface MemberMapper {
	
	public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;
    
    public int checkUniqueId(String inputedId) throws Exception;
    
    public int checkUniqueEmail(String inputedEmail) throws Exception;
    
    public int checkUniqueEmailForModify(@Param("email")String email, @Param("mId")String mId) throws Exception;

    public void earnPointForNewMember(@Param("mId")String mId, @Param("currentPoint")int currentPoint) throws Exception;

    public PointDTO showPoint(String mId) throws Exception;

    public MemberDTO showMemberDetail(String mId) throws Exception; 

    public void submitModifyMemberByAdmin(MemberDTO member) throws Exception;

    public void modifyPoint(@Param("mId")String mId, @Param("point")int point) throws Exception; 

    public MemberDTO selectMember(String mId) throws Exception;
    
    public int checkPwd(MemberDTO member) throws Exception;
    
    public int checkEmail(String email) throws Exception;
    
    public void closeAccount(String mId) throws Exception;
    
    public void updateMyInfo(MemberDTO member) throws Exception;
    
    public void updatePwd(MemberDTO member) throws Exception;

    public void deleteMember(String mId) throws Exception;

    List<MemberListDTO> selectMemberList(MemberCriteria cri) throws Exception;

    public int countPage(MemberCriteria cri) throws Exception;

}
