package com.talentDonation.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Member;

@Mapper
@Repository
public interface UserMapper {
	/****   로그인   ****/
	public Member login(Map<String, String> map); // 로그인
	/****   ID/PWD 가져오기   ****/
	public String getId(String memId); // 로그인 Id 값 가져오기
	public String getPw(String memId); // 로그인 패스워드 값 가져오기
	/****   회원가입   ****/
	void addMember(Member member); //회원가입 정보 등록
	int checkId(String memId); //아이디 중복 체크

	Member getMember(String memId); // memId로 해당 멤버 정보 모두 가져오기
	public void deleteMember(String memId); // 회원탈퇴
}
