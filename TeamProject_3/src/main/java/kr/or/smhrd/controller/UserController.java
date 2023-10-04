package kr.or.smhrd.controller;

<<<<<<< HEAD
<<<<<<< HEAD
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	//마이페이지
	@GetMapping("/mypage")
	String mypage() {
		return "/user/mypage";
	}
	
	//내 정보수정
	@GetMapping("/userEdit")
	String userEdit() {
		return "/user/userEdit";
	}
	
	//회원탈퇴
	@GetMapping("/userWithdrawal")
	String userWithdrawal() {
		return "/user/userWithdrawal";
	}
	
	//로그인
	@GetMapping("/login")
	String login() {
		return "/user/login";
	}
	
	//로그인
	@GetMapping("/idSearch")
	String idSearch() {
		return "/user/idSearch";
	}
	
	//로그인
	@GetMapping("/pwSearch")
	String pwSearch() {
		return "/user/pwSearch";
	}
	
	//로그인
	@GetMapping("/signUp")
	String signUp() {
		return "/user/signUp";
	}
		
		
=======
=======
import java.util.HashMap;
import java.util.Map;

>>>>>>> ac23047b4c26816ab7f3f4f18254a6dd25ba208b
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.smhrd.dto.UserDTO;
import kr.or.smhrd.service.UserService;

@Controller
@RequestMapping("/register")
public class UserController {
	@Autowired
	UserService service;
	
	//筌띾뜆�뵠占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = service.UserSelect((String) session.getAttribute("logId"));
		mav.addObject("dto", dto);
		mav.setViewName("register/mypage");
		
		return mav;
	}
	
	//占쎌돳占쎌뜚占쎌젟癰귨옙 占쎈땾占쎌젟占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/userEdit")
	public ModelAndView userEdit(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = service.UserSelect((String)session.getAttribute("logId"));
		mav.addObject("dto", dto);
		mav.setViewName("register/userEdit");
		return mav;
	}
	
	//占쎌돳占쎌뜚占쎄퉱占쎈닚 占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/userResign")
	public ModelAndView userResign(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = service.UserSelect((String)session.getAttribute("logId"));
		mav.addObject("dto", dto);
		mav.setViewName("register/userResign");
		
		return mav;
	}
	
	//嚥≪뮄�젃占쎌뵥 占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/login")
	public String login() {
		return "/register/login";
	}
	
	//占쎈툡占쎌뵠占쎈탵 筌≪뼐由� 占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/idSearch")
	public String idSearch() {
		return "/register/idSearch";
	}
	
	//占쎈솭占쎈뮞占쎌뜖占쎈굡 筌≪뼐由� 占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/pwSearch")
	public String pwSearch() {
		return "/register/pwSearch";
	}
	
	//占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎈쨲占쎌몵嚥∽옙 占쎌뵠占쎈짗
	@GetMapping("/signUp")
	public String signUp() {
		return "/register/signUp";
	}
		
	// 占쎌돳占쎌뜚揶쏉옙占쎌뿯
	@PostMapping("/UserInsert")
	public ModelAndView UserInsert(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		try {			
			result = service.UserInsert(dto);
		}catch(Exception e) {
			System.out.println("error >> "+e);
		}
		
		if(result > 0) {
			mav.setViewName("redirect: login");
		}else {
			mav.setViewName("register/registerResult");
		}
		
		return mav;
	}
	// 嚥≪뮄�젃占쎌뵥
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String u_id, String u_pw, HttpSession session) {
		UserDTO dto = service.loginOk(u_id, u_pw);
		
		ModelAndView mav = new ModelAndView();
		
		if(dto != null) {
			session.setAttribute("logId", dto.getU_id());
			session.setAttribute("logName", dto.getU_name());
			session.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("register/loginResult");
		}
		return mav;
	}
	
	// 嚥≪뮄�젃占쎈툡占쎌뜍
	@GetMapping("/logOut")
	public ModelAndView logOut(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/memberedit")
	public String memberedit() {
		return "/register/memberedit";
	}
	
	// 占쎌돳占쎌뜚占쎌젟癰귨옙 占쎈땾占쎌젟
	@PostMapping("/UserEdit")
	public ModelAndView UserEdit(UserDTO dto) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.UserEdit(dto);
			
			mav.setViewName("redirect: mypage");
		}catch(Exception e){
			e.printStackTrace();
			mav.setViewName("register/UserEditResult");
		}		
		
		return mav;
	}
	
	// 占쎈툡占쎌뵠占쎈탵 筌≪뼐由�
	
	// �뜮袁⑨옙甕곕뜇�깈 筌≪뼐由�
	
	// 占쎌돳占쎌뜚占쎄퉱占쎈닚
	@PostMapping("/UserDel")
	public ModelAndView UserDel(String u_id, String u_pw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int result = service.UserDel(u_id, u_pw);
		
		if(result > 0) {
			session.invalidate();
			mav.setViewName("redirect:/");
		}else {
			mav.addObject("dto",u_id);
			mav.setViewName("redirect: mypage");
		}
		
		return mav;
	}
	
<<<<<<< HEAD
>>>>>>> 2935cad225b7fccc32d774c77f40cea00ee8c047
=======
	
>>>>>>> ac23047b4c26816ab7f3f4f18254a6dd25ba208b
}
