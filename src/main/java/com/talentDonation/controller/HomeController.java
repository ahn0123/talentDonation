package com.talentDonation.controller;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.talentDonation.dto.Member;
import com.talentDonation.mapper.ProgramMapper;
import com.talentDonation.mapper.ReviewMapper;
import com.talentDonation.mapper.UserMapper;
import com.talentDonation.service.EncryptionService;
import com.talentDonation.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/")
public class HomeController {

	private final UserMapper userMapper;
	private final ProgramMapper programMapper;
	private final ReviewMapper reviewMapper;
	private final EncryptionService Encryption;
	//private final UserService userService;

	@GetMapping("/")
    public String main(Model model, HttpSession session) {
		model.addAttribute("list", programMapper.getProgramExampleRandom()); // 프로그램 랜덤 정보 가져오기
		model.addAttribute("list2", reviewMapper.getReviewExample()); // 교육후기 정보 가져오기
        return "index";
    }

	@GetMapping("index")
	public String index(Model model, HttpSession session) {
		model.addAttribute("list", programMapper.getProgramExampleRandom()); // 프로그램 랜덤 정보 가져오기
		model.addAttribute("list2", reviewMapper.getReviewExample()); // 교육후기 정보 가져오기
		return "index";
	}

	@Autowired
    private UserService userService;

	@GetMapping("/login")
    public String login() {
        return "user/login";
    }

	@PostMapping("/login")
    public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
        try {
            if (map.get("memId") == null || map.get("memPwd") == null) {
                model.addAttribute("msg", "아이디 또는 비밀번호를 입력해주세요");
                return "user/login";
            }

            map.put("memPwd", Encryption.encrypt(map.get("memPwd")));
            Member member = userService.login(map);

            if (member != null) {
                session.setAttribute("member", member);
            } else {
                model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다");
                return "user/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "로그인 중 문제가 발생했습니다");
            return "user/login";
        }
        session.setAttribute("sessionId", userMapper.getId(map.get("memId"))); // 세션값 등록
        model.addAttribute("sessionId", session.getAttribute("sessionId"));
        session.setAttribute("memType", userMapper.getType(map.get("memId"))); //회원타입 등록
		model.addAttribute("memType", session.getAttribute("memType"));

        return "redirect:/";
    }

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	//회원가입 페이지로 이동
    @GetMapping("/signUp")
    public String signUp(Model model, @ModelAttribute Member member) {
        model.addAttribute("member", new Member());
        return  "user/signUp";
    }

    //회원가입 정보 등록
    @PostMapping("/signUp")
    public String singUp(Model model, @ModelAttribute Member member) throws InvalidAlgorithmParameterException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, BadPaddingException, InvalidKeyException {
        member.setMemPwd(Encryption.encrypt(member.getMemPwd()));
        userMapper.addMember(member);
        return "redirect:/login";
    }

    //회원가입 id 중복확인
    @GetMapping("/checkId")
    @ResponseBody
    public String checkId(@RequestParam String id){
        int result = userMapper.checkId(id); //아이디 중복 체크
        if (result == 0) {
            return "success";
        }
        else {
            return "fail";
        }
    }
}
