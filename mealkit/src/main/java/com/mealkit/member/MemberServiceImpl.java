package com.mealkit.member;

import java.util.List;

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
    public void earnPointForNewMember(String mId) throws Exception {
        System.out.println("포인트 최초적립시 아이디 확인 : " + mId);
        memberMapper.earnPointForNewMember(mId);        
    }

    @Override
    public PointDTO showPoint(String mId) throws Exception {       
        return memberMapper.showPoint(mId);
    }
    
    @Override
    public int checkEmail(String mId, String email) throws Exception {
    	return memberMapper.checkEmail(mId, email);
    }
    
    @Override
    public int checkPwd(MemberDTO member) throws Exception {
    	return memberMapper.checkPwd(member);
    }
    
    @Override
    public MemberDTO selectMember(String mId) throws Exception {
    	return memberMapper.selectMember(mId);
    }
    
    @Override
    public void updateMyInfo(MemberDTO member) throws Exception {
    	memberMapper.updateMyInfo(member);
    }
    
    @Override
    public void updatePwd(MemberDTO member) throws Exception {
    	memberMapper.updatePwd(member);
    }

    @Override
    public void deleteAccount(String mId) throws Exception {
        memberMapper.deleteAccount(mId);
    }

}
