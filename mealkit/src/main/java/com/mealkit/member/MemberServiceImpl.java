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
    public int checkUniqueEmailForModify(String email, String mId) throws Exception {
        return memberMapper.checkUniqueEmailForModify(email, mId);
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
    public MemberDTO showMemberDetail(String mId) throws Exception {        
        return memberMapper.showMemberDetail(mId);
    }

    @Override
    public void submitModifyMemberByAdmin(MemberDTO member) throws Exception {
        memberMapper.submitModifyMemberByAdmin(member);        
    }

    @Override
    public void submitModifyPointByAdmin(PointDTO pointDTO) throws Exception {
        memberMapper.submitModifyPointByAdmin(pointDTO);    
    }
    
    //===========================================================================
    
    @Override
    public MemberDTO selectMember(String mId) throws Exception {
    	return memberMapper.selectMember(mId);
    }
    
    @Override
    public int checkPwd(MemberDTO member) throws Exception {
    	return memberMapper.checkPwd(member);
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
    public void deleteMember(String mId) throws Exception {
        memberMapper.deleteMember(mId);
    }

    @Override
    public List<MemberListDTO> selectMemberList(Criteria cri) throws Exception {
    	return memberMapper.selectMemberList(cri);
    }
    
    @Override
    public int countPage(Criteria cri) throws Exception {
    	return memberMapper.countPage(cri);
    }
    
}
