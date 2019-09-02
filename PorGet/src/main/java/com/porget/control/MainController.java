package com.porget.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.porget.domain.PortfolioVO;
import com.porget.domain.UserVO;
import com.porget.persistence.PortfolioDAO;
import com.porget.persistence.UserDAO;

@Controller
public class MainController {
	
	@Autowired
	private PortfolioDAO dao;
	
	@Autowired
	private UserDAO userdao;

	@GetMapping("/")
	public String index() {
		return "main/index";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinform() {
		
		return "main/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String userjoin(UserVO vo) {
		userdao.insert(vo);
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
	
		return "main/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginsuccess(UserVO vo, HttpSession session) {
		String uname = userdao.login(vo);
		if(uname != null) {
			session.setAttribute("uname",uname);
			System.out.println("성공");
			return "redirect:/";
		}else {
			System.out.println("실패");
			return "/main/login";
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	@RequestMapping("/searchKeyword")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		//System.out.println("keyword>>"+keyword);
		List<String> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchInputPartTest";
	}
	
	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		List<Map<String, Object>> list = dao.searchResult(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchResult";
	}
	
	@RequestMapping("/searchTegBox")
	public String searchTegBox(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		List<String> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchTegBox";
	}
	
	/*메인 popular*/
	@RequestMapping("/mainpopular")
	public String mainPopular(Model m) {
		List<Map> list = dao.mainPopular();
		m.addAttribute("list",list);
		return "portfolio/cardPost";
	}
	
	@RequestMapping("/mainrecent")
	public String mainRecent(Model m) {
		List<Map> list = dao.mainRecent();
		System.out.println(list);
		m.addAttribute("list",list);
		return "portfolio/cardPost";
	}
	

}
