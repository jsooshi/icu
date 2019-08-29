package com.porget.control;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.porget.persistence.PortfolioDAO;

@Controller
public class MainController {
	
	@Autowired
	private PortfolioDAO dao;

	@GetMapping("/")
	public String index() {
		return "main/index";
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

}
