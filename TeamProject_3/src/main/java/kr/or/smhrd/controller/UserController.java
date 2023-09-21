package kr.or.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	//����������
	@GetMapping("/mypage")
	String mypage() {
		return "/user/mypage";
	}
	
	//�� ��������
	@GetMapping("/userEdit")
	String userEdit() {
		return "/user/userEdit";
	}
	
	//ȸ��Ż��
	@GetMapping("/userWithdrawal")
	String userWithdrawal() {
		return "/user/userWithdrawal";
	}
	
	//�α���
	@GetMapping("/login")
	String login() {
		return "/user/login";
	}
	
	//�α���
	@GetMapping("/idSearch")
	String idSearch() {
		return "/user/idSearch";
	}
	
	//�α���
	@GetMapping("/pwSearch")
	String pwSearch() {
		return "/user/pwSearch";
	}
	
	//�α���
	@GetMapping("/signUp")
	String signUp() {
		return "/user/signUp";
	}
		
		
}
