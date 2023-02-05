package com.talentDonation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Member;

@Mapper
@Repository
public interface MyPageMapper {
	void modifyMemberInfo(Member member); //회원정보 수정
}
