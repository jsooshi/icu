package com.porget.control;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.persistence.MemberDAO;

@Controller
public class MemberController {

	@Inject
	private MemberDAO dao;
	
	@RequestMapping("/showUser")
	public String showUser(Model m, String uname) { //로그인한 유저네임으로 세션값 받아 회원의 프로필사진, 회원 포트폴리오 받아오기
		m.addAttribute("uname", uname); //로그인한 세션값을 이메일 또는 유저네임으로 받아온다 세션값이라 안줘도 되긴할텐데 혹시몰라 테스트용으로 넣어줌
		String uphoto = dao.selectUserPhoto(uname);
		m.addAttribute("uphoto", uphoto); //회원사진 받아오기
		List<Map<String, Object>> list = dao.myPortfolio(uname);
		m.addAttribute("list", list);
		return "main/showUser";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
