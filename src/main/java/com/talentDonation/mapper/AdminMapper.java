package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Apply;
import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Keyword;
import com.talentDonation.dto.Member;
import com.talentDonation.dto.Program;
import com.talentDonation.dto.Trainer;

@Mapper
@Repository
public interface AdminMapper {
	public List<Member> getMemberList(Criteria cri); //회원정보 가져오기
    public int getMemberAdminTotal(Criteria cri); //회원 총 인원수
    public List<Member> getMemberDetail(String memId); //회원정보 상세보기(Admin)

    public List<Member> getTrainerList(Criteria cri); //트레이너정보 가져오기
    public int getTrainerAdminTotal(Criteria cri); //트레이너 총 인원수
    public List<Member> getTrainerDetail(String memId); //트레이너정보 상세보기(Admin)
    void addTrainer(Trainer trainer); //트레이너 정보 추가 등록
    void modifyTrainerInfo(Trainer trainer); //트레이너 정보 수정
    public List<Trainer> getTrainerName(); //트레이너명 가져오기
    public List<Keyword> getKeyName(); //키워드명 가져오기

    void addProgram(Program program); //프로그램 추가
    public List<Program> getProgramList(Criteria cri); //프로그램 정보 가져오기
    public int getProgramAdminTotal(Criteria cri); //프로그램 총 개수
    public List<Program> getProgramDetail(int progId); //프로그램 정보 상세보기(Admin)
    void modifyProgramInfo(Program program); //프로그램 정보 수정
    void deleteProgram(Program program); //프로그램 삭제

    public List<Apply> getApplyListAdmin(Criteria cri); //신청 정보 가져오기
    public int getApplyAdminTotal(Criteria cri); //신청 총 개수
    public List<Apply> getApplyDetailAdmin(int applyProgId, int applyDogId, String memId); //신청 정보 상세보기(Admin)
    void modifyApplyStatus(Apply apply); //신청 정보 상태값 수정

    public List<Keyword> getKeywordList(Criteria cri); //키워드 정보 가져오기
    public int getKeywordTotal(Criteria cri); //키워드 총 개수
    void addKeyword(Keyword keyword); //키워드 등록
    int checkKeyId(int id); //키워드ID 중복 체크
    public List<Keyword> getKeywordDetail(int keyId); //키워드 정보 상세보기(Admin)
    void modifyKeywordInfo(Keyword keyword); //키워드 정보 수정
}
