package com.porget.control;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.porget.domain.UserVO;
import com.porget.persistence.UserDAO;

@Controller
public class PorgetController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String join() {
		return "main/join";
	}
	
	@RequestMapping(value = "/joinform", method = RequestMethod.POST)
	public String joininsert(UserVO vo) {
		dao.insert(vo);
		
		return "redirect:/loginform";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String login() {
		
		return "main/login";
	}
	@RequestMapping("/main")
	public String main() {
		
		return "main/main";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.POST)
	public String loginsuccess(UserVO vo, HttpSession session) {
		System.out.println("로그인vo ueamil="+vo.getUemail()+", upass="+vo.getUpass());
		String uname = dao.login(vo);
		if(uname!=null) {
			session.setAttribute("uname", uname);
			System.out.println("성공");
			return "redirect:/main";
		}else {
			System.out.println("실패");
			return "/main/login";
		}
		
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "main/myPageModify";
	}

}
//		@RequestMapping(value = "/loginform", method = RequestMethod.POST)
//		public String loginsuccess(UserVO vo, Model m) {
//			if(m.addAttribute("userList.login", vo) != null) {
//				
//			}
