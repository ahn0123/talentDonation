package com.talentDonation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Review;

@Mapper
@Repository
public interface ReviewMapper {
	public List<Review> getReviewList(Criteria cri); //리뷰정보 가져오기
    public int getReviewTotal(Criteria cri); //리뷰 총 개수
}
