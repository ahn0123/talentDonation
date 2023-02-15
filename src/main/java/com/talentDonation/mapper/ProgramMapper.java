package com.talentDonation.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ProgramMapper {
	void addApply(int progId, int dogId); //프로그램 신청하기
	int getApplyCount(int progId, int dogId); //프로그램 신청 중복 방지(count)
}
