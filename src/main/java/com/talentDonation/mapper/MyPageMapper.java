package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Dog;
import com.talentDonation.dto.Member;

@Mapper
@Repository
public interface MyPageMapper {
	void modifyMemberInfo(Member member); //회원정보 수정
	void addDog(Dog dog); //반려견 등록
	public List<Dog> getDogList(String dogMemId); //전체 반려견정보 가져오기
	public List<Dog> getDogDetail(String dogId); //반려견정보 가져오기
	void modifyDogInfo(Dog dog); //반려견정보 수정
	void deleteDog(Dog dog); //반려견 삭제
}
