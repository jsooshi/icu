package com.porget.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.domain.UserVO;
import com.porget.persistence.UserDAO;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private UserDAO dao;
	
	@GetMapping(value={"","/"})
	public String selectMyPage(HttpSession session, Model m) {
		UserVO vo = dao.selectMyPage((String)session.getAttribute("uname"));
		System.out.println(vo);
		m.addAttribute("vo",vo);
		return "member/myPage";
	}
}
