package com.talentDonation.controller;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.talentDonation.dto.Criteria;
import com.talentDonation.dto.Dog;
import com.talentDonation.dto.Member;
import com.talentDonation.mapper.MyPageMapper;
import com.talentDonation.mapper.UserMapper;
import com.talentDonation.service.EncryptionService;
import com.talentDonation.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@Slf4j
@RequestMapping("/myPage/*")
public class MyPageController {
	private final UserService userService;
	private final MyPageMapper myPageMapper;
	private final UserMapper userMapper;
	private final EncryptionService Encryption;

	// 회원정보 조회
    @GetMapping("/myPageMember")
    public String myPageMember(Model model, HttpSession session) {
    	String memId = (String) session.getAttribute("sessionId");
        model.addAttribute("member", userService.getMember(memId)); // 로그인 세션 값으로 멤버 정보 보내줌

        return "myPage/myPageMember";
    }

    // 회원정보 수정
 	@PostMapping("/modifyMemberInfo")
 	public String modifyMemberInfo(@ModelAttribute Member member, HttpSession session) throws InvalidAlgorithmParameterException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, BadPaddingException, InvalidKeyException {
 		String memId = (String) session.getAttribute("sessionId");
 		String pwd1 = member.getMemPwd();
 		log.info("pwd1:" + pwd1);
 		String pwd2 = userMapper.getPw(memId);
 		log.info("pwd2:" + pwd2);
 		if(pwd1.equals(pwd2)) {
 			myPageMapper.modifyMemberInfo(member);
 		} else {
 			member.setMemPwd(Encryption.encrypt(member.getMemPwd()));
 	 		myPageMapper.modifyMemberInfo(member);
 		}

 		return "redirect:/myPage/myPageMember";
 	}

 	// 마이페이지 > 회원탈퇴
    @GetMapping("/deleteMember")
    public String deleteMember() {
        return "/myPage/deleteMember";
    }

    @PostMapping("/deleteMember")
    public String deleteMember(@RequestParam("memPwd") String memPwd, Member dto, HttpSession session, Model model) throws Exception {

//    	Member member = (Member) session.getAttribute("member");
//        String oldPass = member.getMemPwd();
//        String newPass = dto.getMemPwd();


    	Member member = (Member) session.getAttribute("member");
        String oldPass = member.getMemPwd();
        String memPwd2 = dto.getMemPwd();
        String newPass = Encryption.encrypt(memPwd2);


        if (oldPass.equals(newPass)) {
        	userService.deleteMember(member.getMemId());
            session.invalidate();
            model.addAttribute("msg", "회원정보가 삭제되었습니다");
            return "/myPage/deleteMember";
        } else {
            model.addAttribute("msg", "잘못된 패스워드입니다");
            return "/myPage/deleteMember";
        }

    }

    // 반려견 등록 페이지로 이동
    @GetMapping("/addDog")
    public String addDog(Model model, HttpSession session) {
        return  "myPage/addDog";
    }

    // 반려견 등록 페이지
    @PostMapping("/addDog")
    public String addDog(Model model, @ModelAttribute Dog dog) {
    	myPageMapper.addDog(dog);
        return "myPage/addDog";
    }

    // 전체 반려견정보 가져오기
 	@GetMapping("/dogList")
 	public String dogList(Model model, HttpSession session) {
 		String dogMemId = (String) session.getAttribute("sessionId");
 		model.addAttribute("list", myPageMapper.getDogList(dogMemId)); //전체 반려견정보 가져오기
 		return "myPage/dogList";
 	}

 	// 반려견정보 가져오기
 	@GetMapping("/dogDetail")
 	public String dogDetail(Model model, @RequestParam("dogId") String dogId) {
 		model.addAttribute("list", myPageMapper.getDogDetail(dogId)); //반려견정보 가져오기
 		return "myPage/dogDetail";
 	}

 	// 반려견정보 수정
  	@PostMapping("/modifyDogInfo")
  	public String modifyDogInfo(@ModelAttribute Dog dog) {
  		//String dogname = dog.getDogName();
  		//log.info("dogname:"+dogname);
  		myPageMapper.modifyDogInfo(dog);
  		return "redirect:/myPage/dogList";
  	}

  	// 반려견 삭제(ajax)
    @PostMapping(path = "/deleteDog", produces = "text/json; charset=utf-8")
    public String deleteDog(Model model, @ModelAttribute Dog dog) {
        myPageMapper.deleteDog(dog);
        return "redirect:/myPage/dogList";
    }

    // 신청현황 정보 가져오기
   	@GetMapping("/applyListMember")
   	public String applyListMember(Model model, Criteria cri, HttpSession session) {
   		String memId = (String) session.getAttribute("sessionId");
   		//log.info("memId:"+memId);
   		model.addAttribute("list", myPageMapper.getApplyListMember(memId)); //신청 현황 정보 가져오기
   		//int total = myPageMapper.getApplyMemberTotal(memId); //신청현황 총 개수
   		//PageMakerDTO pageMake = new PageMakerDTO(cri, total);
   		//model.addAttribute("pageMaker", pageMake);
   		return "myPage/applyListMember";
   	}

   	// 신청현황 정보 가져오기(트레이너)
   	@GetMapping("/applyListTrainer")
   	public String applyListTrainer(Model model, Criteria cri, HttpSession session) {
   		String memId = (String) session.getAttribute("sessionId");
   		//log.info("memId:"+memId);
   		model.addAttribute("list", myPageMapper.getApplyListTrainer(memId)); //신청 현황 정보 가져오기(트레이너)
   		//int total = myPageMapper.getApplyTrainerTotal(memId); //신청현황 총 개수(트레이너)
   		//PageMakerDTO pageMake = new PageMakerDTO(cri, total);
   		//model.addAttribute("pageMaker", pageMake);
   		return "myPage/applyListTrainer";
   	}
}
