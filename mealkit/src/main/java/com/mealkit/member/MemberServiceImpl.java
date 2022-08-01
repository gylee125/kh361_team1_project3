package com.mealkit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    MemberDAO memberDAO;

    @Override
    public MemberDTO submitLogin(MemberDTO member) throws Exception {
        return memberDAO.submitLogin(member);
    }

    @Override
    public void submitSignUp(MemberDTO member) throws Exception {
        memberDAO.submitSignUp(member);        
    }

    @Override
    public boolean checkUniqueId(String inputedId) throws Exception {
        return memberDAO.checkUniqueId(inputedId);
    }

    @Override
    public boolean checkUniqueEmail(String inputedEmail) throws Exception {
        return memberDAO.checkUniqueEmail(inputedEmail);
    }

    @Override
    public MemberDTO checkEmail(String mId) throws Exception {
        return memberDAO.checkEmail(mId);
    }

    @Override
    public void changePwd(String mId, String pw) throws Exception {
        memberDAO.changePwd(mId, pw);        
    }

    @Override
    public void deleteAccount(String mId) throws Exception {
        memberDAO.deleteAccount(mId);
    }

}
