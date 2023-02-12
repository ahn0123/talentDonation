package com.talentDonation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.PageMakerDTO;
import com.talentDonation.mapper.AdminMapper;
import com.talentDonation.mapper.MyPageMapper;
import com.talentDonation.mapper.ProgramMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/program/*")
public class ProgramController {

	private final ProgramMapper programMapper;
	private final AdminMapper adminMapper;
	private final MyPageMapper myPageMapper;

	// 전체 프로그램 정보 가져오기
 	@GetMapping("/programApplyList")
 	public String programApplyList(Model model, Criteria cri) {
 		model.addAttribute("list", adminMapper.getProgramList(cri)); //프로그램 정보 가져오기
 		int total = adminMapper.getProgramAdminTotal(cri); //프로그램 총 개수
 		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
 		model.addAttribute("pageMaker", pageMake);
 		return "program/programApplyList";
 	}

 	// 프로그램 정보 가져오기
  	@GetMapping("/programApplyDetail")
  	public String programApplyDetail(Model model, @RequestParam("progId") int progId) {
  		model.addAttribute("list", adminMapper.getProgramDetail(progId)); //프로그램 정보 가져오기
  		return "program/programApplyDetail";
  	}

  	// 프로그램 신청정보 가져오기
   	@GetMapping("/addApply")
   	public String addApply(Model model, @RequestParam("progId") int progId) {
   		model.addAttribute("list", adminMapper.getProgramDetail(progId)); //프로그램 정보 가져오기
   		return "program/addApply";
   	}

   	// 프로그램 신청하기
   	@PostMapping("/addApply")
   	public String addApply(@RequestParam("progId") int progId, @RequestParam("dogId") int dogId) {
   		programMapper.addApply(progId, dogId);
   		return "redirect:/";
   	}

   	// 반려견 리스트 팝업
   	@GetMapping("/dogListPopup")
   	public String dogListPopup(Model model, HttpSession session) {
   		String dogMemId = (String) session.getAttribute("sessionId");
   		model.addAttribute("list", myPageMapper.getDogList(dogMemId)); // 반려견명 가져오기
   		return "program/dogListPopup";
   	}

}
