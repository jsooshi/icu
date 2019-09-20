package com.porget.control;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.porget.auth.SNSLogin;
import com.porget.auth.SnsValue;
import com.porget.persistence.MemberDAO;

@Controller
public class MemberController {

	@Inject
	private MemberDAO dao;
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;
	
	
	
	@RequestMapping("/showUser")
	public String showUser(Model m, String uname) { //로그인한 유저네임으로 세션값 받아 회원의 프로필사진, 회원 포트폴리오 받아오기
		m.addAttribute("uname", uname); //로그인한 세션값을 이메일 또는 유저네임으로 받아온다 세션값이라 안줘도 되긴할텐데 혹시몰라 테스트용으로 넣어줌
		String uphoto = dao.selectUserPhoto(uname);
		m.addAttribute("uphoto", uphoto); //회원사진 받아오기
		List<Map<String, Object>> list = dao.myPortfolio(uname);
		m.addAttribute("list", list);
		return "main/showUser";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());

		return "main/login";
	}
	
	@RequestMapping(value="/auth/google/callback", method= {RequestMethod.POST, RequestMethod.GET})
	public String snsLoginCallback(Model model, @RequestParam String code) throws Exception{
		
		SNSLogin snsLogin = new SNSLogin(googleSns);
		String profile = snsLogin.getUserProfile(code);
		System.out.println("profile>"+profile);
		
		model.addAttribute("result",profile);
		
		
		return "main/loginResult";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
