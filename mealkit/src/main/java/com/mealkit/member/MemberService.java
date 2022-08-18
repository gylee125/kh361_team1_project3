package com.mealkit.member;

import java.util.List;

public interface MemberService {

    public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;
    
    public int checkUniqueId(String inputedId) throws Exception;
    
    public int checkUniqueEmail(String inputedEmail) throws Exception;
    
    public int checkUniqueEmailForModify(String email, String mId) throws Exception;
        
    public void earnPointForNewMember(String mId) throws Exception;
    
    public PointDTO showPoint(String mId) throws Exception;

    public MemberDTO showMemberDetail(String mId) throws Exception;   

    public void submitModifyMemberByAdmin(MemberDTO member) throws Exception;

    public void submitModifyPointByAdmin(PointDTO pointDTO) throws Exception;
    
  //===========================================================================

    public MemberDTO selectMember(String mId) throws Exception;
    
    public int checkPwd(MemberDTO member) throws Exception;
    
    public void updateMyInfo(MemberDTO member) throws Exception;
    
    public void updatePwd(MemberDTO member) throws Exception;
    
    public void deleteMember(String mId) throws Exception;
    
    List<MemberListDTO> selectMemberList(Criteria cri) throws Exception;
    
    public int countPage(Criteria cri) throws Exception;
}
