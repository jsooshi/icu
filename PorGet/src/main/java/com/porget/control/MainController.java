package com.porget.control;

import java.util.ArrayList;
import java.util.HashSet;
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
	
	
	@RequestMapping("/searchKey")
	public String searchKeyword(Model m, String keyword) { //검색창에서 연관검색어 가져오기
		List<Map<String, Object>> list = dao.searchKeyword(keyword);
		m.addAttribute("list", list);
		return "portfolio/searchInputPartTest";
	}
	
	@RequestMapping("/searchButton")
	public String searchButton(String keyword, Model m) {//검색버튼 눌렀을시 검색결과 가져오기
		System.out.println("키워드얌 검색창-->"+keyword);
		if(keyword.contains("#")) {
			m.addAttribute("keyword", keyword);
			return "portfolio/searchResult";
		}else {
			
			if(!dao.searchName(keyword).isEmpty()&&!dao.searchTag(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "both");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";
			
			}else if(!dao.searchTag(keyword).isEmpty()&&dao.searchName(keyword).isEmpty()) {
			m.addAttribute("tagOrName", "tag");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";
			
			}else if(!dao.searchName(keyword).isEmpty()&&dao.searchTag(keyword).isEmpty()) {
			System.out.println("dao.searchName(keyword)"+dao.searchName(keyword));
			m.addAttribute("tagOrName", "name");
			m.addAttribute("input", keyword);
			return "portfolio/searchResultAll";	
			}
			return "portfolio/searchResultAll";
		}
		
	}
	
	@RequestMapping("/searchTagBox")
	public String searchTagBox(Model m, String keyword) { //검색창에서 해시태그 연관검색어 가져오기
		List<String> list = dao.searchTag(keyword);
		m.addAttribute("list", list);
		m.addAttribute("keyword",keyword);
		return "portfolio/searchTagBox";
	}
	
	@RequestMapping("/searchNameList")
	public String searchNameList(Model m, String input) { //검색시 제목에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
			list4.add(dao.searchNameList(input));
			m.addAttribute("list4", list4);
		return "portfolio/searchNameResult";
	}

	@RequestMapping("/searchTagList")
	public String searchTagList(Model m, String input) {//검색시 태그에 검색어가 포함되어있을때
		List<List<Map<String, Object>>> list4 = new ArrayList<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
		list4.add(dao.searchTagList(input));
		m.addAttribute("list4", list4);
		return "portfolio/searchTagResult";
	}
	
	@RequestMapping("/searchHashTagList")
	public String searchHashTagList(Model m, String keyword, int base) {//검색시 태그에 검색어가 포함되어있을때
		System.out.println("여기 들어왓닝~~");
		System.out.println("base"+base);
		Set<List<Map<String, Object>>> listSet = new HashSet<List<Map<String,Object>>>();
		List<Map<String, Object>> list=null;
		   //keyword="#java#django"
		   //keyword2= {"","java","django"}
			String[] keyword2 = keyword.split("#");  
			for (int i = 1; i < keyword2.length; i++) {
				list = dao.searchHashResult("#"+keyword2[i], base);
				       //uname:"길동", pfname:"제목",pfnum:"글번호"..base...
				       
				listSet.add(list);
		//		list4.add(dao.searchHashResult("#"+keyword2[i], base));
//				list = dao.searchResult("#"+keyword2[i]);
				//list4.add(list);
			}
			System.out.println("listSet>>>"+ listSet);
			System.out.println("쿼리문에서 distinct해도 중복 안사라짐 ㅜ");
//			for (int j = 0; j < list4.size(); j++) {
//				for (int j2 = 0; j2 < list4.size(); j2++) {
//					if(!list4.get(j).equals(list4.get(j2))) {
//						list4.add(list4.get(j));
//					}
//				}
//			}
			String hashTag = "hashTag";
			m.addAttribute("hashTag", hashTag);
			m.addAttribute("listSet", listSet);
		return "portfolio/searchHashResult";
	}
	

}
