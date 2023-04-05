package com.talentDonation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.talentDonation.dto.Apply;
import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Keyword;
import com.talentDonation.dto.PageMakerDTO;
import com.talentDonation.dto.Program;
import com.talentDonation.dto.Trainer;
import com.talentDonation.mapper.AdminMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/admin/*")
public class AdminController {

	private final AdminMapper adminMapper;

	// 전체 회원정보 가져오기
	@GetMapping("/memberList")
	public String memberList(Model model, Criteria cri) {
		model.addAttribute("list", adminMapper.getMemberList(cri)); //회원정보 가져오기
		int total = adminMapper.getMemberAdminTotal(cri); //회원 총 인원수
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "admin/memberList";
	}

	// 회원정보 상세보기(Admin)
	@GetMapping("/memberDetail")
	public String memberDetail(Model model, @RequestParam("memId") String memId) {
		model.addAttribute("list", adminMapper.getMemberDetail(memId)); //회원정보 상세보기(Admin)
		return "admin/memberDetail";
	}

	// 전체 트레이너정보 가져오기
	@GetMapping("/trainerList")
	public String trainerList(Model model, Criteria cri) {
		model.addAttribute("list", adminMapper.getTrainerList(cri)); //트레이너정보 가져오기
		int total = adminMapper.getTrainerAdminTotal(cri); //트레이너 총 인원수
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "admin/trainerList";
	}

	// 트레이너정보 상세보기(Admin)
	@GetMapping("/trainerDetail")
	public String trainerDetail(Model model, @RequestParam("memId") String memId) {
		model.addAttribute("list", adminMapper.getTrainerDetail(memId)); //트레이너정보 상세보기(Admin)
		return "admin/trainerDetail";
	}

	// 트레이너 정보 추가 등록
    @PostMapping("/addTrainer")
    public String addTrainer(Model model, @ModelAttribute Trainer trainer) {
        adminMapper.addTrainer(trainer);
        return "redirect:/admin/trainerList";
    }

    // 트레이너 정보 수정(ajax)
    @PostMapping(path = "/modifyTrainerInfo", produces = "text/json; charset=utf-8")
    public String modifyTrainerInfo(Model model, @ModelAttribute Trainer trainer) {
        adminMapper.modifyTrainerInfo(trainer);
        return "redirect:/admin/trainerList";
    }

    // 프로그램 등록화면 불러오기
    @GetMapping("/addProgram")
    public String addProgram() {
    	return "admin/addProgram";
    }

    // 프로그램 등록화면 불러오기
    @PostMapping("/addProgram")
    public String addProgram(Model model, @ModelAttribute Program program) {
    	adminMapper.addProgram(program);
        return "redirect:/admin/programList";
    }

    // 트레이너 리스트 팝업
  	@GetMapping("/trainerListPopup")
  	public String trainerListPopup(Model model) {
  		model.addAttribute("list", adminMapper.getTrainerName()); // 트레이너명 가져오기
  		return "admin/trainerListPopup";
  	}

  	// 키워드 리스트 팝업
   	@GetMapping("/keyListPopup")
   	public String keyListPopup(Model model) {
   		model.addAttribute("list", adminMapper.getKeyName()); // 키워드명 가져오기
   		return "admin/keyListPopup";
   	}

   	// 전체 프로그램 정보 가져오기
 	@GetMapping("/programList")
 	public String programList(Model model, Criteria cri) {
 		model.addAttribute("list", adminMapper.getProgramList(cri)); //프로그램 정보 가져오기
 		int total = adminMapper.getProgramAdminTotal(cri); //프로그램 총 개수
 		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
 		model.addAttribute("pageMaker", pageMake);
 		return "admin/programList";
 	}

 	// 프로그램 정보 상세보기(Admin)
 	@GetMapping("/programDetail")
 	public String programDetail(Model model, @RequestParam("progId") int progId) {
 		model.addAttribute("list", adminMapper.getProgramDetail(progId)); //프로그램 정보 상세보기(Admin)
 		return "admin/programDetail";
 	}

 	// 프로그램 정보 수정
   	@PostMapping("/modifyProgramInfo")
   	public String modifyProgramInfo(@ModelAttribute Program program) {
   		adminMapper.modifyProgramInfo(program);
   		return "redirect:/admin/programList";
   	}

   	// 프로그램 삭제(ajax)
    @PostMapping(path = "/deleteProgram", produces = "text/json; charset=utf-8")
    public String deleteProgram(Model model, @ModelAttribute Program program) {
    	adminMapper.deleteProgram(program);
        return "redirect:/admin/programList";
    }

    // 전체 신청 정보 가져오기
  	@GetMapping("/applyListAdmin")
  	public String applyListAdmin(Model model, Criteria cri) {
  		model.addAttribute("list", adminMapper.getApplyListAdmin(cri)); //신청 정보 가져오기
  		int total = adminMapper.getApplyAdminTotal(cri); //신청 총 개수
  		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
  		model.addAttribute("pageMaker", pageMake);
  		return "admin/applyListAdmin";
  	}

  	// 신청 정보 상세보기(Admin)
 	@GetMapping("/applyDetailAdmin")
 	public String applyDetailAdmin(Model model, @RequestParam("applyProgId") int applyProgId, @RequestParam("applyDogId") int applyDogId, @RequestParam("memId") String memId) {
 		model.addAttribute("list", adminMapper.getApplyDetailAdmin(applyProgId, applyDogId, memId)); //신청 정보 가져오기(Admin)
 		return "admin/applyDetailAdmin";
 	}

 	// 신청 정보 상태값 수정(ajax)
    @PostMapping(path = "/modifyApplyStatus", produces = "text/json; charset=utf-8")
    public String modifyApplyStatus(Model model, @ModelAttribute Apply apply) {
    	adminMapper.modifyApplyStatus(apply);
        return "redirect:/admin/applyListAdmin";
    }

    // 전체 키워드 정보 가져오기
   	@GetMapping("/keywordList")
   	public String keywordList(Model model, Criteria cri) {
   		model.addAttribute("list", adminMapper.getKeywordList(cri)); //키워드 정보 가져오기
   		int total = adminMapper.getKeywordTotal(cri); //키워드 총 개수
   		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
   		model.addAttribute("pageMaker", pageMake);
   		return "admin/keywordList";
   	}

   	// 키워드 등록 페이지로 이동
    @GetMapping("/addKeyword")
    public String addKeyword(Model model) {
        return  "admin/addKeyword";
    }

    // 키워드 등록 페이지
    @PostMapping("/addKeyword")
    public String addKeyword(Model model, @ModelAttribute Keyword keyword) {
    	adminMapper.addKeyword(keyword);
        return "redirect:/admin/keywordList";
    }

    // 키워드id 중복확인
    @GetMapping("/checkKeyId")
    @ResponseBody
    public String checkKeyId(@RequestParam int id){
        int result = adminMapper.checkKeyId(id); //키워드ID 중복 체크
        log.info("result:" + result);
        if (result == 0) {
            return "success";
        }
        else {
            return "fail";
        }
    }

    // 키워드 정보 상세보기(Admin)
  	@GetMapping("/keywordDetail")
  	public String keywordDetail(Model model, @RequestParam("keyId") int keyId) {
  		model.addAttribute("list", adminMapper.getKeywordDetail(keyId)); //키워드 정보 상세보기(Admin)
  		return "admin/keywordDetail";
  	}

  	// 키워드 정보 수정(ajax)
   	@PostMapping(path = "/modifyKeywordInfo", produces = "text/json; charset=utf-8")
   	public String modifyKeywordInfo(@ModelAttribute Keyword keyword) {
   		adminMapper.modifyKeywordInfo(keyword);
   		return "redirect:/admin/keywordList";
   	}

}
