package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Member;
import com.talentDonation.dto.Trainer;

@Mapper
@Repository
public interface AdminMapper {
	public List<Member> getMemberList(Criteria cri); //회원정보 가져오기
    public int getMemberAdminTotal(Criteria cri); //회원 총 인원수
    public List<Member> getMemberDetail(String memId); //회원정보 가져오기(Admin)

    public List<Member> getTrainerList(Criteria cri); //트레이너정보 가져오기
    public int getTrainerAdminTotal(Criteria cri); //트레이너 총 인원수
    public List<Member> getTrainerDetail(String memId); //트레이너정보 가져오기(Admin)
    void addTrainer(Trainer trainer); //트레이너 정보 추가 등록
    void modifyTrainerInfo(Trainer trainer);
}
