package com.talentDonation.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talentDonation.dto.Member;
import com.talentDonation.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
    private UserMapper userMapper;

	@Override
	public Member login(Map<String, String> map) throws Exception {
		return userMapper.login(map);
	}

	// memId로 해당 멤버 정보 모두 가져오기
    @Override
    public Member getMember(String memId){
        return userMapper.getMember(memId);
    }

    // 회원탈퇴
    @Override
    public void deleteMember(String memId) throws Exception {
        userMapper.deleteMember(memId);
    }
}
