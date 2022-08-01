package com.mealkit.member;

public interface MemberService {

    public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;
    
    public boolean checkUniqueId(String inputedId) throws Exception;
    
    public boolean checkUniqueEmail(String inputedEmail) throws Exception;
    
    public MemberDTO checkEmail(String mId) throws Exception;
    
    public void changePwd(String mId, String pw) throws Exception;
    
    public void deleteAccount(String mId) throws Exception;   
    
}
