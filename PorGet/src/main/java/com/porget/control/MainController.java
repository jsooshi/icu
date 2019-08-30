package com.porget.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String joinform() {
		
		return "main/join";
	}
	
	@RequestMapping(value = "/joinform", method = RequestMethod.POST)
	public String userjoin(UserVO vo) {
		userdao.insert(vo);
		
		return "redirect:/loginform";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String login() {
	
		return "main/login";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.POST)
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
	
	
	@RequestMapping("/searchKeyword")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		//System.out.println("keyword>>"+keyword);
		List<String> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchInputPartTest";
	}
	
	
//	@RequestMapping("/searchButton")
//	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
//		System.out.println("키워드얌 검색창-->"+keyword);
//		List<Map<String, Object>> list=null;
//		if(keyword.contains("#")) {
//			String[] keyword2 = keyword.split("#");
//			for (int i = 1; i < keyword2.length; i++) {
//				list = dao.searchResult(keyword2[i]);
//			}
//		}else {
//		 list = dao.searchResult(keyword);
//		}
//		m.addAttribute("list", list);
//		return "portfolio/searchResult";
//	}
//	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		System.out.println("키워드얌 검색창-->"+keyword);
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
		if(keyword.contains("#")) {
			String[] keyword2 = keyword.split("#");
			for (int i = 1; i < keyword2.length; i++) {
				list = dao.searchResult("#"+keyword2[i]);
				for (int j = 0; j < list.size(); j++) {
					list4.add(list);
				}
			}
			String name = "tag";
			m.addAttribute("tagOrName", name);
			m.addAttribute("list4", list4);
			return "portfolio/searchResult";
		}else {
			m.addAttribute("input", keyword);
//		 list = dao.searchResult(keyword);///////여기서는 그냥 뷰만 뿌려주게 뷰에서 ajax로 컨트롤러
//		 m.addAttribute("tagOrName", "name");////////
//		 m.addAttribute("list", list);////////////
			return "portfolio/searchResult";
		}
		
	}
	
	@RequestMapping("/searchTagBox")
	public String searchTagBox(Model m, String keyword) { //검색창에서 해시태그 연관검색어 가져오기
		List<String> list = dao.searchTag(keyword);
		m.addAttribute("list", list);
		m.addAttribute("keyword",keyword);
		return "portfolio/searchTagBox";
	}
	
	@RequestMapping("/searchName")
	public String searchName(Model m, String input) {
		List<Map<String, Object>> list=null;
		 list = dao.searchName(input);///////여기서는 그냥 뷰만 뿌려주게 뷰에서 ajax로 컨트롤러
		 m.addAttribute("input", input);
		 m.addAttribute("tagOrName", "name");////////
		 m.addAttribute("list", list);
		return "portfolio/searchName";
	}
	

}
