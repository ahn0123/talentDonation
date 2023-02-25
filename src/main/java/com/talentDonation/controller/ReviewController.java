package com.talentDonation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.PageMakerDTO;
import com.talentDonation.dto.Review;
import com.talentDonation.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/review/*")
public class ReviewController {

	private final ReviewMapper reviewMapper;

	// 전체 교육후기 정보 가져오기
	@GetMapping("/reviewList")
	public String reviewList(Model model, Criteria cri) {
		model.addAttribute("list", reviewMapper.getReviewList(cri)); //교육후기 정보 가져오기
		int total = reviewMapper.getReviewTotal(cri); //교육후기 총 개수
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "review/reviewList";
	}

	// 교육후기 정보 상세보기
	@GetMapping("/reviewDetail")
	public String reviewDetail(Model model, @RequestParam("revProgId") int revProgId, @RequestParam("revDogId") int revDogId) {
		model.addAttribute("list", reviewMapper.getReviewDetail(revProgId, revDogId)); //교육후기 정보 상세보기
		return "review/reviewDetail";
	}

	// 교육후기 등록 페이지로 이동
 	@GetMapping("/addReview")
 	public String addReview(Model model, @RequestParam("revProgId") int revProgId, @RequestParam("revDogId") int revDogId,
 			RedirectAttributes re) {
 		int cnt = reviewMapper.reviewCount(revProgId, revDogId); //신청내용별 교육후기 카운트
 		if (cnt == 0) {
 			model.addAttribute("revProgId", revProgId);
 			model.addAttribute("revDogId", revDogId);
 			return "review/addReview";
 		} else {
 			re.addAttribute("revProgId", revProgId);
 			re.addAttribute("revDogId", revDogId);
 			return "redirect:/review/reviewDetail";
 		}
 	}

 	// 교육후기 등록
    @PostMapping("/addReview")
    public String addReview(Model model, @ModelAttribute Review review) {
    	reviewMapper.addReview(review);
        return "redirect:/review/reviewList";
    }

    // 교육후기 수정(ajax)
    @PostMapping(path = "/modifyReviewInfo", produces = "text/json; charset=utf-8")
    public String modifyReviewInfo(Model model, @ModelAttribute Review review) {
    	reviewMapper.modifyReviewInfo(review);
        return "redirect:/review/reviewList";
    }

}
