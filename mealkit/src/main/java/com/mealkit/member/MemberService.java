package com.mealkit.member;

import java.util.List;

public interface MemberService {

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
