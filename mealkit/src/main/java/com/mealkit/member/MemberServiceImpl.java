package com.mealkit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealkit.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    MemberMapper memberMapper;

    @Override
    public MemberDTO submitLogin(MemberDTO member) throws Exception {
        return memberMapper.submitLogin(member);
    }

    @Override
    public void submitSignUp(MemberDTO member) throws Exception {
        memberMapper.submitSignUp(member);        
    }

    @Override
    public int checkUniqueId(String inputedId) throws Exception {
        return memberMapper.checkUniqueId(inputedId);
    }

    @Override
    public int checkUniqueEmail(String inputedEmail) throws Exception {
        return memberMapper.checkUniqueEmail(inputedEmail);
    }

    @Override
    public MemberDTO checkEmail(String mId) throws Exception {
        return memberMapper.checkEmail(mId);
    }

    @Override
    public void changePwd(String mId, String pw) throws Exception {
        memberMapper.changePwd(mId, pw);        
    }

    @Override
    public void deleteAccount(String mId) throws Exception {
        memberMapper.deleteAccount(mId);
    }

}
