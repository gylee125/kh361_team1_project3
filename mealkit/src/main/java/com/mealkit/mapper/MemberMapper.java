package com.mealkit.mapper;

import java.util.List;

import com.mealkit.member.MemberDTO;
import com.mealkit.member.MemberListDTO;
import com.mealkit.member.PointDTO;

public interface MemberMapper {
	
	public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;
    
    public int checkUniqueId(String inputedId) throws Exception;
    
    public int checkUniqueEmail(String inputedEmail) throws Exception;

    public void earnPointForNewMember(String mId) throws Exception;

    public PointDTO showPoint(String mId) throws Exception; 
    
    public int checkEmail(String mId, String email) throws Exception;
    
    public int checkPwd(MemberDTO member) throws Exception;
    
    public MemberDTO selectMember(String mId) throws Exception;
    
    public void updateMyInfo(MemberDTO member) throws Exception;
    
    public void updatePwd(MemberDTO member) throws Exception;

    public void deleteAccount(String mId) throws Exception; 

}