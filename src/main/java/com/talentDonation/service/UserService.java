package com.talentDonation.service;

import java.util.Map;

import com.talentDonation.dto.Member;

public interface UserService {
	public Member login(Map<String, String > map) throws Exception; //로그인
	Member getMember(String memId); // memId로 해당 멤버 정보 모두 가져오기
	public void deleteMember(String memId) throws Exception; // 회원탈퇴
}
