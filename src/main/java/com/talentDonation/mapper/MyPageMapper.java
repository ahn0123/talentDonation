package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Apply;
import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Dog;
import com.talentDonation.dto.Member;
import com.talentDonation.dto.Record;

@Mapper
@Repository
public interface MyPageMapper {
	void modifyMemberInfo(Member member); //회원정보 수정
	void addDog(Dog dog); //반려견 등록
	public List<Dog> getDogList(String dogMemId); //전체 반려견정보 가져오기
	public List<Dog> getDogDetail(String dogId); //반려견정보 가져오기
	void modifyDogInfo(Dog dog); //반려견정보 수정
	void deleteDog(Dog dog); //반려견 삭제

	public List<Apply> getApplyListMember(String memId, Criteria cri); //신청현황 정보 가져오기(일반회원)
	public int getApplyMemberTotal(String memId, Criteria cri); //신청현황 총 개수(일반회원)
    public List<Apply> getApplyDetailMember(int applyProgId, int applyDogId); //신청 정보 상세보기(일반회원)

    public List<Apply> getApplyListTrainer(String memId, Criteria cri); //신청현황 정보 가져오기(트레이너)
	public int getApplyTrainerTotal(String memId, Criteria cri); //신청현황 총 개수(트레이너)
    public List<Apply> getApplyDetailTrainer(int applyProgId, int applyDogId); //신청 정보 상세보기(트레이너)

    public List<Record> getRecordListMember(String dogMemId, Criteria cri); //교육일지 정보 가져오기(일반회원)
    public int getRecordMemberTotal(String dogMemId, Criteria cri); //교육일지 총 개수(일반회원)
    public List<Record> getRecordDetailMember(int rcProgId, int rcDogId); //교육일지 상세정보(일반회원)

    public List<Record> getRecordListTrainer(String progTrmemId, Criteria cri); //교육일지 정보 가져오기(트레이너)
    public int getRecordTrainerTotal(String progTrmemId, Criteria cri); //교육일지 총 개수(트레이너)
    public List<Record> getRecordDetailTrainer(int rcProgId, int rcDogId); //교육일지 상세정보(트레이너)
    void modifyRecordInfo(Record record); //교육일지 정보 수정
    public int recordCount(int rcProgId, int rcDogId); //신청내용별 교육일지 카운트
    void addRecord(Record record); //교육일지 등록
}
