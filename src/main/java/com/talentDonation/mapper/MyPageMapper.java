package com.talentDonation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Dog;
import com.talentDonation.dto.Member;

@Mapper
@Repository
public interface MyPageMapper {
	void modifyMemberInfo(Member member); //회원정보 수정
	void addDog(Dog dog); //반려견 등록
}
