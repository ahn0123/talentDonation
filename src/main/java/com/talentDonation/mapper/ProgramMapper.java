package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Program;

@Mapper
@Repository
public interface ProgramMapper {
	void addApply(int progId, int dogId); //프로그램 신청하기
	int getApplyCount(int progId, int dogId); //프로그램 신청 중복 방지(count)

	public List<Program> getProgramExampleRandom(); //프로그램 랜덤 정보 가져오기

	int getProgStatus(int revProgId); //프로그램 교육현황 상태값 가져오기
	int getApplyStatus(int revProgId, int revDogId); //교육신청 상태값 가져오기

	public List<Program> getProgramApplyList(Criteria cri); //프로그램 정보 가져오기
    public int getProgramTotal(Criteria cri); //프로그램 총 개수
}
