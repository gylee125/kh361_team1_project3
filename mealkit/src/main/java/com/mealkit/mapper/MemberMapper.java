package com.mealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mealkit.member.MemberDTO;
import com.mealkit.member.MemberListDTO;
import com.mealkit.member.PointDTO;

public interface MemberMapper {
	
	public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;
    
    public int checkUniqueId(String inputedId) throws Exception;
    
    public int checkUniqueEmail(String inputedEmail) throws Exception;
    
    public int checkUniqueEmailForModify(@Param("email")String email, @Param("mId")String mId) throws Exception;
    
    public MemberDTO checkEmail(String mId) throws Exception;
    
    public void changePwd(String mId, String pw) throws Exception;
    
    public void deleteAccount(String mId) throws Exception;

    public void earnPointForNewMember(String mId) throws Exception;

    public PointDTO showPoint(String mId) throws Exception;

    public MemberDTO showMemberDetail(String mId) throws Exception;   

    public List<MemberListDTO> memberList() throws Exception;

    public void submitModifyMemberByAdmin(MemberDTO member) throws Exception;

    public void submitModifyPointByAdmin(PointDTO pointDTO) throws Exception;
    
}
