package com.talentDonation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.PageMakerDTO;
import com.talentDonation.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/review/*")
public class ReviewController {

	private final ReviewMapper reviewMapper;

	// 전체 리뷰정보 가져오기
	@GetMapping("/reviewList")
	public String reviewList(Model model, Criteria cri) {
		model.addAttribute("list", reviewMapper.getReviewList(cri)); //리뷰정보 가져오기
		int total = reviewMapper.getReviewTotal(cri); //리뷰 총 개수
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "review/reviewList";
	}

	// 리뷰정보 상세보기
//	@GetMapping("/reviewDetail")
//	public String reviewDetail(Model model, @RequestParam("memId") String memId) {
//		model.addAttribute("list", reviewMapper.getReviewDetail(memId)); //리뷰정보 상세보기
//		return "review/reviewDetail";
//	}

}
