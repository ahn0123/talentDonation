package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Review;

@Mapper
@Repository
public interface ReviewMapper {
	public List<Review> getReviewList(Criteria cri); //교육후기 정보 가져오기
    public int getReviewTotal(Criteria cri); //교육후기 총 개수
    public List<Review> getReviewDetail(int revProgId, int revDogId); //교육후기 정보 상세보기
    public int reviewCount(int revProgId, int revDogId); //신청내용별 교육후기 카운트
    void addReview(Review review); //교육후기 등록
    void modifyReviewInfo(Review review); //교육후기 수정
}
